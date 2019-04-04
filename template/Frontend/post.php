<?php include('header.php'); ?>


<div class="container">
<div class="row article">

<article class="col-lg-8">
<h1><?php echo $post->getTitle()?></h1>

<?php 
    if ($post->getPicture()) {?>
        <img class="card-img-top" src="admin/uploads/<?= $post->getPicture() ?>" width=730 height=412 alt="image"/>
    <?php  
    } else{?>
        <img class="card-img-top" src="alaska.jpg" alt="image"/>
  <?php
    }?>
<p>
<?php echo $post->getContent()?>
</p>


</article>


<nav class="col-lg-3 offset-lg-1">
<ul class="list-group">

<?php foreach ($allPosts as $post) { ?>

  <li class="list-group-item <?php if($post->getId() == $_GET['id']) { echo 'active'; } ?>">
  
  <a href="?action=detailpost&id=<?= $post->getId() ?>" class="a"><?= $post->getTitle() ?></a>
</li>

  <?php } ?>
</ul>
</nav>

</div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-8">
          <div class="page-header">
            <h1><small class="pull-right"><?=count($comments)?> comments</small> Comments </h1>
          </div> 
           <div class="list-group">
               <?php 
               foreach ($comments as $comment) {

               	?>
               <div class="list-group-item flex-column align-items-start ">
      			    <div class="d-flex w-100 justify-content-between">
      			      <h5 class="mb-1"><?=$comment->getUsername()?></h5>
      			      <small><?=$comment->getCreated()?></small>
      			    </div>
      			    <p class="mb-1"><?=$comment->getComment()?>.</p>
      			    <small><?=$comment->getCreated()?></small>
                <a href="?report=<?=$comment->getId()?>" class="btn btn-danger float-right">Signaler</a>
      			  </div>
               	<?php
               }
               ?>
               <div class="list-group-item flex-column align-items-start ">
                <div class="col-md-8 ">
                   <form method="POST" action='/Blog/public/index.php'>
                      <label>Nom et Prénom :</label>
                      <input type="text" name="username" class="form-control" >
                      <label>Adresse é-mail :</label>
                      <input type="mail" name="mail"  class="form-control" > 
                      <label>Commentaire :</label>
                      <textarea rows="4"  class="form-control" name="comment"></textarea>
                      <input type="hidden" name="post_id" value="<?= $_GET['id'] ?>">
                      <input type="submit" class="btn btn-success mt-2 float-right" name="addComment" value="Envoyer">
                  </form>
                </div>
              </div>
               

           </div>
         
        </div>
    </div>
</div>



<?php include('footer.php'); ?>