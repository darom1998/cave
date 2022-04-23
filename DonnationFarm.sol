// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonateFarm{
    // Send Donation to the current contract 
    address public owner ;
    uint256  account;
    constructor(){
        owner = msg.sender;    
    }
    
    function donateEth(uint256 _amount) public {
        require(_amount > 0 ,"check your donation amount");
        account +=  _amount ;
    }
    function getTotalDonation() public view  returns(uint256){
        return account ;
    }
}
