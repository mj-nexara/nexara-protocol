# Nexara Protocol — Deployment Guide

**Maintained by**: Sovereign Architect (MJ Ahmad)  
**Purpose**: To provide a step-by-step guide for deploying Nexara smart contracts to Mainnet or Testnet environments

---

## 🧱 Prerequisites

- Node.js ≥ 18.x
- Hardhat ≥ 2.20
- `.env` file with required addresses and keys
- Deployer wallet with sufficient ETH (for gas)

---

## 📁 Directory Structure

```
contracts/
├── merit-engine/
├── nexaragov-core/
├── nexara-treasury/
├── nxn-genesis/
run/
├── merit-engine.main.ts
├── nexaragov.main.ts
├── treasury.main.ts
├── nxn-genesis.main.ts
```

---

## 🔐 Environment Variables (`.env`)

```
PRIVATE_KEY=your_deployer_private_key
ROLE_REGISTRY_ADDRESS=0x...
MERIT_ENGINE_ADDRESS=0x...
NXN_TOKEN_ADDRESS=0x...
```

---

## 🧪 Local Deployment (for testing)

```
npx hardhat compile
npx hardhat run run/merit-engine.main.ts --network localhost
```

---

## 🚀 Mainnet Deployment (step-by-step)

### 1. Deploy RoleRegistry (if not already deployed)

```
npx hardhat run run/role-registry.main.ts --network mainnet
```

### 2. Deploy MeritEngine

```
npx hardhat run run/merit-engine.main.ts --network mainnet
```

### 3. Deploy ProposalRegistry + VoteEngine + NexaraGov

```
npx hardhat run run/nexaragov.main.ts --network mainnet
```

### 4. Deploy TreasuryPolicy + NexaraTreasury

```
npx hardhat run run/treasury.main.ts --network mainnet
```

### 5. Deploy Genesis Contracts

```
npx hardhat run run/nxn-genesis.main.ts --network mainnet
```

---

## 🧠 Deployment Philosophy

- All contracts are modular and upgradeable (except Genesis)
- Deployment must follow the order of dependency
- All addresses must be recorded and verified on-chain

---

## 🧾 Post-Deployment Checklist

- [ ] Verify contracts on Etherscan
- [ ] Record deployed addresses in `docs/deployment-record.md`
- [ ] Update `.env` with live addresses
- [ ] Announce Genesis hash and timestamp

---

> _“Deployment is not the end—it is the beginning of responsibility.”_  
> — MJ Ahmad
