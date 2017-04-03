# Todo list

## Contenu
- add alert in profile => place#new event#new
- proposer lien vers inscription artiste / professional / etc... dans les forms d'isncription

## Intégration
- bug hover sur la liste des lieux
- hoverride submit event on form tag manage
- créer un helper permettant de savoir si on participe/visite
- update place_id pour les events
- Formulaire :
    - surcharger les pseudo class ::valid ::invalid sur les champs de formulaire
    - Intégrer checkbox, datepicker, select, radio
- resizer les container pour avoir des gabarit homogène sur tout le site
    - Reste à vérifier les show de place/exhibition/profile
- Intégrer work sans en local pour tester si c'est plus jolie
- resize la photo de la homepage (elle dépasse sur le header)
- améliorer design : error_explanation

## Back
- créer une table polymorphique pour image permettant de mutualiser image_users et image_place
- modéliser une table de notification
- faire fonctionner visit
- faire recherche fonctionnel des artiste / des places / des expos
- créer un système d'email puissant


# Bug Tracker
- rajouter lien quand on est pas loggé pour inciter à l'inscription
- à l'ajout de photo sur la gallerie, on obtient l'erreur "param is missing or the value is empty: user"


# Bad code (but we're speed so we don't have time for all)
## Please, don't judge :(

- profile/visit : Replace uggly conditions to trasnslate users status
