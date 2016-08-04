<HTML>
<HEAD>
<TITLE>Donate a Book!</TITLE>
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
$bookTitle = mysql_real_escape_string($_POST["title"]);
$pubDate = mysql_real_escape_string($_POST["publicationDate"]);
echo $FirstName." <br/>";
echo $LastName." <br/>";
echo $bookTitle." <br/>";
echo $pubDate." <br/>";

$sql = "CALL addAuthorBook('$FirstName', '$LastName', '$bookTitle', '$pubDate')";
echo $sql ."<br/>";
$result = mysql_query($sql);

$author = "select * from SG_AUTHOR";
$inventory = "select * from SG_INVENTORY";
$intersect = "select * from SG_AUTHOR_INVENTORY_INT";
$result1 = mysql_query($author);
$result2 = mysql_query($inventory);
$result3 = mysql_query($intersect);

echo ("<h2> Author Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result1)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result1);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";

echo ("<h2> Books Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result2)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result2);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";

echo ("<h2> Intersectional Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result3)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result3);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";


?> 
</center>
</body>
</html>