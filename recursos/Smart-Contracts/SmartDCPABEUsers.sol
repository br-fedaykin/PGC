// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;
import "./Collection.sol";

contract SmartDCPABEUsers is Collection {

    struct User {
        address addr;
        string name;
        string email;
    }

    address[] public userAddresses;
    mapping (address => User) users;
    uint64 public numUsers;

   constructor(address root) Collection(root)  {}

    function setContractDependencies(ContractType contractType, address addr) override public view onlyOwner {}

    function addUser(address addr, string memory name, string memory email) public {
        userAddresses.push(addr);
        numUsers++;
        users[addr] = User(addr, name, email);
    }

    function isUser(address addr) public view returns (bool) {
        return (bytes(users[addr].name)).length > 0;
    }

    function getUser
    (
        address addr
    )
        public
        view
        returns
    (
        address addr_,
        string memory name,
        string memory email
    )
    {
        User storage u = users[addr];
        return (u.addr, u.name, u.email);
    }
}
