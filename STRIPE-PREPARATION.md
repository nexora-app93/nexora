# Stripe pour NEXORA — préparation uniquement (aucun paiement réel)

## État
- Site public : https://nexora-app93.github.io/nexora/
- Page offres : https://nexora-app93.github.io/nexora/offres.html
- Offres prévues : Pro **19,99 € par mois**, Business **49,99 € par mois**.
- Ces montants sont des **prix finaux annoncés**. Le statut fiscal et l'obligation éventuelle de facturer la TVA ne sont **pas encore déterminés**. Ne pas supposer que la mention « TTC » signifie qu'une TVA doit être calculée ou reversée.
- Compte Stripe **NEXORA** connecté. L'accès connecté actuellement disponible est **en mode réel**, et non en mode test. Aucun produit, prix, lien de paiement, session Checkout ou prélèvement réel n'est créé ici.
- Abonnements Pro et Business **non commercialisés**. Les avis et suggestions locales fonctionnent sans Stripe.

## Configuration préalable (avant d'accepter de l'argent)
1. Déclarer l'activité et obtenir les informations d'entreprise nécessaires, en vérifiant le régime fiscal applicable.
2. Compléter dans Stripe les informations légales, les coordonnées de l'établissement et la situation fiscale exacte. Ne pas activer Stripe Tax sans vérifier les obligations et les juridictions.
3. Préparer et valider les CGV/conditions d'abonnement, modalités de résiliation et de rétractation applicables, politique de confidentialité et mentions légales.
4. Ouvrir le **mode test / sandbox Stripe** depuis le tableau de bord ; ne jamais copier une clé `sk_live_` dans GitHub ou dans un site HTML.
5. Créer **en mode test uniquement** deux produits NEXORA et leurs prix mensuels : 1999 et 4999 centimes d'euro, `recurring.interval=month`. Selon le régime fiscal confirmé, choisir avec soin `tax_behavior` et l'activation éventuelle de Stripe Tax. Conserver les `price_...` de test dans les secrets serveur.
6. Programmer des **Supabase Edge Functions côté serveur** : une fonction Checkout authentifiée (vérifie l'utilisateur et choisit le price_id dans une liste fixée côté serveur), un webhook Stripe signé (utilise le corps brut + `Stripe-Signature`), et un portail client authentifié. Jamais de `sk_...` ni de service-role dans GitHub Pages.
7. Enregistrer `customer.subscription.created`, `customer.subscription.updated`, `customer.subscription.deleted`, `invoice.paid`, `invoice.payment_failed` ; vérifier les signatures, gérer les doublons d'événements et synchroniser `public.abonnements`. Ne jamais donner le plan Pro/Business à partir d'un simple retour navigateur ou de paramètres envoyés par le client.
8. Tester avec cartes Stripe de test : souscription, rejet, renouvellement, annulation, accès refusé et changement d'offre. Passer en réel **uniquement après** revue des montants, taxes, mentions juridiques et webhooks.

## Règles de sécurité
- Ne pas déployer de point d'encaissement public tant que le circuit de paiement + webhook n'est pas vérifié.
- Aucun prix Stripe réel, ID client ou webhook secret ne doit être inventé.
- Le plan gratuit reste la valeur par défaut ; l'accès payant nécessite un statut attesté côté serveur.
- La fonctionnalité IA appelle un service distinct et peut rester indisponible jusqu'à l'ajout sécurisé de la clé API OpenAI.

## Références
- https://docs.stripe.com/billing/subscriptions/build-subscriptions?payment-ui=checkout
- https://docs.stripe.com/webhooks/signature
- https://docs.stripe.com/testing
- https://docs.stripe.com/billing/subscriptions/customer-portal
