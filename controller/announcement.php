<?php

require_once '../models/announcement.php';
require_once '../models/room.php';

class RoomScheduleController {
    private $announcementModel;
    private $roomModel;

    public function __construct() {
        $this->announcementModel = new AnnouncementModel();
        $this->roomModel = new RoomModel();
    }

    // get all room schedule
    public function getAllRoomSchedule() {
        $roomschedule = $this->announcementModel->getAllAnnouncement();

        if (empty($roomschedule)) {
            echo json_encode(['message' => 'Room Schedule is empty']);
        } 
        else {
            echo json_encode($roomschedule);
        }
    }
    
    // get a room schedule by ID
    public function getRoomSchedule($id) {
        $roomSchedule = $this->announcementModel->getRoomScheduleById($id);
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
            $roomSchedules = $this->announcementModel->getSchedulesByRoomId($roomId);
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


    public function createAnnouncement($date, $text) {
        $this->announcementModel->createAnnouncement($date, $text);
    }
    

    // update room schedule
    public function updateRoomSchedule($id, $input) {
        $schedule = $this->announcementModel->getRoomScheduleById($id);
    
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
        $scheduleConflict = $this->announcementModel->roomScheduleExist($schedule['room_id'], $date, $starting_time, $ending_time, $id);
        if ($scheduleConflict) {
            echo json_encode(['status' => 'error', 'message' => 'The room is already occupied for the requested time slot']);
            return;
        }

        $this->announcementModel->updateRoomSchedule($id,  $schedule['room_id'], $block, $date, $starting_time, $ending_time);
        echo json_encode(['status' => 'success', 'message' => 'Room updated successfully']);
    }


    // delete room schedule
    public function deleteRoomSchedule($id) {
        $this->announcementModel->deleteRoomSchedule($id);
    }
}
?>