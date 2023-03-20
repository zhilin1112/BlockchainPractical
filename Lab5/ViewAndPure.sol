// SPDX-License-Identifier: MIT

pragma solidity >=0.6.10; 

contract ViewAndPure{
    uint public x = 1;

    //Promise not to modify the state --> View
    function addToX(uint y)public view returns(uint){
        return x + y; //can direct read the variable x from upside

    }

    //Promise not to modify or read from the state --> Pure
    function add(uint i, uint j)public pure returns(uint){
        return i + j;
    }
}