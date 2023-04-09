//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotWithStage {
    struct Voter {
        uint256 weight;
        bool hadVoted;
        uint8 vote;
    }

    struct Proposal {
        uint256 proposalID;
        string topic;
        uint256 voteCount;
    }

    enum Stage {
        Init,
        Reg,
        Vote,
        Done
    }

    Stage public stage;
    uint256 public proposalCount = 0;
    uint256 public VoterCount = 0;
    address public chairperson;
    uint256 startTime;

    //Voter struct is used to define a mapping of address.
    mapping(address => Voter) public voters;

    Proposal[] public proposals;

    constructor() {
        chairperson = msg.sender;
        voters[chairperson].weight = 2;
        stage = Stage.Init;
        startTime = block.timestamp;
    }

    function changeStateToReg() public returns (Stage){
        stage = Stage.Reg;
        return stage;
    }

    function addProposalDetail(uint256 _id, string memory _subjectProposal)
        public
    {
        Proposal memory b = Proposal(_id, _subjectProposal, 0);
        proposals.push(b);
        proposalCount++;
    }

    //modifiers
    modifier validStage(Stage reqStage) {
        require(stage == reqStage);
        _;
    }

    // Give $(toVoter) the right to vote on this ballot.
    // May only be called by $(chairperson).
    //Instead of use if statement to do validation of chairperson,we can use CUSTOM MODIFIER
    function register(address toVoter) public validStage(Stage.Reg) {
        //the sender must be chairperson (at deploy account register)
        if (msg.sender != chairperson || voters[toVoter].hadVoted == true) return;
        voters[toVoter].weight = 1;
        voters[toVoter].hadVoted = false;
        VoterCount++;
        if (block.timestamp > (startTime + 30 seconds)) {
            stage = Stage.Vote;
            startTime = block.timestamp;
        }
    }

    /// Give a single vote to proposal $(toProposal).
    // toProposal is the id of proposal
    function vote(uint8 toProposal) public validStage(Stage.Vote) {
        //if (stage != Stage.Reg) {return;}
        Voter storage sender = voters[msg.sender];
        if (sender.hadVoted || toProposal >= proposals.length) return;
        sender.hadVoted = true;
        sender.vote = toProposal;

        proposals[toProposal].voteCount += sender.weight;
        
        if (block.timestamp > (startTime + 30 seconds)) {
            stage = Stage.Done;
        }
    }

    function winningProposal()
        public
        view
        validStage(Stage.Done)
        returns (uint8 _winningProposal)
    {
        //if(stage != Stage.Done) {return;}
        uint256 winningVoteCount = 0;

        for (uint8 prop = 0; prop < proposals.length; prop++)
            if (proposals[prop].voteCount > winningVoteCount) {
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
    }
}