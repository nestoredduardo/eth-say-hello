// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
  uint256 totalWaves;
  //TODO: partnerList partner[]
  //TODO: partner {name,message,waveNumber}
  //TODO: name string
  //TODO: message string
  //TODO: waveNumber number

  constructor(){
    console.log("Smart contracts for babies");
  }

  function wave() public{
    totalWaves += 1;
    console.log("%s has waved!", msg.sender);
  }

  function getTotalWaves() public view returns (uint256){
    console.log("We have %d total waves!", totalWaves);
    return totalWaves;
  }
}