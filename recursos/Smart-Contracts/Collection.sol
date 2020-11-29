// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;


/**
 * @author Bruno C. P. Arruda
 * @title Collection Contract
 * @notice This contract defines functions and structures necessary to allow
 * dynamic management of dependencies
 */
abstract contract Collection {

    address public owner;

    /**
     * @notice Enum to represent the contracts in SmartDCPABE project
     */
    enum ContractType {AUTHORITY, FILES, KEYS, REQUESTS, USERS, UTILITY }

    /**
     * @notice creates a new SmartDCPABE contract with unset dependencies
     * @param rootContract the address of the Root contract
     */
    constructor (address rootContract) {
        owner = rootContract;
    }

    /**
     * @notice set a dependency of a contract
     * @param contractType value indicating the contract type, as defined
     * by to Collection.ContractType Enum
     * @param addr a SmartDCPABE contract address
     */
    function setContractDependencies(ContractType contractType, address addr) public virtual;

    /**
     * @notice changes the ownership of the contract
     * @param  newOwner the address of a new SmartDCPABERoot contract
     */
    function changeOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    /**
     * @notice checks if the transaction sender is the owner
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Operation not allowed. User must be the contract owner");
        _;
    }
}
