// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.4.22 <0.7.0;

import "./SafeMath.sol";

contract Tokens {
    uint256 public tokenPrice;
    uint256 private tokenCount;
    address public owner;
    
    mapping (address => uint256) tokenBalance;
    
    event Purchase(address buyer, uint256 amount);
    event Transfer(address sender, address receiver, uint256 amount);
    event Sell(address seller, uint256 amount);
    event Price(uint256 price);
    event LogDepositReceived(address sender);
    
    using SafeMath for uint256;
    
    constructor(uint256 price) public {
        owner = msg.sender;
        tokenPrice = price;
    }
    
    receive() external payable {
        require(msg.data.length == 0);
        emit LogDepositReceived(msg.sender);
    }
    
    function buyToken(uint256 amount) external payable returns (bool) {
        require(msg.value >= amount.mul(tokenPrice));
        tokenBalance[msg.sender] = tokenBalance[msg.sender].add(amount);
        tokenCount = tokenCount.add(amount);
        emit Purchase(msg.sender, amount);
        
        return true;
    }
    
    function transfer(address recipient, uint256 amount) external returns (bool) {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(amount);
        tokenBalance[recipient] = tokenBalance[recipient].add(amount);
        emit Transfer(msg.sender, recipient, amount);
        
        return true;
    }
    
    function sellToken(uint256 amount) external returns (bool) {
        uint256 payment = amount.mul(tokenPrice);
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(amount);
        msg.sender.transfer(payment);
        tokenCount = tokenCount.sub(amount);
        emit Sell(msg.sender, amount);
        
        return true;
    }
    
    function changePrice(uint256 price) external returns (bool) {
        require(msg.sender == owner);
        tokenPrice = price;
        require(address(this).balance >= tokenCount.mul(tokenPrice));
        emit Price(price);
        
        return true;
    }
    
    function getBalance() external view returns (uint256) {
        return tokenBalance[msg.sender];
    }
    
}