import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'login_request.dart';
import 'login_response.dart';

part 'auth_rest_client.g.dart';

/// Retrofit RestClient 예시
///
/// 특징:
/// - @RestApi 어노테이션으로 Base URL 설정
/// - Retrofit 코드 생성으로 타입 안전한 API 클라이언트 구현
/// - @POST, @GET 등의 HTTP 메서드 어노테이션 사용
/// - @Body, @Query, @Path 등으로 파라미터 전달
@RestApi(baseUrl: 'https://api.example.com/v1')
abstract class AuthRestClient {
  factory AuthRestClient(Dio dio, {String baseUrl}) = _AuthRestClient;

  /// 로그인
  ///
  /// POST /auth/login
  /// Request Body: LoginRequest (email, password)
  /// Response: UserModel
  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);
}
