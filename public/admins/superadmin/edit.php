<?php require_once('../../../private/initialize.php'); ?>
<?php require_once(PRIVATE_PATH . '/includes/admin_header.php'); ?>
<?php require_once(PRIVATE_PATH . '/includes/super_admin_header.php'); ?>

<div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
    <h2 class="w3-text-light-grey">Update Admin Record</h2>
    <hr style="width:200px" class="w3-opacity">
    <p>Provide all information below</p>

<?php

  $args['name'] = "Asmaa Gamal";
  $args['email'] = "aoikawa@gmail.com";
  $args['username'] = "Aoikawa ";
  $password = '147258';
  $args['hashed_password'] = password_hash($password, PASSWORD_BCRYPT);
  $args['is_super'] = 0;
  $args['id'] = 5;

  $admin = new Admin($args);
  $result = $admin->update();

  if (!$result) {
    echo "error updating your recod ";
  }else {
    echo "Your record updating successfully";
  }
  //var_dump($args);*/
?>


</div>





  </body>
</html>
