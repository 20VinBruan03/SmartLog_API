<?php

require_once '../config/database.php'; 

class UserModel {

    private $conn;

    public function __construct() {
        $this->conn = Database::getInstance();
    } 

    // create user with a role teacher only
    public function createUser($email, $password, $username, $student_number, $year, $course, $role, $department, $contact_number, $hk_discount, $expert_teacher) {
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
        $sql = "INSERT INTO user (email, password, username, student_number, year, course, role, department, contact_number, hk_discount, expert_teacher) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    if ($stmt = $this->conn->prepare($sql)) {
        $stmt->bind_param("sssssssssss", $email, $hashedPassword, $username, $student_number, $year, $course, $role, $department, $contact_number, $hk_discount, $expert_teacher);
        $stmt->execute();
        $insertedId = $stmt->insert_id; 
        $stmt->close();
        $user = $this->getUserById($insertedId);
        return $user;  
    } else {
        return "Error: " . $this->conn->error;
    }

    }

    // login user (check if email exist)
    public function getUserByEmail($email) {
        $sql = "SELECT * FROM user WHERE email = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();
            $user = $result->fetch_assoc();
            $stmt->close();
            return $user === null ? null : $user;
        } 
        else {
            return "Error: " . $this->conn->error;
        }
    }
    
    // get all users
    public function getUsers() {
        $sql = "SELECT * FROM user";

        $result = $this->conn->query($sql); 
        return $result->num_rows > 0 ? $result->fetch_all(MYSQLI_ASSOC) : [];
    }

    // get user by ID
    public function getUserById($id) {
        $sql = "SELECT * FROM user WHERE id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $result = $stmt->get_result();
            $user = $result->fetch_assoc();
            $stmt->close();

            return $user === null ? null : $user;
        } 
        else {
            return "Error: " . $this->conn->error;
        }
    }

    // update user profile
    public function updateUser($id, $email, $username, $student_number, $year, $course, $contact_number, $expert_teacher, $hk_discount) {
        $sql = "UPDATE user SET email = ?, username = ?, student_number = ?, year = ?, course = ?, contact_number = ?, expert_teacher = ?, hk_discount = ? WHERE id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param("ssssssssi", $email, $username, $student_number, $year, $course, $contact_number, $expert_teacher, $hk_discount, $id);
            $stmt->execute();
            $stmt->close(); 
        } 
        else {      
            return "Error: " . $this->conn->error;
        }
    }

    // change pass
    public function updateUserPassword($userId, $newPassword) {
        $sql = "UPDATE user SET password = ? WHERE id = ?";
    
        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param("si", $newPassword, $userId);
            $stmt->execute();
            $stmt->close();
            return true;
        } 
        else {
            return "Error: " . $this->conn->error;
        }
    }
    
    // delete user by id
    public function deleteUser($id) {
        $sql = "DELETE FROM user WHERE id = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $stmt->close();
            return true;
        } 
        else {
            return "Error: " . $this->conn->error;
        }
    }

    // store user token
    public function storeUserToken($userId, $token) {

        $issuedAt = date('Y-m-d H:i:s');  
        $expiresAt = date('Y-m-d H:i:s', strtotime('+1 hour')); 
    
        $sql = "INSERT INTO user_jwt_token (user_id, token, issued_at, expires_at) VALUES (?, ?, ?, ?)";
    
        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param("isss", $userId, $token, $issuedAt, $expiresAt);
            $stmt->execute();
            $stmt->close();
            return true;
        } 
        else {
            return "Error: " . $this->conn->error;
        }
    }

    // delete user token (logout)
    public function deleteUserToken($userId, $token) {        
        $sql = "DELETE FROM user_jwt_token WHERE user_id = ? AND token = ?";

        if ($stmt = $this->conn->prepare($sql)) {
            $stmt->bind_param("is", $userId, $token);
            if ($stmt->execute()) {
                if ($stmt->affected_rows > 0) {
                    $stmt->close();
                    return true; 
                } else {
                    $stmt->close();
                    return "No token found";
                }
            } else {
                $stmt->close();
                return "Error: " . $this->conn->error;
            }
        } else {
            return "Error preparing query: " . $this->conn->error;
        }
    }   
}
?>
