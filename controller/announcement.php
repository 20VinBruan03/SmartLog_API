<?php

require_once '../models/announcement.php';
require_once '../models/room.php';

class RoomScheduleController {
    private $roomScheduleModel;
    private $roomModel;

    public function __construct() {
        $this->roomScheduleModel = new RoomScheduleModel();
        $this->roomModel = new RoomModel();
    }

    // get all room schedule
    public function getAllRoomSchedule() {
        $roomschedule = $this->roomScheduleModel->getAllRoomSchedule();

        if (empty($roomschedule)) {
            echo json_encode(['message' => 'Room Schedule is empty']);
        } 
        else {
            echo json_encode($roomschedule);
        }
    }

    // get all ongoing schedule
    public function getAllOngoingSchedules() {
        $ongoingSchedules = $this->roomScheduleModel->getAllOngoingSchedules();
    
        if (empty($ongoingSchedules)) {
            echo json_encode(['status' => 'error', 'message' => 'No ongoing schedules found']);
            return;
        }
        echo json_encode($ongoingSchedules);
    }
    
    // get a room schedule by ID
    public function getRoomSchedule($id) {
        $roomSchedule = $this->roomScheduleModel->getRoomScheduleById($id);
        if ($roomSchedule) {
            echo json_encode($roomSchedule);
        } 
        else {
            echo json_encode(['status' => 'error', 'message' => 'Room schedule not found']);
        }
    }

    // get room schedule by room id
    public function getRoomSchedulesOfRoom($roomId) {
        if ($roomId) {
            $roomSchedules = $this->roomScheduleModel->getSchedulesByRoomId($roomId);
            if (empty($roomSchedules)) {
                echo json_encode(['status' => 'error', 'message' => 'Empty room schedules']);
            } 
            else {
                echo json_encode(['Room Schedules' => $roomSchedules]);
            }
        } 
        else {
            echo json_encode(['status' => 'error', 'message' => 'Room ID is required']);
        }
    }


    // create room schedule
    public function createRoomSchedule($room_id, $block, $date, $starting_time, $ending_time) {

        // starting time greater than ending time
        if ($starting_time >= $ending_time) {
            echo json_encode(['status' => 'error', 'message' => 'Starting time must be before ending time']);
            return;
        }

        // check if the room exists
        if ($this->roomModel->roomExists($room_id)) {
    
            // get room 
            $room = $this->roomModel->getRoomById($room_id);
            
            // check closed status
            if ($room['status'] == 'Closed') {
                echo json_encode(['status' => 'error', 'message' => 'This room is closed']);
                return;
            }

            // check time validity
            date_default_timezone_set('Asia/Singapore');
            $currentTimestamp = time();
    
            $requestedStartTimestamp = strtotime("$date $starting_time");
            $requestedEndTimestamp = strtotime("$date $ending_time");
    
            // -1 second to ending time
            $endingTimeStamp = $requestedEndTimestamp - 1;
            $adjustedEndingTime = date('H:i:s', $endingTimeStamp); 
    
            // check time conflict
            if ($requestedStartTimestamp < $currentTimestamp || $endingTimeStamp < $currentTimestamp) {
                echo json_encode(['status' => 'error', 'message' => 'The selected time is in the past. Please choose a future time for the schedule']);
                return;
            }
    
            // check room schedule conflict
            $scheduleConflict = $this->roomScheduleModel->roomScheduleExist($room_id, $date, $starting_time, $adjustedEndingTime);
            
            if ($scheduleConflict) {
                echo json_encode(['status' => 'error', 'message' => 'The room is already occupied for your requested time slot']);
                return;
            } 
            else {
                $roomschedule = $this->roomScheduleModel->createRoomSchedule($room_id, $block, $date, $starting_time, $adjustedEndingTime);
                if ($roomschedule) {
                    echo json_encode(['status' => 'success', 'message' => 'Room schedule created successfully']); 
                } 
                else {
                    echo json_encode(['status' => 'error', 'message' => 'Error creating room schedule']);
                }
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Room not found']);
        }
    }
    

    // update room schedule
    public function updateRoomSchedule($id, $input) {
        $schedule = $this->roomScheduleModel->getRoomScheduleById($id);
    
        // check schedule exist
        if (!$schedule) {
            echo json_encode(['status' => 'error', 'message' => 'Schedule not found']);
            return;
        }

        $block = isset($input['block']) ? $input['block'] : $schedule['block'];
        $date = isset($input['date']) ? $input['date'] : $schedule['date'];
        $starting_time = isset($input['starting_time']) ? $input['starting_time'] : $schedule['starting_time'];
        $ending_time = isset($input['ending_time']) ? $input['ending_time'] : $schedule['ending_time'];

        // check if no value change
        if ($block == $schedule['block'] && $date == $schedule['date'] && 
            $starting_time == $schedule['starting_time'] && $ending_time == $schedule['ending_time']) { 
            echo json_encode(['status' => 'error', 'message' => 'You need to change a value before updating the schedule']);
            return;
        }
    
        // starting time greater than ending time
        if ($starting_time >= $ending_time) {
            echo json_encode(['status' => 'error', 'message' => 'Starting time must be before ending time']);
            return;
        }

        // check time validity
        date_default_timezone_set('Asia/Singapore');
        $currentTimestamp = time();

        $updatedStartTimestamp = strtotime("$date $starting_time");
        $updatedEndTimestamp = strtotime("$date $ending_time");

        if ($updatedStartTimestamp < $currentTimestamp || $updatedEndTimestamp < $currentTimestamp) {
            echo json_encode(['status' => 'error', 'message' => 'The selected time is in the past. Please choose a future time for the schedule']);
            return;
        }
        
        // check room schedule conflict before update
        $scheduleConflict = $this->roomScheduleModel->roomScheduleExist($schedule['room_id'], $date, $starting_time, $ending_time, $id);
        if ($scheduleConflict) {
            echo json_encode(['status' => 'error', 'message' => 'The room is already occupied for the requested time slot']);
            return;
        }

        $this->roomScheduleModel->updateRoomSchedule($id,  $schedule['room_id'], $block, $date, $starting_time, $ending_time);
        echo json_encode(['status' => 'success', 'message' => 'Room updated successfully']);
    }


    // delete room schedule
    public function deleteRoomSchedule($id) {
        $this->roomScheduleModel->deleteRoomSchedule($id);
    }
}
?>