<HTML>
<HEAD>
<TITLE>Show Authors</TITLE>
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


$sql = "select * from SG_INVENTORY";
echo $sql ."<br/>";

$result = mysql_query($sql);

echo ("<h2> Book Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";

?> 
</center>
</body>
</html>