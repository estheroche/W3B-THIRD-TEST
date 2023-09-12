
import { ethers } from "hardhat";

async function main() {
  
const VoteContract = '0x4f88d0be2A1CcC2D63632bB099DfB0504a6B99E6'

  const [signer1, signer2, signer3, signer4, signer5] =
    await ethers.getSigners();
  const votingApp = await ethers.getContractAt(
    "Ivote",
    "0x4f88d0be2A1CcC2D63632bB099DfB0504a6B99E6"
  );

   await votingApp.setCandidate(45, "ego", signer1.address);
  const candidates = await votingApp.getCandidateData(signer1.address);

  console.log(candidates);
  console.log(signer2.address);
  await votingApp.voterRight("drake", signer2.address);

  await votingApp.connect(signer2).vote(signer1.address, 1);

  const VLength = await votingApp.getVoterLength();
  console.log(VLength);

  const voterData = await votingApp.getVoterLength();
  console.log(voterData);
}

// We recommend this pattern to be able to use async/await everywhere 0x5FbDB2315678afecb367f032d93F642f64180aa3
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});



// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

