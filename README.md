# Marvela

Personal project using [Marvel Comics API](https://developer.marvel.com/).

## Introduction

### Features

- [x] Show a list of characters fetched from the Marvel Comics API
- [x] Search for a character
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
- Run the project using `flutter pub run`

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Screenshots

![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 22 Medium](https://user-images.githubusercontent.com/72420125/196648773-04af8711-4c61-4a0b-bd3d-4e899eda6ad5.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 06 34 Medium](https://user-images.githubusercontent.com/72420125/196650048-1811dee6-c4bf-4fdb-a6da-fb2f4ba6f2fd.jpeg)

![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 47 Medium](https://user-images.githubusercontent.com/72420125/196650103-e7088d26-f106-4157-b6b7-3ada82141068.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 58 Medium](https://user-images.githubusercontent.com/72420125/196650446-02b7ff3b-47c2-4fc6-950a-8e5634e7d09b.jpeg)

![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 26 Medium](https://user-images.githubusercontent.com/72420125/196650499-de5b5695-698c-4a3e-b5a6-31bfea11c895.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-19 at 10 05 31 Medium](https://user-images.githubusercontent.com/72420125/196650512-43af8bff-5b9d-4739-954d-38bed952f710.jpeg)

![Simulator Screen Shot - iPhone 13 mini - 2022-10-20 at 21 26 10 Medium](https://user-images.githubusercontent.com/72420125/197052271-ed3ebce7-deef-40b2-aa9b-63c07430af12.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-20 at 21 25 44 Medium](https://user-images.githubusercontent.com/72420125/197052501-5d557149-112d-4b88-a2ca-7e8268269e8e.jpeg)

![Simulator Screen Shot - iPhone 13 mini - 2022-10-20 at 21 25 56 Medium](https://user-images.githubusercontent.com/72420125/197054728-5e5d63e9-c95b-4345-980f-3b99b2d6d6c2.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-20 at 21 26 15 Medium](https://user-images.githubusercontent.com/72420125/197054739-800e362f-0436-4787-bb6c-83737df40ae8.jpeg)

![Simulator Screen Shot - iPhone 13 mini - 2022-10-20 at 21 26 20 Medium](https://user-images.githubusercontent.com/72420125/197054757-1fa21955-b004-4918-8b6e-c56b61689fa9.jpeg)
![Simulator Screen Shot - iPhone 13 mini - 2022-10-20 at 21 26 00 Medium](https://user-images.githubusercontent.com/72420125/197054766-d03c41b4-bca2-4620-be6c-0d86fd60650f.jpeg)



