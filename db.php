<?php
$HOST_NAME = "localhost";
$DB_USER = "root";
$DB_PASS = "";
$DB_NAME = "church_db";

//connecting string

$conn = mysqli_connect($HOST_NAME, 
$DB_USER, $DB_PASS, $DB_NAME);
if(!$conn){
    die("connection failed".mysqli_connect_error());
};
if (isset($_POST['submit'])){

$email= $_POST['email'];

if(empty($email) ){

    echo"All fields are empty";
    die();
}


$insert_query= "INSERT INTO subcribe(email) 
VALUES('$email')";
$result=mysqli_query($conn,$insert_query);
if($result){

echo "Record created succcessfully";
}else{

echo "Not created";
};
}

;




?>