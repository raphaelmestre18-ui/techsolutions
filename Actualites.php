<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>TechSolutions — Actualités</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="fichier_css.css">
</head>
<body>

  <header class="site-header">
    <div class="container header-inner">
      <div class="brand">
        <img src="IMG/LogoTechsolutions.png" alt="TechSolutions" class="brand-logo">
        
      </div>

      <nav class="main-nav" aria-label="Navigation principale">
        <a href="TS.php" class="nav-link">Accueil</a>
        <a href="Services.php" class="nav-link">Services</a>
        <a href="Actualites.php" class="nav-link active">Actualités</a>
        <a href="Contact.php" class="nav-link">Contact</a>
      </nav>

      <div class="header-actions">
        <a href="#" class="link-muted">Espace Client</a>
        <a href="#" class="btn btn-primary">Admin</a>
      </div>
    </div>
  </header>

  <main class="contenu_principal">
    <section class="actualites-hero">
      <div class="container">
        <h1>Actualités</h1>
        <p class="accroche">Restez informés de nos derniers projets et des tendances du secteur</p>

        <div class="filtres">
          <button class="filtre actif">Tous</button>
          <button class="filtre">Produits</button>
          <button class="filtre">Tendances</button>
          <button class="filtre">Entreprise</button>
        </div>

        <div class="grid-articles">
          <article class="article-card">
            <img src="IMG/article1.jpg" alt="Lancement cloud">
            <div class="article-body">
              <div class="meta">📅 1 novembre 2025   •   Produits</div>
              <h3>Lancement de notre nouvelle solution Cloud</h3>
              <p>TechSolutions annonce le lancement de sa nouvelle plateforme cloud qui permet aux entreprises de migrer leurs infrastructures et gagner en agilité.</p>
            </div>
          </article>

          <article class="article-card">
            <img src="IMG/article2.jpg" alt="IA tendances">
            <div class="article-body">
              <div class="meta">📅 28 octobre 2025   •   Tendances</div>
              <h3>Intelligence Artificielle : Les tendances 2025</h3>
              <p>Découvrez notre analyse des principales tendances en matière d'IA pour 2025 : apprentissage, vision par ordinateur et plus encore.</p>
            </div>
          </article>

          <article class="article-card">
            <img src="IMG/article3.jpg" alt="Equipe bureau">
            <div class="article-body">
              <div class="meta">📅 10 octobre 2025   •   Entreprise</div>
              <h3>Nouvelles initiatives internes</h3>
              <p>Retour sur les projets internes et initiatives RH pour améliorer la collaboration et le bien‑être au travail.</p>
            </div>
          </article>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">© 2025 TechSolutions</div>
  </footer>

</body>
</html>