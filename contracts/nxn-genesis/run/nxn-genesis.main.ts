import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`🚀 Deployer: ${deployer.address}`);

  const GenesisMetadata = await ethers.getContractFactory("GenesisMetadata");
  const metadata = await GenesisMetadata.deploy();
  await metadata.deployed();
  console.log(`📜 GenesisMetadata deployed at: ${metadata.address}`);

  const genesisHash = "0xGENESIS_HASH_PLACEHOLDER"; // Replace with actual hash
  const NXNGenesis = await ethers.getContractFactory("NXNGenesis");
  const genesis = await NXNGenesis.deploy(genesisHash, metadata.address);
  await genesis.deployed();
  console.log(`🧬 NXNGenesis deployed at: ${genesis.address}`);
}

main().catch((error) => {
  console.error("🔥 Deployment error:", error);
  process.exit(1);
});
