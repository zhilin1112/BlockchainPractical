// SPDX-License-Identifier: MIT

pragma solidity ^0.5.1; 

contract BasicDataType{
    string public constant StringValue = "BMIS2003BAD";

    bool public myBool = true;

    int public myInt = -1;
    uint public myUnit = 1; //unsignd integer no negative value 

    //unsigned integet with 8 bits and 256 bits 
    uint8 public myUnit8 = 20; 
    uint256 public myUnit256 = 99999; //default integer is 256 bits (32 bytes) 


}