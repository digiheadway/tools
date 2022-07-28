<?php



class Database
{
    private $servername = "localhost";
    private $username = "u240376517_tools";
    private $password = "#DNhomg$:p7L";
    private $dbname = "u240376517_tools";
    private $conn;


    function __construct()
    {
        // Create connection        
        $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);

        // Check connection        
        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }

    function process_query($query)
    {
        $result = $this->conn->query($query);
        if ($result == false) {
            throw new Exception('Error' . $this->conn->error . $query, 1);
        }
        return $result;
    }

    function select($query)
    {
        $result = $this->process_query($query);
        $rows = $result->fetch_all(MYSQLI_ASSOC);
        return $rows;
    }

    function insert(string $table, array $columns, string $value_str){
        $columns = join($columns, ", ");
        $query = "INSERT INTO $table ($columns) VALUES ($value_str)";
        return $this->process_query($query);
    }

    function update(string $table, string $set_str, $id){
        $query = "UPDATE $table SET $set_str WHERE id = $id";
        return $this->process_query($query);
    }

    function close()
    {
        $this->conn->close();
    }
}



?>