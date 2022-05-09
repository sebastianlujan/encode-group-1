//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Ownable {
    address internal owner;

    constructor() {
        owner = msg.sender;
        console.log("Deploying Ownable");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }
}

contract Mortal is Ownable {
    //kill the contract
    function kill() public onlyOwner {
        selfdestruct(payable(msg.sender));
    }
}

contract Estate is Mortal {
    
    address beneficiary;
    modifier onlyBeneficiary() {
        require(msg.sender == beneficiary, "Only beneficiary can perform this action");
        _;
    }

    uint256 public endOfLife;
    uint256 waitingPeriodLength;
    modifier heartbeat {
        _;
        endOfLife = 10 ** 18;
    }

    constructor(address _beneficiary, uint256 _waitingPeriodLength) {
        beneficiary = _beneficiary;
        waitingPeriodLength = _waitingPeriodLength;
    } 

    //cashback
    function depositarTeca() public payable onlyOwner heartbeat { }

    function retirarLaTeca(uint amount) public payable onlyOwner heartbeat {
        payable(owner).transfer(amount);
    }

    event EstasVivoPibe(uint indexed endOfWaitingPeriod);

    function assertDead() public onlyBeneficiary {
        endOfLife = block.timestamp + waitingPeriodLength;
        emit EstasVivoPibe(block.timestamp);
    }

    function heredarLaTeca( address newBeneficiary ) public onlyBeneficiary heartbeat {
        require( block.timestamp >= endOfLife, "Cagaste , te re moriste man" );
        owner = beneficiary;
        beneficiary = newBeneficiary;
    }
}