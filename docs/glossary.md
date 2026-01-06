# Moon Web 개발 용어사전 (Development Glossary)

> Suprema CLUe - 출입통제(Access Control) 및 방문자 관리(Visitor Management) 웹 포털 시스템

**관련 문서**: [구현 계획](plan.md) | [비즈니스 컨텍스트](business-requirements.md) | [기술 명세서](techspec/techspec.md)

---

## 목차
1. [도메인 개념](#도메인-개념)
2. [계층 구조 (Hierarchy)](#계층-구조-hierarchy)
3. [출입통제 (Access Control)](#출입통제-access-control)
4. [방문자 관리 (Visitor Management)](#방문자-관리-visitor-management)
5. [장치 관련 (Device)](#장치-관련-device)
6. [인증 방식 (Authentication)](#인증-방식-authentication)
7. [사용자 및 권한 (User & Permission)](#사용자-및-권한-user--permission)
8. [스케줄 및 기간 (Schedule & Period)](#스케줄-및-기간-schedule--period)
9. [이벤트 및 로그 (Event & Log)](#이벤트-및-로그-event--log)
10. [I/O 모듈](#io-모듈)
11. [구역 및 알람 (Zone & Alarm)](#구역-및-알람-zone--alarm)
12. [플러그인 연동 (Plugin Integration)](#플러그인-연동-plugin-integration)
13. [기술 용어](#기술-용어)

---

## 도메인 개념

| 영문 | 한글 | 설명 |
|------|------|------|
| **CLUe** | 클루 | Suprema의 클라우드 기반 출입통제 서비스 플랫폼 |
| **Access Control (AC)** | 출입통제 / 출입보안 | 인증을 통해 특정 공간에 대한 출입을 제어하는 시스템 |
| **Visitor Management** | 방문자 관리 | 방문 일정, 방문자 정보를 관리하는 시스템 |
| **Video Security** | 영상보안 | 영상 감시 및 보안 관련 서비스 |
| **Time Attendance** | 근태관리 | 출퇴근 시간 및 근무 관리 서비스 |
| **Sync Plugin** | 동기화 플러그인 | 외부 시스템과 사용자 정보를 동기화하는 기능 |
| **Operation Center** | 운영센터 | 시스템 전체를 관리하는 웹 포털 |

---

## 계층 구조 (Hierarchy)

시스템은 다음과 같은 계층 구조를 가집니다:

```
Branch (지사/브랜치)
  └── Distributor (대리점)
        └── Place Group (공간그룹)
              └── Place (공간)
                    └── Door (출입문)
                          └── Device (장치)
```

### 출입통제 계층

| 영문 | 한글 | 설명 |
|------|------|------|
| **Branch** | 브랜치 / 지사 | 최상위 관리 단위, 여러 대리점을 포함 |
| **Distributor** | 대리점 | 브랜치 하위의 관리 단위 |
| **Place Group** | 공간그룹 | 여러 공간을 그룹화한 단위 |
| **Place** | 공간 | 물리적 장소 (예: 매장, 사무실) |
| **Door** | 출입문 | 출입을 제어하는 문 |
| **Device** | 장치 / 출입장치 | 인증을 수행하는 하드웨어 (리더기, 컨트롤러 등) |

### 방문자 관리 계층

| 영문 | 한글 | 설명 |
|------|------|------|
| **Visit Branch** | 방문 지사 | 방문자 관리의 최상위 단위 |
| **Visit Building** | 빌딩 | 지사 하위의 건물 단위 |
| **Visit Company** | 입주사 | 빌딩 내 입주해 있는 회사 |
| **Location** | 출입구역 / 방문위치 | 입주사 내 방문 가능한 구역 |

---

## 출입통제 (Access Control)

### 출입문 상태 (Door Status)

| 영문 | 한글 | 설명 |
|------|------|------|
| **NORMAL** | 정상 | 정상 상태 |
| **INCIDENT** | 장애 | 이상 상태 발생 |

### 출입문 명령 (Door Command)

| 영문 | 한글 | 설명 |
|------|------|------|
| **ONCE_OPEN** | 일시 열림 | 한 번만 문을 연다 |
| **ALWAYS_OPEN** | 항상 열림 / 고정 개방 | 문을 계속 열어둔다 |
| **ALWAYS_CLOSE** | 항상 닫힘 / 고정 잠금 | 문을 계속 잠근다 |
| **RELEASE_MANUAL_MODE** | 수동 모드 해제 | 수동 제어 상태를 해제한다 |

### 출입문 잠금 상태 (Door Lock State)

| 영문 | 한글 | 설명 |
|------|------|------|
| **NORMAL_LOCKED** | 정상 잠금 | 기본 잠금 상태 |
| **MANUAL_LOCKED** | 수동 잠금 | 관리자가 수동으로 잠근 상태 |
| **SCHEDULE_LOCKED** | 스케줄 잠금 | 스케줄에 의해 잠긴 상태 |
| **AUTH_UNLOCKED** | 인증 해제 | 인증 성공으로 해제된 상태 |
| **ONCE_UNLOCKED** | 일시 해제 | 일시적으로 해제된 상태 |
| **MANUAL_UNLOCKED** | 수동 해제 | 관리자가 수동으로 해제한 상태 |
| **SCHEDULE_UNLOCKED** | 스케줄 해제 | 스케줄에 의해 해제된 상태 |
| **EMERGENCY_UNLOCKED** | 비상 해제 | 비상 상황으로 해제된 상태 |

### 출입문 설정

| 영문 | 한글 | 설명 |
|------|------|------|
| **Entry Device** | 입실 장치 | 입장 시 사용하는 인증 장치 |
| **Exit Device** | 퇴실 장치 | 퇴장 시 사용하는 인증 장치 |
| **Relay** | 릴레이 | 문 잠금장치를 제어하는 전기 스위치 |
| **Open Delay Time** | 열림 시간 | 문이 열려있는 지속 시간 |
| **Exit Button** | 퇴실 버튼 | 내부에서 문을 여는 버튼 |
| **Door Sensor** | 출입문 센서 | 문의 열림/닫힘을 감지하는 센서 |
| **Open Schedule** | 스케줄 열림 | 특정 시간에 자동으로 문을 여는 스케줄 |
| **Close Schedule** | 스케줄 닫힘 | 특정 시간에 자동으로 문을 닫는 스케줄 |

### 출입 유형

| 영문 | 한글 | 설명 |
|------|------|------|
| **ALL_DOOR** | 모든 출입문 | 모든 출입문에 접근 가능 |
| **SPECIFIC** | 특정 출입문 | 특정 출입문에만 접근 가능 |

---

## 방문자 관리 (Visitor Management)

### 스케줄 상태 (Schedule Status)

| 영문 | 한글 | 설명 |
|------|------|------|
| **RESERVED** | 방문 예정 | 예약된 방문 일정 |
| **IN_PERIOD** | 방문 중 | 현재 방문 진행 중 |
| **FINISHED** | 방문 완료 | 방문이 완료됨 |
| **CANCELLED** | 방문 취소 | 방문이 취소됨 |

### 방문자 상태 (Attendee Status)

| 영문 | 한글 | 설명 |
|------|------|------|
| **BEFORE_VISIT** | 방문 예정 | 아직 방문하지 않음 |
| **CHECK_IN** | 방문 중 | 입장하여 체류 중 |
| **CHECK_OUT** | 방문 완료 | 퇴장 완료 |
| **CANCELLED** | 방문 취소 | 방문이 취소됨 |

### 방문 목적 (Purpose Type)

| 영문 | 한글 | 설명 |
|------|------|------|
| **MEETING** | 미팅 | 회의 목적 방문 |
| **DELIVERY** | 배달 | 배송 목적 방문 |
| **CONSTRUCTION** | 공사 | 시공/공사 목적 방문 |
| **ETC** | 기타 | 기타 목적 방문 |

### 예약 관련

| 영문 | 한글 | 설명 |
|------|------|------|
| **Schedule** | 스케줄 / 방문 일정 | 방문 예약 정보 |
| **Attendee** | 방문자 | 방문하는 사람 |
| **Host** | 호스트 | 방문을 접수/승인하는 담당자 |
| **Booking Product** | 예약 상품 | 예약 가능한 시간/공간 상품 |
| **Applicant** | 신청자 | 예약을 신청한 사람 |
| **Approval Pending** | 승인 대기 | 승인을 기다리는 상태 |
| **Approval Completed** | 승인 완료 | 승인이 완료된 상태 |
| **Approval Rejected** | 승인 거절 | 승인이 거절된 상태 |

---

## 장치 관련 (Device)

### 장치 종류 (Device Type)

| 영문 | 한글 | 설명 |
|------|------|------|
| **BioLiteN2** | 바이오라이트 N2 | Suprema 지문 인식 장치 |
| **XPass2** | 엑스패스 2 | Suprema 카드 리더기 |
| **XStation2** | 엑스스테이션 2 | Suprema 복합 인증 장치 |
| **BioStation3** | 바이오스테이션 3 | Suprema 고급 생체인증 장치 |
| **BioEntryW3** | 바이오엔트리 W3 | Suprema 방수 지문 인식 장치 |
| **SecureIOModule** | 시큐어IO 모듈 | Suprema I/O 컨트롤러 |

### 장치 상태 및 동기화

| 영문 | 한글 | 설명 |
|------|------|------|
| **Network Connected** | 정상 | 네트워크 연결됨 |
| **Network Disconnected** | 연결 끊김 | 네트워크 연결 안됨 |
| **Device Sync** | 장치 동기화 | 장치에 설정값을 동기화 |
| **Firmware** | 펌웨어 | 장치의 내장 소프트웨어 |
| **Kernel Version** | 커널 버전 | 운영체제 핵심 버전 |

### 장치 명령 (Device Command)

| 영문 | 한글 | 설명 |
|------|------|------|
| **RESET** | 초기화 | 장치 설정 초기화 |
| **RESET_NETWORK_EXCLUDE** | 네트워크 제외 초기화 | 네트워크 설정을 제외하고 초기화 |
| **RESET_FACTORY** | 공장 초기화 | 공장 출하 상태로 초기화 |
| **REBOOT_DEVICE** | 장치 재시작 | 장치를 재부팅 |
| **UPGRADE_FIRMWARE** | 펌웨어 업그레이드 | 펌웨어를 업데이트 |
| **SEARCH_SLAVE** | 슬레이브 검색 | 하위 장치 검색 |
| **HEALTH_CHECK** | 헬스 체크 | 장치 상태 확인 |
| **UPLOAD_LOGS** | 로그 업로드 | 장치 로그를 서버로 전송 |

### 장치 네트워크 설정

| 영문 | 한글 | 설명 |
|------|------|------|
| **DHCP** | DHCP | 자동 IP 할당 방식 |
| **IP Address** | IP 주소 | 장치의 네트워크 주소 |
| **Subnet Mask** | 서브넷마스크 | 네트워크 범위 지정 |
| **Gateway** | 게이트웨이 | 네트워크 관문 주소 |
| **DNS Server** | DNS 서버 | 도메인 이름 해석 서버 |

### RS485 통신

| 영문 | 한글 | 설명 |
|------|------|------|
| **RS485 Master** | RS485 마스터 | 하위 장치를 제어하는 주 장치 |
| **RS485 Slave** | RS485 슬레이브 | 마스터에 의해 제어되는 종속 장치 |

---

## 인증 방식 (Authentication)

### 인증 수단 (Credential Type)

| 영문 | 한글 | 설명 |
|------|------|------|
| **QR_CODE** | QR 코드 | QR 코드를 이용한 인증 |
| **FACE** | 얼굴 | 안면 인식 인증 |
| **FINGERPRINT** | 지문 | 지문 인식 인증 |
| **CARD** | 카드 / RF 카드 | RFID 카드 인증 |
| **PIN** | PIN | 비밀번호 인증 |
| **DYNAMIC_QR** | CLUe QR | 동적으로 생성되는 QR 코드 |
| **MOBILE_CARD** | 모바일 카드 | 스마트폰 기반 카드 인증 |

### 인증 모드 (Auth Mode)

| 영문 | 한글 | 설명 |
|------|------|------|
| **FACE** | 얼굴 | 안면 인식 단독 |
| **FINGERPRINT** | 지문 | 지문 인식 단독 |
| **CARD** | 카드 | 카드 인식 단독 |
| **CARD_THEN_FACE** | 카드 + 얼굴 | 카드 후 얼굴 복합 인증 |
| **CODE_THEN_PIN** | 코드 + PIN | 코드 후 PIN 복합 인증 |
| **QR** | QR | QR 코드 단독 |
| **DYNAMIC_QR** | 동적 QR | 동적 QR 코드 |
| **PHONE_WITH_AGE** | 전화번호 + 나이 | 전화번호와 나이 확인 |
| **PHONE_WITH_NAME** | 전화번호 + 이름 | 전화번호와 이름 확인 |
| **UNIQUE_PIN** | 고유 PIN | 사용자별 고유 PIN |
| **OAUTH** | OAuth | 소셜 로그인 인증 |

### 카드 유형

| 영문 | 한글 | 설명 |
|------|------|------|
| **CSN Card** | CSN 카드 | 카드 시리얼 넘버 방식 |
| **Wiegand Card** | 위건드 카드 | 위건드 프로토콜 방식 |
| **26 bit Wiegand SIA Standard** | 26비트 위건드 표준 | 표준 26비트 위건드 포맷 |
| **HID 37 bit H10302** | HID 37비트 H10302 | HID 37비트 포맷 |

### QR 벤더 (QR Vendor Type)

| 영문 | 한글 | 설명 |
|------|------|------|
| **NAVER** | 네이버 | 네이버 QR 인증 |
| **KAKAO** | 카카오 | 카카오 QR 인증 |
| **OAUTH** | OAuth | 소셜 로그인 방식 |
| **CLUE_VISITOR** | CLUe 방문자 | CLUe 자체 방문자 QR |

### 생체정보 관련

| 영문 | 한글 | 설명 |
|------|------|------|
| **Face Link** | Face Link / 페이스링크 | 얼굴 정보 링크 연동 방식 |
| **Bio Source Type** | 생체정보 입수 방식 | 생체정보 저장/연동 방식 |
| **Bio Into Server** | 서버 저장 | 생체정보를 서버에 저장 |
| **Bio Link** | 링크 연동 | 생체정보를 링크로 연동 |
| **Biometric Collection Agreement** | 생체정보 수집 동의 | 생체정보 수집에 대한 사용자 동의 |
| **User Pre Consent** | 사용자 사전 동의 | 생체정보 수집 전 사전 동의 절차 |

---

## 사용자 및 권한 (User & Permission)

### 계정 유형 (Account Type)

| 영문 | 한글 | 설명 |
|------|------|------|
| **USER** | 사용자 | 일반 사용자 |
| **SUPREMA_MANUFACTURE** | 슈프리마 제조 | 슈프리마 제조사 계정 |
| **SERVICE_OPERATOR** | 서비스 운영자 | 서비스 운영 담당자 |
| **PLACE_GROUP_ADMIN** | 공간그룹 관리자 | 공간그룹 관리 권한 |
| **DISTRIBUTOR_ADMIN** | 대리점 관리자 | 대리점 관리 권한 |
| **BRANCH_ADMIN** | 브랜치 관리자 | 브랜치 관리 권한 |
| **SERVICE_PROVIDER** | 서비스 제공자 | 서비스 제공 담당 |
| **BUSINESS_PROVIDER** | 비즈니스 제공자 | 비즈니스 제공 담당 |
| **BUSINESS_OWNER** | 비즈니스 소유자 | 비즈니스 소유 권한 |
| **VISITOR_MEMBER** | 방문자 회원 | 방문자 시스템 회원 |

### 계정 상태 (Account Status)

| 영문 | 한글 | 설명 |
|------|------|------|
| **ACTIVE** | 활성 | 활성화된 계정 |
| **INACTIVE** | 비활성 | 비활성화된 계정 |
| **AUTH_CODE_LOCKED** | 인증코드 잠금 | 인증코드 오류로 잠김 |
| **PASSWORD_LOCKED** | 비밀번호 잠금 | 비밀번호 오류로 잠김 |
| **PASSWORD_EXPIRED** | 비밀번호 만료 | 비밀번호가 만료됨 |
| **DELETE_RESERVE** | 삭제 예약 | 삭제가 예약된 상태 |
| **INVITED_SIGNUP** | 가입 초대 | 가입 초대를 받은 상태 |

### 역할 (Role Type)

| 영문 | 한글 | 설명 |
|------|------|------|
| **MASTER** | 마스터 / 메인 관리자 | 최고 권한의 관리자 |
| **MANAGER** | 매니저 / 서브 관리자 | 부 관리자 |

### 관리자 유형

| 영문 | 한글 | 설명 |
|------|------|------|
| **Branch Admin Master** | 지사 마스터 관리자 | 지사의 최고 관리자 |
| **Branch Admin Manager** | 지사 매니저 관리자 | 지사의 부 관리자 |
| **Building Admin Master** | 빌딩 마스터 관리자 | 빌딩의 최고 관리자 |
| **Building Admin Manager** | 빌딩 매니저 관리자 | 빌딩의 부 관리자 |
| **Company Admin Master** | 입주사 마스터 관리자 | 입주사의 최고 관리자 |
| **Company Admin Manager** | 입주사 매니저 관리자 | 입주사의 부 관리자 |
| **Company Host** | 입주사 호스트 | 입주사의 방문 담당자 |
| **Email Manager** | 이메일 관리자 | 이메일로 접속하는 관리자 |
| **Mobile Manager** | 모바일 관리자 | 모바일 앱으로 접속하는 관리자 |

### 사용자 관련

| 영문 | 한글 | 설명 |
|------|------|------|
| **Place Auth** | 사용자 / 공간 인증 | 공간 출입 권한이 있는 사용자 |
| **User ID** | 사용자 ID | 사용자 고유 식별자 |
| **User Key** | 사용자 Key | 사용자 인증 키 |
| **Access Period** | 출입기간 | 출입이 허용된 기간 |
| **Entry Status** | 출입 상태 | 출입 허용/금지 상태 |
| **Invite** | 초대 | 관리자/사용자 초대 |
| **Kickout** | 내보내기 | 관리자/사용자 추방 |
| **Leave** | 나가기 | 스스로 나가기 |

---

## 스케줄 및 기간 (Schedule & Period)

### 스케줄 유형 (Schedule Type)

| 영문 | 한글 | 설명 |
|------|------|------|
| **ALWAYS** | 항상 | 항상 적용되는 스케줄 |
| **SPECIFIC** | 특정 | 특정 시간에만 적용되는 스케줄 |

### 기간 관련

| 영문 | 한글 | 설명 |
|------|------|------|
| **Access Period Status** | 출입기간 상태 | 출입 가능 기간의 상태 |
| **Before Period Start** | 기간 시작 전 | 허용 기간 시작 전 |
| **Period Expired** | 기간 만료 | 허용 기간 만료 |
| **Unlimited** | 제한 없음 | 기간 제한 없음 |

### 요일

| 영문 | 한글 |
|------|------|
| **Monday / Mon** | 월요일 |
| **Tuesday / Tue** | 화요일 |
| **Wednesday / Wed** | 수요일 |
| **Thursday / Thu** | 목요일 |
| **Friday / Fri** | 금요일 |
| **Saturday / Sat** | 토요일 |
| **Sunday / Sun** | 일요일 |

---

## 이벤트 및 로그 (Event & Log)

### 주요 이벤트 유형

| 영문 | 한글 | 설명 |
|------|------|------|
| **QR_AUTH_SUCCESS** | QR 인증 성공 | QR 코드 인증 성공 |
| **QR_AUTH_FAIL** | QR 인증 실패 | QR 코드 인증 실패 |
| **FACE_AUTH_SUCCESS** | 얼굴 인증 성공 | 안면 인식 인증 성공 |
| **FACE_AUTH_FAIL** | 얼굴 인증 실패 | 안면 인식 인증 실패 |
| **CARD_AUTH_SUCCESS** | 카드 인증 성공 | 카드 인증 성공 |
| **CARD_AUTH_FAIL** | 카드 인증 실패 | 카드 인증 실패 |
| **FINGERPRINT_AUTH_SUCCESS** | 지문 인증 성공 | 지문 인식 인증 성공 |
| **FINGERPRINT_AUTH_FAIL** | 지문 인증 실패 | 지문 인식 인증 실패 |
| **DOOR_INCIDENT** | 출입문 장애 | 출입문 이상 상태 |
| **DOOR_TEMP_OPEN_REQ** | 관리자 일시 개방 요청 | 관리자가 일시적으로 문 개방 요청 |
| **DOOR_MANUAL_OPEN_REQ** | 관리자 고정 개방 요청 | 관리자가 지속적으로 문 개방 요청 |
| **DOOR_MANUAL_CLOSE_REQ** | 관리자 고정 잠금 요청 | 관리자가 지속적으로 문 잠금 요청 |
| **NETWORK_DISCONNECT** | 네트워크 연결 해제 | 네트워크 연결이 끊김 |
| **NETWORK_CONNECT** | 네트워크 연결 성공 | 네트워크 연결됨 |
| **DOOR_RELAY_ON** | 릴레이 켜짐 | 문 열림 릴레이 활성화 |
| **DOOR_RELAY_OFF** | 릴레이 꺼짐 | 문 열림 릴레이 비활성화 |
| **DOOR_SENSOR_OPEN** | 출입문 센서 열림 | 문이 열린 것을 감지 |
| **DOOR_SENSOR_CLOSE** | 출입문 센서 닫힘 | 문이 닫힌 것을 감지 |
| **DOOR_HELD_OPEN** | 출입문 장시간 열림 | 문이 오래 열려있음 |
| **DOOR_FORCE_OPEN** | 출입문 강제 열림 | 문이 강제로 열림 |
| **FIRMWARE_UPGRADED** | 펌웨어 업그레이드 성공 | 펌웨어 업데이트 완료 |

### 감사 로그 (Audit Log)

| 영문 | 한글 | 설명 |
|------|------|------|
| **Audit Log** | 감사 로그 | 시스템 변경 이력 기록 |
| **Source** | 출처 | 이벤트 발생 출처 |
| **Admin** | 관리자 | 작업을 수행한 관리자 |
| **IP Address** | IP 주소 | 접속 IP 주소 |
| **Target** | 대상 | 영향을 받은 대상 |
| **Event** | 이벤트 | 발생한 이벤트 유형 |
| **Action Type** | 액션 유형 | 수행된 작업 유형 (조회/생성/수정/삭제) |

### 감사 로그 액션 유형

| 영문 | 한글 | 설명 |
|------|------|------|
| **LIST** | 목록 조회 | 목록 데이터 조회 |
| **DETAIL** | 상세 조회 | 상세 데이터 조회 |
| **CREATE** | 생성 | 새로운 데이터 생성 |
| **UPDATE** | 수정 | 기존 데이터 수정 |
| **DELETE** | 삭제 | 데이터 삭제 |
| **COMMAND** | 명령 | 장치에 명령 전송 |

---

## I/O 모듈

### I/O 관련 용어

| 영문 | 한글 | 설명 |
|------|------|------|
| **I/O Module** | I/O 모듈 | 입출력 제어 모듈 |
| **Contact Sensor** | 접점 센서 | 접촉 감지 센서 |
| **Relay Output** | 릴레이 출력 | 릴레이를 통한 제어 출력 |
| **Input Port** | 입력 포트 | 신호 입력 포트 |
| **Output Port** | 출력 포트 | 신호 출력 포트 |
| **Switch Type** | 스위치 타입 | 스위치 동작 방식 |

### 스위치 타입 (Switch Type)

| 영문 | 한글 | 설명 |
|------|------|------|
| **NORMAL_OPEN** | 상시 열림 (NO) | 평상시 회로가 열려있음 |
| **NORMAL_CLOSE** | 상시 닫힘 (NC) | 평상시 회로가 닫혀있음 |

---

## 구역 및 알람 (Zone & Alarm)

### 구역 유형

| 영문 | 한글 | 설명 |
|------|------|------|
| **Zone** | 구역 | 논리적 영역 그룹 |
| **Fire Zone** | 화재 연동 구역 | 화재 시 연동되는 구역 |
| **Fire Access Zone** | 화재 출입 구역 | 화재 시 출입 통제 구역 |

### 알람 관련

| 영문 | 한글 | 설명 |
|------|------|------|
| **Zone Alarm** | 구역 알람 | 구역에서 발생한 알람 |
| **Alarm Status** | 알람 상태 | 알람의 현재 상태 |
| **Ongoing** | 발생 중 | 알람이 진행 중 |
| **Released** | 해제 | 알람이 해제됨 |
| **Auto Release** | 자동 해제 | 알람 자동 해제 |
| **Manual Release** | 수동 해제 | 관리자가 수동으로 해제 |
| **Door Open Held** | 장시간 문 열림 | 문이 오래 열려있는 상태 |
| **Door Force Open** | 강제 문 열림 | 문이 강제로 열린 상태 |

---

## 플러그인 연동 (Plugin Integration)

### 연동 시스템

| 영문 | 한글 | 설명 |
|------|------|------|
| **Sync Plugin** | 동기화 플러그인 | 외부 시스템과 동기화하는 플러그인 |
| **Brivo** | Brivo | Brivo 출입통제 시스템 |
| **PDK (ProdataKey)** | PDK | ProdataKey 출입통제 시스템 |
| **Webhook** | 웹훅 | 이벤트 발생 시 외부로 알림 전송 |
| **API Key** | API 키 | API 접근을 위한 인증 키 |

### Wiegand 설정

| 영문 | 한글 | 설명 |
|------|------|------|
| **Wiegand** | 위건드 | 카드 리더 통신 프로토콜 |
| **Pulse Width** | 펄스 폭 | 신호 펄스의 폭 (마이크로초) |
| **Pulse Interval** | 펄스 간격 | 신호 펄스 간 간격 |
| **Facility Code** | 시설 코드 | 시설 식별 코드 |

---

## 기술 용어

### 아키텍처 관련

| 영문 | 한글 | 설명 |
|------|------|------|
| **Repository** | 리포지토리 | 데이터 접근 계층 |
| **Provider** | 프로바이더 | 상태 관리 및 의존성 제공 |
| **ViewModel (VM)** | 뷰모델 | 화면 로직 관리 클래스 |
| **Data Layer** | 데이터 레이어 | 데이터 처리 계층 |
| **Rest API** | Rest API | HTTP 기반 API |
| **Retrofit** | Retrofit | HTTP 클라이언트 라이브러리 |
| **Riverpod** | Riverpod | Flutter 상태 관리 라이브러리 |

### 데이터 관련

| 영문 | 한글 | 설명 |
|------|------|------|
| **Request Body** | 요청 본문 | API 요청 데이터 |
| **Response** | 응답 | API 응답 데이터 |
| **Query** | 쿼리 | 조회 조건 파라미터 |
| **Pagination** | 페이지네이션 | 목록 페이지 처리 |

### UI 관련

| 영문 | 한글 | 설명 |
|------|------|------|
| **Dialog** | 다이얼로그 | 팝업 창 |
| **Toast** | 토스트 | 일시적 알림 메시지 |
| **SubPage** | 서브페이지 | 하위 페이지 |
| **Widget** | 위젯 | UI 컴포넌트 |
| **Theme** | 테마 | UI 스타일 테마 |

### 공간 상태 (Place Status)

| 영문 | 한글 | 설명 |
|------|------|------|
| **INSTALL** | 설치 | 설치 중인 상태 |
| **SERVICE** | 서비스 / 운영 중 | 서비스 운영 중인 상태 |

---

## 파일 네이밍 컨벤션

| 접미사 | 용도 | 예시 |
|--------|------|------|
| **_vm.dart** | ViewModel 클래스 | `place_detail_vm.dart` |
| **_page.dart** | 페이지 위젯 | `login_page.dart` |
| **_dialog.dart** | 다이얼로그 위젯 | `add_card_dialog.dart` |
| **_body.dart** | API Request Body | `login_body.dart` |
| **_response.dart** | API Response | `account_response.dart` |
| **_query.dart** | API Query 파라미터 | `devices_query.dart` |
| **_repository.dart** | Repository 클래스 | `ac_repository.dart` |
| **_provider.dart** | Provider 클래스 | `auth_provider.dart` |
| **_extension.dart** | Extension 클래스 | `date_time_extension.dart` |
| **.g.dart** | 코드 생성 파일 (json_serializable 등) | `login_body.g.dart` |

---

## 약어 사전

| 약어 | 전체 표현 | 한글 |
|------|-----------|------|
| **AC** | Access Control | 출입통제 |
| **VM** | ViewModel | 뷰모델 |
| **UI** | User Interface | 사용자 인터페이스 |
| **API** | Application Programming Interface | 응용 프로그램 인터페이스 |
| **QR** | Quick Response | 빠른 응답 코드 |
| **PIN** | Personal Identification Number | 개인 식별 번호 |
| **DHCP** | Dynamic Host Configuration Protocol | 동적 호스트 구성 프로토콜 |
| **DNS** | Domain Name System | 도메인 이름 시스템 |
| **CSN** | Card Serial Number | 카드 시리얼 번호 |
| **S/N** | Serial Number | 시리얼 번호 |
| **FW** | Firmware | 펌웨어 |
| **I/O** | Input/Output | 입출력 |
| **OAuth** | Open Authorization | 개방형 인증 |
| **AWS** | Amazon Web Services | 아마존 웹 서비스 |
| **IoT** | Internet of Things | 사물인터넷 |

---

> 이 문서는 프로젝트 개발 시 일관된 용어 사용을 위해 작성되었습니다.
> 새로운 용어가 추가되면 이 문서를 업데이트해 주세요.
