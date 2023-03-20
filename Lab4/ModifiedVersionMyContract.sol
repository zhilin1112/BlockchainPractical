// SPDX-License-Identifier: MIT

pragma solidity ^0.5.1; 

//Use different version and different keyword
//Constant & pure 
contract MyContract{
    //state variable = the thing declare right after the contract
    string public constant value = "myValue2";
    constructor() public{ 
    }

    function get()view public returns(string memory){
        return value;
    }

    // function set(string val)public {
    //     value = val;
    // }

}