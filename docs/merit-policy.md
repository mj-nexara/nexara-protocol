# Nexara Protocol — Merit Policy

**Maintained by**: Sovereign Architect (MJ Ahmad)  
**Purpose**: To define the scoring logic, role weights, and recalibration rules of the MeritEngine

---

## 🧠 Philosophy of Merit

Merit is not a number—it is a reflection of purpose.  
In Nexara, merit is earned through contribution, not claimed through status.

---

## 🧱 Merit Structure

| Role         | Base Weight | Description |
|--------------|-------------|-------------|
| Contributor  | 1000        | Active proposal submitter, builder, or researcher |
| Maintainer   | 750         | Technical steward, reviewer, or deployer |
| Auditor      | 500         | Verifier of logic, ethics, and security |
| Observer     | 100         | Passive participant, learner, or supporter |
| Guardian     | Variable    | Assigned based on ethical intervention |

---

## 🧮 Scoring Logic

- **Initial Assignment**: Based on role and verified contribution
- **Adjustments**:
  - + Merit for accepted proposals, code commits, audits
  - − Merit for inactivity, ethical violations, or rejected proposals
- **Decay**: Optional time-based decay for inactive addresses (governance-controlled)

---

## 🔁 Recalibration Policy

- **Frequency**: Quarterly (every 90 days)
- **Method**:
  - Snapshot of contributions
  - Community review (optional)
  - Maintainer-led adjustment via `adjustMerit()`
- **Transparency**: All changes logged on-chain with reason

---

## 🧾 Merit Abuse Prevention

- No self-assignment of merit
- No circular boosting (collusion)
- All adjustments require Maintainer role and are auditable

---

## 🕊️ Final Note

Merit is not a reward—it is a **responsibility**.  
It grants influence, but demands alignment.  
It empowers voices, but binds them to purpose.

> _“Let merit be earned with humility, and exercised with honor.”_  
> — MJ Ahmad
