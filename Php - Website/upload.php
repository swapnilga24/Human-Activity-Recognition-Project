<?php
//$target_dir = "uploads/";  $target_dir .
 /*$file = "input.csv";
  if (!unlink($file))
  {
      echo ("Error deleting $file");
  }
  else
  {
      echo ("Deleted $file");
  }
*/
  $target_file =  basename($_FILES["fileToUpload"]["name"]);
  $uploadOk = 1;
  $csvFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if csv file is a actual image or fake image
  if(isset($_POST["submit"])) 
  {
// Allow certain file formats
  if($csvFileType != "csv" ) 
  {
    echo "Sorry, only csv files are allowed.";
    $uploadOk = 0;
  }
// Check if $uploadOk is set to 0 by an error*/
  if ($uploadOk == 0) 
  {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
  }
  else 
  {  
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) 
    {
        echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
        rename($target_file,"input.csv");
        echo "<br><br><a href='input.csv'target='_blank'>click here</a>to check uploaded file";
    }
    else
    {
        echo "Sorry, there was an error uploading your file.";
    }
}
}
?>