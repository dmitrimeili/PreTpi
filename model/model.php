<?php

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

function getAllReviews()
{
    $table = getAllItems("reviews where approuved = 1");
    return $table;

}
function getAllReviewsNotApprouved()
{
    $table = getAllItems("reviews where approuved = 0");
    return $table;

}

function getAllPlatforms()
{
    $table = getAllItems("platforms");
    return $table;

}

function getAllVideogamesCategories()
{
    $table = getAllItems("videogamecategories");
    return $table;
}

function getVideogames()
{
    $table = getAllItems("videogames");
    return $table;
}

function getUsers()
{
    $users = getAllItems("users");
    return $users;
}

function getAnItem($table)
{
    try {
        $dbh = callPDO();
        $query = "SELECT * FROM $table";
        $statment = $dbh->prepare($query);
        $statment->execute();
        $queryResults = $statment->fetch(PDO::FETCH_ASSOC);
        return $queryResults;
        $dbh = null;
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }
}

function getAUser($email)
{
    $user = getAnItem("users where email = '$email'");
    return $user;
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

function addAReview($review)
{
    addAnItem("reviews (title,review,rating,date,approuved,Users_id,VideoGames_id)
    Values ('{$review["title"]}','{$review["review"]}','{$review["rating"]}','{$review["date"]}','{$review["approuved"]}','{$review["Users_id"]}','{$review["VideoGames_id"]}')");
}

function getReviewByType($id)
{

    try {
        $dbh = callPDO();
        $query = ' select * from reviews
        inner join videogames ON reviews.VideoGames_id = videogames.id
        inner join platforms ON videogames.Platforms_id = platforms.id
        where Platforms.id = :id ';
        $statement = $dbh->prepare($query);//prepare query
        $statement->execute(['id' => $id]);//execute query
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
function UpdateItem($table)
{
    try{
        $dbh = callPDO();
        $query = "UPDATE $table";
        $statement = $dbh->prepare($query);
        $statement->execute();
        $queryResult = $statement->fetch();
        $dbh = null;
        return $queryResult;
    }catch (PDOException $e){
        print "Error!: " . $e->getMessage() . "<br/>";
        return null;
    }
}
function ApprouveAReview($id)
{
    UpdateItem("reviews set approuved = 1 where id = $id");

}
function BlockAUser($id)
{
    UpdateItem("users set Blocked = 1 where id = $id");
}
function UnBlockAUser($id)
{
    UpdateItem("users set Blocked = 0 where id = $id");
}
function callPDO()
{
    require ".const.php";
    $dbh = new PDO('mysql:host=' . $dbhost . ';dbname=' . $dbname, $user, $pass);
    return $dbh;
}

?>
