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


$sql1 = "select * from SG_AUTHOR";
echo $sql1 ."<br/>";
$sql2 = "select * from SG_INVENTORY";
echo $sql2 ."<br/>";
$sql3 = "select * from SG_AUTHOR_INVENTORY_INT";
echo $sql3 ."<br/>";
$sql4 = "select * from SG_CUSTOMER";
echo $sql4 ."<br/>";
$sql5 = "select * from SG_BOOKS_LENT";
echo $sql5 ."<br/>";
$sql6 = "select * from SG_RETURN_INFO";
echo $sql6 ."<br/>";

$result1 = mysql_query($sql1);
$result2 = mysql_query($sql2);
$result3 = mysql_query($sql3);
$result4 = mysql_query($sql4);
$result5 = mysql_query($sql5);
$result6 = mysql_query($sql6);


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

echo ("<h2> Book Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result2)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result2);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";

echo ("<h2> Book/Author Intersection Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result3)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result3);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";

echo ("<h2> Customer Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result4)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result4);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";

echo ("<h2> Books Lent Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result5)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result5);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";

echo ("<h2> Books Returned Table </h2>");

echo ("<TABLE border=2>");
while($row=mysql_fetch_row($result6)){
echo("<TR>");
for($j=0;$j<mysql_num_fields($result6);$j++){
echo("<TD>".$row[$j]."</TD>");
}
echo("</TR>");
}
echo "</TABLE>";

?> 
</center>
</body>
</html>