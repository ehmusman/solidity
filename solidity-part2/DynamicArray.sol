// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract demoo {
    uint[] public arr;

    function getAllData()public view returns(uint[] memory){
        return arr;
    }
    function addData(uint value) public{
        arr.push(value);
    }
    function removeData() public{
        if(arr.length !=0){
        arr.pop();
        }
    }
}