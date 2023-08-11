// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/**
* @title Escrow
* @dev Implements escrow for secure transactions between buyer, seller, and arbiter
* @custom:dev-run-script scripts/deploy_with_ethers.ts
*/
contract Escrow {
    // Declaring the state variables
    address payable public buyer;
    address payable public seller;
    address payable public arbiter;
    uint public price;
    mapping(address => uint) public totalAmount;
    // Defining a enumerator 'State'
    enum State {
        // Following are the data members
        await_payment, await_delivery, complete
    }
    // Declaring the object of the enumerator
    State public state;

    constructor(address payable _buyer, address payable _seller, uint _price) {
        // Assigning the values of the 
        // state variables
        arbiter = payable(msg.sender);
        buyer = _buyer;
        seller = _seller;
        price = _price;
        state = State.await_payment;
    }
    // Defining function modifier 'instate'
    modifier instate(State expected_state) {
        require(state == expected_state);
        _;
    }
    // Defining function modifier 'onlyBuyer'
    modifier onlyBuyer() {
        require(msg.sender == buyer ||
                msg.sender == arbiter);
        _;
    }
    // Defining function modifier 'onlySeller'
    modifier onlySeller() {
        require(msg.sender == seller);
        _;
    }

    function sendPayment() onlyBuyer instate(State.await_payment) public payable {
        require(msg.value > 0 &&
                totalAmount[msg.sender] + msg.value <= price);
        totalAmount[msg.sender] += msg.value;
    }

    function confirmPayment() onlyBuyer instate(State.await_payment) public payable {
        require(totalAmount[msg.sender] == price);
        state = State.await_delivery;
    }
    function confirmDelivery() onlyBuyer instate(State.await_delivery) public {
        seller.transfer(address(this).balance);
        state = State.complete;
    }
    function returnPayment() onlySeller instate(State.await_delivery) public {
        buyer.transfer(address(this).balance);
    }
}