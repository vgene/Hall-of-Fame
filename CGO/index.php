<?php
function curPageURL() {
	return "https://".$_SERVER['SERVER_NAME'];
}
function myInclude($arg_1)
{
  $ch = curl_init();
  curl_setopt ($ch, CURLOPT_URL, $arg_1);
  curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
  $contents = curl_exec($ch);
  curl_close($ch);
  echo $contents;
}

function head()
{
?>
<title> <?php echo basename(getcwd()); ?> Hall of Fame</title>
<?php
}
?>

<?php
function page()
{
echo myInclude(curPageURL()."/Fame/".basename(getcwd())."/fame.html");
?>



<?php
}
?>

<?php ob_start(); ?>
<div align="center" class="side-extra">
<p><a href="#liberty">Find Liberty!</a> </p>
</div>
<?php $sidebar_extra_content = ob_get_clean();?>


<?php require("../../page.php") ?>
