// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract DecentralizedVotingSystem {
    uint public voterId;
    uint public candidateId;

    address public Admin;

    struct Candidate {
        uint candidateId;
        uint age;
        string name;
        uint voteCount;
        address _candidateAddress;
    }

    event CandidateCreate(
        uint candidateId,
        uint age,
        string name,
        uint voteCount,
        address candidateAddress
    );

    address[] public candidateAddress;

    mapping(address => Candidate) public candidates;

    address[] public votedVoters;

    address[] public votersAddress;

    struct Voter {
        uint id;
        string name;
        address voterAddress;
        uint voterAllowed;
        uint votes;
        bool voterVoted;
    }

    event VoterCreate(
        uint id,
        string name,
        address voterAddress,
        uint voterAllowed,
        bool voterVoted,
        uint votes
    );

    mapping(address => Voter) public voters;

    constructor() {
        Admin = msg.sender;
    }

    function setCandidate(
        uint _age,
        string memory _name,
        address _candidateAddress
    ) public {
        require(Admin == msg.sender, "Only Admin ");
        candidateId++;
        Candidate storage candidate = candidates[_candidateAddress];
        candidate.age = _age;
        candidate.name = _name;
        candidate.voteCount = 0;
        candidate._candidateAddress = _candidateAddress;
        candidateAddress.push(_candidateAddress);
        emit CandidateCreate(
            candidateId,
            _age,
            _name,
            candidate.voteCount,
            _candidateAddress
        );
    }

    function getCandidates() public view returns (address[] memory) {
        return candidateAddress;
    }

    function getCandidateLength() public view returns (uint) {
        return candidateAddress.length;
    }

    function getCandidateData(
        address _candidateAddress
    ) public view returns (uint, string memory, uint, uint, address) {
        return (
            candidates[_candidateAddress].candidateId,
            candidates[_candidateAddress].name,
            candidates[_candidateAddress].age,
            candidates[_candidateAddress].voteCount,
            candidates[_candidateAddress]._candidateAddress
        );
    }

    function voterRight(string memory name, address voterAddress) public {
        require(Admin == msg.sender, "Only Admin allowed to create voter");
        voterId++;
        Voter storage voter = voters[voterAddress];
        require(voter.voterAllowed == 0, "Voter Allowed not zero");
        voter.id = voterId;
        voter.name = name;
        voter.voterAddress;
        voter.voterAllowed = 1;
        voter.votes = 1000;
        voter.voterVoted = false;
        votersAddress.push(voterAddress);
        emit VoterCreate(
            voter.id,
            name,
            voterAddress,
            voter.voterAllowed,
            voter.voterVoted,
            voter.votes
        );
    }

    function vote(address _candidateAddress, uint _candidateVoteId) public {
        Voter storage voter = voters[msg.sender];
        require(!voter.voterVoted, "already voted");
        require(voter.voterAllowed != 0, " no right to vote");

        voter.voterVoted = true;

        voter.votes = _candidateVoteId;

        votedVoters.push(_candidateAddress);

        candidates[_candidateAddress].voteCount += voter.voterAllowed;
    }

    function getVoterLength() public view returns (uint) {
        return votedVoters.length;
    }

    function getVoterData(
        address _candidateAddress
    ) public view returns (uint, string memory, address, uint, uint, bool) {
        return (
            voters[_candidateAddress].id,
            voters[_candidateAddress].name,
            voters[_candidateAddress].voterAddress,
            voters[_candidateAddress].voterAllowed,
            voters[_candidateAddress].votes,
            voters[_candidateAddress].voterVoted
        );
    }

    function getVotedList() public view returns (address[] memory) {
        return votedVoters;
    }

    function getVoteList() public view returns (address[] memory) {
        return votersAddress;
    }
}
