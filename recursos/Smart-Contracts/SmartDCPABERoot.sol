// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;

import "./Collection.sol";

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

    constructor () {
        owner = msg.sender;
    }

    function changeOwnership(address newRoot) public onlyOwner{
        for (uint8 i = 0; i < numContracts; i++) {
            bytes memory payload = abi.encodeWithSignature("changeOwnership(address)", newRoot);
            (bool success, ) = contractAddress[i].call(payload);

            // NOTE: this could lead to consistency problems if a failed require() breaks the loop and ownership is not restored.
            require(success, "Contract method invocation failed.");
        }
    }

    function setAllContracts(Collection.ContractType[numContracts] memory contractType, address[numContracts] memory addr) public onlyOwner {
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

    function setContract(Collection.ContractType contractType, address addr) public onlyOwner validIndex(contractType) {
        setContractAddress(contractType, addr);
        supplyContractDependencies(contractType);
        receiveContractDependencies(contractType);
    }

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
            bytes memory payload = abi.encodeWithSignature("setContractDependencies(uint8,address)", dependentContract, contractAddress[dependentContract]);
            (bool success, ) = contractAddress[index].call(payload);
            require(success, "Contract method invocation failed.");
        }
    }

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
            bytes memory payload = abi.encodeWithSignature("setContractDependencies(uint8,address)", index, contractAddress[index]);
            (bool success, ) = contractAddress[dependentContract].call(payload);
            require(success, "Contract method invocation failed.");
        }
    }

    function getAllContractAddresses() public view returns (address[numContracts] memory) {
        return contractAddress;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Operation not allowed.");
        _;
    }

    modifier validIndex(Collection.ContractType contractType) {
        require(uint8(contractType) < numContracts, "targered contract type aren't implemented yet.");
        _;
    }
}
