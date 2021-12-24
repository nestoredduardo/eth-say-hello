// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
pragma abicoder v2;

import "hardhat/console.sol";

contract WavePortal {
  uint256 public totalWaves;

  event NewWave(address indexed from, uint256 timestamp, string name, string message);

  struct partner {
    address waver;
    string name;
    string message;
    uint256 timestamp;
  }
  partner[] public partnerList;

  constructor() payable{
    console.log("Smart contracts for babies");
  }

  function wave(string memory name,string memory message) public{
    totalWaves += 1;
    console.log("%s waved w/ message %s", msg.sender, message);

    partnerList.push(partner(msg.sender, name, message, block.timestamp));

    emit NewWave(msg.sender, block.timestamp, name, message);

    uint256 prizeAmount = 0.0001 ether;
    require(
      prizeAmount <= address(this).balance,
      "Trying to withdraw more money than the contract has."
    );
    (bool success, ) = (msg.sender).call{value: prizeAmount}("");
    require(success, 'Failed to withdraw money from contract');
  }

  function getTotalWaves() public view returns (uint256){
    console.log("We have %d total waves!", totalWaves);
    return totalWaves;
  }

  function getPartnerList() public view returns (partner[] memory){
    return partnerList;
  }
}