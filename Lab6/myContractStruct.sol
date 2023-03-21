//SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

contract myContractStruct{
    struct Person {
        string firstName;
        string lastName;
    }

    Person[] public people; 

    uint public peopleCount = 0; 

    function addPerson(string memory _firstName, string memory _lastName) public{
        Person memory tempPeople;
        tempPeople.firstName = _firstName;
        tempPeople.lastName = _lastName;
        
        peopleCount += 1;
        people.push(tempPeople);
    } 
}