// SPDX-License-Identifier: MIT

pragma solidity ^0.4.0; 

contract SimpleStorage{
    uint storedData;

    function set(uint data)public{
        storedData=data;
    } 
    function get()view public returns(uint){
        return storedData;
    } 

    function increment(uint num) public{
        storedData += num;
        return;
    }

    function decrement(uint num) public{
        storedData -= num;
        return;
    }

}