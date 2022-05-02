// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract demoo {
    // Arrays, Struct, Mapping are known as reference datatypes.
    // When we use reference datatype we have to explicitly provide the data area where the type is stored.
    // Every reference type has an additional annotation, the "data location" sbout where it is stored. there are three data locations, memory, storage, calldata

    // //////////////////// Memory ////////////////////////
    // Lifetime is limited to an external function call

    // /////////////////// Storage ////////////////////////
    // the location where the state variables are stored, where the lifetime is limited to the lifetime of a contract.

    // ////////////////// Calldata ////////////////////////
    // special data location that contains the function argument

    // these above are the most important data locations used for storing reference types data


    ///////////////////////////// Storage Area Vs Memory Area for reference Data type ///////////////////////

    // fixed length array
    uint[3] public arr=[1,2,3]; // here arr is stored in storage area because its a state variable

    function multiplyBy2(uint[3] memory brr) public pure returns(uint[3] memory){
        brr[1]=2*brr[1]; // multiplying second index with 2
        return brr;
    }

    ///////////////////////////// Calldata Vs Memory Area for reference Data type ///////////////////////

    //  calldata => argument => immutable => its read only => used to minimize the gas cost.
     function changingBrr(uint[3] memory brr, uint[3] calldata crr) public pure returns(uint[3] memory){
        // crr[1]=2*crr[1]; // multiplying second index with 2, its not doable because crr is readonly
        brr[1]=2*crr[1]; // replacing second index of brr with 2 time of second index of crr. crr is readonly here
        return brr;
    }

    // ///////////////////////// storage, Pointer, Memory /////////////////////////////////////////////

    function pointerExample() public returns(uint[3] memory) {
        arr[0]=10; // here I am modifying the state variable directly
        uint[3] storage pointer=arr; // here using storage keyword a pointer is created. means 2 different variables will point towards same data liocation. 
        pointer[1]=4; // here using pointer I'm modifying the arr state variable using pointer. it
        return arr;
        // if we do same thing using memory, memory will copy the whole array and will create a new variable. than the changing in both variables will point out to two different variables. this is the difference between the memory and storage

    }
}