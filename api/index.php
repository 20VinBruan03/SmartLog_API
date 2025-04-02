<?php
// website access controls
header("Access-Control-Allow-Origin: *");  
header("Access-Control-Allow-Headers: Content-Type, Authorization");  
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PATCH, DELETE");  

// token handler
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../auth/middleware.php';

// controllers
require_once '../controller/user.php';
require_once '../controller/room.php';
require_once '../controller/dtr.php';
require_once '../controller/announcement.php';

$requestMethod = $_SERVER['REQUEST_METHOD'];
$uri = $_SERVER['REQUEST_URI'];
$contentType = $_SERVER['CONTENT_TYPE'] ?? '';
$input = json_decode(file_get_contents('php://input'), true);

if (strpos($contentType, 'application/json') === false) {
    echo json_encode(['message' => 'Invalid json content type.']);
    exit;
}

// instantiate controllers
$userController = new UserController();
$roomController = new RoomController();
$dtrController = new dtrController();
$announcementController = new AnnouncementController();

// user method handler
function handleUser($requestMethod, $uri, $input, $userController) {
    switch ($requestMethod) {
        case 'GET':
            if (preg_match('/\/user\/(\d+)/', $uri, $matches)) {
                // get user by id
                $userController->getUser($matches[1]);
            } 
            else {
                echo json_encode(['message' => 'Invalid user request']);
            }
            break; 
            
        case 'POST':
            if (preg_match('/\/user\/login/', $uri)) {
                // teacher login
                if (isset($input['email'], $input['password'])) {
                    $userController->loginUser($input['email'], $input['password']);
                } 
                else {
                    echo json_encode(['message' => 'Missing email or password']);
                }
            }   
            elseif (preg_match('/\/user\/signup/', $uri)) {
                $userController->createUser($input['email'], $input['password'], $input['username'], $input['student_number'], $input['year'], $input['course'],  $input['role'], $input['department'], $input['contact_number'], $input['hk_discount'], $input['expert_teacher']);
            } 
            elseif (preg_match('/\/user\/logout/', $uri)) {
                // teacher logout
                $Authorization = $_SERVER['HTTP_AUTHORIZATION'] ?? null;
                if ($Authorization) {
                    // invalidate token if token is authorized
                    $userController->logoutUser($Authorization);    
                } 
                else {
                    echo json_encode(['message' => 'Authorization token is missing']);
                }
            }    else {
                echo json_encode(['message' => 'Invalid user request']);
            }
            break;

        case 'PATCH':
            if (preg_match('/\/user\/(\d+)/', $uri, $matches)) {
                $id = $matches[1];
                if (!empty($input)) {
                    // check if variable old, new, confirm pass (change pass)
                    if (isset($input['old_password']) && isset($input['new_password']) && isset($input['confirm_password'])) {
                        $oldPassword = $input['old_password'];
                        $newPassword = $input['new_password'];
                        $confirmPassword = $input['confirm_password'];
                        $userController->changePassword($id, $oldPassword, $newPassword, $confirmPassword);
                    } 
                    else {
                        // use update user profile
                        $userController->updateUser($id, $input);
                    }
                } 
                else {
                    echo json_encode(['message' => 'No fields to update']);
                }
            } 
            else {
                echo json_encode(['message' => 'Invalid user ID']);
            }
            break;
                    
        case 'DELETE':
            if (preg_match('/\/user\/(\d+)/', $uri, $matches)) {
                $userController->deleteUserById($matches[1]);
            } 
            else {
                echo json_encode(['message' => 'Invalid user ID']);
            }
            break;

        default:
            echo json_encode(['message' => 'Method not supported']);
            break;
    }
}

// room method handler
function handleRoom($requestMethod, $uri, $input, $roomController) {
    switch ($requestMethod) {
        case 'GET':
            if (preg_match('/\/room\/(\d+)/', $uri, $matches)) {
                $roomController->getRoom($matches[1]);
            } elseif (preg_match('/\/room/', $uri)) {
                if (isset($_GET['keyword'])) { 
                    $input['keyword'] = $_GET['keyword'];  
                    $roomController->searchRooms($input);  
                }
                else {
                    $roomController->getRooms();
                }
            }  else {
                echo json_encode(['message' => 'Invalid room request']);
            }
            break;

        case 'POST':
            if (preg_match('/\/room/', $uri)) {
                if (isset($input['room_building'], $input['room_number'], $input['status'], $input['equipment'], $input['capacity'], $input['room_type'])) {
                    $roomController->createRoom($input['room_building'], $input['room_number'], $input['status'], $input['equipment'], $input['capacity'], $input['room_type']);
                } 
                else {
                    echo json_encode(['message' => 'Missing required fields for room creation', 'status' => '400']);
                }
            } 
            else {
                echo json_encode(['message' => 'Invalid room request']);
            }
            break;

        case 'PATCH':
            if (preg_match('/\/room\/(\d+)/', $uri, $matches)) {
                $roomController->updateRoom($matches[1], $input);
            } 
            else {
                echo json_encode(['message' => 'Invalid room ID for update', 'status' => '400']);
            }
            break;

        case 'DELETE':
            if (preg_match('/\/room\/(\d+)/', $uri, $matches)) {
                $roomController->deleteRoomById($matches[1]);
            } 
            else {
                echo json_encode(['message' => 'Invalid room ID for deletion', 'status' => '400']);
            }
            break;

        default:
            echo json_encode(['message' => 'Invalid room request']);
            break;
    }
}

// dtr request method handler
function handledtr($requestMethod, $uri, $input, $dtrController) {
    switch ($requestMethod) {
        case 'GET':
            if (preg_match('/\/dtr_request\/expert_teacher\/(\d+)/', $uri, $matches)) {
                $dtrController->getAllDTRrequestsByexpert_teacher_id($matches[1]);
            } 
            elseif (preg_match('/\/dtr_request/', $uri)) {
                $dtrController->getAllDTRrequests();
            }
            elseif (preg_match('/\/room_request\/history/', $uri)) {
                $dtrController->getRoomRequestHistory();
            } 
            elseif (preg_match('/\/dtr_request\/user\/(\d+)/', $uri, $matches)) {
                $dtrController->getDTRbyUserID($matches[1]);
            }
              
            elseif (preg_match('/\/dtr_request\/(\d+)/', $uri, $matches)) {
                $id = $matches[1]; 
                $dtrController->getDTRrequestById($id); 
            } 
            elseif (preg_match('/\/dtr_request/', $uri)) {
                $dtrController->getRoomRequests();
            } 
            else {
                echo json_encode(['message' => 'Invalid DTR request']);
            }
            break;

        case 'POST':
            if (isset($input['user_id'], $input['date'], $input['time_in'], $input['time_out'], $input['numberOFhrs'], $input['remarks'], $input['expert_teacher_id'])) {
                $dtrController->createDTR($input['user_id'], $input['date'], $input['time_in'], $input['time_out'], $input['numberOFhrs'], $input['remarks'], $input['expert_teacher_id']);
            } 
            else {
                echo json_encode(['message' => 'Missing required fields to create room request']);
            }
            break;

        case 'PATCH':
            if (preg_match('/\/dtr_request\/(\d+)/', $uri, $matches)) {
                $id = $matches[1]; 
                if (isset($input['remarks'])) {
                    $dtrController->updateDTRRequestStatus($id, $input['remarks']);
                } 
                else {
                    echo json_encode(['message' => 'Only approved or rejected status update is allowed']);
                }
            } 
            else {
                echo json_encode(['message' => 'Invalid room request ID or missing status']);
            }
            break;

        case 'DELETE':

            if (preg_match('/\/room_request\/(\d+)\/(\d+)/', $uri, $matches)) {
                $userId = $matches[1];
                $requestId = $matches[2];
                $dtrController->cancelPendingRequestofUserId($userId, $requestId);
            } 
            else if (preg_match('/\/room_request\/(\d+)/', $uri, $matches)) {
                $dtrController->deleteRoomRequest($matches[1]);
            } 
            else {
                echo json_encode(['message' => 'Invalid room request ID']);
            }
            break;

        default:
            echo json_encode(['message' => 'Room request method not supported']);
            break;
    }
}

// room schedule method handler
function handleAnnouncement($requestMethod, $uri, $input, $announcementController) {
    switch ($requestMethod) {
        case 'GET':
            if (preg_match('/\/room_schedule\/ongoing_schedule/', $uri)) {
                $announcementController->getAllOngoingSchedules();
            } 
            elseif (preg_match('/\/room_schedule\/room\/(\d+)/', $uri, $matches)) {
                $announcementController->getRoomSchedulesOfRoom($matches[1]);
            } 
            elseif (preg_match('/\/room_schedule\/(\d+)/', $uri, $matches)) {
                $announcementController->getRoomSchedule($matches[1]);
            } 
            elseif (preg_match('/\/announcement/', $uri)) {
                $announcementController->getAllAnnouncement();
            } 
            else {
                echo json_encode(['message' => 'Invalid room schedule request']);
            }
            break;

        case 'POST':
            if (isset($input['date'], $input['text'])) {
                $announcementController->createAnnouncement($input['date'], $input['text']);
            } 
            else {
                echo json_encode(['message' => 'Missing required fields to create room schedule']);
            }
            break;

        case 'PATCH':
            if (preg_match('/\/room_schedule\/(\d+)/', $uri, $matches)) {
                $announcementController->updateRoomSchedule($matches[1], $input);
            } 
            else {
                echo json_encode(['message' => 'Invalid room schedule ID for update']);
            }
            break;

        case 'DELETE':
            if (preg_match('/\/announcement\/(\d+)/', $uri, $matches)) {
                $announcementController->deleteAnnouncementById($matches[1]);
            } 
            else {
                echo json_encode(['message' => 'Invalid room schedule ID for deletion']);
            }
            break;

        default:
            echo json_encode(['message' => 'Room schedule method not supported']);
            break;
    }
}




// main request routing logic
if (preg_match('/\/dtr_request/', $uri)) {
    handledtr($requestMethod, $uri, $input, $dtrController);
} 

elseif (preg_match('/\/announcement/', $uri)) {
    handleAnnouncement($requestMethod, $uri, $input, $announcementController);
} 

elseif (preg_match('/\/user/', $uri)) {
    handleUser($requestMethod, $uri, $input, $userController);
} 
elseif (preg_match('/\/room/', $uri)) {
    handleRoom($requestMethod, $uri, $input, $roomController);
} 
else {
    echo json_encode(['message' => 'Invalid request']);
}
?>