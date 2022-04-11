// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
// Event Modifier  
contract buyMyNFT{
    enum Status {Available , Not_Available}
    Status currentStatus ;
    address payable public owner ;
    constructor() public {
      currentStatus = Status.Available;  
      owner = msg.sender ;
    }
    event paid(address _Buyer , uint _money);
    modifier OnlyAvailable{
        require(currentStatus >= Status.Available);
        _;
    }
    modifier cost(uint _amount){
        require(msg.value == _amount);
        _;
    }

    function buyNFT() external payable OnlyAvailable cost(4 ether) {
        currentStatus = Status.Not_Available ;
        owner.transfer(msg.value);
        emit paid(msg.sender , msg.value);

    }
}
