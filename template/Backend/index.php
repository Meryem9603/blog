<?php require 'header.php'; ?>

  <div id="wrapper">

    <!-- Sidebar -->
    <?php require 'sidebar.php'; ?>

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
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  

                  <tr>
                    <th>Titre</th>
                    <th>Contenu</th>
                    <th>Date de création</th>
                    <th>Date modification</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($posts as $post) { ?>
                   <tr>
                    <td><a href="?action=detailpost&id=<?= $post->getId()?>"><?= $post->getTitle()?></a></td>
                    <td><?= substr($post->getContent(),0,100)  ?>...</td>
                    <td><?= $post->getCreated()?></td>
                    <td><?= $post->getUpdated()?></td>
                    <td><a href="?action=editpost&id=<?= $post->getId()?>" >modifier</a> <a href="?action=deletepost&id=<?= $post->getId()?>"  onclick="return confirm('etes vous sûr de vouloir supprimer cet article ?')" >supprimer</a></td>
                  </tr>
                  <?php } ?>
                  

                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <?php require 'footer.php'; ?>