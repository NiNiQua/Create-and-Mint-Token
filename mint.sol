// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {
  address public owner;
  uint256 public totalSupply;

  mapping(address => uint256) public balances;

  constructor() {
      owner = msg.sender;
      totalSupply = 0;
  }

  function mint(address _address, uint256 _amount) public {
      require(msg.sender == owner, "Only the owner can mint tokens.");
      require(_address == owner, "Tokens can only be minted to the owner.");
      totalSupply += _amount;
      balances[_address] += _amount;
  }

  function burn(uint256 _amount) public {
      require(balances[msg.sender] >= _amount, "Not enough balance.");
      totalSupply -= _amount;
      balances[msg.sender] -= _amount;
  }

  function transfer(address _to, uint256 _amount) public {
      require(balances[msg.sender] >= _amount, "Not enough balance.");
      balances[msg.sender] -= _amount;
      balances[_to] += _amount;
  }
}
