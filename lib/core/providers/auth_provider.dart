import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/clerk_service.dart';

// Auth state model
class AuthState {
  final bool isAuthenticated;
  final Map<String, dynamic>? user;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.isAuthenticated = false,
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    Map<String, dynamic>? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Auth notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final ClerkService _clerkService;

  AuthNotifier(this._clerkService) : super(const AuthState());

  Future<void> signInWithGoogle(String googleToken) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _clerkService.signInWithGoogle(googleToken);
      state = state.copyWith(
        isAuthenticated: true,
        user: result,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);

    try {
      await _clerkService.signOut();
      state = const AuthState();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

// Providers
final clerkServiceProvider = Provider<ClerkService>((ref) => ClerkService());

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final clerkService = ref.watch(clerkServiceProvider);
  return AuthNotifier(clerkService);
});