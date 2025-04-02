<?php

require_once "../config/database.php";

class RoomModel {
    private $conn;

    public function __construct() {
        $this->conn = Database::getInstance();
    }

    // get all rooms
    public function getAllRoom() {
        $sql = "SELECT * FROM room ORDER BY room.created_at DESC";
        $result = $this->conn->query($sql);

        return $result->num_rows > 0 ? $result->fetch_all(MYSQLI_ASSOC) : [];
    }

    public function getRoomCountByStatus() {
        $sql = "
            SELECT status, COUNT(*) AS count
            FROM room
            GROUP BY status
        ";
        $result = $this->conn->query($sql);

        $statusCounts = [
            'Occupied' => 0,
            'Available' => 0,
            'Closed' => 0,
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

    // get room by id
    public function getRoomById($id) {
        $sql = "SELECT * FROM room WHERE id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('i', $id);
            $stmt->execute();
            $result = $stmt->get_result();

            return $result->num_rows > 0 ? $result->fetch_assoc() : null;
        } else {
            echo json_encode(['message' => 'Error: ' . $this->conn->error]);
            return null;
        }
    }

    // get all schedule of a room
    public function getRoomSchedules($roomId) {
        $sql = "SELECT * FROM room_schedule WHERE room_id = ?";
        
        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('i', $roomId);  
            $stmt->execute();
            $result = $stmt->get_result();
            return $result->num_rows > 0 ? $result->fetch_all(MYSQLI_ASSOC) : [];
        }
        return [];
    }

    // create room  
    public function createRoom($room_building, $room_number, $status, $equipment, $capacity, $roomType) {
        $sql = "INSERT INTO room (room_building, room_number, status, equipment, capacity, room_type) 
                VALUES (?, ?, ?, ?, ?, ?)";
    
        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('sissis', $room_building, $room_number, $status, $equipment, $capacity, $roomType);

            if ($stmt->execute()) {
                $roomId = $stmt->insert_id;
                return [
                    'id' => $roomId,
                    'room_building' => $room_building,
                    'room_number' => $room_number,
                    'status' => $status,
                    'equipment' => $equipment,
                    'capacity' => $capacity,
                    'room_type' => $roomType
                ];
            } else {
                return 'Error creating room: ' . $this->conn->error;
            }
        } else {
            return 'Error preparing statement: ' . $this->conn->error;
        }
    }
    
    // update room details
    public function updateRoom($id, $room_building, $room_number, $roomType, $capacity, $status, $equipment) {

        $sql = "UPDATE room 
                SET room_building = ?, room_number = ?, room_type = ?, capacity = ?, status = ?, equipment = ? 
                WHERE id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('sisissi', $room_building, $room_number, $roomType, $capacity, $status, $equipment, $id); 
            if (!$stmt->execute()) {
                return json_encode(['message' => 'Error updating room: ' . $this->conn->error]);
            }
        }
    }

    // update room status (available or occupied)
    public function updateRoomStatus($roomId, $status) {
        // Only allow "Available" or "Occupied" statuses, prevent "Closed"
        if ($status !== 'Available' && $status !== 'Occupied') {
            return false;  // Prevent updating the status if it's neither Available nor Occupied
        }
    
        $query = "UPDATE room SET status = ? WHERE id = ?";
        if ($stmt = $this->conn->prepare($query)) {
            $stmt->bind_param('si', $status, $roomId);
            if ($stmt->execute()) {
                return true;    
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    

    // search room by keyword
    public function searchRooms($keyword) {
        // sql injection search bar
        $escapedKeyword = $this->conn->real_escape_string($keyword);

        $query = "SELECT * FROM room WHERE room_building LIKE ? OR room_type LIKE ? OR room_number LIKE ? OR status LIKE ? OR capacity LIKE ? OR equipment LIKE ?";

        $stmt = $this->conn->prepare($query);
        $searchTerm = "%$escapedKeyword%";
        $stmt->bind_param("ssssss", $searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $rooms = [];

            // get room schedule to include in the response in each room id
            while ($row = $result->fetch_assoc()) {
                $roomId = $row['id'];
                $scheduleQuery = "SELECT * FROM room_schedule WHERE room_id = ?";
                $scheduleStmt = $this->conn->prepare($scheduleQuery);
                $scheduleStmt->bind_param("i", $roomId);
                $scheduleStmt->execute();
                $scheduleResult = $scheduleStmt->get_result();
                $schedules = [];

                // room schedule details 
                while ($schedule = $scheduleResult->fetch_assoc()) {
                    $schedules[] = [
                        'id' => $schedule['id'],
                        'room_id' => $schedule['room_id'],
                        'block' => $schedule['block'],
                        'date' => $schedule['date'],
                        'starting_time' => $schedule['starting_time'],
                        'ending_time' => $schedule['ending_time']
                    ];
                }
                // room details
                $room = [
                    'id' => (string) $row['id'],
                    'room_building' => $row['room_building'],
                    'room_number' => (string) $row['room_number'], 
                    'status' => $row['status'],
                    'equipment' => $row['equipment'],
                    'capacity' => $row['capacity'], 
                    'room_type' => $row['room_type'],
                    'schedules' => $schedules  
                ];
                $rooms[] = $room;
            }
            return $rooms;
        } else {
            return [];
        }
    }

    // delete room by id
    public function deleteRoom($id) {
        $sql = "DELETE FROM room WHERE id = ?";
        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('i', $id); 
            if (!$stmt->execute()) {
                return json_encode(['message' => 'Error request: ' . $this->conn->error]);
            }
        } 
    }

    // check if room exist 
    public function roomExists($room_id) {
        $sql = "SELECT id FROM room WHERE id = ?";
    
        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('i', $room_id);
            $stmt->execute();
            $stmt->store_result();
            return $stmt->num_rows > 0;
        } else {
            echo json_encode(['message' => 'Error executing query: ' . $this->conn->error]);
            return false;
        }
    }

    // room exist by building and number
    public function roomExistsByDetails($room_building, $room_number) {
        $sql = "SELECT id FROM room WHERE room_building = ? AND room_number = ?";
        
        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param('si', $room_building, $room_number);  
            $stmt->execute();
            $stmt->store_result();
            
            return $stmt->num_rows > 0;
        } else {
            echo json_encode(['message' => 'Error executing query: ' . $this->conn->error]);
            return false;
        }
    }

}
?>