Create a new Architecture Decision Record for: $ARGUMENTS

First read existing files in .claude/decisions/ to determine the next 
ADR number.

Create .claude/decisions/00X-[slugified-title].md using this format:

# ADR 00X — $ARGUMENTS

## Date
[today's date]

## Status
Proposed

## Context
[What problem or situation led to this decision]

## Decision
[What was decided and how it will be implemented]

## Alternatives Considered
[Other options that were evaluated and why they were rejected]

## Consequences
### Positive
[Benefits of this decision]

### Negative / Tradeoffs
[Costs or risks introduced]

## Affected Files
[List of files that will change or were changed]

After creating the file, add a reference line to the 
## 📋 Architecture Decisions section of CLAUDE.md.

Output:
📄 Created: .claude/decisions/00X-[title].md
📄 Updated: CLAUDE.md — added ADR reference