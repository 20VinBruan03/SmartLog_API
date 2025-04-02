<?php

require_once '../models/dtr.php';
require_once '../models/room.php';
require_once '../models/announcement.php';

class dtrController {
    private $dtrModel;
    private $roomModel;
    private $roomScheduleModel;

    public function __construct() {
        $this->dtrModel = new DTRModel();
        $this->roomModel = new RoomModel(); 
        $this->roomScheduleModel = new AnnouncementModel();
    }
    
    // get all room requests of a specific student
    public function getDTRbyUserID($userId) {
        $dtr = $this->dtrModel->getDTRbyUserID($userId);
        if ($dtr) {
            echo json_encode($dtr);
        } 
        else {
            echo json_encode(['status' => 'error', 'message' => 'No DTR requests found for this student']);
        }
    }

    public function getAllDTRrequests () {
        $dtr = $this->dtrModel->getAllDTRrequests();
        if ($dtr) {
        echo json_encode($dtr);    
    }
}

    public function getAllDTRrequestsByexpert_teacher_id($id) {
        $dtr = $this->dtrModel->getAllDTRrequestsByexpert_teacher_id($id);
        if ($dtr) {
        echo json_encode($dtr);    
}
}


    // get room request history (approved or rejected only)
    public function getRoomRequestHistory () {
        $requestHistory = $this->dtrModel->getRoomRequestHistory();
        echo json_encode(['Room Request History' => $requestHistory]);
    }

    // get all pending room request only
    public function getAllPendingRoomRequest () {
        $allPendingRequests = $this->dtrModel->getAllPendingRoomRequests();
        echo json_encode(['Pending Requests' => $allPendingRequests]);
    }

    // get dashboard details (web)
    public function getRoomRequests() {
        $currentTime = date('H:i:s');
        $currentDate = date('Y-m-d');
        
        $rooms = $this->roomModel->getAllRoom();
        
        if (empty($rooms)) {
            echo json_encode(['message' => 'No rooms found']);
            return;
        }
    
        // get ongoing schedule
        $getOngoingSchedules = $this->roomScheduleModel->getAllAnnouncement();
        
        foreach ($rooms as &$room) {
            $room['ongoing_schedule'] = (object) [];
            $room['schedules'] = [];
    
            // check closed room
            if ($room['status'] == 'Closed') {
                continue;
            }
            $room['status'] = 'Available';  
    
            // check ongoing schedule
            $isOccupied = false;
            foreach ($getOngoingSchedules as $schedule) {
                if ($schedule['room_id'] == $room['id']) {
                    $room['ongoing_schedule'] = $schedule;
                    $room['status'] = 'Occupied';
                    $isOccupied = true;
                    break;
                }
            }
    
            // check schedules
            if (!$isOccupied) {
                $schedules = $this->roomScheduleModel->getSchedulesByRoomId($room['id']);
                
                if (!empty($schedules)) {
                    foreach ($schedules as $schedule) {
                        $scheduleDate = $schedule['date'];
                        $startingTime = $schedule['starting_time'];
                        $endingTime = $schedule['ending_time'];
    
                        // set status to occupied if matched to current time
                        if ($currentDate === $scheduleDate && $currentTime >= $startingTime && $currentTime < $endingTime) {
                            $room['status'] = 'Occupied';
                        }
                    }
                    $room['schedules'] = $schedules;
                }
            }
    
            // update status
            if ($room['status'] == 'Occupied') {
                $this->roomModel->updateRoomStatus($room['id'], 'Occupied');
            } else {
                $this->roomModel->updateRoomStatus($room['id'], 'Available');
            }
        }
    
        // get count by status
        $roomstatusCounts = $this->roomModel->getRoomCountByStatus();
        
        $requeststatusCounts = $this->dtrModel->getRoomRequestsCountByStatus();
        $getAllRoomRequestsHistory = $this->dtrModel->getAllPendingRoomRequests();
    
        echo json_encode([
            'pending count' => (string)$requeststatusCounts['Pending'],
            'approved count' => (string)$requeststatusCounts['Approved'],
            'rejected count' => (string)$requeststatusCounts['Rejected'],
            'available count' => (string)$roomstatusCounts['Available'],
            'occupied count' => (string)$roomstatusCounts['Occupied'],
            'closed count' => (string)$roomstatusCounts['Closed'],
            'Ongoing schedule' => $getOngoingSchedules,
            'Request history' => $getAllRoomRequestsHistory
        ]);
    }
    
    

    // get dtr request by id
    public function getDTRrequestById($id) {
        $dtrRequest = $this->dtrModel->getDTRrequestById($id);
        if ($dtrRequest) {
            echo json_encode($dtrRequest);
        } 
        else {
            echo json_encode(['status' => 'error', 'message' => 'DTR request not found']);
        }
    }

    // create dtr
    public function createDTR($user_id, $date, $time_in, $time_out, $numberOFhrs, $remarks, $expert_teacher_id) {
        $this->dtrModel->createDTR($user_id, $date, $time_in, $time_out, $numberOFhrs, $remarks,  $expert_teacher_id);
    }
    
    
    // update room request status only (Approved, Rejected)
    public function updateDTRRequestStatus($id, $remarks) {
        
        // check room request exist
        $roomRequest = $this->dtrModel->getDTRrequestById($id);

        if (!$roomRequest) {
            echo json_encode(['message' => 'Room request not found']);
            return;
        }
        $this->dtrModel->updateDTRRequestStatus($id, $remarks);
        echo json_encode(['status' => 'success', 'message' => 'Room request updated successfully']);
    }

    // delete room request
    public function deleteRoomRequest($id) {
        $this->dtrModel->deleteRoomRequest($id);
    }

    // cancel pending request of a user id
    public function cancelPendingRequestofUserId($userId, $requestId) {
        $this->dtrModel->deletePendingRequestByUserId($userId, $requestId);
    }
}
?>
