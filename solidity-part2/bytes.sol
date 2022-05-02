// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract Demo {
    // bytes are like a dynamic array, 
    // using bytes1,2,3 and so on we are able to store a specific length of string
    // but bytes are like dynamic array. we can add as many character as we want 
    // and moreover we can access each character using index like we do in array

    bytes public str="abc";

    function accessIndex(uint index) public view returns(bytes1){
        return str[index];
    }
     function accessBytes() public view returns(bytes memory){
        return str;
        // this shows that bytes is a reference data type
    }
}