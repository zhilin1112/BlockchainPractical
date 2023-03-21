//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TutorBider{
    string public name;
    uint public bidAmount;
    bool public eligible;
    uint public minBid;
    uint public winnerAmount;
    address public winnerAddress;
    uint public winnerTimeStamp;
    string public winnerBider;

    constructor (uint _setMinBid){
        minBid=_setMinBid;
    }
    function setName(string memory _name) public {
        name=_name;
    }
    function setBidAmount(uint _value) public {
        bidAmount= _value;
    }
    function determineEligibility() public {
        if(bidAmount >= minBid)
            eligible= true;
        else
            eligible=false;
    }
    function determineWinner() public {
        if(bidAmount > winnerAmount){
            winnerAmount = bidAmount;
            winnerBider = name;
            winnerAddress = msg.sender;
            winnerTimeStamp = block.timestamp;
        }
    }
    }
    