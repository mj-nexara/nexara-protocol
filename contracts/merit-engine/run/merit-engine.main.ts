import { ethers } from "hardhat";
import { MeritEngine } from "../typechain-types";
import roles from "../config/roles.config";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`🚀 Deployer: ${deployer.address}`);

  const roleRegistryAddress = process.env.ROLE_REGISTRY_ADDRESS;
  if (!roleRegistryAddress) {
    throw new Error("❌ ROLE_REGISTRY_ADDRESS not set in environment");
  }

  const MeritEngineFactory = await ethers.getContractFactory("MeritEngine");
  const meritEngine = (await MeritEngineFactory.deploy(roleRegistryAddress)) as MeritEngine;

  await meritEngine.deployed();
  console.log(`✅ MeritEngine deployed at: ${meritEngine.address}`);

  // Assign initial merit scores from config
  for (const entry of roles.initialMerit) {
    const tx = await meritEngine.assignMerit(entry.address, entry.score);
    await tx.wait();
    console.log(`🎯 Assigned ${entry.score} merit to ${entry.address}`);
  }

  console.log("🏁 MeritEngine main run complete.");
}

main().catch((error) => {
  console.error("🔥 Error in main run:", error);
  process.exit(1);
});
