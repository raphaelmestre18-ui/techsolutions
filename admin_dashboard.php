<?php
// filepath: c:\xampp\htdocs\techsolutions\admin_dashboard.php
session_start();

if (!isset($_SESSION['admin_id'])) {
    header('Location: admin_login.php');
    exit;
}

$admin_name = $_SESSION['admin_username'] ?? 'Admin';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>TechSolutions — Admin Dashboard</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="fichier_css.css">
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
      margin: 0;
      background: #f5f5f5;
    }
    .admin-header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .admin-header h1 {
      margin: 0;
      font-size: 24px;
    }
    .logout-btn {
      background: rgba(255,255,255,0.2);
      color: white;
      border: 1px solid white;
      padding: 8px 16px;
      border-radius: 5px;
      cursor: pointer;
      text-decoration: none;
      transition: background 0.3s;
    }
    .logout-btn:hover {
      background: rgba(255,255,255,0.3);
    }
    .container {
      max-width: 1200px;
      margin: 40px auto;
      padding: 0 20px;
    }
    .dashboard-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 20px;
    }
    .card {
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    .card h3 {
      margin-top: 0;
      color: #667eea;
    }
    .card p {
      color: #666;
      line-height: 1.6;
    }
    .card a {
      display: inline-block;
      margin-top: 15px;
      padding: 10px 20px;
      background: #667eea;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      transition: background 0.3s;
    }
    .card a:hover {
      background: #764ba2;
    }
  </style>
</head>
<body>

  <div class="admin-header">
    <h1>Tableau de bord Admin</h1>
    <a href="admin_logout.php" class="logout-btn">Déconnexion</a>
  </div>

  <div class="container">
    <p>Bienvenue, <strong><?php echo htmlspecialchars($admin_name); ?></strong> !</p>

    <div class="dashboard-grid">
      <div class="card">
        <h3>📰 Gérer les articles</h3>
        <p>Ajouter, modifier ou supprimer les actualités du site.</p>
        <a href="admin_articles.php">Gérer les articles</a>
      </div>

      <div class="card">
        <h3>⚙️ Paramètres</h3>
        <p>Configurer les paramètres généraux du site.</p>
        <a href="admin_settings.php">Paramètres</a>
      </div>

      <div class="card">
        <h3>👥 Utilisateurs</h3>
        <p>Gérer les comptes administrateurs.</p>
        <a href="admin_users.php">Gérer les utilisateurs</a>
      </div>
    </div>
  </div>

</body>
</html>