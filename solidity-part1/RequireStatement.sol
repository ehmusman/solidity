// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract RequireStatements{
    uint public sum;
    uint public check=1;
    function isZero(uint a) public{
        sum=1;
        require(a==0, "a is not equal to zero");
        // this require is not like if else statement, because it throws error but if else just return answer conditionally
        // if else statement use revert instead of return then these both things will become same
        // if conditions become false, the error throws, and all the state changes are roll backed to the initial state
    }
    function isZeroIfElse(uint a) public returns(string memory){
        check=2;
        if(a==0){
            sum=1;
            return "a is zero";
        }else{
            revert("a is not equal to zero");
            // return "a is not equal to zero";
        }
    }
}