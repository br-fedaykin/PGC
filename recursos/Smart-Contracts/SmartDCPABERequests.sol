// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;

import "./SmartDCPABEAuthority.sol";
import "./SmartDCPABEUsers.sol";
import "./Collection.sol";

/**
 * @author Bruno C. P. Arruda
 * @title SmartDCPABE Attribute Request Contract
 * @notice This contract allow the management and search of attribute requests made by users
 */
contract SmartDCPABERequests is Collection {

    enum KeyRequestStatus {
        PENDING,
        OK,
        REJECTED
    }

    struct KeyRequest {
        KeyRequestStatus status;
        uint64 timestamp;
        uint64 responseTimestamp;
        string attrNames;
    }

    event pendingRequestIndexChanged (
        uint64 oldIndex,
        uint64 newIndex
    );

    event pendingRequesterIndexChanged (
        uint64 oldIndex,
        uint64 newIndex
    );

    mapping(address => address[]) pendingRequesters;
    mapping(address => mapping(address => uint64[])) pendingRequests;
    mapping(address => mapping(address => KeyRequest[])) requests;
    SmartDCPABEUsers user;
    SmartDCPABEAuthority authority;

    /**
     * @notice creates the contract with unset dependencies
     * @param root the address of the Root contract
     */
    constructor(address root) Collection(root) {}

    /**
     * @inheritdoc Collection
     */
    function setContractDependencies(
        Collection.ContractType contractType,
        address addr
    )
        public
        override
        onlyOwner
    {
        if (contractType == ContractType.AUTHORITY) {
            authority = SmartDCPABEAuthority(addr);
        } else if (contractType == ContractType.USERS) {
            user = SmartDCPABEUsers(addr);
        }
    }

    /**
     * @notice registers a user request for attributes
     * @param certifier certifier's address
     * @param requester requester's address
     * @param timestamp timestamp of the request
     * @param attrNames an array with names of attributes published by the certifier
     */
    function addRequest(
        address certifier,
        address requester,
        uint64 timestamp,
        string memory attrNames
    )
        public
    {
        assert(user.isUser(requester));
        assert(authority.isCertifier(certifier));
        uint64 pendingIndex = uint64(requests[certifier][requester].length);
        requests[certifier][requester].push(
            KeyRequest(KeyRequestStatus.PENDING, timestamp, 0, attrNames)
        );
        pendingRequests[certifier][requester].push(pendingIndex);
        pendingRequesters[certifier].push(requester);
    }
    /**
     * @notice process a request by removing it from the list of pending requests
     * and changing its status
     * @param certifier certifier's address
     * @param requesterIndex index of the user in the requester array
     * @param pendingIndex index of the request in the pending request array
     * @param newStatus the new, final state of the request
     */
    function processRequest(
        address certifier,
        uint64 requesterIndex,
        uint64 pendingIndex,
        KeyRequestStatus newStatus
    )
        public
    {
        address requester = pendingRequesters[certifier][requesterIndex];
        uint64 listSize = uint64(pendingRequests[certifier][requester].length);
        require(listSize >= 1, "No pending requests for this certifier.");
        uint64 index = pendingRequests[certifier][requester][pendingIndex];
        requests[certifier][requester][index].status = newStatus;
        if (listSize == 1) {
            pendingRequests[certifier][requester].pop();
            address lastRequester = pendingRequesters[certifier][pendingRequesters[certifier].length - 1];
            pendingRequesters[certifier].pop();
            if (requesterIndex != pendingRequesters[certifier].length) {
                pendingRequesters[certifier][requesterIndex] = lastRequester;
                emit pendingRequesterIndexChanged(
                    uint64(pendingRequesters[certifier].length),
                    requesterIndex
                );
            }
        } else {
            uint64 lastIndex = pendingRequests[certifier][requester][listSize - 1];
            pendingRequests[certifier][requester].pop();
            if (pendingIndex != listSize - 1) {
                pendingRequests[certifier][requester][pendingIndex] = lastIndex;
                emit pendingRequestIndexChanged(listSize - 1, pendingIndex);
            }
        }
    }

    /**
     * @notice get the number of requests made by an user to a certifier
     * @param certifier certifier's address
     * @param requester user's address
     * @return num_requests the number of the requests
     */
    function getRequestListSize(
        address certifier,
        address requester
    )
        public
        view
        returns (uint256)
    {
        return requests[certifier][requester].length;
    }

    /**
     * @notice get the indexes of requests made by an user to a certifier with
     * current "pending" status
     * @param certifier certifier's address
     * @param requester user's address
     * @return indexes a list of indexes of requests stored in the request array
     */
    function getPendingList(
        address certifier,
        address requester
    )
        public
        view
        returns (uint64[] memory)
    {
        return pendingRequests[certifier][requester];
    }

    /**
     * @notice get the number of different users with pending requests to a certifier
     * @param certifier certifier's address
     * @return num_requesters the number of users with pending requests
     */
    function getPendingRequesterListSize(address certifier) public view returns (uint256) {
        return pendingRequesters[certifier].length;
    }

    /**
     * @notice get the address of an user with pending requests
     * @param certifier certifier's address
     * @param requesterIndex index of the user in the requester array
     * @return addr the user's address
     */
    function getPendingRequesterAddress(
        address certifier,
        uint64 requesterIndex
    )
        public
        view
        returns (address)
    {
        return pendingRequesters[certifier][requesterIndex];
    }

    /**
     * @notice get the status of a request
     * @param certifier certifier's address
     * @param requester user's address
     * @param index the index of the request in the list of requests made by an
     * user to a certifier
     * @return status a value indicating the request status, defined in the
     * KeyRequestStatus Enum
     */
    function getRequestStatus(
        address certifier,
        address requester,
        uint64 index
    )
        public
        view
        returns (KeyRequestStatus status)
    {
        return requests[certifier][requester][index].status;
    }

    /**
     * @notice get request data
     * @param certifier certifier's address
     * @param requester user's address
     * @param index the index of the request in the list of requests made by an
     * user to a certifier
     * @return status a value indicating the request status, defined in the
     * KeyRequestStatus Enum
     * @return index the index of the request in the list of requests made by an
     * user to a certifier
     * @return timestamp publication timestamp
     * @return responseTimestamp certifier processing timestamp. In case the request is pending,
     * responseTimestamp = 0.
     * @return attrNames an array with names of attributes published by the certifier
     */
    function getRequest
    (
        address certifier,
        address requester,
        uint64 index
    )
        public
        view
        returns
    (
        KeyRequestStatus status,
        uint64,
        uint64 timestamp,
        uint64 responseTimestamp,
        string memory attrNames
    )
    {
        KeyRequest memory kr = requests[certifier][requester][index];
        return (
            kr.status,
            index,
            kr.timestamp,
            kr.responseTimestamp,
            kr.attrNames
        );
    }
}
