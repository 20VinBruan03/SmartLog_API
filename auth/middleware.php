<?php

require_once __DIR__ . '/token_helper.php';

class AuthMiddleware {
    public static function verifyToken() {
        $Authorization = $_SERVER['HTTP_AUTHORIZATION'] ?? null;

        if ($Authorization) {
            // separate 'Bearer' string from token
            if (strpos($Authorization, 'Bearer ') === 0) {
                $jwt = substr($Authorization, 7);
                $decoded = JwtHelper::decode($jwt);
                if ($decoded === null) {
                    echo json_encode(['message' => 'Invalid JWT token.']);
                    exit;
                }
            } else {
                echo json_encode(['message' => 'Authorization token is malformed']);
                exit;
            }
        } else {
            echo json_encode(['message' => 'Authorization token is missing']);
            exit;
        }
    }
}
 

?>