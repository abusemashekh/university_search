import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/exceptions/app_exceptions.dart';
import '../models/university_model.dart';
import '../models/user_profile_model.dart';
import '../services/university_service.dart';

final universityServiceProvider = Provider<UniversityService>((ref) {
  return UniversityService();
});

final userProfileProvider = Provider<UserProfileModel>((ref) {
  return UserProfileModel.mockUser;
});

class HomeState {
  final bool isLoading;
  final List<UniversityModel> universities;
  final String? errorMessage;
  final String searchQuery;

  const HomeState({this.isLoading = false, this.universities = const [], this.errorMessage, this.searchQuery = ''});

  HomeState copyWith({bool? isLoading, List<UniversityModel>? universities, String? errorMessage, String? searchQuery}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      universities: universities ?? this.universities,
      errorMessage: errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final UniversityService _universityService;

  HomeViewModel(this._universityService) : super(const HomeState());

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query, errorMessage: null);
  }

  Future<void> searchUniversities() async {
    final query = state.searchQuery.trim();

    if (query.isEmpty) {
      state = state.copyWith(errorMessage: 'Please enter a country name');
      return;
    }

    if (query.length < AppConstants.minCountryNameLength) {
      state = state.copyWith(errorMessage: AppConstants.invalidCountryMessage);
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final universities = await _universityService.searchUniversitiesByCountry(query);

      if (universities.isEmpty) {
        state = state.copyWith(isLoading: false, universities: [], errorMessage: AppConstants.emptyResultsMessage);
      } else {
        state = state.copyWith(isLoading: false, universities: universities, errorMessage: null);
      }
    } on AppException catch (e) {
      state = state.copyWith(isLoading: false, universities: [], errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(isLoading: false, universities: [], errorMessage: 'An unexpected error occurred. Please try again.');
    }
  }

  void clearSearch() {
    state = const HomeState();
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final universityService = ref.watch(universityServiceProvider);
  return HomeViewModel(universityService);
});
