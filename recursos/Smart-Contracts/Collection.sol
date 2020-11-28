// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;

abstract contract Collection {

    address public owner;
    enum ContractType {AUTHORITY, FILES, KEYS, REQUESTS, USERS, UTILITY }

    constructor (address rootContract) {
        owner = rootContract;
    }

    function setContractDependencies(ContractType contractType, address addr) public virtual;

    function changeOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Operation not allowed. User must be the contract owner");
        _;
    }
}
