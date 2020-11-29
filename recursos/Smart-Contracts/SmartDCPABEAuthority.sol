// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;

import "./SmartDCPABEUsers.sol";
import "./Collection.sol";

/**
 * @author Bruno C. P. Arruda
 * @title SmartDCPABE Certifier Management Contract
 * @notice This contract allow to register and find certifiers
 */
contract SmartDCPABEAuthority is Collection {

    struct Certifier {
        address addr;
        string name;
        string email;
        uint64 numPublicKeys;
    }

    address[] public certifierAddresses;
    mapping(address => Certifier) certifiers;
    SmartDCPABEUsers user;
    address contractKeys;

    /**
     * @notice creates the contract with unset dependencies
     * @param root the address of the Root contract
     */
    constructor(address root) Collection(root) {}

    /**
     * @inheritdoc Collection
     */
    function setContractDependencies(
        ContractType contractType,
        address addr
    )
        public
        override
        onlyOwner
    {
        if (contractType == ContractType.USERS) {
            user = SmartDCPABEUsers(addr);
        } else if (contractType == ContractType.KEYS) {
            contractKeys = addr;
        }
    }

    /**
     * @notice increments public key counting of a certifier
     * @param addr the certifier's address
     */
    function incrementPublicKeyCount(address addr) public {
        require(msg.sender == contractKeys, "Operation not allowed.");
        certifiers[addr].numPublicKeys++;
    }

    /**
     * @notice checks if the address is registered as a Certifier in this contract
     * @param addr a Ethereum address
     */
    function isCertifier(address addr) public view returns (bool) {
        return (bytes(certifiers[addr].name)).length > 0;
    }

    /**
     * @notice registers a certifier
     * @param addr certfier's address
     * @param name certifier's name
     * @param email certifier's e-mail
     */
    function addCertifier(address addr, string memory name, string memory email) public {
        certifierAddresses.push(addr);
        certifiers[addr] = Certifier(addr, name, email, 0);
    }

    /**
     * @notice get certifier data
     * @param addr the certifier's address
     * @return addr_ certifier's address
     * @return name certifier's name
     * @return email certifier's e-mail
     * @return numPublicKeys number of attributes published by the certifier
     */
    function getCertifier
    (
        address addr
    )
        public
        view
        returns
    (
        address addr_,
        string memory name,
        string memory email,
        uint64 numPublicKeys
    )
    {
        Certifier storage c = certifiers[addr];
        return (c.addr, c.name, c.email, c.numPublicKeys);
    }
}
