// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract demoo {
    string public str="Hello";
    
    function compareTwoStrings(string calldata str1, string calldata str2) public pure returns(bool){
        if(keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2))){
            return true;
        }
        else{
            return false;
        }
    }
    function stringConcat(string calldata s1, string calldata s2) public pure returns(string memory){
        string memory s= string.concat(s1," ",s2);
        return s;
    }
}