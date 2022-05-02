// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ConditionalStatements{
// can only be used inside functions

function isZero(uint a)public pure returns(uint){
    if(a==0){
        return 0;
    }else if(a>1){
        return 1;
    }else{
        return 2;
    }
}
function loops()public pure returns(uint){
    uint count;
    uint sum;

    // ///////////// While Loop ///////////////
    while(count<5){
        sum=sum+1;
        count++;
    }

    // ////////////////////// Do While Loop /////////////

    // do{
    //     sum= sum+1;
    //     count++;
    // }while(count<0);

    // /////////////////// For Loop ////////////////////
    // for (int i; i<5; i++) 
    // {
    //     sum=sum+1;
    // }
    return sum;
}
}

// Sum of first 5 nums
contract Sum {
    function sum() public pure returns (uint) {
        uint256 count;
        uint256 num = 0;
        while (count <= 5) {
            num = num + count;
            count++;
        }
        return num;
    }
}
// Return Greater Num
contract Greater {
    function greater(uint a, uint b) public pure returns (uint) {
      if(a>b){
          return a;
      }else{
          return b;
      }
    }
}
