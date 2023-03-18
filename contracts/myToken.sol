// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

contract myToken{
    string public name = "Pelumi's Token";
    string public symbol = "PT";

    uint256 public totalSupply = 4000000;

    address public owner;
    mapping(address => uint256)  balances;
    event Transfer(address indexed _from, address indexed _to, uint256 _value);


    constructor(address newOwner){
        balances[msg.sender] = totalSupply;
        newOwner = msg.sender;
    }
    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");
        require(msg.sender != address(0), "Invalid token address");
        require(to != address(0), "Invalid token address");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);

    }

    function balanceOf(address account) external view returns (uint256){
        return balances[account];
    }

}