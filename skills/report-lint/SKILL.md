---
name: report-lint
description: Validate final research-derived outputs for factual fidelity, preserved uncertainty, information architecture, cognitive load, channel fit, and actionability.
---

# Report Lint

## Purpose

최종 결과를 사용자에게 보여주거나 게시하기 전에 검사한다.

문법 검사가 아니라 다음을 검증한다.

1. 사실 보존
2. 불확실성 보존
3. 정보 구조
4. 인지 부담
5. 채널 적합성
6. 행동 가능성

검증 기준은 `research-output`이다.

외부 스타일 스킬을 사용했다면 반드시 스타일 적용 **이후** 이 lint를 실행한다.

## Severity

### Critical

사실 왜곡이나 잘못된 의사결정을 유발할 수 있다.

반드시 수정한다.

### Major

내용이 완전히 틀리지는 않았지만
사람이 이해하거나 판단하기 어렵다.

가능하면 수정한다.

### Minor

가독성이나 표현 문제다.

최종 품질 개선을 위해 수정한다.

# 1. Fidelity

## L001 — 새로운 사실

Severity: Critical

최종 결과에 `research-output`에 없는 사실이 추가됐는지 검사한다.

원본:

```text
사용자 인터뷰에서 설정 복잡성이 언급됐다.
```

잘못된 출력:

```text
대부분의 사용자가 설정이 복잡하다고 답했다.
```

"대부분"이라는 정보가 원본에 없다.

## L002 — 불확실성 제거

Severity: Critical

가설, 추정, 가능성을 확정된 사실로 바꾸지 않는다.

원본:

```text
초기 설정이 이탈에 영향을 줄 가능성이 있다.
```

잘못된 출력:

```text
초기 설정 때문에 사용자가 이탈한다.
```

## L003 — 조건 삭제

Severity: Critical

결론 범위를 결정하는 조건을 삭제하지 않는다.

특히 다음을 검사한다.

- 기간
- 모집단
- 표본
- 비교 기준
- 예외
- 통계적 제한

## L004 — 수치 왜곡

Severity: Critical

다음을 검사한다.

- 숫자 변경
- 반올림으로 의미 변화
- 단위 변경
- 백분율과 퍼센트포인트 혼동
- 기간 변경
- 분모 변경

# 2. Information architecture

## L101 — 결론 지연

Severity: Major

Confluence:
핵심 결론이 문서 상단에서 보이지 않으면 실패.

Slack:
첫 두 문장 안에 핵심 결론 또는 요청이 없으면 실패.

## L102 — Bullet dump

Severity: Major

설명 없이 bullet이 연속되어 독자가 관계를 스스로 추론해야 하면 실패.

특히 Confluence에서 5개 이상의 bullet이 연속되면 구조 문제를 검사한다.

## L103 — 중복

Severity: Major

같은 결론을 여러 섹션에서 표현만 바꾸어 반복하지 않는다.

## L104 — 추상적 헤딩

Severity: Minor

피한다.

- 분석
- 결과
- 인사이트
- 기타
- 내용

가능하면 실제 내용을 드러내는 제목으로 바꾼다.

# 3. Cognitive load

## L201 — 과도한 정보 밀도

Severity: Major

한 문단 안에 서로 다른 주장, 수치, 제안이 과도하게 섞이면 분리한다.

## L202 — 맥락 없는 숫자

Severity: Major

나쁨:

```text
이탈률은 44%다.
```

좋음:

```text
7일 내 이탈률은 최근 3개월 동안 31%에서 44%로 증가했다.
```

## L203 — 명사 나열

Severity: Minor

과도하게 압축된 명사 나열을 자연스러운 문장으로 바꾼다.

나쁨:

```text
온보딩 개선 필요성 및 리텐션 영향 검토
```

좋음:

```text
온보딩을 개선하면 리텐션에 어떤 영향을 주는지 확인할 필요가 있다.
```

## L204 — 과도한 완곡어법

Severity: Minor

의미를 흐리는 표현을 줄인다.

- ~인 것으로 보입니다
- ~일 수도 있을 것 같습니다
- ~측면이 있을 수 있습니다

실제 불확실성이 있을 때만 사용한다.

# 4. Slack-only

## S001 — 너무 긴 배경

Severity: Major

핵심 결론보다 배경 설명이 먼저 나오면 실패.

## S002 — 액션이 숨겨짐

Severity: Major

행동이나 결정이 필요한데 무엇을 해야 하는지 명확하지 않으면 실패.

## S003 — 문서 복사

Severity: Major

Confluence 문단을 그대로 붙여 넣은 형태라면 실패.

## S004 — 핵심 정보 과다

Severity: Major

동일한 중요도의 bullet이 5개 이상이면 다음을 고려한다.

- 중요도가 낮은 항목 제거
- 상위 개념으로 묶기
- Confluence로 이동

## S005 — 장식성 표현

Severity: Minor

핵심보다 먼저 나오면 제거한다.

- 안녕하세요
- 조사해보았습니다
- 내용 공유드립니다
- 참고 부탁드립니다

조직 문화상 필요한 경우는 예외다.

# 5. Confluence-only

## C001 — 문서 자립성 부족

Severity: Major

이전 Slack 대화나 구두 맥락 없이는 이해하기 어렵다면 실패.

## C002 — 근거 추적 불가

Severity: Critical

중요한 주장에 원본 finding 또는 source를 연결할 수 없으면 실패.

## C003 — 해석 없는 데이터 나열

Severity: Major

숫자와 사실만 나열하고 의미를 설명하지 않으면 실패.

## C004 — 지나친 상세

Severity: Major

의사결정과 이해에 영향을 주지 않는 조사 과정이 본문을 차지하면 실패.

# 6. Actionability

## A001 — So what 부재

Severity: Major

문서 전체를 읽고도 리서치가 무엇을 의미하는지 알 수 없다면 실패.

## A002 — 모호한 권고

Severity: Major

다음처럼 끝내지 않는다.

- 사용자 경험을 개선할 필요가 있다.
- 추가 검토가 필요하다.
- 지속적으로 모니터링해야 한다.

무엇을 확인하거나 변경할지 구체화한다.

## A003 — 책임 없는 요청

Severity: Major

행동이 필요한데 필요한 행동 자체가 불명확하면 수정한다.

담당자가 원본에 없다면 임의로 만들지 않는다.

# Internal lint format

필요하면 내부적으로 다음과 같이 기록한다.

```yaml
lint:
  result: fail
  issues:
    - id: L002
      severity: critical
      message: "원본의 가능성 표현이 확정적 인과관계로 변경됨"
    - id: S002
      severity: major
      message: "결정 요청이 있으나 필요한 행동이 명확하지 않음"
```

사용자가 요구하지 않으면 lint 로그 자체를 최종 결과에 노출하지 않는다.

# Pass condition

- Critical issue: 0
- Major issue: 가능하면 0
- research-output의 핵심 의미 보존
- 대상 채널 목적 충족

Critical이 하나라도 있으면 수정 후 다시 검사한다.

## Last question

Confluence:

> 이 문서를 한 달 뒤 처음 읽는 사람이 결론과 근거를 이해할 수 있는가?

Slack:

> 이 메시지를 30초만 읽는 사람이 핵심과 필요한 행동을 알 수 있는가?

아니라면 다시 쓴다.
