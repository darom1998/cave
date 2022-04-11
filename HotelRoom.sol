// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract HotelRoom{
    enum Statues {VACANT , OCCUPIED}
    Statues CurrentStatus ;
    event Occupied(address _ocupiant,uint _value);


    address payable public owner ;
    constructor() public{
        CurrentStatus = Statues.VACANT ;
        owner = msg.sender ;
    }
    modifier onlyWhileVACANT {
        require(CurrentStatus == Statues.VACANT,"currently occupied");
        _;
    }
    modifier costs(uint _amount){
        require(msg.value >= _amount,"more ether needed");
        _;
    }

    receive() external payable onlyWhileVACANT costs(2 ether)  {
        // check price and status
        CurrentStatus = Statues.OCCUPIED;
        owner.transfer(msg.value);
        emit Occupied(msg.sender , msg.value);
    }

}
