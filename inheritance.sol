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

    address[] wallets;
    mapping (address => uint) inheritance;
}