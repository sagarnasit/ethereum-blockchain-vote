pragma solidity ^0.4.2;

contract Election {

    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Store Voters
    mapping( address => bool ) public voters;
    // Store Candidate
    // Fetch Candidate
    mapping( uint => Candidate ) public candidates;

    // Store Cnadidate counts
    uint public candidatesCount;

    // Constructor
    constructor() public {
        addCandidate("Sagar");
        addCandidate("Ninad");
    }

    function addCandidate( string _name ) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote( uint _candidateId ) public {
        // require that voter hasn't voted before.
        require(! voters[msg.sender]);

        //require valid candidate.
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        // record voter has a vote.
        voters[msg.sender] = true;
        // update candidate vote count.
        candidates[_candidateId].voteCount++;
    }
}