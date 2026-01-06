# CLAUDE.md

이 파일은 Claude Code가 이 저장소에서 작업할 때 참고하는 가이드입니다.

## 프로젝트 개요

Web 플랫폼을 대상으로 하는 Flutter 애플리케이션 (Flutter SDK 3.6.1+)

## 주요 기술 스택

- **상태 관리**: riverpod
- **라우팅**: go_router
- **HTTP 통신**: retrofit, dio
- **코드 생성**: json_serializable, build_runner

## 아키텍처 패턴 (MVVM)

```
Page (View) ↔ PageViewModel ↔ Repository ↔ RestClient
```

- **Page**: UI 렌더링 및 사용자 인터랙션
- **PageViewModel**: 비즈니스 로직 및 상태 관리 (Riverpod NotifierProvider)
- **Repository**: 데이터 소스 추상화
- **RestClient**: API 통신 (Retrofit)

## 개발 명령어

```bash
# 의존성 설치
flutter pub get

# 코드 생성 (model, rest_client 등)
dart run build_runner build --delete-conflicting-outputs

# 웹 실행
flutter run -d chrome
```

## 참고 문서
- [비즈니스 컨텍스트](docs/business-requirements.md): 서비스/도메인별 비즈니스 요구사항과 배경 설명
- [기술 명세서](docs/techspec/techspec.md): 주요 기술 사양 및 상세 스펙 문서
- [개발 용어집](docs/glossary.md): 프로젝트 개발 용어 및 개념 정리
- [구현 계획](docs/plan.md): 전체 구현 계획 및 체크리스트

## 폴더 구조

```
lib/
├── main.dart                 # 앱 진입점
├── app/
│   ├── router/              # go_router 설정
│   └── theme/               # 테마 설정
├── core/
│   ├── constants/           # 상수 정의
│   ├── utils/               # 유틸리티 함수
│   └── extensions/          # 확장 메서드
├── data/
│   ├── models/              # 데이터 모델 (json_serializable)
│   ├── repositories/        # Repository 구현
│   └── rest_api.dart        # RestClient (retrofit)
├── views/
│   ├── pages/               # 페이지별 폴더
│   │   └── [feature]/       # 기능별 폴더
│   │       ├── [feature]_page.dart      # UI 페이지
│   │       ├── [feature]_page_vm.dart   # ViewModel (riverpod)
│   │       └── widgets/                 # 기능별 위젯
│   └── widgets/             # 공통 재사용 위젯
```

---

> 이 문서는 Claude Code가 이 저장소에서 작업할 때 참고하는 가이드입니다.