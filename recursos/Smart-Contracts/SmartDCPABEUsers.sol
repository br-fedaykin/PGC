// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;
import "./Collection.sol";

/**
 * @author Bruno C. P. Arruda
 * @title SmartDCPABE User Management Contract
 * @notice This contract allow to register and find users
 */
contract SmartDCPABEUsers is Collection {

    struct User {
        address addr;
        string name;
        string email;
    }

    address[] public userAddresses;
    mapping(address => User) users;
    uint64 public numUsers;

    /**
     * @notice creates the contract with unset dependencies
     * @param root the address of the Root contract
     */
    constructor(address root) Collection(root)  {}

    /**
     * @inheritdoc Collection
     */
    function setContractDependencies(ContractType contractType, address addr) public view override onlyOwner {}

    /**
     * @notice registers a user
     * @param addr user's address
     * @param name user's name
     * @param email user's e-mail
     */
    function addUser(address addr, string memory name, string memory email) public {
        userAddresses.push(addr);
        numUsers++;
        users[addr] = User(addr, name, email);
    }

    /**
     * @notice checks if the address is registered as a user in this contract
     * @param addr a Ethereum address
     */
    function isUser(address addr) public view returns (bool) {
        return (bytes(users[addr].name)).length > 0;
    }

    /**
     * @notice get user data
     * @param addr the user's address
     * @return addr_ user's address
     * @return name user's name
     * @return email user's e-mail
     */
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
