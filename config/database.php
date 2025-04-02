<?php
class Database {
    private static $instance = null;
    private $conn;
    private $host = 'localhost';
    private $db_name = 'smartlog';
    private $username = 'root';
    private $password = '';

    // fix establishing database connection per model (slow response issue)

    // prevents direct object creation every model
    private function __construct() {
        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->db_name);
        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }

    // get single instance
    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new Database();
        }
        return self::$instance->conn;
    }
}
?>
