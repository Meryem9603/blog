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
            Liste commentaires </div>

          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  

                  <tr>
                    <th>nom d'utilisateur</th>
                    <th>adresse é-mail</th>
                    <th>commentaire</th>
                    <th>Date de création</th>
                    <th>Date modification</th>
                    <th>Signale</th>
                    <th>Action</th>
                    
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($comments as $comment) { ?>
                   <tr>
                    <td><a href="?action=detailpost&id=<?= $comment->getPost()?>"><?= $comment->getUsername()?></a></td>
                    <td><?= $comment->getMail()?></td>
                    <td><?= substr($comment->getComment(),0,100)  ?>...</td>
                    <td><?= $comment->getCreated()?></td>
                    <td><?= $comment->getUpdated()?></td>
                    <td><?= $comment->getReport()?></td>
                    <td> <a href="?action=deletecomment&id=<?= $comment->getId()?>" >supprimer</a></td>
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