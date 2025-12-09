<?php
// filepath: c:\xampp\htdocs\techsolutions\admin_dashboard.php
session_start();

// accès réservé aux admins
if (!isset($_SESSION['admin_id'])) {
    header('Location: admin_login.php');
    exit;
}

try {
    $pdo = new PDO('mysql:host=127.0.0.1;dbname=techsolutions;charset=utf8mb4', 'root', '', [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ]);
} catch (Exception $e) {
    die('Erreur connexion DB : ' . $e->getMessage());
}

$pcId = isset($_GET['pc']) ? (int)$_GET['pc'] : 1;

// Récupération PC — ne demande pas la colonne description si elle n'existe pas
$stmt = $pdo->prepare('SELECT id, name, image_url, price FROM pcs WHERE id = :id LIMIT 1');
$stmt->execute([':id' => $pcId]);
$pc = $stmt->fetch();

// Récupération composants
$stmt2 = $pdo->prepare('SELECT c.name FROM pc_components pc JOIN components c ON c.id = pc.component_id WHERE pc.pc_id = :id');
$stmt2->execute([':id' => $pcId]);
$components = $stmt2->fetchAll();

$admin_name = $_SESSION['admin_username'] ?? 'Admin';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>TechSolutions — Gestion du parc</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="fichier_css.css">
  <style>
    body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; margin:0; background:#f5f5f5; }
    .admin-header { background: linear-gradient(135deg,#667eea 0%,#764ba2 100%); color:white; padding:16px 24px; display:flex; justify-content:space-between; align-items:center;}
    .logout-btn { background: rgba(255,255,255,0.18); color:white; padding:8px 12px; border-radius:6px; text-decoration:none; }
    header.admin-top { display:flex; align-items:center; justify-content:space-between; padding:14px 28px; background:#fff; box-shadow:0 1px 0 rgba(0,0,0,0.05); }
    .brand { display:flex; align-items:center; gap:12px; } .brand img{ height:34px; }
    .centrage_div { text-align:center; margin:18px 0; }
    .centrage_image { max-width:420px; width:100%; display:block; margin:18px auto; border-radius:8px; }
    .rectangle { text-align:center; margin:12px 0; }
    .Prix { font-weight:700; }
  </style>
</head>
<body>
  <header class="admin-top" role="banner">
    <div class="brand">
      <a href="TS.php"><img src="IMG/LogoTechsolutions.png" alt="TechSolutions"></a>
      <strong>Gestion du parc</strong>
    </div>
    <div class="admin-actions">
      <span style="margin-right:12px;color:#fff;">Connecté : <?php echo htmlspecialchars($admin_name); ?></span>
      <a class="logout-btn" href="admin_logout.php">Déconnexion</a>
    </div>
  </header>

  <main style="padding:20px;">
    <div class="centrage_div">
      <p>
        <a href="?pc=1" class="boutton">PC DEV</a>
        <a href="?pc=2" class="boutton">PC Designer</a>
        <a href="?pc=3" class="boutton">PC ADMIN</a>
        <a href="?pc=8" class="boutton">PC Direction</a>
        <a href="?pc=4" class="boutton">PC RH</a>
      </p>
    </div>

    <h1 class="centrage_texte"><?php echo $pc ? htmlspecialchars($pc['name']) : 'PC introuvable'; ?></h1>

    <?php if ($pc): ?>
      <img src="<?php echo htmlspecialchars($pc['image_url']); ?>" alt="Image" class="centrage_image">
      <div class="rectangle">
        <p class="Prix">Prix : <?php echo number_format((float)$pc['price'], 2, ',', ' '); ?> €</p>
      </div>

      <h2>Composants</h2>
      <?php if (!empty($components)): ?>
        <ul>
          <?php foreach ($components as $r): ?>
            <li class="style_texte"><?php echo htmlspecialchars($r['name']); ?></li>
          <?php endforeach; ?>
        </ul>
      <?php else: ?>
        <p>Aucun composant trouvé pour ce PC.</p>
      <?php endif; ?>

      <h3>Description</h3>
      <?php
        // Si la colonne description existe dans la table, récupère-la ; sinon affiche un texte par défaut.
        $description = 'Pas de description.';
        try {
            $colCheck = $pdo->query("SHOW COLUMNS FROM pcs LIKE 'description'")->fetch();
            if ($colCheck) {
                $stmtDesc = $pdo->prepare('SELECT description FROM pcs WHERE id = :id LIMIT 1');
                $stmtDesc->execute([':id' => $pcId]);
                $rowDesc = $stmtDesc->fetch();
                if ($rowDesc && !empty($rowDesc['description'])) {
                    $description = $rowDesc['description'];
                }
            }
        } catch (Exception $e) {
            // ignorer, on utilisera le texte par défaut
        }
      ?>
      <p><?php echo nl2br(htmlspecialchars($description)); ?></p>

    <?php else: ?>
      <p>PC introuvable.</p>
    <?php endif; ?>
  </main>

  <footer style="text-align:center;padding:24px;color:#889;">© 2025 TechSolutions</footer>
</body>
</html>