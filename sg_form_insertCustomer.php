<HTML>
<HEAD>
<TITLE>Become a Library Member!</TITLE>
</HEAD>
<BODY>
<center>
<?php

$host = 'dany.simmons.edu';
$user = 'gao9';
$password = '1539372';
$database = '33302sp16_gao9';

echo "Server Name " .$host ."<br/><br/>";
echo 'Attempting to connect to server <br/><br/>';
$conn = mysql_connect($host,$user,$password) or die('unable to connect' . mysql_error($conn));
echo 'Successfully connected to server';
echo "<br/><br/>";
echo "Database name: ". $database . "<br/><br>";
echo 'Attempting to connect to database <br/><br/>';
mysql_select_db($database,$conn) or die ('unable' . msql_error($conn));
echo "Connected to database " . $database;

echo "<br/><br/>";
echo " POST info: <br/>";
$FirstName = mysql_real_escape_string($_POST["FirstName"]);
$LastName = mysql_real_escape_string($_POST["LastName"]);
$address = mysql_real_escape_string($_POST["address"]);
$zip = mysql_real_escape_string($_POST["zip"]);
$phone = mysql_real_escape_string($_POST["phone"]);
echo $FirstName." <br/>";
echo $LastName." <br/>";
echo $address." <br/>";
echo $zip."<br/>";
echo $phone." <br/>";

$procedure = "CALL InsertSGCustomer('$FirstName', '$LastName', '$address', '$zip', '$phone')";
echo $procedure ."<br/>";
$sql = "select * from SG_CUSTOMER";
$result2 = mysql_query($procedure);
$result1 = mysql_query($sql);

echo ("<h2> Customer Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result1)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result1);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";


?> 
</center>
</body>
</html>