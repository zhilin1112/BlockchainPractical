// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

contract Bidder{
    string public name;
    uint public bidAmount;
    bool public eligible;
    uint public minBid = 50;

    function setName(string memory inputName) public {
        name = inputName;
    }

    function setBidAmount(uint inputBidAmount) public {
        if(determineEligibility(inputBidAmount)){
            bidAmount = inputBidAmount;
        }
        else{
            bidAmount = 0;
        }
    }

    function determineEligibility(uint inputBid) public returns (bool){
        if(inputBid < minBid){
            eligible = false;
        }
        else {
        eligible = true;
        }

        return eligible;
    }
}