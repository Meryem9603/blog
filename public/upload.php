<?php
$target_dir = "admin/uploads/";

$target_file = $target_dir . basename($_FILES["image"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
$uniquename = uniqid().".".$imageFileType ;
$target_file   = $target_dir.$uniquename ;
$check = getimagesize($_FILES["image"]["tmp_name"]);
if($check !== false) {
    echo "File is an image - " . $check["mime"] . ".";
    $uploadOk = 1;
} else {
    echo "Le fichier n'est pas une image.";
    $uploadOk = 0;
}

// Check if file already exists
if (file_exists($target_file)) {
    echo "Désolé, le fichier existe déjà.";
    $uploadOk = 0;
}
// Check file size
if ($_FILES["image"]["size"] > 500000) {
    echo "Désolé, votre fichier est trop volumineux.";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    echo "Désolé, seuls les fichiers JPG, JPEG, PNG et GIF sont autorisés.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Désolé, votre fichier n'a pas été téléchargé.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        $image_name = $uniquename;
        echo "Le fichier ". $uniquename. "est bien enregistré.";
    } else {
        echo "Désolé, une erreur s'est produite lors de l'envoi de votre fichier.";
    }
}
?>