<?php
$pdo = new PDO('mysql:host=127.0.0.1;dbname=techsolutions;charset=utf8mb4', 'root', '', [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
]);

$pcId = isset($_GET['pc']) ? (int)$_GET['pc'] : 1;

$pc = $pdo->query("SELECT id, name, image_url, price FROM pcs WHERE id = ".$pcId)->fetch();
$components = $pdo->query("SELECT c.name FROM pc_components pc JOIN components c ON c.id=pc.component_id WHERE pc.pc_id=".$pcId)->fetchAll();
?>
<!doctype html>
<html lang="fr">
<head>
  <link rel="stylesheet" href="style_parc.css">
  <meta charset="utf-8"><title>Étape 04 — PC dynamique</title>
</head>
<body>
  <div class="centrage_div">
    <p > <a href="?pc=1" class="boutton" >PC DEV</a>  <a href="?pc=2" class="boutton" >PC Designer</a>  <a href="?pc=3" class="boutton" >PC ADMIN</a>  
    <a href="?pc=8" class="boutton" >PC Direction </a>  <a href="?pc=4" class="boutton" >PC RH  </a></p>
  </div>
  <h1 class="centrage_texte"><?php echo $pc ? $pc['name'] : 'PC introuvable'; ?></h1>
  <?php if ($pc): ?>
    <img src="<?php echo $pc['image_url']; ?>" alt="Image" class="centrage_image">
    <div class="rectangle">
    
    </div>
    <h2>Composants</h2>
    <ul>
      <?php foreach ($components as $r): ?>
        <li class="style_texte"><?php echo $r['name']; ?></li>
      <?php endforeach; ?>
    </ul>
    <h3>Description</h3>

    
    
  <?php endif; ?>
</body>
</html>
