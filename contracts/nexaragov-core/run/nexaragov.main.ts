import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`🚀 Deployer: ${deployer.address}`);

  const roleRegistry = "0xYourRoleRegistryAddress";
  const meritEngine = "0xYourMeritEngineAddress";

  const ProposalRegistry = await ethers.getContractFactory("ProposalRegistry");
  const proposalRegistry = await ProposalRegistry.deploy();
  await proposalRegistry.deployed();
  console.log(`✅ ProposalRegistry deployed at: ${proposalRegistry.address}`);

  const VoteEngine = await ethers.getContractFactory("VoteEngine");
  const voteEngine = await VoteEngine.deploy(meritEngine);
  await voteEngine.deployed();
  console.log(`✅ VoteEngine deployed at: ${voteEngine.address}`);

  const NexaraGov = await ethers.getContractFactory("NexaraGov");
  const nexaraGov = await NexaraGov.deploy(
    roleRegistry,
    meritEngine,
    proposalRegistry.address,
    voteEngine.address
  );
  await nexaraGov.deployed();
  console.log(`🏛️ NexaraGov deployed at: ${nexaraGov.address}`);
}

main().catch((error) => {
  console.error("🔥 Deployment error:", error);
  process.exit(1);
});