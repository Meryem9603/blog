<?php  require 'header.php' ;?>

  <div id="wrapper">

    <!-- Sidebar -->
    <?php require 'sidebar.php' ; ?>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Liste articles <div class="float-right"> <a href="?action=create-post" class="btn btn-success">Ajouter un article</a></div></div>

          <div class="card-body">
            <form method="POST" action="?action=update-post&id=<?=$post->getId()?>"  enctype="multipart/form-data">
          <div class="form-group">
            <div class="form-row">
              
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="Titre" name="title" class="form-control" placeholder="Titre" required="required" value="<?=$post->getTitle()?>">
                  <label for="Titre">Titre</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="file" id="Image" name="image" class="form-control" placeholder="Image"  value="">
                  <label for="Image">Image</label>
                </div>
              </div>
            </div>
          </div>
          <input type="hidden" name="id"  value="<?=$post->getId()?>">
          <div class="form-group">
            <div class="form-label-group">
             <textarea id ="content" class="form-control" rows="10" name="content"><?=$post->getContent()?></textarea>
            </div>
   
          </div>
          <input type="submit" name="updatepost" class="btn btn-primary btn-block" value="Enregistrer les modifications">  
        </form>
          </div>
         
        </div>

      </div>
      <!-- /.container-fluid -->
       <script src="https://cloud.tinymce.com/5/tinymce.min.js?apiKey=r1w9edpm847iapdh3y4svpyqq0s4081uv050bvgdhiywxltx"></script>

       <script>
      tinymce.init({
        selector: '#content'
      });
  </script>
      <!-- Sticky Footer -->
      <?php require 'footer.php'; ?>