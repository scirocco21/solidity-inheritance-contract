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

    // functions that define contract execution
        // a) set up receiving wallet(s)
    function setup(address _wallet, uint _inheritanceAmount) public isOwner {
        wallets.push(_wallet);
        inheritance[_wallet] = _inheritanceAmount;
    }

        // b) pay all eligible wallets 
    function pay() private isDeceased {
        for (uint index = 0; index < wallets.length; index++) {
            wallets[index].transfer(inheritance[wallets[i]]);
        }
    }

        // c) when owner dies, trigger payout
    function hasDied() public isOwner {
        deceased = true;
        pay();
    }

}