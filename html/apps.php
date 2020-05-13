<?php

ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(-1);

$servername = "db";
$username = "user";
$password = "password";
$dbname = "mls";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

$stmt = $conn->prepare("SELECT system_name, criticality FROM app_info WHERE mls_id=?");
$id = $_GET["mls_id"];
$stmt->bind_param('i', $mls_id);
$stmt->execute();
$result = $stmt->get_result();

print("<html>");
if ($result->num_rows > 0) {
	// output data of each row
	while($row = $result->fetch_assoc()) {
		printf("<div>%s: %s</div>", $row["name"], $row["criticality"]);
	}
} else {
	print("<div>No apps found!</div>");
}
print("</html>");
$conn->close();

?>
