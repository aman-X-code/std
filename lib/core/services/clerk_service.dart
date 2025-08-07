import 'package:dio/dio.dart';

class ClerkService {
  static const String _baseUrl = 'https://digischooladminbackend.vercel.app/'; // Replace with your actual Clerk backend URL
  late final Dio _dio;

  ClerkService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));
  }

  // Sign in with Google using Clerk
  Future<Map<String, dynamic>> signInWithGoogle(String googleToken) async {
    try {
      final response = await _dio.post(
        '/auth/google',
        data: {
          'token': googleToken,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to sign in with Google: ${e.message}');
    }
  }

  // Get user profile
  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to get user profile: ${e.message}');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _dio.post('/auth/signout');
    } on DioException catch (e) {
      throw Exception('Failed to sign out: ${e.message}');
    }
  }
}