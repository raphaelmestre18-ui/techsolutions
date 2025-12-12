<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>TechSolutions — Contact</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="fichier_css.css">
</head>
<body>

  <?php include 'header.php'; ?>

  <main class="contenu_principal">
    <section class="contact-section">
      <div class="container contact-grid">
        <div class="contact-info">
          <h2>Contactez-nous</h2>
          <p>Une question ? Un projet ? N'hésitez pas à nous contacter pour discuter de vos besoins.</p>

          <div class="card contact-card">
            <div class="ci">
              <span class="ci-icone">✉️</span>
              <div>
                <div class="ci-titre">Email</div>
                <div class="ci-texte"><a href="mailto:contact@techsolutions.fr">contact@techsolutions.fr</a></div>
              </div>
            </div>

            <div class="ci">
              <span class="ci-icone">📞</span>
              <div>
                <div class="ci-titre">Téléphone</div>
                <div class="ci-texte">+33 .. .. .. .. ..</div>
              </div>
            </div>

            <div class="ci">
              <span class="ci-icone">📍</span>
              <div>
                <div class="ci-titre">Adresse</div>
                <div class="ci-texte">123 Avenue de l'Innovation<br>19100 Brive, France</div>
              </div>
            </div>
          </div>
        </div>

        <aside class="contact-form-wrap">
          <div class="card form-card">
            <form id="contactForm" action="#" method="post" novalidate>
              <label for="fullname">Nom complet *</label>
              <input id="fullname" name="fullname" type="text" required>

              <label for="email">Email *</label>
              <input id="email" name="email" type="email" required>

              <label for="subject">Sujet *</label>
              <select id="subject" name="subject" required>
                <option value="">Sélectionnez un sujet</option>
                <option>Demande de devis</option>
                <option>Support technique</option>
                <option>Recrutement</option>
                <option>Autre</option>
              </select>

              <label for="message">Message *</label>
              <textarea id="message" name="message" rows="6" required></textarea>

              <div class="form-foot">
                <small>* En soumettant ce formulaire, vous acceptez que vos données soient traitées conformément à notre <a href="#">politique de confidentialité</a>.</small>
                <button type="submit" class="btn btn-primary">Envoyer</button>
              </div>
            </form>
          </div>
        </aside>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">© 2025 TechSolutions</div>
  </footer>

</body>
</html>