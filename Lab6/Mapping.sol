pragma solidity ^0.6.10;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public myMap;

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    } 

function get(address _addr) public view returns (uint) {
         // Mapping always returns a value.
         // If the value was never set, it will return the default value.
        return myMap[_addr];
    }

    function remove(address _addr) public {
        // Reset the value to the default value.
        delete myMap[_addr];
    }
}
