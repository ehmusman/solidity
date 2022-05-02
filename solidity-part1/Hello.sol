// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Hello {
    // uint public num=10; // state variable => permanently stored on blockchain => its costly
    uint public x;
    function setterLocal(uint num) public pure{
        uint a; // local variables => doesnot stored on blockchain and can't cost gas price 
        a=num;
    }
    
    function setterState(uint num) public{
        x=num;
    }

    function getterState() public view returns(uint){
        return x;
    }

    // pure => Neither reading nor writing on state variable
    // view => when you are reading from state variables
    //      => (when nothing is written) => you are writing on state variables
}