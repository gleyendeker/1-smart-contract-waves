// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {

    uint256 totalWaves;


    /*
     * create event to notify the browser when a wave happens
     */
    event NewWave(address indexed from, uint256 timestamp, string message);

    /*
     * wave struct
     */
    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    // declare waves as array o Wave
    Wave[] waves;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave(string memory _message) public {

        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

        // store the wave data in the array.
        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }


    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

}