# API 명세

이 문서는 프로젝트에서 사용하는 API 명세서들을 설명합니다.

## API 서버 목록

| 서버 | 파일 | 설명 |
|------|------|------|
| 인증 서버 | [auth-server-api.json](./auth-server-api.json) | 계정 인증, 로그인, 회원가입 API |
| 장치 서버 | [device-server-api.json](./device-server-api.json) | 장치, 출입문, 구역 관리 API |
| 공간 서버 | [place-server-api.json](./place-server-api.json) | 공간, 조직, 계정 관리 API |

## 공통 정보

- **Base URL**: `https://api.moon.supremainc.com/dev`
- **API 버전**: v1
- **형식**: OpenAPI 3.0.1

---

## 1. 인증 서버 (auth-server-api.json)

계정 인증 및 회원 관리 관련 API를 제공합니다.

### 주요 도메인

| 도메인 | 엔드포인트 | 설명 |
|--------|------------|------|
| 계정 관리 | `/v1/accounts` | 계정 정보 조회/수정 |
| 계정 인증 | `/v1/accounts/login/*` | 로그인 (이메일, 휴대전화, 2FA) |
| 토큰 관리 | `/v1/accounts/access-token`, `/v1/accounts/refresh-token` | JWT 토큰 갱신 |
| 계정 등록 | `/v1/accounts/register`, `/v1/accounts/verify` | 회원가입, 인증코드 |
| 패스워드 | `/v1/accounts/passwords/*` | 패스워드 변경/초기화 |
| 계정 삭제 | `/v1/accounts/remove` | 회원 탈퇴 |

### 주요 API 예시

```
POST   /v1/accounts/login/email       # 이메일 로그인
POST   /v1/accounts/login/phone       # 휴대전화 로그인
POST   /v1/accounts/login/two-factor  # 2FA 로그인
POST   /v1/accounts/access-token      # Access Token 갱신
POST   /v1/accounts/register          # 계정 등록
GET    /v1/accounts                   # 계정 정보 조회
```

---

## 2. 장치 서버 (device-server-api.json)

장치 및 출입 제어 관련 API를 제공합니다.

### 주요 도메인

| 도메인 | 엔드포인트 | 설명 |
|--------|------------|------|
| 장치 관리 | `/v1/devices/*` | 장치 등록, 설정, 로그인, 펌웨어 등 |
| 인증 관리 | `/v1/auths/*` | 사용자 인증, 얼굴 등록, 생체정보 동의 |
| 출입문 관리 | `/v1/doors/*` | 출입문 설정, 포트, 인증서 |
| 구역 관리 | `/v1/zones/*` | 구역 설정, 화재 구역 |
| 일정 관리 | `/v1/schedules/*` | 출입 일정 관리 |
| IO 모듈 | `/v1/io-modules/*` | 릴레이, 접점 센서 |
| 로그 | `/v1/event-logs/*`, `/v1/audit-logs/*` | 이벤트/감사 로그 조회 |
| 동적 QR | `/v1/dynamic-qrs/*` | 동적 QR 코드 생성/관리 |
| 알림 설정 | `/v1/notification-setting/*` | 알림 설정 |
| OAuth | `/v1/oauth/*` | 네이버 OAuth, 약관 그룹 |

### 주요 API 예시

```
GET    /v1/devices                    # 장치 목록 조회
POST   /v1/devices/register           # 장치 등록
GET    /v1/doors/{doorId}             # 출입문 상세 조회
GET    /v1/event-logs                 # 이벤트 로그 조회
POST   /v1/auths/{authId}/face-links  # 얼굴 인증 연결
```

---

## 3. 공간 서버 (place-server-api.json)

공간 및 조직 관리 관련 API를 제공합니다.

### 주요 도메인

| 도메인 | 엔드포인트 | 설명 |
|--------|------------|------|
| 공간 관리 | `/v1/places/*` | 공간 생성, 수정, 삭제, 멤버 관리 |
| 공간 그룹 | `/v1/place-groups/*` | 공간 그룹 관리 |
| 지점 관리 | `/v1/branches/*` | 지점 생성, 멤버 관리 |
| 총판 관리 | `/v1/distributors/*` | 총판 관리 |
| API 토큰 | `/v1/api-tokens/*` | API 토큰 발급/관리 |
| 계정 | `/v1/accounts/*` | 계정 Firestore 정보 |

### 주요 API 예시

```
GET    /v1/places                     # 공간 목록 조회
POST   /v1/places                     # 공간 생성
GET    /v1/places/{placeId}           # 공간 상세 조회
POST   /v1/places/{placeId}/invite    # 공간 멤버 초대
GET    /v1/branches                   # 지점 목록 조회
GET    /v1/distributors               # 총판 목록 조회
```

---

## 인증 방식

API 호출 시 `Authorization` 헤더에 JWT 토큰을 포함해야 합니다.

```
Authorization: Bearer <JWT_ACCESS_TOKEN>
```

## 참고

- 상세한 요청/응답 스키마는 각 JSON 파일을 참조하세요.
- API 클라이언트 코드 생성 시 OpenAPI Generator 또는 Retrofit을 사용합니다.

