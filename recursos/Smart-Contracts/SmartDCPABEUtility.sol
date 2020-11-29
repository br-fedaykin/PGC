// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 <= 0.7.5;

import "./Collection.sol";

/**
 * @author Bruno C. P. Arruda
 * @title SmartDCPABE Utility Contract
 * @notice This contract acts as a Library, providing common, utility functions
 */
contract SmartDCPABEUtility is Collection {

    /**
     * @notice creates the contract with unset dependencies
     * @param root the address of the Root contract
     */
    constructor(address root) Collection(root) {}

    /**
     * @inheritdoc Collection
     */
    function setContractDependencies(ContractType contractType, address addr) public view override onlyOwner {}

    /**
     * @notice convert a string to a single word of 32 bytes.
     * Text must be at most 32 bytes of length
     * @param source the string to convert
     * @return result a bytes32 representation of the string
     */
    function stringToBytes32(string memory source) public pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        assert(tempEmptyStringTest.length <= 32);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
            result := mload(add(source, 0x20))
        }
    }

    /**
     * @notice convert a word of 32 bytes into a string.
     * @param source the bytes32 value to convert
     * @return value a string representation of the bytes32 array
     */
    function bytes32ToString(bytes32 source) public pure returns (string memory value) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(source) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (uint j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        value = string(bytesStringTrimmed);
    }

    /**
     * @notice removes trailing 0x00 in a bytes31 source and outputs the result as bytes
     * @param source a bytes31 value
     * @param size the offset of the data within the bytes31 value
     * @return output the result of the conversion
     */
    function trimBytes31(bytes31 source, uint8 size) public pure returns (bytes memory output) {
        output = new bytes(size);
        bytes32 source32 = bytes32(source);
        for (uint j = 0; j < size; j++) {
            byte char = byte(bytes32(uint(source32) * 2 ** (8 * j)));
            output[j] = char;
        }
        return output;
    }
}
