pragma solidity >=0.4.20;

contract Inheritance {
    address owner;
    bool deceased;
    uint money;

    constructor() public payable {
        owner = msg.sender;
        money = msg.value;
        deceased = false;
    }

    // check that conditions are met before contract is executed
        // a) only run contract if there is an owner equal to owner of contract instance
    modifier isOwner {
        require (msg.sender == owner);
        _;
    }
        // b) only run contract if contract owner is dead
    modifier isDeceased {
        require(deceased == true);
        _;
    }

    address[] wallets;
    mapping (address => uint) inheritance;
}