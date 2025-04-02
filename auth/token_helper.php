<?php

use Firebase\JWT\JWT;

class JwtHelper {

    private static $secretKey = 'roomfinder'; 

    // encode token
    public static function encode($data) {
        // issued time
        $issuedAt = time(); 
        // expiration
        $expirationTime = $issuedAt + 86400;
        // payload body  
        $payload = array(
            "iat" => $issuedAt,  
            "exp" => $expirationTime,  
            "data" => $data,  // user credentials
            "id" => $data['id'] // user id
        );

        // encode token
        $token = JWT::encode($payload, self::$secretKey, 'HS256'); //sym 
        
        return $token;
    }


    // decode token 
    public static function decode($jwt) {

        // remove "Bearer " from token string
        if (strpos($jwt, 'Bearer ') === 0) {
            $jwt = substr($jwt, 7);
        }
    
        // split jwt header, payload, signature
        $parts = explode('.', $jwt);
        if (count($parts) != 3) {
            throw new Exception("Invalid JWT token format");
        }

        // decode header and payload
        $header = json_decode(self::base64UrlDecode($parts[0]), true);
        $payload = json_decode(self::base64UrlDecode($parts[1]), true);
    
        // check header 
        if ($header === null || !is_array($header)) {
            throw new Exception("Failed to decode JWT header properly");
        }
    
        // get token algo from header
        $algorithm = $header['alg'];

        // check algo
        if ($algorithm !== 'HS256') {
            throw new Exception("Invalid algorithm");
        }
    
        // check token expiration
        $currentTime = time();
        if (isset($payload['exp']) && $payload['exp'] < $currentTime) {
            throw new TokenExpiredException("Token has expired");
        }
        return $payload;
    }
    
    // decode token from base64url
    private static function base64UrlDecode($data) {

        $remainder = strlen($data) % 4;
        if ($remainder) {
            $padlen = 4 - $remainder;
            $data .= str_repeat('=', $padlen);
        }
    
        return base64_decode(strtr($data, '-_', '+/'));
    }
}

// token expiry exception
class TokenExpiredException extends Exception {
    public function __construct($message) {
        parent::__construct($message);
    }
}

?>