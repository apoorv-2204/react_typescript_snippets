//SPDX-License-Identifier:MIT
 pragma solidity ^0.8.6;

 contract Conditions{

     function Condition(int x) public pure returns(int){
            if(x>=0 && x<=10){
                return 1;
            }
            else if(x>=11 && x<=20){
                return 2;
            }
            else if(x>=21 && x<=30){
                return 3;
            }
            else if(x>=31){
                return 4;
            }
            else{
                return 5;
            }
       }
   }
