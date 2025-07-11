class AppConstants {
  static const String universitiesApiUrl = 'http://universities.hipolabs.com';

  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;
  static const double cardElevation = 4.0;

  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  static const String networkErrorMessage = 'Network error. Please check your connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String emptyResultsMessage = 'No universities found for this country.';
  static const String invalidCountryMessage = 'Please enter a valid country name.';

  static const int minCountryNameLength = 2;
  static const int maxCountryNameLength = 50;
}
