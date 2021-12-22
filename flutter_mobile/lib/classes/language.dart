class Language {
  final int id;
  final String languageCode;

  Language(this.id,   this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "fr"),
      Language(2, "ar"),
     
    ];
  }
}