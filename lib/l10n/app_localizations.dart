import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String get appName =>
      _localizedValues[locale.languageCode]?['appName'] ?? 'Jiji';
  String get appTagline =>
      _localizedValues[locale.languageCode]?['appTagline'] ?? 'Your AI Friend';

  String get jijiSays =>
      _localizedValues[locale.languageCode]?['jijiSays'] ?? 'Jiji says';
  String get explainRAG =>
      _localizedValues[locale.languageCode]?['explainRAG'] ?? 'Explain RAG';

  String get ragMessage =>
      _localizedValues[locale.languageCode]?['ragMessage'] ??
      'Retrieval-Augmented Generation (RAG) combines search with large language models to improve the accuracy of generated answers by providing relevant information from external data sources.';

  String get ragBullet1 =>
      _localizedValues[locale.languageCode]?['ragBullet1'] ??
      'Retrieves data from external sources';
  String get ragBullet2 =>
      _localizedValues[locale.languageCode]?['ragBullet2'] ??
      'Uses a language model to generate answers using this data';
  String get ragBullet3 =>
      _localizedValues[locale.languageCode]?['ragBullet3'] ??
      'Enhances the accuracy of responses';

  String get presentationTitle =>
      _localizedValues[locale.languageCode]?['presentationTitle'] ??
      'Presentation on RAG';
  String get presentationSubtitle =>
      _localizedValues[locale.languageCode]?['presentationSubtitle'] ??
      'PowerPoint Presentation';
  String get openButton =>
      _localizedValues[locale.languageCode]?['openButton'] ?? 'Open';

  String get videoTitle =>
      _localizedValues[locale.languageCode]?['videoTitle'] ??
      'What is RAG? Retrieval-Augment...';
  String get videoSubtitle =>
      _localizedValues[locale.languageCode]?['videoSubtitle'] ??
      'YouTube Video';
  String get watchButton =>
      _localizedValues[locale.languageCode]?['watchButton'] ?? 'Watch';

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appName': 'Jiji',
      'appTagline': 'Your AI Friend',
      'jijiSays': 'Jiji says',
      'explainRAG': 'Explain RAG',
      'ragMessage':
          'Retrieval-Augmented Generation (RAG) combines search with large language models to improve the accuracy of generated answers by providing relevant information from external data sources.',
      'ragBullet1': 'Retrieves data from external sources',
      'ragBullet2': 'Uses a language model to generate answers using this data',
      'ragBullet3': 'Enhances the accuracy of responses',
      'presentationTitle': 'Presentation on RAG',
      'presentationSubtitle': 'PowerPoint Presentation',
      'openButton': 'Open',
      'videoTitle': 'What is RAG? Retrieval-Augment...',
      'videoSubtitle': 'YouTube Video',
      'watchButton': 'Watch',
    },
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
