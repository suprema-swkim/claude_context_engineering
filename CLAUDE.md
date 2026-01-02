# CLAUDE.md

이 파일은 Claude Code (claude.ai/code)가 이 저장소에서 작업할 때 참고하는 가이드입니다.

## 프로젝트 개요

여러 플랫폼(Web)을 대상으로 하는 Flutter 애플리케이션입니다. 프로젝트는 Flutter SDK 3.6.1+ 및 Dart를 사용합니다.

## 참고 문서

- **[PRD (Product Requirements Document)](docs/prd.md)**: 제품 요구사항 및 프로젝트 목표 정의
- **[기술 스택 (Tech Stack)](docs/tech_stack/tech_stack.md)**: 아키텍처 패턴, 사용 라이브러리, 코드 구조 및 컨벤션

## 필수 명령어

### 개발
```bash
# 의존성 설치
flutter pub get

# 앱 실행 (기본 기기)
flutter run

# 특정 플랫폼에서 실행
flutter run -d chrome        # Web

# Hot reload: 터미널에서 'r' 키 입력
# Hot restart: 터미널에서 'R' 키 입력
```

### 테스트
```bash
# 모든 테스트 실행
flutter test

# 특정 테스트 파일 실행
flutter test test/widget_test.dart

# 커버리지와 함께 테스트 실행
flutter test --coverage
```

### 빌드
```bash
# 릴리스 빌드 (Web)
flutter build web
```

### 코드 생성

> 📁 코드 생성 명령어는 [기술 스택 문서](docs/tech_stack/tech_stack.md#코드-생성-명령어)를 참조하세요.

## 프로젝트 구조 및 아키텍처

- **아키텍처 패턴**: MVVM (Page ↔ PageViewModel ↔ Repository ↔ RestClient)
- **상태 관리**: Riverpod
- **라우팅**: go_router
- **API 통신**: Retrofit + Dio
- **테마**: seed color 설정을 사용한 Material 3 디자인

> 📁 **상세한 폴더 구조, 네이밍 컨벤션, API 통신 예시는 [기술 스택 문서](docs/tech_stack/tech_stack.md)를 참조하세요.**

## 코드 표준

- **Linting**: `package:flutter_lints` (버전 5.0.0) 사용, 권장 Flutter lint 규칙 적용
- **분석**: `analysis_options.yaml`에 설정 포함
- **포맷팅**: 표준 Dart 포맷팅 준수 (`dart format` 사용)

## 플랫폼 지원

이 프로젝트는 다음 플랫폼을 지원하도록 구성되어 있습니다:
- Web

플랫폼별 코드는 각 디렉토리(`web/` 등)에 위치합니다.
