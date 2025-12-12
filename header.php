<?php
if (session_status() === PHP_SESSION_NONE) session_start();
?>
<header class="site-header">
  <div class="container header-inner">
    <div class="brand">
      <img src="IMG/LogoTechsolutions.png" alt="TechSolutions" class="brand-logo">
    </div>

    <nav class="main-nav" aria-label="Navigation principale">
      <a href="TS.php" class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) === 'TS.php') ? 'active' : ''; ?>">Accueil</a>
      <a href="Services.php" class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) === 'Services.php') ? 'active' : ''; ?>">Services</a>
      <a href="Actualites.php" class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) === 'Actualites.php') ? 'active' : ''; ?>">Actualités</a>
      <a href="Contact.php" class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) === 'Contact.php') ? 'active' : ''; ?>">Contact</a>
    </nav>

    <div class="header-actions">
      <a href="admin_login.php" class="btn btn-primary">Admin</a>
    </div>
  </div>
</header>
