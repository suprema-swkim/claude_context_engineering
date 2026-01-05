# Moon Web 구현 계획

> Suprema CLUe - 클라우드 기반 출입통제 및 방문자 관리 웹 포털 시스템

---

## 📌 사용 방법

이 문서는 프로젝트의 전체 구현 계획을 체크리스트 형식으로 관리합니다.

- **미완료 항목**: `[ ]` - 아직 작업하지 않은 항목
- **완료 항목**: `[x]` - 작업이 완료된 항목

**작업이 완료되면 `[ ]`를 `[x]`로 변경하여 진행 상황을 추적하세요!**

---

## Phase 0: 프로젝트 초기 설정

### 개발 환경 구축
- [ ] Flutter SDK 3.6.1+ 설치 및 검증
- [ ] 필수 의존성 패키지 설치
  - [ ] riverpod (상태 관리)
  - [ ] go_router (라우팅)
  - [ ] dio, retrofit (네트워킹)
  - [ ] json_serializable (직렬화)
  - [ ] build_runner (코드 생성)
  - [ ] equatable (값 비교)
- [ ] 추가 권장 패키지 설치
  - [ ] logger (로깅)
  - [ ] shared_preferences (로컬 저장소)
  - [ ] flutter_secure_storage (보안 저장소)
  - [ ] intl (국제화)
  - [ ] url_launcher (URL 처리)
  - [ ] flutter_svg (SVG 렌더링)
  - [ ] flutter_lints (린트)
  - [ ] mockito (테스트)

### 프로젝트 구조 설정
- [ ] MVVM 아키텍처 폴더 구조 생성
  - [ ] lib/app/ (라우터, 테마)
  - [ ] lib/core/ (상수, 유틸리티, 확장)
  - [ ] lib/data/ (모델, 레포지토리, 데이터소스)
  - [ ] lib/views/ (페이지, 뷰모델, 위젯)
- [ ] 코드 컨벤션 및 린트 규칙 설정
- [ ] Git workflow 설정

---

## Phase 1: 핵심 인프라 구축

### 1. 인증 시스템
- [ ] 인증 도메인 구현
  - [ ] 인증 모델 정의 (Account, Token)
  - [ ] 인증 RestClient 구현 (auth-server 연동)
  - [ ] 인증 Repository 구현
  - [ ] JWT 토큰 관리 로직
- [ ] 로그인 기능
  - [ ] 이메일 로그인 UI/ViewModel
  - [ ] 휴대전화 로그인 UI/ViewModel
  - [ ] 2FA (Two-Factor Authentication)
  - [ ] 토큰 저장 및 자동 갱신
- [ ] 회원가입 기능
  - [ ] 회원가입 UI/ViewModel
  - [ ] 인증코드 발송 및 검증
  - [ ] 비밀번호 설정
- [ ] 계정 관리
  - [ ] 패스워드 변경
  - [ ] 패스워드 초기화
  - [ ] 계정 삭제
  - [ ] 로그아웃

### 2. 라우팅 및 네비게이션
- [ ] go_router 설정
  - [ ] 라우트 정의
  - [ ] 인증 상태 기반 리다이렉션
  - [ ] 딥링크 지원
- [ ] 메인 레이아웃
  - [ ] 사이드바 네비게이션
  - [ ] 헤더 (사용자 정보, 알림)
  - [ ] 반응형 레이아웃

### 3. 공통 컴포넌트
- [ ] 디자인 시스템
  - [ ] 테마 설정 (색상, 타이포그래피)
  - [ ] 공통 위젯 (버튼, 입력 필드, 카드 등)
  - [ ] 다국어 지원 (intl)
- [ ] 에러 핸들링
  - [ ] 에러 모델 정의
  - [ ] 에러 메시지 표시 UI
  - [ ] 로깅 시스템

---

## Phase 2: 출입통제 (Access Control) - 핵심 기능

### 1. 장치 관리
- [ ] 장치 도메인 구현
  - [ ] 장치 모델 (Device)
  - [ ] 장치 RestClient (device-server)
  - [ ] 장치 Repository
- [ ] 장치 등록 및 설정
  - [ ] 장치 목록 조회 UI/ViewModel
  - [ ] 장치 등록 UI/ViewModel
  - [ ] 장치 상세 정보 UI/ViewModel
  - [ ] 장치 설정 (네트워크, DHCP/Static IP)
  - [ ] RS485 마스터/슬레이브 구성
- [ ] 장치 모니터링
  - [ ] 실시간 장치 상태 표시
  - [ ] 헬스 체크
  - [ ] 로그 업로드
  - [ ] 장치 명령 전송 (재시작, 초기화)
- [ ] 펌웨어 관리
  - [ ] 펌웨어 버전 확인
  - [ ] 펌웨어 업그레이드

### 2. 출입문 관리
- [ ] 출입문 도메인 구현
  - [ ] 출입문 모델 (Door)
  - [ ] 출입문 RestClient
  - [ ] 출입문 Repository
- [ ] 출입문 설정
  - [ ] 출입문 목록 조회 UI/ViewModel
  - [ ] 출입문 생성/수정 UI/ViewModel
  - [ ] 입실/퇴실 장치 매핑
  - [ ] 릴레이 및 센서 설정
  - [ ] 출입문 열림/닫힘 스케줄
  - [ ] 출입문 잠금 모드 설정
- [ ] 출입문 제어
  - [ ] 원격 출입문 제어 UI (일시 열림, 고정 개방, 고정 잠금)
  - [ ] 출입문 상태 모니터링
  - [ ] 출입문 잠금 상태 확인

### 3. 사용자 인증 관리
- [ ] 인증 도메인 구현
  - [ ] 인증 수단 모델 (Face, Fingerprint, Card, QR, PIN)
  - [ ] 인증 RestClient
  - [ ] 인증 Repository
- [ ] 인증 수단 등록
  - [ ] 얼굴 인증 등록 (Face Link 연동)
  - [ ] 지문 인증 등록
  - [ ] 카드 인증 등록 (CSN, Wiegand)
  - [ ] QR 코드 (정적/동적)
  - [ ] PIN 등록
  - [ ] 모바일 카드
- [ ] 복합 인증 모드
  - [ ] 카드 + 얼굴
  - [ ] 코드 + PIN
  - [ ] 전화번호 + 이름/나이
- [ ] 생체정보 수집 동의
  - [ ] 사용자 사전 동의 관리 UI/ViewModel
  - [ ] 생체정보 수집 동의서

### 4. 출입 권한 관리
- [ ] 출입 권한 도메인 구현
  - [ ] 출입 권한 모델 (AccessPermission)
  - [ ] 출입 권한 RestClient
  - [ ] 출입 권한 Repository
- [ ] 사용자별 출입 권한
  - [ ] 출입 권한 목록 조회 UI/ViewModel
  - [ ] 출입 권한 생성/수정 UI/ViewModel
  - [ ] 출입 가능 출입문 지정 (전체/특정)
  - [ ] 출입 기간 설정 (시작일, 종료일, 무제한)
  - [ ] 출입 스케줄 설정 (항상/특정 시간대)
- [ ] 출입 상태 관리
  - [ ] 출입 허용/금지 상태 변경
  - [ ] 출입 기간 만료 관리

### 5. 이벤트 및 로그
- [ ] 이벤트 도메인 구현
  - [ ] 이벤트 모델 (Event, AuditLog)
  - [ ] 이벤트 RestClient
  - [ ] 이벤트 Repository
- [ ] 이벤트 로그
  - [ ] 인증 성공/실패 이벤트 조회 UI/ViewModel
  - [ ] 출입문 이벤트 조회
  - [ ] 장치 이벤트 조회
  - [ ] 알람 이벤트 조회
  - [ ] 이벤트 필터링 및 검색
- [ ] 감사 로그 (Audit Log)
  - [ ] 관리자 작업 이력 조회 UI/ViewModel
  - [ ] IP 주소 기록
  - [ ] 작업 대상 및 출처 추적

### 6. 구역 및 알람
- [ ] 구역 도메인 구현
  - [ ] 구역 모델 (Zone)
  - [ ] 구역 RestClient
  - [ ] 구역 Repository
- [ ] 구역 관리
  - [ ] 논리적 영역 그룹 설정 UI/ViewModel
  - [ ] 화재 연동 구역
  - [ ] 화재 출입 구역
- [ ] 알람 관리
  - [ ] 알람 상태 모니터링 UI/ViewModel
  - [ ] 자동/수동 알람 해제
  - [ ] 장시간 문 열림 알람
  - [ ] 강제 문 열림 알람

---

## Phase 3: 방문자 관리 (Visitor Management)

### 1. 방문 일정 관리
- [ ] 방문 도메인 구현
  - [ ] 방문 일정 모델 (VisitSchedule)
  - [ ] 방문 RestClient
  - [ ] 방문 Repository
- [ ] 방문 예약
  - [ ] 방문 일정 목록 조회 UI/ViewModel
  - [ ] 방문 일정 생성 UI/ViewModel (방문자 정보, 방문 시간, 방문 목적)
  - [ ] 방문 목적 유형 설정 (미팅, 배달, 공사, 기타)
  - [ ] 방문 위치 지정 (빌딩, 입주사, 출입구역)
- [ ] 방문 승인
  - [ ] 방문 승인 대기/완료/거절 UI/ViewModel
  - [ ] 호스트 지정

### 2. 방문자 체크인/체크아웃
- [ ] 방문자 상태 관리
  - [ ] 방문 예정 (BEFORE_VISIT) 상태 표시
  - [ ] 방문 중 (CHECK_IN) 상태 표시
  - [ ] 방문 완료 (CHECK_OUT) 상태 표시
  - [ ] 방문 취소 (CANCELLED) 상태 표시
- [ ] QR 코드 발급
  - [ ] 방문자 전용 동적 QR 코드 생성
  - [ ] 네이버/카카오 QR 연동

### 3. 방문 스케줄 상태
- [ ] 방문 예정 (RESERVED)
- [ ] 방문 중 (IN_PERIOD)
- [ ] 방문 완료 (FINISHED)
- [ ] 방문 취소 (CANCELLED)

---

## Phase 4: 조직 및 계층 관리

### 1. 출입통제 계층
- [ ] 계층 도메인 구현
  - [ ] Branch (지사) 모델
  - [ ] Distributor (대리점) 모델
  - [ ] PlaceGroup (공간그룹) 모델
  - [ ] Place (공간) 모델
- [ ] 지사 관리
  - [ ] 지사 목록 조회 UI/ViewModel
  - [ ] 지사 생성/수정/삭제 UI/ViewModel
  - [ ] 지사 멤버 관리
- [ ] 대리점 관리
  - [ ] 대리점 목록 조회 UI/ViewModel
  - [ ] 대리점 생성/수정/삭제 UI/ViewModel
  - [ ] 대리점 멤버 관리
- [ ] 공간그룹 관리
  - [ ] 공간그룹 목록 조회 UI/ViewModel
  - [ ] 공간그룹 생성/수정/삭제 UI/ViewModel
- [ ] 공간 관리
  - [ ] 공간 목록 조회 UI/ViewModel
  - [ ] 공간 생성/수정/삭제 UI/ViewModel
  - [ ] 공간 멤버 관리

### 2. 방문자 관리 계층
- [ ] Visit Branch (방문 지사) 관리
- [ ] Visit Building (빌딩) 관리
- [ ] Visit Company (입주사) 관리
- [ ] Location (출입구역/방문위치) 관리

---

## Phase 5: 사용자 및 권한 관리

### 1. 계정 유형 구현
- [ ] SUPREMA_MANUFACTURE (슈프리마 제조)
- [ ] SERVICE_OPERATOR (서비스 운영자)
- [ ] BRANCH_ADMIN (지사 관리자)
- [ ] DISTRIBUTOR_ADMIN (대리점 관리자)
- [ ] PLACE_GROUP_ADMIN (공간그룹 관리자)
- [ ] BUSINESS_OWNER (비즈니스 소유자)
- [ ] USER (일반 사용자)
- [ ] VISITOR_MEMBER (방문자 회원)

### 2. 역할 구현
- [ ] MASTER (마스터/메인 관리자)
- [ ] MANAGER (매니저/서브 관리자)

### 3. 계정 상태 관리
- [ ] ACTIVE (활성)
- [ ] INACTIVE (비활성)
- [ ] AUTH_CODE_LOCKED (인증코드 잠금)
- [ ] PASSWORD_LOCKED (비밀번호 잠금)
- [ ] PASSWORD_EXPIRED (비밀번호 만료)
- [ ] DELETE_RESERVE (삭제 예약)
- [ ] INVITED_SIGNUP (가입 초대)

### 4. 멤버 관리
- [ ] 멤버 초대 (Invite) UI/ViewModel
- [ ] 멤버 내보내기 (Kickout) UI/ViewModel
- [ ] 멤버 나가기 (Leave) UI/ViewModel

---

## Phase 6: I/O 모듈 및 릴레이 관리

### 1. I/O 모듈
- [ ] I/O 모듈 도메인 구현
  - [ ] I/O 모듈 모델
  - [ ] I/O RestClient
  - [ ] I/O Repository
- [ ] 입력 포트 설정 (Contact Sensor)
- [ ] 출력 포트 설정 (Relay Output)
- [ ] 스위치 타입 설정 (NORMAL_OPEN, NORMAL_CLOSE)

### 2. 릴레이 제어
- [ ] 릴레이 ON/OFF 제어 UI/ViewModel
- [ ] 출입문 릴레이 매핑
- [ ] 릴레이 상태 모니터링

---

## Phase 7: 스케줄 관리

### 1. 스케줄 유형
- [ ] 스케줄 도메인 구현
  - [ ] 스케줄 모델 (Schedule)
  - [ ] 스케줄 RestClient
  - [ ] 스케줄 Repository
- [ ] ALWAYS (항상) 스케줄
- [ ] SPECIFIC (특정) 스케줄

### 2. 스케줄 적용
- [ ] 출입 권한 스케줄 UI/ViewModel
- [ ] 출입문 열림/닫힘 스케줄 UI/ViewModel
- [ ] 출입 기간 관리

---

## Phase 8: 플러그인 연동

### 1. 외부 시스템 동기화
- [ ] Sync Plugin 구현
- [ ] Brivo 연동
- [ ] PDK (ProdataKey) 연동

### 2. Webhook
- [ ] 이벤트 발생 시 외부 시스템 알림 전송
- [ ] API Key 기반 인증

### 3. OAuth 연동
- [ ] 네이버 OAuth
- [ ] 카카오 OAuth
- [ ] 소셜 로그인 인증

---

## Phase 9: 고급 기능

### 1. 대시보드 및 리포트
- [ ] 대시보드 UI/ViewModel
  - [ ] 실시간 출입 현황
  - [ ] 장치 상태 요약
  - [ ] 알람 현황
  - [ ] 방문자 현황
- [ ] 리포트 생성
  - [ ] 출입 이력 리포트
  - [ ] 장치 상태 리포트
  - [ ] 방문자 통계 리포트

### 2. 실시간 알림
- [ ] Push 알림
- [ ] Email 알림
- [ ] SMS 알림

### 3. 통합 기능
- [ ] 모바일 앱 연동
- [ ] 영상 보안 연동
- [ ] 근태 관리 연동

---

## Phase 10: AI 및 분석

### 1. 이상 행위 탐지
- [ ] 비정상 출입 패턴 감지
- [ ] 알림 발송

### 2. 출입 패턴 분석
- [ ] 사용자별 출입 패턴 분석
- [ ] 시간대별 출입 통계

### 3. 예측 유지보수
- [ ] 장치 이상 징후 감지
- [ ] 예방 정비 알림

### 4. 대시보드 자동화
- [ ] 자동 리포트 생성
- [ ] 인사이트 제공

---

## 비기능 요구사항

### 1. 성능 최적화
- [ ] API 응답 시간 500ms 이하 유지
- [ ] 페이지 로딩 시간 3초 이내
- [ ] 동시 사용자 1,000명 지원

### 2. 보안
- [ ] HTTPS 통신 적용
- [ ] 민감 데이터 암호화
- [ ] 생체정보 보호 (Face Link 연동)

### 3. 테스트
- [ ] 단위 테스트 작성
- [ ] 통합 테스트 작성
- [ ] E2E 테스트 작성

### 4. 문서화
- [ ] API 문서 작성
- [ ] 코드 주석 작성
- [ ] 사용자 가이드 작성

### 5. 배포
- [ ] 개발 환경 배포
- [ ] 스테이징 환경 배포
- [ ] 프로덕션 환경 배포

---

## 버전 정보

- **문서 생성일**: 2026-01-05
- **작성자**: Claude Code
- **프로젝트 버전**: v1.0

---

> 이 계획은 PRD를 기반으로 작성되었으며, 프로젝트 진행 상황에 따라 업데이트됩니다.
