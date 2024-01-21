<?php
include 'conn.php';
header("Access-Control-Allow-Origin: *");

$xcase = $_POST['case'];

// Common variables
$id_card = $_POST['id_card'];
$titlename = $_POST['titlename'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$date_of_birth = $_POST['date_of_birth'];
$heart_value = $_POST['heart_value'];
$pulse_value = $_POST['pulse_value'];

$response = array();

switch ($xcase) {
    case '1': // insert
        $sql = "INSERT INTO user (id_card, titlename, firstname, lastname, date_of_birth, heart_value, pulse_value)
                VALUES ('$id_card', '$titlename', '$firstname', '$lastname', '$date_of_birth', '$heart_value', '$pulse_value')";

        if (mysqli_query($conn, $sql)) {
            $response['status'] = 200;
            $response['message'] = "User data inserted successfully";
        } else {
            $response['status'] = 500;
            $response['message'] = "Failed to insert user data: " . mysqli_error($conn);
        }
        break;

    case '2': // update
        $sql = "UPDATE user
                SET titlename='$titlename', firstname='$firstname', lastname='$lastname',
                    date_of_birth='$date_of_birth', heart_value='$heart_value', pulse_value='$pulse_value'
                WHERE id_card='$id_card'";

        if (mysqli_query($conn, $sql)) {
            $response['status'] = 200;
            $response['message'] = "User data updated successfully";
        } else {
            $response['status'] = 500;
            $response['message'] = "Failed to update user data: " . mysqli_error($conn);
        }
        break;

    case '3': // delete
        $sql = "DELETE FROM user WHERE id_card='$id_card'";

        if (mysqli_query($conn, $sql)) {
            $response['status'] = 200;
            $response['message'] = "User data deleted successfully";
        } else {
            $response['status'] = 500;
            $response['message'] = "Failed to delete user data: " . mysqli_error($conn);
        }
        break;

    default:
        $response['status'] = 400;
        $response['message'] = "Invalid case provided";
        break;
}

echo json_encode($response);

mysqli_close($conn);
