import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`🚀 Deployer: ${deployer.address}`);

  const nxnToken = "0xYourNXNTokenAddress";
  const roleRegistry = "0xYourRoleRegistryAddress";

  const TreasuryPolicy = await ethers.getContractFactory("TreasuryPolicy");
  const policy = await TreasuryPolicy.deploy();
  await policy.deployed();
  console.log(`📜 TreasuryPolicy deployed at: ${policy.address}`);

  const NexaraTreasury = await ethers.getContractFactory("NexaraTreasury");
  const treasury = await NexaraTreasury.deploy(nxnToken, roleRegistry, policy.address);
  await treasury.deployed();
  console.log(`💰 NexaraTreasury deployed at: ${treasury.address}`);
}

main().catch((error) => {
  console.error("🔥 Deployment error:", error);
  process.exit(1);
});
