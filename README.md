# PokéDart: une application Web en Dart pour capturer et échanger des Pokémon

## Aperçu

PokéDart est une application Web qui vous permet de capturer des Pokémon et de les échanger avec d'autres joueurs. Pour commencer, créez un compte en entrant votre nom d'utilisateur et votre mot de passe. Ensuite, accédez à la liste des Pokémon disponibles et choisissez celui que vous voulez capturer. Vous pouvez également échanger vos Pokémon avec d'autres joueurs en utilisant l'option "Échanger".

## Installation et configuration

- Dart SDK installé
- Flutter installé
- Connexion à Internet

## Instructions

1. Clonez le repo Git: git clone https://github.com/Mocky-FS/PokemonFight.git
2. Accédez au dossier du projet: cd PokemonFight
3. Exécutez pub get pour installer les dépendances
4. Exécutez flutter run pour lancer l'application

## Fonctionnalités futures
1. Création d’un compte utilisateur en s’enregistrant
2. Stocker les données dans une base de données (ou sqlite) pour pas perdre son compte user et ses teams pokémons
3. Création d’une interface graphic terminal pour pouvoir afficher l’interface de combat
4. Création d’équipe pokémon :
   - Choix des pokémons (dans la limite de 6)
   - Choix des attaques disponibles pour le pokémon (dans la limite de 4)
   - (Choix des objets pour plus tard)
5. Création du système de combat comme Smogon avec :
   - Team preview
   - Choix du pokémon qu’on envoie en premier sur le terrain
   - Un timer pendant le combat
6. Checkout sur les attaques et les calculs de dommages des coups critiques etc…
7. Maintenir le code et essayer de créer de la protection dans le code contre les mauvaises surprises (cheat etc…)

## Structure du code

Le projet PokéDart est organisé en différents fichiers et dossiers selon l'architecture MVC. Le dossier lib contient tous les fichiers nécessaires au fonctionnement de l'application, tels que les contrôleurs, les vues et les modèles. Les fichiers concernant chaque fonctionnalité sont regroupés dans des dossiers distincts, pour une organisation optimale.
Contribuer

Si vous souhaitez contribuer au développement de PokéDart, vous pouvez soumettre des problèmes, des demandes de fonctionnalités ou des demandes de fusion sur le dépôt GitHub. Avant de soumettre vos modifications, assurez-vous que toutes les dépendances ont été installées et que le code est correctement formaté et testé.
Licence
