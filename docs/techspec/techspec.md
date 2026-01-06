# 기술 스펙 (Tech Spec)

**관련 문서**: [구현 계획](../plan.md) | [용어집](../glossary.md) | [비즈니스 컨텍스트](../business-requirements.md)

---

## 개요

이 문서는 Flutter 프로젝트의 기술 스택과 아키텍처에 대한 상세 가이드입니다.

### 문서 목적

- 프로젝트에서 사용하는 핵심 라이브러리 및 도구 소개
- MVVM 아키텍처 패턴과 각 레이어별 책임 정의
- 코드 작성 시 따라야 할 네이밍 컨벤션 및 규칙 제공
- 실무에서 바로 활용 가능한 예시 코드 제공

### 대상 독자

- 프로젝트에 새로 합류하는 개발자
- Flutter 아키텍처를 학습하려는 팀원
- 코드 리뷰 시 컨벤션 확인이 필요한 경우

### 문서 구성

| 섹션 | 설명 |
|------|------|
| [아키텍처 패턴](#아키텍처-패턴) | MVVM 패턴 및 레이어별 책임 |
| [핵심 라이브러리](#핵심-라이브러리) | 상태 관리, 라우팅, 네트워킹 등 주요 라이브러리 |
| [권장 추가 라이브러리](#권장-추가-라이브러리) | 로깅, 로컬 저장소, 국제화 등 선택적 라이브러리 |
| [코드 생성 명령어](#코드-생성-명령어) | build_runner 사용법 |
| [네이밍 컨벤션](#네이밍-컨벤션) | 파일 및 클래스 명명 규칙 |
| [API 통신 예시](#api-통신-예시) | Page, ViewModel, Repository, RestClient 예시 |
| [환경 설정](#환경-설정) | API Base URL 관리 방법 |

### 예시 코드

> [`examples/`](./examples/) 폴더에 실제 구현 예시가 포함되어 있습니다.

| 파일 | 설명 |
|------|------|
| `login_page.dart` | 일반 상태를 사용하는 Page 예시 |
| `async_login_page.dart` | AsyncValue를 사용하는 Page 예시 |
| `login_page_vm.dart` | 수동 로딩/에러 처리 ViewModel |
| `async_login_page_vm.dart` | AsyncNotifier 기반 ViewModel |
| `auth_repository.dart` | Repository 구현 예시 |
| `auth_rest_client.dart` | Retrofit RestClient 예시 |
| `login_request.dart` / `login_response.dart` | JSON 직렬화 모델 예시 |

---

## 아키텍처 패턴

### MVVM (Model-View-ViewModel)

프로젝트는 MVVM 패턴을 따르며, 다음과 같은 레이어 구조를 가집니다:

```
Page (View)
  ↕
PageViewModel (ViewModel)
  ↕
Repository
  ↕
RestClient (Data Source)
```

#### 레이어별 책임

- **Page (View)**: UI 렌더링 및 사용자 인터랙션 처리
- **PageViewModel**: 비즈니스 로직 및 상태 관리
- **Repository**: 데이터 소스 추상화 및 데이터 흐름 제어
- **RestClient**: API 통신 및 원격 데이터 소스 관리

## 핵심 라이브러리

### 상태 관리
- **[riverpod](https://pub.dev/packages/riverpod)**: 의존성 주입 및 상태 관리
- **[flutter_riverpod](https://pub.dev/packages/flutter_riverpod)**: Flutter용 Riverpod 위젯
- **[riverpod_annotation](https://pub.dev/packages/riverpod_annotation)**: Riverpod 코드 생성 어노테이션
- **[riverpod_generator](https://pub.dev/packages/riverpod_generator)**: Riverpod 코드 자동 생성

### 라우팅
- **[go_router](https://pub.dev/packages/go_router)**: 선언적 라우팅 및 딥링크 지원

### 네트워킹
- **[dio](https://pub.dev/packages/dio)**: HTTP 클라이언트
- **[retrofit](https://pub.dev/packages/retrofit)**: Type-safe REST API 클라이언트
- **[retrofit_generator](https://pub.dev/packages/retrofit_generator)**: Retrofit 코드 생성

### 직렬화/역직렬화
- **[json_annotation](https://pub.dev/packages/json_annotation)**: JSON 직렬화 어노테이션
- **[json_serializable](https://pub.dev/packages/json_serializable)**: JSON 직렬화 코드 생성

### 값 비교
- **[equatable](https://pub.dev/packages/equatable)**: 값 기반 동등성 비교

**사용 이유**:
- == 연산자 및 hashCode 자동 구현
- 상태 비교 간소화 (특히 Riverpod 상태 관리에서 유용)
- 보일러플레이트 코드 감소

### 코드 생성
- **[build_runner](https://pub.dev/packages/build_runner)**: Dart 코드 생성 도구

## 권장 추가 라이브러리

### 로깅
- **[logger](https://pub.dev/packages/logger)**: 구조화된 로깅

**사용 이유**:
- 개발 중 디버깅 편의성
- 프로덕션 로그 관리

### 로컬 저장소
- **[shared_preferences](https://pub.dev/packages/shared_preferences)**: 간단한 키-값 저장소
- **[flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)**: 보안이 필요한 데이터 저장 (토큰 등)

**사용 이유**:
- 사용자 설정 저장
- 인증 토큰 보관
- 캐시 데이터 관리

### 국제화
- **[intl](https://pub.dev/packages/intl)**: 국제화 및 지역화
- **[flutter_localizations](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)**: Flutter 기본 국제화

**사용 이유**:
- 다국어 지원
- 날짜/시간 포맷팅

### 유틸리티
- **[url_launcher](https://pub.dev/packages/url_launcher)**: 외부 URL 열기
- **[flutter_svg](https://pub.dev/packages/flutter_svg)**: SVG 이미지 렌더링

### 개발 도구
- **[flutter_lints](https://pub.dev/packages/flutter_lints)**: Flutter 권장 린트 규칙
- **[mockito](https://pub.dev/packages/mockito)**: 테스트용 목 객체 생성

## 코드 생성 명령어

프로젝트에서 사용하는 코드 생성 명령어:

```bash
# 모든 코드 생성 (한 번만 실행)
dart run build_runner build --delete-conflicting-outputs

# 기존 생성 파일 삭제 후 재생성
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

## 네이밍 컨벤션

### 파일 명명 규칙
- **Page**: `{feature}_page.dart` (예: `login_page.dart`)
- **ViewModel**: `{feature}_page_vm.dart` (예: `login_page_vm.dart`)
- **Repository**: `{domain}_repository.dart` (예: `auth_repository.dart`)
- **RestClient**: `{domain}_rest_client.dart` (예: `auth_rest_client.dart`)
- **Model**: `{model_name}_model.dart` (예: `user_model.dart`)

### 클래스 명명 규칙
- **Page**: `{Feature}Page` (예: `LoginPage`)
- **ViewModel**: `{Feature}PageViewModel` (예: `LoginPageViewModel`)
- **Repository**: `{Domain}Repository` (예: `AuthRepository`)
- **RestClient**: `{Domain}RestClient` (예: `AuthRestClient`)
- **Model**: `{ModelName}Model` (예: `UserModel`)

## API 통신 예시

> 모든 예시 코드는 [`examples/`](./examples/) 폴더에서 확인할 수 있습니다.

### Page 사용

#### 패턴 1: 일반 상태를 사용하는 Page

**전체 코드**: [`examples/login_page.dart`](./examples/login_page.dart)

**주요 특징**:
- `ConsumerWidget`을 사용하여 Riverpod 상태 관리
- `ref.watch()`로 상태 구독 및 UI 업데이트
- `ref.listen()`으로 로그인 성공 시 네비게이션 처리
- 로딩 상태는 `Stack`으로 오버레이 표시
- 에러 메시지는 `errorMessage` prop으로 전달

#### 패턴 2: AsyncValue를 사용하는 Page

**전체 코드**: [`examples/async_login_page.dart`](./examples/async_login_page.dart)

**주요 특징**:
- `AsyncValue.when()`으로 로딩/데이터/에러 상태를 한 번에 처리
- 로딩, 데이터, 에러 상태를 한 곳에서 처리
- null 체크가 불필요
- 모든 상태를 처리하도록 강제 (컴파일 타임 안정성)
- `data`, `loading`, `error` 케이스를 명시적으로 처리

### ViewModel (Riverpod NotifierProvider)

#### 패턴 1: 일반 상태 관리 (수동 로딩/에러 처리)

**전체 코드**: [`examples/login_page_vm.dart`](./examples/login_page_vm.dart)

**주요 특징**:
- `Equatable`을 사용한 상태 클래스 정의
- `copyWith()` 메서드로 불변 상태 업데이트
- 수동으로 `isLoading`, `errorMessage`, `isSuccess` 상태 관리
- try-catch로 명시적 에러 처리
- `NotifierProvider`로 상태와 로직 제공

#### 패턴 2: AsyncValue 사용 (자동 로딩/에러 처리)

**전체 코드**: [`examples/async_login_page_vm.dart`](./examples/async_login_page_vm.dart)

**주요 특징**:
- `AsyncNotifier`를 사용하여 비동기 상태 자동 관리
- `AsyncValue.guard()`로 에러 처리 자동화
- 상태 클래스에는 비즈니스 데이터만 정의 (로딩/에러 상태 제외)
- UI에서 `.when()` 메서드로 깔끔한 상태 처리
- `AsyncNotifierProvider`로 상태와 로직 제공

### API 레이어 (Repository & RestClient)

#### Repository 구현

**전체 코드**: [`examples/auth_repository.dart`](./examples/auth_repository.dart)

**주요 특징**:
- RestClient를 주입받아 API 통신 수행
- 비즈니스 로직 레이어와 데이터 소스 레이어 분리
- Request/Response 모델 변환 처리
- Entity로 변환하여 도메인 레이어에 전달

#### RestClient 정의 (Retrofit)

**전체 코드**: [`examples/auth_rest_client.dart`](./examples/auth_rest_client.dart)

**주요 특징**:
- `@RestApi` 어노테이션으로 Base URL 설정
- Retrofit 코드 생성으로 타입 안전한 API 클라이언트 구현
- `@POST`, `@GET` 등의 HTTP 메서드 어노테이션 사용
- `@Body`, `@Query` 등으로 파라미터 전달

#### Model 정의 (Equatable + JSON Serializable)

**전체 코드**:
- [`examples/login_request.dart`](./examples/login_request.dart) - Request 모델 예시
- [`examples/login_response.dart`](./examples/login_response.dart) - Response 모델 예시

**주요 특징**:
- `@JsonSerializable()` 어노테이션으로 JSON 직렬화/역직렬화 자동 생성
- `Equatable`을 사용한 값 기반 동등성 비교
- `fromJson()`, `toJson()` 팩토리 메서드
- `props` getter로 비교할 필드 정의

## 환경 설정

### API Base URL 관리
환경별로 다른 API URL을 사용하기 위해 다음을 고려하세요:

- **[flutter_dotenv](https://pub.dev/packages/flutter_dotenv)**: .env 파일 관리
- **[flutter_config](https://pub.dev/packages/flutter_config)**: 네이티브 환경 변수

또는 Dart의 `--dart-define`을 사용한 빌드 시 환경 변수 주입:
```bash
flutter run --dart-define=API_BASE_URL=https://api.example.com
```

---

> 이 문서는 프로젝트의 기술 스택과 아키텍처에 대한 상세 가이드입니다.
