// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;

import "./SmartDCPABEAuthority.sol";
import "./SmartDCPABEUsers.sol";
import "./Collection.sol";

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

    mapping (address => address[]) pendingRequesters;
    mapping (address => mapping (address => uint64[])) pendingRequests;
    mapping (address => mapping (address => KeyRequest[])) requests;
    SmartDCPABEUsers user;
    SmartDCPABEAuthority authority;

    constructor(address root) Collection(root) {}

    function setContractDependencies(Collection.ContractType contractType, address addr) override public onlyOwner {
        if (contractType == ContractType.AUTHORITY) {
            authority = SmartDCPABEAuthority(addr);
        } else if (contractType == ContractType.USERS) {
            user = SmartDCPABEUsers(addr);
        }
    }

    function addRequest(address certifier, address requester, uint64 timestamp, string memory attrNames) public {
        assert(user.isUser(requester));
        assert(authority.isCertifier(certifier));
        uint64 pendingIndex = uint64(requests[certifier][requester].length);
        requests[certifier][requester].push(KeyRequest(KeyRequestStatus.PENDING, timestamp, 0, attrNames));
        pendingRequests[certifier][requester].push(pendingIndex);
        pendingRequesters[certifier].push(requester);
    }

    function processRequest(address certifier, uint64 requesterIndex, uint64 pendingIndex, KeyRequestStatus newStatus) public {
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
                emit pendingRequesterIndexChanged(uint64(pendingRequesters[certifier].length), requesterIndex);
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

    function getRequestListSize(address certifier, address requester) public view returns (uint256) {
        return requests[certifier][requester].length;
    }

    function getPendingList(address certifier, address requester) public view returns (uint64[] memory) {
        return pendingRequests[certifier][requester];
    }

    function getPendingRequesterListSize(address certifier) public view returns (uint256) {
        return pendingRequesters[certifier].length;
    }

    function getPendingRequesterAddress(address certifier, uint64 requesterIndex) public view returns (address) {
        return pendingRequesters[certifier][requesterIndex];
    }

    function getRequestStatus(address certifier, address requester, uint64 index) public view returns (KeyRequestStatus status) {
        return requests[certifier][requester][index].status;
    }

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
