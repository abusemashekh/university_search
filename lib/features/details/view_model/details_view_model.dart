import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/models/university_model.dart';

class DetailState {
  final UniversityModel university;
  final bool isLaunchingUrl;

  const DetailState({required this.university, this.isLaunchingUrl = false});

  DetailState copyWith({UniversityModel? university, bool? isLaunchingUrl}) {
    return DetailState(university: university ?? this.university, isLaunchingUrl: isLaunchingUrl ?? this.isLaunchingUrl);
  }
}

class DetailViewModel extends StateNotifier<DetailState> {
  DetailViewModel(UniversityModel university) : super(DetailState(university: university));

  Future<bool> launchWebsite(String url) async {
    if (url.isEmpty) return false;

    state = state.copyWith(isLaunchingUrl: true);

    try {
      final uri = Uri.parse(url);
      final success = await canLaunchUrl(uri);

      if (success) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      state = state.copyWith(isLaunchingUrl: false);
    }
  }

  List<String> get allWebsites => state.university.webPages;
  List<String> get allDomains => state.university.domains;
}

final detailViewModelProvider = StateNotifierProvider.family<DetailViewModel, DetailState, UniversityModel>((ref, university) => DetailViewModel(university));
