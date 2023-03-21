//SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

contract myContractMapping{
    struct Person {
        uint id;
        string firstName;
        string lastName;
    }

    mapping(uint => Person) public people;

    uint public peopleCount = 0; 

    function addPerson(string memory _firstName, string memory _lastName) public{
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);

        peopleCount += 1;

    } 
}