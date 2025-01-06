# Quran Flutter

`quran_flutter` is a Flutter package designed to provide access to the text of the Quran in multiple languages, sourced from [Tanzil.net](https://tanzil.net). Metadata about Surahs (chapters), Verses, Juzs (sections), and Pages is also provided.

## Screenshots

<p align="center">
  <img src="https://github.com/waqaralisiyal23/quran_flutter/raw/main/screenshots/1.png" alt="Home Screen" width="200" />
  <img src="https://github.com/waqaralisiyal23/quran_flutter/raw/main/screenshots/2.png" alt="Surah List" width="200" />
  <img src="https://github.com/waqaralisiyal23/quran_flutter/raw/main/screenshots/3.png" alt="Juz List" width="200" />
  <img src="https://github.com/waqaralisiyal23/quran_flutter/raw/main/screenshots/4.png" alt="Page List" width="200" />
  <img src="https://github.com/waqaralisiyal23/quran_flutter/raw/main/screenshots/5.png" alt="Read Surah" width="200" />
  <img src="https://github.com/waqaralisiyal23/quran_flutter/raw/main/screenshots/6.png" alt="Read Juz" width="200" />
  <img src="https://github.com/waqaralisiyal23/quran_flutter/raw/main/screenshots/7.png" alt="Read Page" width="200" />
</p>

## Table of Contents

- [Quran Flutter](#quran-flutter)
  - [Screenshots](#screenshots)
  - [Table of Contents](#table-of-contents)
  - [Getting started](#getting-started)
  - [Installation](#installation)
  - [Initialization](#initialization)
  - [Constants](#constants)
  - [Available Quran Translations](#available-quran-translations)
  - [Quran Text](#quran-text)
  - [Surah Methods](#surah-methods)
  - [Verse Methods](#verse-methods)
  - [Juz Methods](#juz-methods)
  - [Page Methods](#page-methods)
  - [Example](#example)
  - [Contributing](#contributing)
    - [Bug Reports](#bug-reports)
    - [Feature Requests](#feature-requests)
    - [Pull Requests](#pull-requests)
    - [Conclusion](#conclusion)
  - [Contributors](#contributors)
    - [@waqaralisiyal23](#waqaralisiyal23)
    - [@dasyad00](#dasyad00)
  - [License](#license)

## Getting started

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  quran_flutter: ^1.0.0
```

## Initialization

```dart
import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Quran.initialize();
  runApp(const MyApp());
}
```

## Constants

- **`bismillah`** - The Bismillah phrase: بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ
- **`surahCount`** - Total number of surahs in the Quran.
- **`makkiSurahCount`** - Total number of Makki surahs in the Quran.
- **`madaniSurahCount`** - Total number of Madani surahs in the Quran.
- **`verseCount`** - Total number of verses in the Quran.
- **`juzCount`** - Total number of juz in the Quran.

## Available Quran Translations

- **`Albanian`**
- **`Amazigh`**
- **`Amharic`**
- **`Azerbaijani`**
- **`Bengali`**
- **`Bosnian`**
- **`Bulgarian`**
- **`Chinese`**
- **`Czech`**
- **`Divehi`**
- **`Dutch`**
- **`English`**
- **`French`**
- **`German`**
- **`Hausa`**
- **`Hindi`**
- **`Indonesian`**
- **`Italian`**
- **`Japanese`**
- **`Korean`**
- **`Kurdish`**
- **`Malay`**
- **`Malayalam`**
- **`Norwegian`**
- **`Pashto`**
- **`Persian`**
- **`Polish`**
- **`Portuguese`**
- **`Romanian`**
- **`Russian`**
- **`Sindhi`**
- **`Somali`**
- **`Spanish`**
- **`Swahili`**
- **`Swedish`**
- **`Tajik`**
- **`Tamil`**
- **`Tatar`**
- **`Thai`**
- **`Turkish`**
- **`Urdu`**
- **`Uyghur`**
- **`Uzbek`**

## Quran Text

The Quran text can be accessed in different languages using the provided function.

**getQuranVerses:**

This function retrieves the Quran text based on the specified language.

**Usage:**

```dart
// Get Quran text in Arabic
Map<int, Map<int, Verse>> quranVerses = Quran.getQuranVerses();

// Get Quran text in English
Map<int, Map<int, Verse>> quranVersesEnglish = Quran.getQuranVerses(language: QuranLanguage.english);
```

**Parameters:**

- `language` (optional) - The language in which you want to retrieve the Quran text. It can be any [supported language](#available-quran-translations) from the `QuranLanguage` enum, or `null` for the original Arabic text.

**Returns:**

A map where the key is the surah number and the value is another map with the verse number as the key and the `Verse` object as the value.

## Surah Methods

- **`Map<int, Surah> getSurahAsMap()`** - Returns a map containing all the surahs indexed by their numbers.

- **`List<Surah> getSurahAsList()`** - Returns a list of all surahs in the Quran.

- **`Surah getSurah(int surahNumber)`** - Returns the Surah object for the specified surah number.

- **`Map<int, Verse> getSurahVersesAsMap(int surahNumber, {QuranLanguage? language})`** - Returns the verses of the specified surah as a map indexed by verse numbers, optionally in the specified language.

- **`List<Verse> getSurahVersesAsList(int surahNumber, {QuranLanguage? language})`** - Returns the verses of the specified surah as a list, optionally in the specified language.

- **`String getSurahName(int surahNumber)`** - Returns the name of the specified surah.

- **`String getSurahNameEnglish(int surahNumber)`** - Returns the English name of the specified surah.

- **`int getTotalVersesInSurah(int surahNumber)`** - Returns the total number of verses in the specified surah.

- **`int getRevealationOrderInSurah(int surahNumber)`** - Returns the revelation order of the specified surah.

- **`int getRukusInSurah(int surahNumber)`** - Returns the number of rukus in the specified surah.

- **`SurahType getSurahType(int surahNumber)`** - Returns the type (Meccan or Medinan) of the specified surah.

- **`bool isMakkiSurah(int surahNumber)`** - Returns true if the specified surah is Meccan, otherwise false.

- **`bool isMadaniSurah(int surahNumber)`** - Returns true if the specified surah is Medinan, otherwise false.

**Usage:**

```dart
Map<int, Surah> surahMap = Quran.getSurahAsMap();

List<Surah> surahList = Quran.getSurahAsList();

Surah surah =  Quran.getSurah(5);
print(surah.name);
print(surah.nameEnglish);
print(surah.meaning);
print(surah.revealationOrder);

Map<int, Verse> surahVersesMap =  Quran.getSurahVersesAsMap(2);

Map<int, Verse> surahVersesMap2 =  Quran.getSurahVersesAsMap(4, language: QuranLanguage.english);

List<Verse> surahVersesList =  Quran.getSurahVersesAsList(2);

List<Verse> surahVersesList2 =  Quran.getSurahVersesAsList(4, language: QuranLanguage.english);

String surahName = Quran.getSurahName(14);
print(surahName);

String surahNameEnglish = Quran.getSurahNameEnglish(14);
print(surahNameEnglish);

int totalVerses = Quran.getTotalVersesInSurah(9);
print(totalVerses);

SurahType surahType = Quran.getSurahType(21);
print(surahType.value);

bool isMadaniSurah = Quran.isMadaniSurah(45);
print(isMadaniSurah);
```

## Verse Methods

- **`Verse getVerse({required int surahNumber, required int verseNumber, QuranLanguage? language})`** - Retrieves the verse corresponding to the given surah number and verse number. Optionally, you can specify the language in which to retrieve the verse.

**Usage:**

```dart
Verse verse = Quran.getVerse(surahNumber: 1, verseNumber: 5);
print(verse.text);

Verse verseEnglish = Quran.getVerse(surahNumber: 1, verseNumber: 5, language: QuranLanguage.english);
print(verseEnglish.text);
```

## Juz Methods

- **`Map<int, Juz> getJuzAsMap()`** - Retrieves a map of all juz with their corresponding numbers.

- **`List<Juz> getJuzAsList()`** - Retrieves a list of all juz.

- **`int getTotalVersesInJuz(int juzNumber)`** - Retrieves the total number of verses in the specified juz.

- **`Map<int, JuzSurahVerses> getSurahVersesInJuzAsMap(int juzNumber)`** - Retrieves the verses of each surah within the specified juz as a map.

- **`List<JuzSurahVerses> getSurahVersesInJuzAsList(int juzNumber)`** - Retrieves the verses of each surah within the specified juz as a list.

- **`int getTotalVersesOfSurahInJuz({required int surahNumber, required int juzNumber})`** - Retrieves the total number of verses of the specified surah within the specified juz.

- **`int getJuzNumber({required int surahNumber, required int verseNumber})`** - Retrieves the juz number of the specified surah and verse.

## Page Methods

- **`Map<int, QuranPage> getPageAsMap()`** - Retrieves a map of all pages with their corresponding numbers.

- **`List<QuranPage> getPageAsList()`** - Retrieves a list of all pages.

- **`int getTotalVersesInPage(int pageNumber)`** - Retrieves the total number of verses in the specified page.

- **`Map<int, PageSurahVerses> getSurahVersesInPageAsMap(int pageNumber)`** - Retrieves the verses of each surah within the specified page as a map.

- **`List<PageSurahVerses> getSurahVersesInPageAsList(int pageNumber)`** - Retrieves the verses of each surah within the specified page as a list.

- **`int getTotalVersesOfSurahInPage({required int surahNumber, required int pageNumber})`** - Retrieves the total number of verses of the specified surah within the specified page.

- **`int getPageNumber({required int surahNumber, required int verseNumber})`** - Retrieves the page number of the specified surah and verse.

**Usage:**

```dart
Map<int, Juz> juzMap = Quran.getJuzAsMap();

List<Juz> juzList = Quran.getJuzAsList();

int totalVersesInJuz = Quran.getTotalVersesInJuz(15);
print(totalVersesInJuz);

Map<int, JuzSurahVerses> juzSurahVersesMap = Quran.getSurahVersesInJuzAsMap(23);

List<JuzSurahVerses> juzSurahVersesList = Quran.getSurahVersesInJuzAsList(23);

int totalVersesOfSurahInJuz = Quran.getTotalVersesOfSurahInJuz(surahNumber: 1, juzNumber: 1);
print(totalVersesOfSurahInJuz);

int juzNumber = Quran.getJuzNumber(surahNumber: 2, verseNumber: 11);
print(juzNumber);
```

## Example

You can find an example app demonstrating the usage of the `quran_flutter` package in the [`example`](example) directory.

To run the example app:

1. Clone this repository.
2. Navigate to the `example` directory.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` to launch the example app on an emulator or a physical device.

## Contributing

Thank you for considering contributing to Quran Flutter! Contributions from users like you help improve the project and make it better for everyone.

### Bug Reports

If you encounter a bug while using Quran Flutter, please open an [issue](https://github.com/waqaralisiyal23/quran_flutter/issues) on GitHub. Be sure to include detailed information about how to reproduce the bug, including steps to replicate it, the expected behavior, and the actual behavior you observed. Screenshots or code examples can also be helpful.

### Feature Requests

If you have an idea for a new feature or enhancement, feel free to open an [issue](https://github.com/waqaralisiyal23/quran_flutter/issues) on GitHub to discuss it. We welcome suggestions for improvements and additions to Quran Flutter.

### Pull Requests

If you'd like to contribute directly to the project, you can submit a pull request with your changes. Here's how:

1. Fork the repository by clicking the `Fork` button on GitHub.
2. Clone your fork of the repository to your local machine.
3. Create a new branch for your changes: `git checkout -b my-feature`
4. Make your changes in the new branch.
5. Test your changes to ensure they work as expected.
6. Commit your changes with descriptive commit messages: `git commit -m "Add new feature"`.
7. Push your branch to your fork on GitHub: `git push origin my-feature`.
8. Submit a pull request from your branch to the `main` branch of the original repository.

Your pull request will be reviewed by the project maintainers, and feedback may be provided to help improve your contribution.

### Conclusion

Thank you for considering contributing to `quran_flutter`. Your contributions are valued and help improve the project for everyone. Happy coding!

## Contributors

Thanks to the following amazing people who contributed to this project:

### [@waqaralisiyal23](https://github.com/waqaralisiyal23)

![Your Profile Picture](https://github.com/waqaralisiyal23.png?size=100)

- **Name:** Waqar Ali Siyal
- **Role:** Creator and maintainer of the Quran Flutter package.
- **Contributions:** Developed the package, implemented core features, maintained the project, and added several enhancements.
- **GitHub Profile:** [waqaralisiyal23](https://github.com/waqaralisiyal23)

### [@dasyad00](https://github.com/dasyad00)

![dasyad00's Profile Picture](https://github.com/dasyad00.png?size=100)

- **Name:** Danang Rahmatullah
- **Contributions:** Added Quran pages data along with example.
- **GitHub Profile:** [dasyad00](https://github.com/dasyad00)

## License

MIT License

Copyright (c) 2024 Waqar Ali Siyal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
