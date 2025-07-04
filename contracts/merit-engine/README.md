# MeritEngine

**MeritEngine** is the core weighting mechanism within the Nexara Protocol. It ensures that all governance decisions are influenced not by popularity or wealth, but by **contribution, role, and ethical alignment**.

---

## 🧠 Purpose

To establish a transparent, role-aware, and dynamically adjustable merit system that:
- Rewards meaningful contribution
- Prevents plutocracy and mob rule
- Enables weighted voting and proposal evaluation

---

## 🧱 Architecture

- `MeritEngine.sol`: Core contract for assigning and adjusting merit scores
- `RoleRegistry.sol`: External contract that verifies role-based access (e.g., Maintainer)
- `IMeritEngine.sol`: Interface for external integrations
- `run/merit-engine.main.ts`: Hardhat script for deployment and merit initialization

---

## 🔐 Access Control

Only addresses with the `"Maintainer"` role (as defined in `RoleRegistry`) can:
- Assign merit
- Adjust merit

This ensures that merit distribution is **governed, not gamed**.

---

## ⚙️ Key Functions

| Function | Description |
|----------|-------------|
| `assignMerit(address, uint256)` | Set a contributor’s merit score |
| `adjustMerit(address, int256)` | Increase or decrease merit score |
| `getMerit(address)` | View current merit score |

---

## 🧪 Usage in Governance

Merit scores can be used to:
- Weight votes in proposals
- Determine eligibility for roles or rewards
- Track historical contribution over time

---

## 🧬 Ethical Alignment

MeritEngine is not just a scoring system—it is a **reflection of Nexara’s values**:
- Dignity through recognition
- Transparency through traceability
- Fairness through role-weighted logic

---

> _“In Nexara, merit is not a number—it is a measure of purpose.”_
