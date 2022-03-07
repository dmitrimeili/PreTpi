<?php

function getAllReviews()
{
    require".const.php";
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
function callPDO()
{
    require ".const.php";
    $dbh = new PDO('mysql:host' . $dbhost . ';dbname=' . $dbname, $user, $pass);
    return $dbh;
}

?>
