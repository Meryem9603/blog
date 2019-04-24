<?php include('header.php'); ?>



  <div class="container" >
    <div class="row intro" >
      <div class="col-md-6"><p><img src="alaska.jpg" alt="photo de l'alaska" id="alaska"></p></div>
       <div class="col-md-5"><p>Bonjour, je suis Jean Forteroche, acteur et écrivain, je vous souhaite la bienvenue sur mon blog où vous allez trouver la version numérique de mon dernier roman intitulé ‘Billet simple pour l’Alaska‘, N’hésitez pas à y laisser des commentaires.
       Je vous souhaite une bonne lecture.

</p></div>
    </div>
  </div>

  <div class="container">

          <div class="row">
           
            <?php foreach ($posts as $post) {?>
             <div class="col-md-4">
              <div class="card mb-4 box-shadow">
              <?php 
              if ($post->getPicture()) {?>
                  <img class="card-img-top" src="admin/uploads/<?= $post->getPicture() ?>" width=348 height=196 alt="image"/>
              <?php  
              } else{?>
                  <img class="card-img-top" src="alaska.jpg" alt="image"/>
            <?php
              }

              ?>
               
                <div class="card-body">
                  <p class="card-text">
                  <b><?=$post->getTitle()?></b><br />
                  <?=substr($post->getContent(), 0,130)?>
                  </p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <?php
                     echo '<a href="?action=detailpost&id='.$post->getId().'" class="btn btn-sm btn-outline-secondary">Lire la suite</a>' ?>
                      
                    </div>
                    <small class="text-muted"><?=$post->getCreated()?></small>
                  </div>
                </div>
              </div>
            </div>
           <?php } ?>

            


<nav aria-label="...">
  <ul class="pagination">
   <?php for ($i=1; $i <= $total_pages ; $i++) { ?>
    
     <li class="page-item "> 
      <?php echo '<a class="page-link" href="?page='.$i.'">'.$i.'</a>' ?>
    
      </li>

     <?php
   }
    
    
  ?> 
  </ul>
</nav>


          </div>
        </div>

<?php include('footer.php'); ?>