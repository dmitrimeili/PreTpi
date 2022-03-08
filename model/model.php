<?php

function getAllReviews()
{


    try {
        $dbh = callPDO();
        $query = 'SELECT * FROM pretpi.reviews ';
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute();//execute query
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC);//prepare result for client
        $dbh = null;
        if ($debug) var_dump($queryResult);
        return $queryResult;
    } catch (PDOException $e){
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }
}
function getReview($id)
{

    try {
        $dbh = callPDO();
        $query = 'SELECT * FROM pretpi.reviews where id = :id';
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute(['id'=> $id]);//execute query
        $queryResult = $statement->fetch(PDO::FETCH_ASSOC);//prepare result for client
        $dbh = null;
        if ($debug) var_dump($queryResult);
        return $queryResult;
    } catch (PDOException $e){
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }
}
function addAnItem($table){
    try {
        $dbh = callPDO();
        $query = "INSERT INTO pretpi.$table";
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute();//execute query
        $id = $dbh->lastInsertId();
        $dbh = null;
        return $id;
    } catch (PDOException $e){
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }

}
function addUser($user){
    addAnItem("users (name,surname,email,password,Blocked,Roles_id)
    Values ('{$user["name"]}', '{$user["surname"]}','{$user["email"]}','{$user["password"]}','{$user["Blocked"]}','{$user["Roles_id"]}')");
}
function callPDO()
{
    require ".const.php";
    $dbh = new PDO('mysql:host' . $dbhost . ';dbname=' . $dbname, $user, $pass);
    return $dbh;
}

?>
