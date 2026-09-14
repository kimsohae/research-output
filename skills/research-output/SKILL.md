---
name: research-output
description: Normalize research findings into a canonical intermediate format that preserves facts, evidence, uncertainty, implications, and sources before channel-specific writing.
---

# Research Output

## Purpose

리서치 결과를 최종 게시물로 바로 작성하지 않는다.

Confluence, Slack, 보고서, 이메일 등 여러 형태로 변환할 수 있도록
정보를 표준 중간 산출물로 정리한다.

이 스킬의 출력은 **canonical research model**이다.

최종 renderer가 내용을 압축하거나 재배치하더라도
사실 여부와 의미를 검증할 때 이 결과를 기준으로 사용한다.

## Core principles

### 사실과 해석을 분리한다

다음을 구분한다.

- 확인된 사실
- 근거에서 도출한 해석
- 추정
- 아직 검증되지 않은 가설
- 권고

해석이나 권고를 사실처럼 표현하지 않는다.

### 중요한 주장에 근거를 연결한다

중요한 Finding마다 가능하면 다음을 보존한다.

- Claim
- Evidence
- Source
- Confidence
- Caveat
- Implication

### 요약 과정에서 결정적인 조건을 버리지 않는다

특히 다음을 보존한다.

- 수치
- 날짜와 기간
- 모집단
- 표본
- 비교 기준
- 단위
- 전제
- 예외
- 불확실성

### 독자나 매체를 가정하지 않는다

이 단계에서는 Slack이나 Confluence에 맞게 쓰지 않는다.

정보를 매체와 분리하여 보존한다.

## Output format

# Research Output

## Question

이번 리서치가 답하려는 질문을 1~3문장으로 작성한다.

## Executive Finding

가장 중요한 결론을 3~5문장으로 설명한다.

단순한 발견 목록이 아니라
"그래서 무엇을 알게 되었는가"가 드러나야 한다.

## Findings

각 Finding에 고유 ID를 부여한다.

### F1. [발견 제목]

**Claim**

확인하거나 도출한 내용을 완결된 문장으로 작성한다.

**Evidence**

주장을 뒷받침하는 핵심 근거를 기록한다.

가능하면 수치, 사례, 비교 기준을 포함한다.

**Source**

출처 또는 출처 식별자를 기록한다.

**Confidence**

High / Medium / Low

필요하면 이유를 한 문장으로 설명한다.

**Caveat**

해석할 때 주의할 조건이나 한계를 기록한다.

없다면 생략할 수 있다.

**Implication**

이 발견이 현재 질문이나 의사결정에 어떤 의미가 있는지 설명한다.

필요한 만큼 F2, F3를 추가한다.

Finding 수를 억지로 늘리지 않는다.

## Synthesis

Finding들을 함께 보았을 때 나타나는 패턴과 관계를 설명한다.

단순 반복을 피한다.

다음을 고려한다.

- 여러 근거가 같은 방향을 가리키는가
- 서로 충돌하는 근거가 있는가
- 초기 가설과 달라진 점은 무엇인가
- 중요한 상관관계나 인과 가능성은 무엇인가

인과가 확인되지 않았다면 인과처럼 쓰지 않는다.

## Decision Relevance

의사결정과 관련될 때 작성한다.

### 현재 판단할 수 있는 것

현재 근거만으로 판단 가능한 내용.

### 아직 판단하기 어려운 것

추가 정보가 필요한 내용.

### 권고

현재 근거 기준으로 합리적인 행동이 있다면 제시한다.

권고와 사실을 혼동하지 않는다.

## Open Questions

아직 답하지 못한 중요한 질문을 기록한다.

"추가 조사가 필요하다"에서 끝내지 않는다.

무엇을 확인해야 판단이 달라지는지 구체적으로 쓴다.

## Sources

실제로 사용한 주요 출처를 정리한다.

## Quality gate

출력 전에 확인한다.

1. 중요한 주장에 근거가 연결되어 있는가?
2. 사실과 해석이 구분되어 있는가?
3. 원본에 없던 사실을 추가하지 않았는가?
4. 중요한 수치, 기간, 조건이 사라지지 않았는가?
5. 같은 내용이 불필요하게 반복되지 않는가?
6. 이 결과만으로 다른 작성자가 Slack과 Confluence를 각각 만들 수 있는가?

하나라도 충족하지 못하면 수정한다.
