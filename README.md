# AvisBoost — prototype de lancement

## Ce que contient cette version
- Landing page responsive (`index.html`)
- Tableau de bord de démonstration (`app.html`)
- Générateur local de réponses suggérées (sans API IA)
- Création de message de demande d'avis à partir de votre lien
- Export JSON des paramètres locaux

## Limites importantes
Ceci est un prototype front-end, pas encore un SaaS commercial complet :
- pas de comptes utilisateurs ni de base de données serveur ;
- pas de connexion à Google Business Profile ;
- pas d'envoi automatique de SMS/e-mails ;
- pas de paiement Stripe ;
- chiffres du tableau de bord fictifs ;
- aucune réponse n'est publiée automatiquement.

Ne présentez pas les chiffres de démonstration comme des résultats réels. Demandez un avis honnête à tous les clients sans filtrer les demandes selon leur satisfaction et respectez les règles des plateformes.

## Publication gratuite (sans acheter de domaine)
1. Créez un compte GitHub : https://github.com
2. Créez un dépôt public nommé `avisboost`.
3. Téléversez `index.html`, `app.html` et `README.md`.
4. Dans le dépôt : Settings → Pages.
5. Source : Deploy from a branch ; branche `main`, dossier `/root` ; Save.
6. Après quelques minutes, GitHub Pages affiche l'adresse publique de votre site dans Settings → Pages.

Alternative : glissez-déposez le dossier sur https://app.netlify.com/drop (selon les conditions et limites de l'offre gratuite).

## Avant de vendre
Il faudra ajouter un backend sécurisé, authentification, stockage isolé par client, politique de confidentialité, conditions d'utilisation, gestion RGPD, facturation et tests. Vérifiez aussi les obligations françaises applicables à la collecte et au traitement des données.
