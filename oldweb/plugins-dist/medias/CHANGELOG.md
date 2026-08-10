# Changelog

## 4.1.0 - 2023-01-27

### Added

- spip/spip#3719 Permettre d’éditer un logo
- Fichier `README.md`

### Changed

- Compatible SPIP 4.2.0-dev

### Removed

- spip/safehtml#4786 Suppression du Sanitizer SVG qui est maintenant dans le plugin SafeHtml
- Suppression du formulaire `FORMULAIRE_CHANGER_FICHIER_DOCUMENT` qui n'est plus utilisé par SPIP (la fonctionnalité se trouve directement dans `FORMULAIRE_EDITER_DOCUMENT`)

### Fixed

- #4919 Correction d'une inversion entre taille des images et des logos dans le test des tailles acceptables
- spip/spip#5274 Homogénéiser les labels des listes
- #4902 Suppression des boutons excédentaires de sens de tri sur certaines listes de documents
