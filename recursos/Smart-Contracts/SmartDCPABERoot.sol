// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;

import "./Collection.sol";

/**
 * @author Bruno C. P. Arruda
 * @title Root Administrator Contract
 * @notice This contract manages contract dependencies among the contracts related to
 * the SmartDCPABE project
 * @dev This contract must be published before other contracts, and its address must be passed
 * as argument to other contract constructors
 */
contract SmartDCPABERoot {

    uint8 constant numContracts = 6;
    address[numContracts] public contractAddress;
    Collection.ContractType AUTHORITY = Collection.ContractType.AUTHORITY;
    Collection.ContractType FILES = Collection.ContractType.FILES;
    Collection.ContractType KEYS = Collection.ContractType.KEYS;
    Collection.ContractType REQUESTS = Collection.ContractType.REQUESTS;
    Collection.ContractType USERS = Collection.ContractType.USERS;
    Collection.ContractType UTILITY = Collection.ContractType.UTILITY;
    address owner;

    /**
     * @notice sets the transaction sender's as the owner of this contract
     */
    constructor () {
        owner = msg.sender;
    }

    /**
     * @notice pass the ownership of contracts to a new Root contract
     * @param  newRoot the address of a new SmartDCPABERoot contract
     */
    function changeOwnership(address newRoot) public onlyOwner {
        for (uint8 i = 0; i < numContracts; i++) {
            bytes memory payload = abi.encodeWithSignature("changeOwnership(address)", newRoot);
            (bool success, ) = contractAddress[i].call(payload);
            require(success, "Contract method invocation failed.");
        }
    }

    /**
     * @notice get all contract addresses managed by SmartDCPABERoot
     * @return addresses a list of contract addresses
     */
    function getAllContractAddresses() public view returns (address[numContracts] memory) {
        return contractAddress;
    }

    /**
     * @notice register all contract addresses and inject their dependencies
     * @param contractType a list of values indicating the contract type of the addresses,
     * as defined by the Collection.ContractType Enum
     * @param addr a list of SmartDCPABE contract addresses
     */
    function setAllContracts(
        Collection.ContractType[numContracts] memory contractType,
        address[numContracts] memory addr
    )
        public
        onlyOwner
    {
        for (uint8 i = 0; i < numContracts; i++) {
            require(uint(addr[i]) != uint(0), "Some address is 0x0. Please inform a correct address.");
        }
        for (uint8 i = 0; i < numContracts; i++) {
            if (uint(addr[i]) != 0) {
                setContractAddress(contractType[i], addr[i]);
            }
        }
        for (uint8 i = 0; i < numContracts; i++) {
            if (uint(addr[i]) != 0) {
                supplyContractDependencies(contractType[i]);
            }
        }
    }

    /**
     * @notice register a contract address and set corresponding dependencies
     * @param contractType a value indicating the contract type of the addresses, as defined
     * by the Collection.ContractType Enum
     * @param addr a SmartDCPABE contract address
     */
    function setContract(
        Collection.ContractType contractType,
        address addr
    )
        public
        onlyOwner
        validIndex(contractType)
    {
        setContractAddress(contractType, addr);
        supplyContractDependencies(contractType);
        receiveContractDependencies(contractType);
    }

    /**
     * @notice register a contract address
     * @param contractType a value indicating the contract type of the addresses, as defined
     * by the Collection.ContractType Enum
     * @param addr a SmartDCPABE contract address
     */
    function setContractAddress(Collection.ContractType contractType, address addr) private {
        uint8 index = uint8(contractType);
        if (contractType == AUTHORITY) {
            contractAddress[index] = addr;
        } else if (contractType == FILES) {
            contractAddress[index] = addr;
        } else if (contractType == KEYS) {
            contractAddress[index] = addr;
        } else if (contractType == REQUESTS) {
            contractAddress[index] = addr;
        }else if (contractType == USERS) {
            contractAddress[index] = addr;
        } else if (contractType == UTILITY) {
            contractAddress[index] = addr;
        }
    }

    /**
     * @notice update all dependencies of a contract, used when there is a new
     * contract to replace an existing one and it has dependencies
     * @param contractType a value indicating the contract type, as defined
     * by the Collection.ContractType Enum
     */
    function receiveContractDependencies(Collection.ContractType contractType) private {
        if (contractType == UTILITY || contractType == USERS) {
            return;
        }
        Collection.ContractType[numContracts] memory dependencies;
        uint8 numDependencies = 0;
        if (contractType == AUTHORITY) {
            dependencies[0] = KEYS;
            dependencies[1] = USERS;
            numDependencies = 2;
        } else if (contractType == FILES) {
            dependencies[0] = USERS;
            numDependencies = 1;
        } else if (contractType == KEYS) {
            dependencies[0] = UTILITY;
            dependencies[1] = AUTHORITY;
            numDependencies = 2;
        } else if (contractType == REQUESTS) {
            dependencies[0] = USERS;
            dependencies[1] = AUTHORITY;
            numDependencies = 2;
        }

        uint8 index = uint8(contractType);
        for (uint8 i = 0; i < numDependencies; i++) {
            uint8 dependentContract = uint8(dependencies[i]);
            bytes memory payload = abi.encodeWithSignature(
                "setContractDependencies(uint8,address)",
                dependentContract,
                contractAddress[dependentContract]
            );
            (bool success, ) = contractAddress[index].call(payload);
            require(success, "Contract method invocation failed.");
        }
    }

    /**
     * @notice injects a contract address in all contracts that depends on it,
     * used when there is a new contract deploy to replace existing one
     * @param contractType a value indicating the contract type, as defined
     * by the Collection.ContractType Enum
     */
    function supplyContractDependencies(Collection.ContractType contractType) private {
        if (contractType == FILES || contractType == REQUESTS) {
            return;
        }
        Collection.ContractType[numContracts] memory dependencies;
        uint8 numDependencies = 0;
        if (contractType == AUTHORITY) {
            dependencies[0] = KEYS;
            dependencies[1] = REQUESTS;
            numDependencies = 2;
        } else if (contractType == KEYS) {
            dependencies[0] = AUTHORITY;
            numDependencies = 1;
        } else if (contractType == USERS) {
            dependencies[0] = AUTHORITY;
            dependencies[1] = FILES;
            dependencies[2] = REQUESTS;
            numDependencies = 3;
        } else if (contractType == UTILITY) {
            dependencies[0] = KEYS;
            numDependencies = 1;
        }

        uint8 index = uint8(contractType);
        for (uint8 i = 0; i < numDependencies; i++) {
            uint8 dependentContract = uint8(dependencies[i]);
            bytes memory payload = abi.encodeWithSignature(
                "setContractDependencies(uint8,address)",
                index,
                contractAddress[index]
            );
            (bool success, ) = contractAddress[dependentContract].call(payload);
            require(success, "Contract method invocation failed.");
        }
    }

    /**
     * @notice checks if the transaction sender is the owner
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Operation not allowed.");
        _;
    }

     /**
     * @notice checks wether passed value is defined in ContractType Enum
     */
    modifier validIndex(Collection.ContractType contractType) {
        require(uint8(contractType) < numContracts, "target contract type aren't implemented yet.");
        _;
    }
}
