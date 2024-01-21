<?php
header('Access-Control-Allow-Origin: *');
include "./conn.php";

$imeiNo = isset($_REQUEST['imeNumber']) ? $_REQUEST['imeNumber'] : '';
$deviceName = isset($_REQUEST['name']) ? $_REQUEST['name'] : '';

if (!empty($imeiNo) && !empty($deviceName)) {
    // แทนที่คำสั่ง SQL สำหรับการเพิ่มข้อมูลลงในตาราง tb_device
    $sql = "INSERT INTO tb_device(imei_no, DeviceName) VALUES ('$imeiNo','$deviceName')";

    if (mysqli_query($conn, $sql)) {
        // การเพิ่มข้อมูลสำเร็จ
        http_response_code(200);
        // echo json_encode(['message' => 'Insertion successful']);
    } else {
        // การเพิ่มข้อมูลไม่สำเร็จ
        http_response_code(500); // Internal Server Error
        // echo json_encode(['message' => 'Insertion failed']);
    }
}
