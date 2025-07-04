# Nexara Treasury

**Nexara Treasury** is the ethical fund management system of the Nexara Protocol. It ensures that all disbursements are purpose-driven, role-authorized, and transparently recorded.

---

## 🧠 Purpose

- Store and manage NXN Coin reserves
- Distribute funds based on approved purposes
- Enforce role-based authorization (e.g., Treasurer)
- Align all financial flows with Nexara’s ethical vision

---

## 🧱 Architecture

| Contract | Role |
|----------|------|
| `NexaraTreasury` | Core fund release logic |
| `TreasuryPolicy` | Approved purposes registry |
| `RoleRegistry` | Role-based access control |

---

## 🔐 Access Control

Only addresses with the `"Treasurer"` role can release funds.  
All purposes must be pre-approved in `TreasuryPolicy`.

---

## 🧬 Ethical Alignment

The treasury is not a vault—it is a **vessel of purpose**. Every coin released must serve a cause aligned with dignity, transparency, and public good.

> _“Let the treasury serve the people, not the powerful.”_
