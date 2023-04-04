// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract functionModifier {
    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
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
