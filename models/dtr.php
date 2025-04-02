<?php

require_once "../config/database.php";

class DTRModel {
    private $conn;

    public function __construct() {
        $this->conn = Database::getInstance();
    }

    // get room request history (approved or rejected only) (order from latest to oldest, descending based on created_at)
    public function getRoomRequestHistory() {
        $sql = "SELECT rr.*, u.username, r.room_building, r.room_number FROM room_request rr JOIN user u ON rr.user_id = u.id
        JOIN room r ON rr.room_id = r.id WHERE rr.status = 'approved' OR rr.status = 'rejected' ORDER BY rr.created_at DESC";

        $result = $this->conn->query($sql);
        return $result->num_rows > 0 ? $result->fetch_all(MYSQLI_ASSOC) : [];
    }

    // get all dtr request
    public function getAllDTRrequests() {
        $sql = "SELECT * FROM dtr";

        $result = $this->conn->query($sql);
        return $result->num_rows > 0 ? $result->fetch_all(MYSQLI_ASSOC) : [];
    }

    // get all dtr request
    // get all room request by teacher id
    public function getAllDTRrequestsByexpert_teacher_id($userId) {
        // get room request with room details
        $sql = "SELECT * FROM dtr WHERE expert_teacher_id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('i', $userId); 
            $stmt->execute();
            $result = $stmt->get_result();
    
            return $result->num_rows > 0 ? $result->fetch_all(MYSQLI_ASSOC) : [];
        } 
        else {
            echo json_encode(['message' => 'Error executing query: ' . $this->conn->error]);
            return [];
        }
    }
    // get dtr requests counts based on status (approved, rejected, pending)
    public function getRoomRequestsCountByStatus() {
        $sql = "SELECT status, COUNT(*) AS count FROM room_request GROUP BY status";
        $result = $this->conn->query($sql);

        $statusCounts = [
            'Pending' => 0,
            'Approved' => 0,
            'Rejected' => 0,
        ];

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (array_key_exists($row['status'], $statusCounts)) {
                    $statusCounts[$row['status']] = (int)$row['count']; 
                }
            }
        }
        return $statusCounts;
    }
    
    // get all pending room request ordered by latest to oldest (descending)
    public function getAllPendingRoomRequests() {
        $sql = "SELECT room_request.*, user.username FROM room_request JOIN user ON room_request.user_id = user.id 
        WHERE room_request.status = 'pending' ORDER BY room_request.created_at DESC";

        $result = $this->conn->query($sql);
        $pendingRequests = [];

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $pendingRequests[] = $row;
            }
        }
        return $pendingRequests;
    }

    // get all room request by teacher id
    public function getDTRbyUserID($userId) {
        // get room request with room details
        $sql = "SELECT * FROM dtr WHERE user_id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('i', $userId); 
            $stmt->execute();
            $result = $stmt->get_result();
    
            return $result->num_rows > 0 ? $result->fetch_all(MYSQLI_ASSOC) : [];
        } 
        else {
            echo json_encode(['message' => 'Error executing query: ' . $this->conn->error]);
            return [];
        }
    }
    
    // get room request by id
    public function getDTRrequestById($id) {
        $sql = "SELECT * FROM dtr WHERE id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('i', $id);
            $stmt->execute();
            $result = $stmt->get_result();

            return $result->num_rows > 0 ? $result->fetch_assoc() : null;
        } 
        else {
            echo json_encode(['message' => 'Error: ' . $this->conn->error]);
            return null;
        }
    }

    // create dtr
    public function createDTR($user_id, $date, $time_in, $time_out, $numberOFhrs, $remarks, $expert_teacher_id) { 

        $sql = "INSERT INTO dtr (user_id, date, time_in, time_out, numberOFhrs, remarks, expert_teacher_id) 
                VALUES (?, ?, ?, ?, ?, ?, ?)";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('isssssi', $user_id, $date, $time_in, $time_out, $numberOFhrs, $remarks, $expert_teacher_id);
        
        if ($stmt->execute()) {
            echo json_encode(['message' => 'DTR request created successfully! ']);

        } else {
            echo json_encode(['message' => 'Error: ' . $this->conn->error]);

        }
    
        } 
    }

    // update dtr request status (approve or reject a pending dtr request only)
    public function updateDTRRequestStatus($id, $remarks) {
        $roomRequest = $this->getDTRRequestById($id);
    
        if ($roomRequest) {
            // check if the room request status is pending
            if ($roomRequest['remarks'] !== 'PENDING') {
                echo json_encode(['message' => 'Only pending room requests can be updated']);
                return;
            }

            $sql = "UPDATE dtr SET remarks = ? WHERE id = ?";
            if ($stmt = $this->conn->prepare($sql)) {
                $stmt->bind_param('si', $remarks, $id);
                ($stmt->execute());
            } 
            else {
                echo json_encode(['message' => 'Error preparing SQL: ' . $this->conn->error]);
            }
        } 
        else {
            echo json_encode(['message' => 'Room request not found']);
        }
    }
    
    
    // delete dtr request
    public function deleteRoomRequest($id) {
        $roomRequest = $this->getDTRrequestById($id);

        if (!$roomRequest) {
            echo json_encode(['message' => 'DTR request does not exist']);
            return;
        }

        $sql = "DELETE FROM room_request WHERE id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('i', $id);
            if ($stmt->execute()) {
                echo json_encode(['message' => 'Deleted successfully']);
            } 
            else {
                echo json_encode('Error deleting room request');
            }
        } 
        else {
            echo json_encode(['message' => 'Error preparing SQL: ' . $this->conn->error]);
        }
    }

    // delete pending request by user id
    public function deletePendingRequestByUserId($userId, $requestId) {
        $sql = "DELETE FROM room_request WHERE user_id = ? AND id = ? AND status = 'Pending'";
    
        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('ii', $userId, $requestId);  
            if ($stmt->execute()) {
                if ($stmt->affected_rows > 0) {
                    echo json_encode(['message' => 'Pending room request cancelled successfully.']);
                } else {
                    echo json_encode(['message' => 'No matching pending request found for the specified user and request ID.']);
                }
            } else {
                echo json_encode(['message' => 'Error deleting pending request: ' . $this->conn->error]);
            }
        } else {
            echo json_encode(['message' => 'Error preparing SQL: ' . $this->conn->error]);
        }
    }
}
?>
