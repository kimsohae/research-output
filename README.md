# Research Report Skills

리서치 결과를 사람이 이해하기 좋은 형태로 변환하기 위한 작은 스킬 모음입니다.

핵심 아이디어는 **리서치와 최종 글쓰기를 분리**하는 것입니다.

```text
Research
  ↓
research-output
  ↓
report-router
  ├───────────────┐
  ↓               ↓
confluence-report slack-report
  └───────┬───────┘
          ↓
  fluent-korean (optional, external)
          ↓
      report-lint
          ↓
        Publish
```

## 왜 필요한가

리서치 에이전트가 조사와 최종 글쓰기를 한 번에 수행하면 자주 다음 문제가 생깁니다.

- 사실과 해석이 섞인다.
- 중요한 수치나 조건이 요약 과정에서 사라진다.
- Confluence와 Slack에 같은 문장을 복사한다.
- Slack은 너무 길고, Confluence는 맥락이 부족하다.
- 자연스럽게 보이도록 다듬는 과정에서 원래 의미가 강해지거나 왜곡된다.

이 저장소는 이를 다섯 단계로 분리합니다.

| Skill | 역할 |
|---|---|
| `research-output` | 리서치 결과를 표준 중간 포맷으로 정규화 |
| `report-router` | 독자와 목적에 맞는 출력 채널 결정 |
| `confluence-report` | 오래 읽고 다시 참조할 수 있는 문서 생성 |
| `slack-report` | 빠르게 판단하고 행동할 수 있는 메시지 생성 |
| `report-lint` | 사실 보존, 정보 구조, 채널 적합성 최종 검증 |

## fluent-korean은 포함되어 있나요?

**아니요.**

이 저장소는 `fluent-korean`의 코드, 프롬프트, 파일을 포함하거나 복사하지 않습니다.

`fluent-korean`은 별도로 설치할 수 있는 **선택적 외부 스타일 레이어**로만 취급합니다.

원한다면 다음처럼 조합할 수 있습니다.

```text
confluence-report / slack-report
  ↓
fluent-korean (별도 설치)
  ↓
report-lint
```

중요한 점은 `report-lint`가 마지막에 실행되어야 한다는 것입니다.  
문장 스타일을 다듬은 뒤에도 원래 리서치의 수치, 불확실성, 조건이 유지되었는지 다시 확인하기 위해서입니다.

외부 프로젝트:
- https://github.com/snflkd/fluent-korean

이 저장소는 위 프로젝트와 독립적이며, 해당 프로젝트를 vendoring하지 않습니다.

---

## 설치

각 스킬 디렉터리를 사용하는 에이전트의 skill directory에 복사하면 됩니다.

플랫폼별 경로를 저장소에서 강제하지 않기 위해 설치 스크립트는 대상 경로를 인자로 받습니다.

```bash
./scripts/install.sh /path/to/your/skills
```

예:

```bash
./scripts/install.sh ~/.my-agent/skills
```

특정 스킬만 설치하려면 직접 복사해도 됩니다.

```bash
cp -R skills/slack-report /path/to/your/skills/
cp -R skills/report-lint /path/to/your/skills/
```

---

## 권장 사용법

### 1. 먼저 리서치를 정규화합니다

원본 조사 결과를 곧바로 Slack이나 Confluence 글로 만들지 않습니다.

`research-output`을 사용하여 다음을 보존합니다.

- 핵심 질문
- 발견
- 근거
- 출처
- 신뢰도
- 제한사항
- 해석
- 의사결정 관련성
- 미해결 질문

### 2. 출력 채널을 결정합니다

`report-router`가 목적을 기준으로 선택합니다.

**Confluence**
- 장기 보존
- 비동기 이해
- 의사결정 근거 기록
- 상세 근거 보존

**Slack**
- 즉시 공유
- 빠른 상태 파악
- 결정 또는 행동 요청
- 상세 문서로의 진입점

**둘 다**
- 기록도 남기고 지금 팀에도 알려야 하는 경우

### 3. 채널별 renderer를 실행합니다

같은 `research-output`에서 서로 다른 결과를 만듭니다.

Slack은 Confluence의 축약 복사본이 아닙니다.

### 4. 선택적으로 한국어 스타일을 다듬습니다

별도 설치한 스타일 스킬이 있다면 renderer 이후 적용할 수 있습니다.

이 단계는 **사실을 추가하거나 결론을 강화해서는 안 됩니다.**

### 5. 마지막에 lint를 실행합니다

`report-lint`는 최종 결과와 `research-output`을 비교합니다.

Critical 오류가 하나라도 있으면 게시하지 않고 수정합니다.

---

## 빠른 예시

원본 리서치:

```text
최근 3개월 동안 신규 사용자의 7일 내 이탈률이 31%에서 44%로 증가했다.
초기 설정을 완료하지 않은 사용자에서 이탈률이 가장 높았다.
같은 기간 유입 채널 구성도 달라졌기 때문에 초기 설정 실패를 직접 원인으로 단정할 수 없다.
```

### Confluence

```text
# 신규 사용자 리텐션 하락 분석

## 한눈에 보기

최근 3개월 동안 신규 사용자의 7일 내 이탈률이 31%에서 44%로 증가했다.
현재 데이터에서는 초기 설정 미완료 사용자에서 이탈이 가장 높다.

다만 같은 기간 유입 채널 구성도 변했기 때문에 초기 설정 경험을
리텐션 하락의 단일 원인으로 보기는 어렵다.

초기 설정 완료율을 높이는 실험과 함께 유입 채널을 통제한 분석을 제안한다.
```

### Slack

```text
신규 사용자 리텐션 하락은 첫 7일 이탈 증가가 가장 큰 요인으로 보입니다.

- 최근 3개월 7일 내 이탈률: 31% → 44%
- 초기 설정 미완료 사용자에서 이탈이 가장 높았습니다.
- 다만 유입 채널도 변해 초기 설정이 직접 원인이라고 단정하기는 어렵습니다.

다음 액션: 초기 설정 개선 실험과 채널 통제 cohort 분석을 함께 진행하는 것을 제안합니다.
상세: [Confluence 링크]
```

---

## 저장소 구조

```text
research-report-skills/
├── README.md
├── AGENTS.md
├── scripts/
│   └── install.sh
├── examples/
│   └── end-to-end.md
└── skills/
    ├── research-output/
    │   └── SKILL.md
    ├── report-router/
    │   └── SKILL.md
    ├── confluence-report/
    │   ├── SKILL.md
    │   └── examples.md
    ├── slack-report/
    │   ├── SKILL.md
    │   └── examples.md
    └── report-lint/
        └── SKILL.md
```

## 설계 원칙

1. **Research is canonical.** 최종 문서보다 `research-output`이 사실의 기준입니다.
2. **Renderer cannot invent.** renderer는 순서와 표현을 바꿀 수 있지만 새로운 사실을 만들 수 없습니다.
3. **Channel has a job.** Confluence는 기억과 이해, Slack은 주의와 행동을 담당합니다.
4. **Style is optional.** 자연스러운 문체는 중요하지만 사실 보존보다 우선하지 않습니다.
5. **Lint is last.** 최종 변경 이후 다시 원본과 대조합니다.

## 추천 확장

운영하면서 다음을 추가하면 품질이 더 좋아집니다.

- 조직에서 실제로 좋은 평가를 받은 Confluence 문서 5~10개
- 좋은 Slack 보고 10~20개
- 팀 내부 용어와 금지 표현
- 임원 보고용 renderer
- 이메일 renderer
- PRD / RFC renderer
- lint 회귀 테스트 fixture

이 저장소의 examples는 출발점입니다.  
실제 조직의 좋은 산출물을 few-shot 예시로 추가하는 것이 가장 큰 개선 효과를 냅니다.
