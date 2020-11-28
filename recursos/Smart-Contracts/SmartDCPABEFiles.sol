// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;
import "./SmartDCPABEUsers.sol";
import "./Collection.sol";

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
            users = SmartDCPABEUsers(addr);
        }
    }

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

    function addRecordingCiphertext
    (
        address addr,
        string memory fileName,
        string memory policy,
        bytes memory c0,
        bytes memory c1,
        bytes memory c2,
        bytes memory c3
    )
        public
        onlyFileOwner(addr)
    {
        ciphertexts[addr][fileName] = Ciphertext(policy, c0, c1, c2, c3);
    }

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

    function getCiphertext
    (
        address addr,
        string memory fileName
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
        Ciphertext memory ct = ciphertexts[addr][fileName];
        return (
            ct.policy,
            ct.c0,
            ct.c1,
            ct.c2,
            ct.c3
        );
    }

    function getServerID(string memory domain) public view returns (int64) {
        for (uint64 i = 0; i < numServers; i++) {
            if (keccak256(bytes(domain)) == keccak256(bytes(servers[i].domain))) {
                return int64(i);
            }
        }
        return -1;
    }

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

    function getFileNameByIndex(address addr, uint64 index) public view returns (string memory) {
        return fileNames[addr][index];
    }

    function getFileCounting(address addr) public view returns (uint256) {
        return fileNames[addr].length;
    }

    modifier onlyFileOwner(address addr) {
        require (msg.sender == addr, "Operation not allowed. User must be the file owner");
        _;
    }

    modifier validUser(address addr) {
        require(users.isUser(addr), "User not registered");
        _;
    }

    modifier validFile(address addr, string memory fileName) {
        require(files[addr][fileName].timestamp != 0, "File does not exist.");
        _;
    }
}
