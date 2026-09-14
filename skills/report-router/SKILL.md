---
name: report-router
description: Choose the appropriate output channel and renderer for research based on audience, purpose, urgency, and need for long-term context preservation.
---

# Report Router

## Purpose

사용자의 "요약", "정리", "공유", "보고"라는 단어만 보고 형식을 정하지 않는다.

누가 읽는지,
언제 읽는지,
무엇을 해야 하는지,
나중에 다시 참조해야 하는지를 기준으로 renderer를 선택한다.

이 스킬은 직접 최종 문서를 작성하지 않는다.

## Default pipeline

```text
Research
→ research-output
→ report-router
→ renderer
→ optional style layer
→ report-lint
→ final
```

리서치 원문에서 바로 Slack이나 Confluence 글을 작성하지 않는다.

## Choose Confluence when

다음 중 하나 이상이면 `confluence-report`를 선택한다.

- 나중에 다시 참조해야 한다.
- 조사 배경과 근거를 보존해야 한다.
- 팀의 지식으로 남겨야 한다.
- 여러 사람이 비동기적으로 읽는다.
- 의사결정 근거를 기록해야 한다.
- 후속 작업자가 전체 맥락을 알아야 한다.
- 사용자가 Confluence, 문서화, 기록을 명시한다.

Confluence의 핵심 목적은 **기억과 이해의 보존**이다.

## Choose Slack when

다음 중 하나 이상이면 `slack-report`를 선택한다.

- 빠르게 공유하는 것이 목적이다.
- 현재 상태를 알리는 보고다.
- 누군가의 판단이나 행동이 필요하다.
- 상세 내용은 다른 문서에 존재한다.
- 짧은 시간 안에 핵심을 파악해야 한다.
- 사용자가 Slack, 팀 공유, 빠른 보고를 명시한다.

Slack의 핵심 목적은 **주의를 집중시키고 행동을 유도하는 것**이다.

## Choose both when

다음 상황에서는 둘 다 생성한다.

- 중요한 리서치를 공유하면서 기록도 남겨야 한다.
- 의사결정 근거를 문서화하고 즉시 알릴 필요가 있다.
- Confluence 문서를 Slack을 통해 배포한다.
- 사용자가 "문서화해서 공유"를 요청한다.

순서:

```text
research-output
→ confluence-report
→ slack-report
```

Slack은 Confluence의 축약 복사본이 아니다.

## Audience adjustment

### 실무 담당자

우선순위:

- 실제 발견
- 제약
- 구현 또는 실행에 영향을 주는 정보
- 다음 단계

### 팀 리드 / 매니저

우선순위:

- 결론
- 영향
- 리스크
- 선택지
- 필요한 결정

### 임원 / 경영진

우선순위:

- 사업적 의미
- 결정 사항
- 예상 영향
- 중요한 리스크

방법론은 의사결정에 영향을 줄 때만 포함한다.

## Interpreting ambiguous requests

### "요약해줘"

현재 대화에서 읽기 위한 요청이면 일반 요약이 가능하다.

업무 산출물이나 팀 공유 맥락이면 목적에 맞는 renderer를 선택한다.

### "공유해줘"

기본적으로 Slack 성격으로 본다.

장기 기록 가치가 높다면 Confluence + Slack을 고려한다.

### "정리해줘"

장기 보존 목적이면 Confluence.

현재 이해만을 위한 요청이면 일반 요약.

### "보고해줘"

빠른 상태 보고 → Slack

정식 분석 보고 → Confluence

근거 기록 + 즉시 알림 → 둘 다

## Internal routing contract

필요하면 내부적으로 다음 구조를 만든다.

```yaml
output_plan:
  source: research-output
  targets:
    - confluence-report
    - slack-report
  audience:
    - product-team
  objective:
    - preserve-context
    - communicate-decision
  detail_level: medium
  action_required: true
```

사용자가 원하지 않으면 이 내부 계획을 그대로 노출하지 않는다.

## Non-negotiable rule

renderer는 사실을 추가할 수 없다.

허용:

- 순서 변경
- 압축
- 표현 변경
- 강조 조정
- 중복 제거

금지:

- 새로운 수치
- 새로운 원인
- 출처 없는 인과관계
- 불확실성을 확정으로 변경
- 원본에 없는 담당자나 일정 생성

## Final step

모든 renderer 결과는 최종 변경이 끝난 뒤 `report-lint`를 통과해야 한다.
