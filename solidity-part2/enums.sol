// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract Demo {
    // enums are use defined data types
    // it restricts the variables to have only one of the predefined value.
    enum State{
        Pending,
        Active,
        Inactive
    }
    State public currentState;
    address public owner; 
    constructor(){
        currentState=State.Pending;
        owner=msg.sender;
    }

    function updateState(State newState) public {
        require(msg.sender == owner, "You are not owner");
        currentState=newState;
    }
}