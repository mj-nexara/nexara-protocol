# NexaraGov — Voting Policy

**Maintained by**: Sovereign Architect (MJ Ahmad)  
**Purpose**: To define the rules, thresholds, and timing for all merit-weighted voting within NexaraGov

---

## 🧠 Voting Philosophy

Voting in Nexara is not a popularity contest.  
It is a **merit-weighted, ethically aligned, and role-aware mechanism** for dignified decision-making.

---

## 🧾 Default Voting Parameters

| Parameter        | Value              | Description |
|------------------|--------------------|-------------|
| Voting Duration  | 7 days             | Time window for casting votes |
| Quorum Threshold | 10,000 merit units | Minimum total merit required for vote to be valid |
| Approval Ratio   | > 60% Yes votes    | Percentage of Yes votes (by merit weight) required for approval |
| One Vote Per Address | ✅              | Each address may vote once per proposal |

---

## 🔁 Voting Lifecycle

1. Proposal submitted by eligible Contributor
2. Proposal validated and registered
3. Voting opens for 7 days
4. Votes cast using `castVote(address, proposalId, support)`
5. VoteEngine tallies merit-weighted results
6. If quorum + approval met → proposal is executable

---

## 🧬 Merit Weighting

- Votes are weighted by `MeritEngine.getMerit(address)`
- Merit is dynamic and recalibrated quarterly
- No stake-based voting allowed

---

## 🛡️ Special Cases

| Case | Rule |
|------|------|
| Emergency Override | Sovereign Architect may bypass vote (existential threats only) |
| Tie Vote | Proposal is rejected |
| Low Quorum | Proposal is invalid and archived |

---

## 🧾 Governance-Controlled Parameters

All voting parameters may be updated via:
- Governance proposal
- Merit-weighted approval
- Ethical alignment review

---

## 🕊️ Final Note

> _“A vote in Nexara is not just a choice—it is a reflection of earned trust.”_  
> — MJ Ahmad
