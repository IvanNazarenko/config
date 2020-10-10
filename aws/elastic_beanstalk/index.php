<!DOCTYPE html>
<html>
<body>
<center>
<h1>My WEB server</h1>

<?php
echo '<p style="color: yellow; text-align: center">
	Hello From AWS Elastic Beanstask  Web Server!
     </p>';

echo '<br> Local IP:' .$_SERVER ['SERVER_ADDR'];
?>
</center>
</body>
</html>
