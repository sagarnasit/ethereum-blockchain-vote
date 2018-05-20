pragma solidity ^0.4.2;

contract Election {

    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store Candidate
    // Fetch Candidate
    mapping( uint => Candidate ) public candidates;

    // Store Cnadidate counts
    uint public candidateCount;

    // Constructor
    constructor() public {
        addCandidate("Sagar");
        addCandidate("Ninad");
    }

    function addCandidate( string _name ) private {
        candidateCount++;
        candidates[candidateCount] = Candidate( candidateCount, _name, 0 );
    }
}