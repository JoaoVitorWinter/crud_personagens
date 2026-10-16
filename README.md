# crud

A new Flutter project.

## Firestore

Personagens e missões são armazenados por usuário em `usuarios/{uid}/personagens`
e `usuarios/{uid}/missoes`. As regras em `firestore.rules` permitem acesso apenas
ao usuário autenticado cujo UID corresponde ao documento de `usuarios`.

Para publicar as regras com a Firebase CLI, configure o projeto Firebase e execute:

```sh
firebase deploy --only firestore:rules
```

Os documentos existentes na coleção raiz `personagens` não são migrados ou
apagados automaticamente. Migre os dados necessários para cada subcoleção do
usuário e, depois de confirmar a cópia, apague a coleção antiga pelo console do
Firestore.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
