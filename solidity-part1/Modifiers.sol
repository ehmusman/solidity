// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ModifierStatement{
// Modifier statement is used to to remove the code duplication
    uint public sum;
// function isZero(uint a)public{
//     require(a==0, "a is not equal to zero");
//     sum=a;
// }
// function isZero1(uint a)public{
//     require(a==0, "a is not equal to zero");
//     sum=a;
// }
// function isZero2(uint a)public{
//     require(a==0, "a is not equal to zero");
//     sum=a;
// }
// function isZero3(uint a)public{
//     require(a==0, "a is not equal to zero");
//     sum=a;
// }

/////////////////////// With Modifiers /////////////////////////

modifier nonZero(uint value){
    require(value==0, "a is not equal to zero");
    _;
}
function isZero(uint a)public nonZero(a){
    sum=1;
}
function isZero1(uint a)public nonZero(a){
    sum=2;
}
function isZero2(uint a)public nonZero(a){
    sum=3;
}
function isZero3(uint a)public nonZero(a){
    sum=4;
}
}