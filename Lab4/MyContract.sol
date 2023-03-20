// SPDX-License-Identifier: MIT

pragma solidity ^0.5.1; 

//Use different version and different keyword
//Constant & pure 
contract MyContract{
    string public constant value = "myValue2";
    constructor() public{ 
    }

    function get()pure public returns(string memory){
        return value;
    }

    // function set(string val)public {
    //     value = val;
    // }

}