// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;

import "./SmartDCPABEUsers.sol";
import "./Collection.sol";

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

    constructor(address root) Collection(root) {}

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

    function incrementPublicKeyCount(address addr) public {
        require(msg.sender == contractKeys, "Operation not allowed.");
        certifiers[addr].numPublicKeys++;
    }

    function isCertifier(address addr) public view returns (bool) {
        return (bytes(certifiers[addr].name)).length > 0;
    }

    function addCertifier(address addr, string memory name, string memory email) public {
        certifierAddresses.push(addr);
        certifiers[addr] = Certifier(addr, name, email, 0);
    }

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
