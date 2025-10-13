<?php
if (isset($_POST['vrm'])) {
    $vrm = strtoupper(trim($_POST['vrm']));
    $apiKey = "86fa92fac0718076c9f1967e18c4bd6c";
    $url = "https://api.checkcardetails.co.uk/vehicledata/vehicleregistration?apikey={$apiKey}&vrm={$vrm}";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        echo json_encode(["status" => "error", "message" => curl_error($ch)]);
        exit;
    }
    curl_close($ch);

    $data = json_decode($response, true);
    // echo "<pre>";
    // print_r($data);
    // echo "</pre>";
    

    if ($data) {
        echo json_encode(["status" => "success", "data" => $data]);
    } else {
        echo json_encode(["status" => "error", "message" => "Invalid response from API"]);
    }
}
