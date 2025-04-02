TO-DO LIST!!!

-add a created at column for the room request table
-add logic to count room request based on status (pending, approved and rejected)
-get the recent room request base on the created_at column (24 hours limit)
-add student token table in the database with column id, student_id(), token, created_at, expires_at
-add admin token table in the database with column id, admin_id(), token, created_at, expires_at

-apply middleware which uses student token for mobile app routes
-apply middleware which uses admin token for web app routes

-fix backward time bug in room schedule for datetime format
-fix time overlap bug in room schedulee for datetime format

-if room request is approved, add the room request schedule to room schedules(add room status logic to add via room status "approved")
-if room is closed, it cannot be accessed until updated to available(backend)

!!!WARNING
-!!!CANNOT ADD STARTING TIME TO AN EXISTING SCHEDULE ENDING TIME (ex.add schedule starting         time=10:00pm, existing schedule ending time 10:00 (overlap))(fix sql query)

(TODO)

-if room schedule is finished, delete the room schedule(backend)
-room request already exist(backend)
-change password bug(backend)
-room building and room number exist(backend)
-protect routes using middleware

-!!can send empty strings (BACKEND)

!
-add htaccess configuration for better routing
