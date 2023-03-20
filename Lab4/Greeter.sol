// SPDX-License-Identifier: MIT

pragma solidity ^0.4.0; 

contract Greeter {
    string public yourName; //state variable
    constructor() public {
        yourName = "world 123";
    }
    function set(string name)public{
        yourName=name;
    }
    function hello()constant public returns(string){
        return yourName; 
    }
}