# Git 워크플로우

> 이 문서는 Git 브랜치 전략 및 협업 규칙을 안내합니다.  
> 각 브랜치 및 폴더는 [CLAUDE.md](../CLAUDE.md)에서 정의한 표준 폴더 구조를 준수해야 합니다.

## 브랜치 전략

```
master ← stage ← dev ← feature/기능명, bugfix/버그명
```

- `master`: 프로덕션 배포 브랜치 (PR 통해서만 병합)
- `stage`: 스테이징/QA 환경 브랜치 (배포 전 테스트)
- `dev`: 개발 통합 브랜치 (다음 릴리스 준비)
- `feature/{기능명}`: 새 기능 개발 (dev에서 분기 → dev으로 병합)
- `bugfix/{버그명}`: 버그 수정 (dev 기준)
- `hotfix/{긴급수정}`: 프로덕션 긴급 수정 (master 기준 → master, stage, dev 모두 병합)

---

## 작업 흐름

```bash
# 1. 새 기능 시작
git checkout dev
git pull origin dev
git checkout -b feature/new-feature

# 2. 작업 및 커밋
git add .
git commit -m "feat: 새로운 기능 추가"
git push origin feature/new-feature

# 3. PR 생성 후 리뷰 → dev 병합

# 4. dev → stage 병합 (QA 테스트)
git checkout stage
git pull origin stage
git merge dev
git push origin stage

# 5. stage → master 병합 (프로덕션 배포)
git checkout master
git pull origin master
git merge stage
git push origin master
```

---

## 커밋 메시지

### 형식
```
<타입>: <제목>
```

### 타입
- `feat`: 새로운 기능 추가
- `fix`: 버그 수정
- `refactor`: 코드 리팩토링
- `style`: 코드 포맷팅
- `docs`: 문서 수정
- `test`: 테스트 코드
- `chore`: 빌드 설정, 의존성 등
- `design`: UI/UX 변경
- `rename`: 파일/폴더명 변경
- `remove`: 파일 삭제

### 작성 규칙
- 50자 이내, 명령형, 마침표 없음

### 예시
```
feat: 사용자 로그인 기능 구현
fix: 비밀번호 유효성 검사 버그 수정
```

---

## PR 가이드

- 작은 단위로 나누기
- 자기 리뷰 후 PR 생성
- Squash and Merge 권장

---

## 주의사항

- master/stage/dev 브랜치에 직접 커밋 금지
- 민감 정보(API 키, 토큰) 커밋 금지
- 공유 브랜치에 force push 금지
