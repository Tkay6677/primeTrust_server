<?php 
require_once 'connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = strtoupper($_POST['email']);
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        setcookie('isLoggedIn', $row["id"], time() + 3600, '/');
        header("Location:  http://127.0.0.1:5500/html/dashboard/index.html");
    } else {
        echo "Invalid username or password!";
    }
    $result = mysqli_query($conn, $sql);
}
mysqli_close($conn);
?>