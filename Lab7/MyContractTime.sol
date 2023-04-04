// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContractTime {
    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

    //we need to make sure that the currrent time is in the future beyond a certain like opening time
    //we need to set this openingtime is actually expressed in seconds.
    //it is epic time (https://ww.epochconverter.com).
    uint256 openingTime = 1635610920; //current time in second since the time stamp

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        uint256 _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory _fName, string memory _lName) public {
        people[peopleCount] = Person(peopleCount, _fName, _lName);
        incrementCount();
    }

    //internal function
    function incrementCount() internal {
        peopleCount += 1;
    }
}
