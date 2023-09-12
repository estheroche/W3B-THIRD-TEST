import { ethers } from "hardhat";


async function main() {
  const Vote = await ethers.deployContract("DecentralizedVotingSystem", [ ]);
  Vote.waitForDeployment();

  console.log(Vote.target);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
  