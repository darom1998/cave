// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract MyContract{
        address public owner ;
        // Constructor executed once 
        constructor() public{
             owner = msg.sender ;
        }
         // state var 
        uint256  amountEth ;
        // 2d Array
        uint256[][] public myArr = [[1,3],[2,4],[7,8]];
        uint256[] public numbers =[1,2,3,4,5,6,7,8,9,10,11];
        // Creat new type
        struct  Holder{
            string nameHolder ;
            uint256 amountEth ;
            }
        // declare type created    
        Holder[] public holder ;
        // Creat mapping var
        mapping(uint => Holder) public idToHolder ;  
        // Nested mapping is map inside map
        mapping(address => mapping(uint => Holder)) public myHold ;
        // Store holders
        function storeHolders(uint _id ,string memory _nameHolder, uint256 _amountEth) public{
            idToHolder[_id] = Holder(_nameHolder,_amountEth);
            
            
        }
        function addhold (uint _id ,string memory _nameHolder, uint256 _amountEth) public {
            myHold[msg.sender][_id] = Holder(_nameHolder,_amountEth);
        }

        function isEvenNumber(uint _number)  public pure  returns(bool){
            if(_number % 2 == 0){
                return true;

            }
            return false;
        }
        function countEven() public view returns (uint){
            uint count = 0 ;
            for(uint i = 0 ; i < numbers.length ;i++)
            {
                if(isEvenNumber(numbers[i])){
                    count += 1;
                }
                else{
                    count += 0;
                }
                

            }
            return count ;
        }
        function isOwner() public view returns(bool){
            return (msg.sender == owner);
        }





}
