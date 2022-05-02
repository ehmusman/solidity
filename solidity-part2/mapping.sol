// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract demoo {
    //  Mapping is just like an object of objects data structure
    mapping(uint => uint) public data;
    mapping(address => mapping(address=>uint)) public access;


    function addNumber(address addr1, address addr2, uint value) public {
        access[addr1][addr2]= value;
    }
    function getNumber(address addr1, address addr2) public view returns(uint){
        return access[addr1][addr2];
    }
    function insertData(uint key, uint value) public{
        data[key]=value;
    }
    function getData(uint key) public view returns(uint){
        return data[key];
    }
}