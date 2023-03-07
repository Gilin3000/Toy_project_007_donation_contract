pragma solidity ^0.8.0;

contract Fundraising {
  uint256 public targetAmount;
  address public owner;
  mapping(address => uint256) public donations;

  uint256 public raisedAmount = 0;
  uint256 public finishTime = block.timestamp + 1 hours;

  constructor(uint256 _targetAmount) {
    targetAmount = _targetAmount;
    owner = msg.sender;
  }

  receive() external payable {
    require(block.timestamp < finishTime, "This campaign is over");
    donations[msg.sender] += msg.value;
    raisedAmount += msg.value;
  }

  function withDrawDonations() external {
    require(msg.sender == owner, "Funds will only be released to the owner");
    require(raisedAmount >= targetAmount, "The project did not reach the goal");
    require(block.timestamp > finishTime, "This campaign is not over yet");
    payable(owner).transfer(raisedAmount);
  }
  function refund() external {
    require(block.timestamp > finishTime, "This campaign is not over yet");
    require(raisedAmount < targetAmount, "This campaign reached the goal"); 
    require(donations[msg.sender] > 0, "You did not donate this campaign");
    uint256 toRefund = donations[msg.sender];
    donations[msg.sender] = 0;
    payable(msg.sender).transfer(toRefund);
  }
}