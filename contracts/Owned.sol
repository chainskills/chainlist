pragma solidity ^0.4.11;

contract Owned {
  // State variable
  address owner;

  // Modifiers
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  // constructor
  function Owned() {
    owner = msg.sender;
  }
}
