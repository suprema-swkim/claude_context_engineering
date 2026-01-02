// 패턴 1: 일반 상태 관리 (수동 로딩/에러 처리)
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider 정의
final loginPageNotifierProvider = NotifierProvider<LoginPageViewModel, LoginState>(
  LoginPageViewModel.new,
);

class LoginPageViewModel extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
  }
}

// ViewModel 상태 클래스
class LoginState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, isSuccess];
}
