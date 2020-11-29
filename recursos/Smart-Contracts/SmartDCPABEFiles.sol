// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;
import "./SmartDCPABEUsers.sol";
import "./Collection.sol";

/**
 * @author Bruno C. P. Arruda
 * @title SmartDCPABE File Management Contract
 * @notice This contract allow the management and search of files published by this contract.
 * The contract also registers server hosting those files
 */
contract SmartDCPABEFiles is Collection {

    struct Recording {
        uint64 serverID;
        string uRIPathname;
        bytes32 hashing;
        uint64 timestamp;
    }

    struct Ciphertext {
        string policy;
        bytes c0;
        bytes c1;
        bytes c2;
        bytes c3;
    }

    struct FileServer {
        string domain;
        string path;
        uint16 port;
    }

    uint64 public numServers;
    mapping(address => string[]) fileNames;
    mapping(address => mapping(string => Recording)) files;
    mapping(address => mapping(string => Ciphertext)) ciphertexts;

    FileServer[] servers;
    SmartDCPABEUsers users;

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
            users = SmartDCPABEUsers(addr);
        }
    }

    /**
     * @notice registers a server
     * @param domain server domain
     * @param path path to query for files
     * @param port service port
     */
    function addServer(
        string memory domain,
        string memory path,
        uint16 port
    )
        public
        returns (uint64 serverIndex)
    {
        servers.push(FileServer(domain, path, port));
        serverIndex = numServers;
        numServers++;
    }

    /**
     * @notice registers a file for an user
     * @param addr user's address
     * @param filename file name
     * @param serverID ID of the server hosting the file
     * @param uRIPathname pathname component of a URI to this file
     * @param hashing file hashing
     * @param timestamp publication timestamp
     */
    function addRecording (
        address addr,
        string memory filename,
        uint64 serverID,
        string memory uRIPathname,
        bytes32 hashing,
        uint64 timestamp
    )
        public
        onlyFileOwner(addr)
        validUser(addr)

    {
        if (files[addr][filename].timestamp == 0) {
            fileNames[addr].push(filename);
        }
        files[addr][filename] = Recording(serverID, uRIPathname, hashing, timestamp);
    }

    /**
     * @notice register the ABE ciphertext of a file
     * @param addr user's address
     * @param filename file name
     * @param policy access policy to the file
     * @param c0 a component of the DCPABE ciphertext
     * @param c1 a component of the DCPABE ciphertext
     * @param c2 a component of the DCPABE ciphertext
     * @param c3 a component of the DCPABE ciphertext
     */
    function addRecordingCiphertext
    (
        address addr,
        string memory filename,
        string memory policy,
        bytes memory c0,
        bytes memory c1,
        bytes memory c2,
        bytes memory c3
    )
        public
        onlyFileOwner(addr)
    {
        ciphertexts[addr][filename] = Ciphertext(policy, c0, c1, c2, c3);
    }

    /**
     * @notice deletes a file
     * @param addr user's address
     * @param filename file name
     */
    function deleteFileAndCiphertext
    (
        address addr,
        string memory filename
    )
        public
        onlyFileOwner(addr)
    {
        delete files[addr][filename];
        delete ciphertexts[addr][filename];
    }

    /**
     * get ciphertext data
     * @param addr user's address
     * @param filename file name
     * @return policy access policy to the file
     * @return c0 a component of the DCPABE ciphertext
     * @return c1 a component of the DCPABE ciphertext
     * @return c2 a component of the DCPABE ciphertext
     * @return c3 a component of the DCPABE ciphertext
     */
    function getCiphertext
    (
        address addr,
        string memory filename
    )
        public
        view
        returns
    (
        string memory policy,
        bytes memory c0,
        bytes memory c1,
        bytes memory c2,
        bytes memory c3
    )
    {
        Ciphertext memory ct = ciphertexts[addr][filename];
        return (
            ct.policy,
            ct.c0,
            ct.c1,
            ct.c2,
            ct.c3
        );
    }

    /**
     * @notice get the ID of a server
     * @param domain server domain
     * @return serverID the ID of the server
     */
    function getServerID(string memory domain) public view returns (int64) {
        for (uint64 i = 0; i < numServers; i++) {
            if (keccak256(bytes(domain)) == keccak256(bytes(servers[i].domain))) {
                return int64(i);
            }
        }
        return -1;
    }

    /**
     * @notice get server data
     * @param index the ID of the server
     * @return domain server domain
     * @return path path to query for files
     * @return port service port
     */
    function getServer(
        uint64 index
    )
        public
        view
        returns (string memory domain, string memory path, uint16 port)
    {
        assert(index < numServers);
        FileServer storage s = servers[index];
        return (s.domain, s.path, s.port);
    }

    /**
     * @notice get recording data
     * @param addr user's address
     * @param index file index in the user's recording array
     * @return name the file name
     * @return serverID ID of the server hosting the file
     * @return uRIPathname pathname component of a URI to this file
     * @return hashing
     * @return timestamp publication timestamp
     */
    function getRecording
    (
        address addr,
        uint64 index
    )
        public
        view
        returns
    (
        string memory name,
        uint64 serverID,
        string memory uRIPathname,
        bytes32 hashing,
        uint64 timestamp
    )
    {
        return getRecording(addr, fileNames[addr][index]);
    }

    /**
     * @notice get recording data
     * @param addr user's address
     * @param name file name
     * @return name_ the file name
     * @return serverID ID of the server hosting the file
     * @return uRIPathname pathname component of a URI to this file
     * @return hashing
     * @return timestamp publication timestamp
     */
    function getRecording
    (
        address addr,
        string memory name
    )
        public
        view
        returns
    (
        string memory name_,
        uint64 serverID,
        string memory uRIPathname,
        bytes32 hashing,
        uint64 timestamp
    )
    {
        Recording storage r = files[addr][name];
        return (
            name,
            r.serverID,
            r.uRIPathname,
            r.hashing,
            r.timestamp
        );
    }
    /**
     * @notice get the name of a file by its index in the user's recording array
     * @param addr user's address
     * @param index file index in the user's recording array
     * @return filename
     */
    function getFileNameByIndex(address addr, uint64 index) public view returns (string memory) {
        return fileNames[addr][index];
    }

    /**
     * @notice get file countings
     * @param addr user's address
     * @return num_files the number of files published by the user
     */
    function getFileCounting(address addr) public view returns (uint256) {
        return fileNames[addr].length;
    }

    /**
     * @notice checks if the transaction sender is the owner
     * @param addr user's address
     */
    modifier onlyFileOwner(address addr) {
        require (msg.sender == addr, "Operation not allowed. User must be the file owner");
        _;
    }

    /**
     * @notice checks if the address is registered as an user
     * @param addr user's address
     */
    modifier validUser(address addr) {
        require(users.isUser(addr), "User not registered");
        _;
    }

    /**
     * @notice checks if the file exists
     * @param addr user's address
     * @param filename file name
     */
    modifier validFile(address addr, string memory filename) {
        require(files[addr][filename].timestamp != 0, "File does not exist.");
        _;
    }
}
