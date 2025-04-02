

// FIX REDUNDANT query IN SQL QUERY!!!

// check if room schedule exists (avoid time conflict)
    public function roomScheduleExist($room_id, $date, $starting_time, $ending_time, $exclude_id = null) {
        $sql = "SELECT * FROM room_schedule WHERE room_id = ? AND date = ? AND ";
    
        // exclude sched id that is being updated to the checking
        if ($exclude_id) {
            $sql .= "id != ? AND "; 
        }
    
        // time conflicts!
        $sql .= "( 
            (starting_time < ? AND ending_time > ?)  -- creating schedule that eats an existing schedule
            OR 
            (starting_time < ? AND ending_time > ?)  -- creating a starting time that is inside an existing schedule
            OR 
            (? BETWEEN starting_time AND ending_time) -- creating schedule inside a schedule
            OR 
            (? BETWEEN starting_time AND ending_time)  -- creating an ending time inside an existing schedule
            OR 
            (starting_time BETWEEN ? AND ?)  -- Existing schedule starts within the new schedule's range
            OR 
            (ending_time BETWEEN ? AND ?)  -- Existing schedule ends within the new schedule's range
        )";
    
        if ($stmt = $this->conn->prepare($sql)) {
            // update sched
            if ($exclude_id) {
                $stmt->bind_param('issssssssssss', $room_id,
                $date, $exclude_id, $starting_time, $ending_time,
                $starting_time, $ending_time, $starting_time, $ending_time,
                $starting_time, $ending_time, $starting_time, $ending_time);
            } 
            // create sched
            else {
                $stmt->bind_param('isssssssssss', $room_id,
                $date, $starting_time, $ending_time, $starting_time,
                $ending_time, $starting_time, $ending_time, $starting_time,
                $ending_time, $starting_time, $ending_time);
            }
    
            $stmt->execute();
            $result = $stmt->get_result();
    
            return $result->num_rows > 0;
        } else {
            echo json_encode(['message' => 'Error checking schedule: ' . $this->conn->error]);
            return false;
        }
    }