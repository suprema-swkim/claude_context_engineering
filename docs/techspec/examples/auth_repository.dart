import 'auth_rest_client.dart';
import 'login_request.dart';
import 'login_response.dart';

/// Repository 패턴 예시
///
/// 책임:
/// - RestClient를 주입받아 API 통신 수행
/// - 비즈니스 로직 레이어와 데이터 소스 레이어 분리
/// - Request/Response 모델 변환 처리
/// - Entity로 변환하여 도메인 레이어에 전달
class AuthRepository {
  final AuthRestClient _restClient;

  AuthRepository(this._restClient);

  /// 로그인
  ///
  /// [email]과 [password]를 받아서 AuthRestClient를 통해 API 요청을 보내고,
  /// 응답받은 UserModel을 반환합니다.
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      // RestClient를 통해 API 호출
      final response = await _restClient.login(
        LoginRequest(email: email, password: password),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}