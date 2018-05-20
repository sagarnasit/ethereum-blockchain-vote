
var Election = artifacts.require("./Election.sol");

contract("Election", function() {

    var electionInstance;

    it("initialize with two candidate", function() {
        return Election.deployed().then( function(i) {
            return i.candidateCount();
        }).then( function(count) {
            assert.equal(count, 2);
        });
    });

    it("It initialize with correct candidate value", function() {
        return Election.deployed().then( function(i) {
            electionInstance = i;
            return electionInstance.candidates(1);
        }).then( function(candidate) {
            assert.equal(candidate[0].toNumber(), 1, "contain correct id");
            assert.equal(candidate[1].toString(), "Sagar", "contain correct name");
            assert.equal(candidate[2].toNumber(), 0, "contain correct vote count");

            return electionInstance.candidates(2);
        }).then( function(candidate) {
            assert.equal(candidate[0].toNumber(), 2, "contain correct id");
            assert.equal(candidate[1].toString(), "Ninad", "contain correct name");
            assert.equal(candidate[2].toNumber(), 0, "contain correct vote count");

        });
    });
});


