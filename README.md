# Marvela

Personal project using [Marvel Comics API](https://developer.marvel.com/).

## Introduction

### Features

- Show a list of characters fetched from the Marvel Comics API
- Search for a character
- Show a details page of a character
- Toggle between dark and light theme
- Save favorites characters to a local database

## Implementation

The project was implemented using bloc architecture.

- Data Layer: consists of the `marvel_api_client` for retrieving raw data from the Marvel API.
- Repository Layer: abstracts the data layer and exposes the domain models to be consumed by the application. (`marvel_repository`)
- Business Logic: manages the state of each feature (themes, character, favorite characters etc)
- Presentation Layer: displays characters, favorite characters and collects input from the user (settings page, search page, favorites page etc)

## Installation

To run this project;

- Download or clone the repository
- Get the required packages using `flutter pub get`
- You must have api keys from [Marvel Developers Portal](https://developer.marvel.com/).
- Create a `.env` at the root of `packages/marvel_api`

```
PUBLIC_KEY=<Your Actual Public Key>
PRIVATE_KEY=<Your Actual Private Key>
```

- Generate models using `flutter pub run build_runner build --delete-conflicting-outputs`

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
