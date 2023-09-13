# VotingSystem = https://sepolia.etherscan.io/address/0x4f88d0be2A1CcC2D63632bB099DfB0504a6B99E6

# DecentralizedVotingSystem

DecentralizedVotingSystem smart contract, appears to be a simple implementation of a decentralized voting system on the Ethereum blockchain. Let's break down its main components and functionalities:

# State Variables:

- voterId and candidateId: Unsigned integers used to assign unique IDs to voters and candidates.
- Admin: Address of the contract administrator (presumably the entity or account that deployed the contract).
- candidateAddress: An array of addresses representing the Ethereum addresses of the candidates.
- candidates: A mapping that associates a candidate's Ethereum address with their Candidate struct.
- votedVoters: An array of addresses representing voters who have already cast their votes.
  -votersAddress: An array of addresses representing all eligible voters.

# Structs:

- Candidate: A struct to represent candidate information, including their ID, age, name, vote count, and Ethereum address.
- Voter: A struct to store voter information, including their ID, name, Ethereum address, allowed status (1 for allowed, 0 for not allowed), number of votes, and whether the voter has already voted.

# Events:

- CandidateCreate: An event triggered when a new candidate is added, emitting candidate details.
- VoterCreate: An event triggered when a new voter is added, emitting voter details.

# Constructor:

The constructor sets the Admin address to the Ethereum address that deploys the contract.

# Functions:

- setCandidate: Allows the contract administrator to add a candidate by specifying their age, name, and Ethereum address.
- getCandidates: Retrieves an array of all candidate addresses.
- getCandidateLength: Returns the number of candidates.
- getCandidateData: Returns the details of a specific candidate based on their Ethereum address.
- voterRight: Allows the contract administrator to create a new voter by specifying their name and Ethereum address. Each voter is initially allowed to vote (voterAllowed = 1) and is given 1000 votes.
- vote: Allows voters to cast their votes for a specific candidate. The voter's vote count is set to the \_candidateVoteId, and their voterVoted status is marked as true. The candidate's vote count is incremented by the number of votes the voter has.
- getVoterLength: Returns the number of voted voters.
- getVoterData: Returns the details of a specific voter based on their Ethereum address.
- getVotedList: Retrieves an array of addresses representing voters who have already cast their votes.
- getVoteList: Retrieves an array of all eligible voter addresses.

# Modifiers:

The require statements in various functions ensure that only the contract administrator can perform certain actions (e.g., adding candidates or voters).

This contract provides a basic foundation for a decentralized voting system on Ethereum, but it has some limitations and potential improvements, such as ensuring the security and transparency of the voting process, handling edge cases, and allowing for the removal of candidates and voters. Additionally, the contract does not include the logic for tallying and displaying the final election results.
