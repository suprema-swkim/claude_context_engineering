// 패턴 2: AsyncNotifierProvider를 사용한 비동기 상태 관리
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider 정의
final asyncLoginPageNotifierProvider =
    AsyncNotifierProvider<AsyncLoginPageViewModel, LoginResult>(
  AsyncLoginPageViewModel.new,
);

class AsyncLoginPageViewModel extends AsyncNotifier<LoginResult> {
  @override
  Future<LoginResult> build() async {
    // 초기 상태 반환 (로그인 전 상태)
    return const LoginResult();
  }

  Future<void> login(String email, String password) async {
    // 로딩 상태로 변경
    state = const AsyncValue.loading();

    // 비동기 작업 수행 및 결과 반영
    state = await AsyncValue.guard(() async {
      // 실제 로그인 API 호출
      await Future.delayed(const Duration(seconds: 2)); // 시뮬레이션

      // 유효성 검사
      if (email.isEmpty || password.isEmpty) {
        throw Exception('이메일과 비밀번호를 입력해주세요.');
      }

      if (!email.contains('@')) {
        throw Exception('올바른 이메일 형식이 아닙니다.');
      }

      if (password.length < 6) {
        throw Exception('비밀번호는 6자 이상이어야 합니다.');
      }

      // 로그인 성공
      return const LoginResult(isSuccess: true);
    });
  }

  void reset() {
    state = const AsyncValue.data(LoginResult());
  }
}

// 로그인 결과 클래스
class LoginResult {
  final bool isSuccess;

  const LoginResult({
    this.isSuccess = false,
  });
}

