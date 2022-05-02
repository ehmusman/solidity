// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract demoo {
    // Public   Accessible in => outside World, Within Contract, Derived Contract, Other Contract
    // Private  Accessible in => Within Contract
    // internal Accessible in => Within Contract, Derived Contract
    // External Accessible in => outside World, Derived Contract, Other Contract
    function f1() public pure returns (uint256) {
        return 1;
    }

    function f2() private pure returns (uint256) {
        return 2;
    }

    function f3() internal pure returns (uint256) {
        return 3;
    }

    function f4() external pure returns (uint256) {
        return 4;
    }
    // only f1 and f4 can be accesible from outside world
    // only f1,f2,f3 can be accessed within contract
}
// Lets create a child contract
contract child is demoo{
    uint public x = f3();
    // here f1, f3, f4 are accessible
    // f2 is not accessible because its private
}

//  Lets create some other contract to test demo

contract otherContract{
    demoo obj = new demoo();
    // here we can access, public and external functions only
    uint public f1=obj.f1();
    uint public f4=obj.f4();
}