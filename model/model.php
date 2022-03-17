<?php

function getAllReviews()
{

    try {
        $dbh = callPDO();
        $query = 'SELECT * FROM reviews ';
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute();//execute query
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC);//prepare result for client
        $dbh = null;
        if ($debug) var_dump($queryResult);
        return $queryResult;
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }
}
function getReviewFilms($id)
{


    try {
        $dbh = callPDO();
        $query = 'select * from reviews
                    inner join films ON Films_id = films.id
                    inner join creators ON Creators_id = creators.id
                    where reviews.id = :id';
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute(['id' => $id]);//execute query
        $queryResult = $statement->fetch(PDO::FETCH_ASSOC);//prepare result for client
        $dbh = null;
        if ($debug) var_dump($queryResult);
        return $queryResult;
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }
}
function getReviewGames($id)
{


    try {
        $dbh = callPDO();
        $query = 'select * from reviews
                    inner join videogames ON VideoGames_id = videogames.id
                    inner join developers ON videogames.Developers_id = developers.id
                    inner join platforms ON videogames.Platforms_id = platforms.id
                    where reviews.id = :id';
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute(['id' => $id]);//execute query
        $queryResult = $statement->fetch(PDO::FETCH_ASSOC);//prepare result for client
        $dbh = null;
        if ($debug) var_dump($queryResult);
        return $queryResult;
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }
}


function addAnItem($table)
{
    try {
        $dbh = callPDO();
        $query = "INSERT INTO $table";
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute();//execute query
        $id = $dbh->lastInsertId();
        $dbh = null;
        return $id;
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }

}

function addUser($user)
{
    addAnItem("users (firstname,lastname,email,password,Blocked,Roles_id)
    Values ('{$user["firstname"]}', '{$user["lastname"]}','{$user["email"]}','{$user["password"]}','{$user["Blocked"]}','{$user["Roles_id"]}')");
}

function getAllItems($table)
{
    try {
        $dbh = callPDO();
        $query = "SELECT * FROM $table";
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute();//execute query
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC);//prepare result for client
        $dbh = null;
        if ($debug) var_dump($queryResult);
        return $queryResult;
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }
}

function getUsers()
{
    $users = getAllItems("users");
    return $users;
}

function callPDO()
{
    require ".const.php";
    $dbh = new PDO('mysql:host=' . $dbhost . ';dbname=' . $dbname, $user, $pass);
    return $dbh;
}

?>
