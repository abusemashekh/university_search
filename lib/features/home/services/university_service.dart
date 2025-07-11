import 'package:dio/dio.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../models/university_model.dart';

class UniversityService {
  final Dio _dio;
  static const String _baseUrl = 'http://universities.hipolabs.com';

  UniversityService({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<List<UniversityModel>> searchUniversitiesByCountry(String country) async {
    try {
      final response = await _dio.get('/search', queryParameters: {'country': country});

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => UniversityModel.fromJson(json)).toList();
      } else {
        throw const ServerException('Failed to load universities');
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          throw const NetworkException('Connection timeout. Please check your internet connection.');
        case DioExceptionType.connectionError:
          throw const NetworkException('No internet connection. Please check your network settings.');
        default:
          throw const ServerException('Something went wrong. Please try again later.');
      }
    } catch (e) {
      throw const ServerException('Unexpected error occurred. Please try again.');
    }
  }
}
