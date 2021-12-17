// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
pragma abicoder v2;

import "hardhat/console.sol";

contract WavePortal {
  uint256 public totalWaves;
  struct partner {
    string name;
    string message;
    uint256 waveNumber;
  }
  partner[] public partnerList;

  constructor(){
    console.log("Smart contracts for babies");
  }

  function wave(string memory name,string memory message,uint256 waveNumber) public{
    if(partnerList.length > 0){
      for(uint i =0; i< partnerList.length; i++){
        if(keccak256(abi.encode(partnerList[i].name)) == keccak256(abi.encode(name))){
          partnerList[i].waveNumber += waveNumber;
        }else{
          partnerList.push(partner(name,message,waveNumber));
        }
      }
    }else{
      partnerList.push(partner(name,message,waveNumber));
    }
    
    totalWaves += waveNumber;
    console.log("%s has waved!", msg.sender);
    console.log("Name: %s", name);
    console.log("Message: %s", message);
    console.log("Wave Number: %s", waveNumber);
  }

  function getTotalWaves() public view returns (uint256){
    console.log("We have %d total waves!", totalWaves);
    return totalWaves;
  }

  function getPartnerList() public view returns (partner[] memory){
    return partnerList;
  }
}