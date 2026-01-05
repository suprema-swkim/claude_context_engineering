---
description: 프로젝트 개발을 시작하는 메인에이전트 명령어
---

# 🚀 프로젝트 개발 시작 (Main Agent)

이 명령어는 서브에이전트들을 총괄하는 메인에이전트입니다.
프로젝트의 구현 계획을 분석하고, 단계별 개발을 진행합니다.

---

## 📋 실행 프로세스

### Step 1: 구현 계획 분석
1. `docs/plan.md` 파일을 읽어 전체 구현 계획을 파악합니다.
2. 최상위 Phase부터 순차적으로 탐색합니다.
3. 미완료 항목(`[ ]`)이 있는 첫 번째 Phase를 식별합니다.

### Step 2: Phase 선택 확인
1. 식별된 Phase의 이름과 주요 작업 항목을 사용자에게 제시합니다.
2. 다음 형식으로 확인을 요청합니다:

```
📌 다음 개발 Phase를 발견했습니다:

**[Phase 이름]**
- 주요 작업 1
- 주요 작업 2
- ...

이 Phase를 진행하시겠습니까? (Y/N)
```

3. 사용자가 거부하면 다음 미완료 Phase를 제안하거나 사용자의 선택을 받습니다.

### Step 3: 개발 플랜 수립
사용자가 승인하면, 해당 Phase에 대한 상세 개발 플랜을 작성합니다:

1. **기술 분석**
   - 필요한 API 엔드포인트 확인 (`docs/api/` 참조)
   - 필요한 데이터 모델 정의
   - 기술 명세 확인 (`docs/techspec/techspec.md` 참조)

2. **작업 분해**
   - 세부 작업을 우선순위에 따라 정렬
   - 각 작업별 담당 서브에이전트 지정:
     - `1.api_specialist`: API 클라이언트 및 Repository 구현
     - `2.state_manager`: ViewModel 및 상태 관리 구현
     - `3.ui_ux_specialist`: UI 페이지 및 위젯 구현
     - `4.routing_manager`: 라우팅 및 네비게이션 설정
     - `5.tester`: 테스트 코드 작성
     - `6.reviewer`: 코드 리뷰 및 품질 검증

3. **의존성 파악**
   - 작업 간 순서 의존성 명시
   - 병렬 처리 가능한 작업 식별

4. **플랜 형식**
```
📝 개발 플랜: [Phase 이름]

**1. 사전 작업**
- [ ] 작업 내용 (@담당에이전트)

**2. 핵심 구현**
- [ ] 작업 내용 (@담당에이전트)

**3. UI 구현**
- [ ] 작업 내용 (@담당에이전트)

**4. 통합 및 테스트**
- [ ] 작업 내용 (@담당에이전트)

예상 소요: X 단계
```

### Step 4: 플랜 확인
1. 작성된 개발 플랜을 사용자에게 제시합니다.
2. 다음 형식으로 확인을 요청합니다:

```
위 개발 플랜을 진행하시겠습니까? (Y/N)
수정이 필요하면 말씀해주세요.
```

3. 사용자 피드백에 따라 플랜을 수정하거나 진행합니다.

### Step 5: 플랜 실행
사용자 승인 후 개발을 진행합니다:

1. 각 작업을 순서대로 실행합니다.
2. 작업 완료 시 `docs/plan.md`의 해당 항목을 `[x]`로 업데이트합니다.
3. 주요 마일스톤마다 진행 상황을 사용자에게 보고합니다.

---

## 🔗 서브에이전트 참조

| 에이전트 | 역할 | 파일 |
|---------|------|------|
| API Specialist | RestClient, Repository 구현 | `.claude/agents/1.api_specialist.md` |
| State Manager | ViewModel, 상태 관리 | `.claude/agents/2.state_manager.md` |
| UI/UX Specialist | 페이지, 위젯 구현 | `.claude/agents/3.ui_ux_specialist.md` |
| Routing Manager | 라우팅, 네비게이션 | `.claude/agents/4.routing_manager.md` |
| Tester | 테스트 코드 작성 | `.claude/agents/5.tester.md` |
| Reviewer | 코드 리뷰, 품질 검증 | `.claude/agents/6.reviewer.md` |

---

## 📚 참조 문서

- **구현 계획**: `docs/plan.md`
- **비즈니스 요구사항**: `docs/business-requirements.md`
- **기술 명세**: `docs/techspec/techspec.md`
- **API 문서**: `docs/api/`
- **용어집**: `docs/glossary.md`

---

## ⚠️ 주의사항

1. 반드시 사용자 확인을 받은 후에만 다음 단계로 진행합니다.
2. 각 Phase는 순차적으로 완료해야 합니다 (의존성 존재).
3. 코드 생성 후 `dart run build_runner build --delete-conflicting-outputs` 실행이 필요할 수 있습니다.
4. 모든 변경사항은 기존 아키텍처 패턴(MVVM)을 준수해야 합니다.
