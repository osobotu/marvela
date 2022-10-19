# Marvela

Personal project using [Marvel Comics API](https://developer.marvel.com/).

## Introduction

### Features

- [x] Show a list of characters fetched from the Marvel Comics API
- [ ] Search for a character
- [x] Show a details page of a character
- [x] Toggle between dark and light theme
- [ ] Save favorites characters to a local database

## Implementation

The project was implemented using bloc architecture.

- Data Layer: consists of the `marvel_api_client` for retrieving raw data from the [Marvel Comics API](https://developer.marvel.com/).
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

##  Screenshots

![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 22 Medium](https://user-images.githubusercontent.com/72420125/196648773-04af8711-4c61-4a0b-bd3d-4e899eda6ad5.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 06 34 Medium](https://user-images.githubusercontent.com/72420125/196650048-1811dee6-c4bf-4fdb-a6da-fb2f4ba6f2fd.jpeg)

![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 47 Medium](https://user-images.githubusercontent.com/72420125/196650103-e7088d26-f106-4157-b6b7-3ada82141068.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 58 Medium](https://user-images.githubusercontent.com/72420125/196650446-02b7ff3b-47c2-4fc6-950a-8e5634e7d09b.jpeg)

![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 26 Medium](https://user-images.githubusercontent.com/72420125/196650499-de5b5695-698c-4a3e-b5a6-31bfea11c895.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 31 Medium](https://user-images.githubusercontent.com/72420125/196650512-43af8bff-5b9d-4739-954d-38bed952f710.jpeg)

