
<?php require 'header.php' ; ?>

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
            Liste articles <div class="float-right"> <a href="?action=newpost" class="btn btn-success">Ajouter un article</a></div></div>

          <div class="card-body">
            <form method="POST" action="?action=create-post" enctype="multipart/form-data">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="Titre" name="title" class="form-control" placeholder="Titre" required="required" value="">
                  <label for="Titre">Titre</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="file" id="Image" name="image" class="form-control" placeholder="Image" required="required" value="">
                  <label for="Image">Image</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
             <textarea class="form-control" rows="10" name="content"></textarea>
            </div>
   
          </div>
          <input type="submit" name="addpost" class="btn btn-primary btn-block" value="Ajouter">  
        </form>
          </div>
         
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
     <?php require 'footer.php' ; ?>
