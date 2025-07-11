class UniversityModel {
  final String name;
  final String country;
  final String? stateProvince;
  final String? alphaTwoCode;
  final List<String> domains;
  final List<String> webPages;

  UniversityModel({required this.name, required this.country, this.stateProvince, this.alphaTwoCode, required this.domains, required this.webPages});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      stateProvince: json['state-province'],
      alphaTwoCode: json['alpha_two_code'],
      domains: List<String>.from(json['domains'] ?? []),
      webPages: List<String>.from(json['web_pages'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'country': country, 'state-province': stateProvince, 'alpha_two_code': alphaTwoCode, 'domains': domains, 'web_pages': webPages};
  }

  String get primaryWebsite => webPages.isNotEmpty ? webPages.first : '';

  String get primaryDomain => domains.isNotEmpty ? domains.first : '';
}
