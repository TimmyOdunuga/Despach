pragma solidity >=0.7.0 <0.9.0;
// SPDX-License-Identifier: GPL-3.0


//Compare String pair
library StringCompare{
    // /**
    // * @doubleStringPair compare two strings (a and b) and returns a bool value
    // * a is compare against b
    // **/
    function twoPair(string memory a, string memory b) public pure returns(bool){
       return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
    
    // /**
    // * @tripleStringPair compare three strings (a, b and c) and returns a bool value
    // * a is compare against b and a against c, returns true if either is equal.
    // **/
    function triplePair(string memory a, string memory b, string memory c) public pure returns(bool){
       return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b)) || keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(c));
    }
}
