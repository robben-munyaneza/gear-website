# Changelog

## 3.2.2 - 2023-02-27

### Changed

- Mise à jour des chaînes de langues depuis trad.spip.net


## 3.2.1 - 2023-02-23

### Added

- Autoriser la prévisualisation des images Webp et SVG

### Fixed

- #4872 Éviter une fatale quand `bigup_token` est `null`


## 3.2.0 - 2023-01-27

### Added

- #4538 Permettre un retaillage des images côté navigateur, avant upload
- #4538 Configuration de la largeur / hauteur de retaillage côté navigateur
- #4856 Ajout d'un pipeline `bigup_preparer_input_options` pour personnaliser finement les options

### Changed

- Compatible SPIP 4.2-dev

### Fixed

- #4869 Ne pas retailler une image côté navigateur si son poids devient supérieur à l’image d’origine
- #4868 Accessibilité au clavier du bouton Choisir
