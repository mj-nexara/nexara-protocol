// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./GenesisMetadata.sol";

/// @title NXNGenesis
/// @notice Immutable record of the symbolic and technical origin of NXN Coin
contract NXNGenesis {
    address public immutable genesisArchitect;
    uint256 public immutable genesisTimestamp;
    string public immutable genesisHash;
    GenesisMetadata public metadata;

    event GenesisCommitted(address indexed architect, uint256 timestamp, string hash);

    constructor(string memory _genesisHash, address _metadata) {
        genesisArchitect = msg.sender;
        genesisTimestamp = block.timestamp;
        genesisHash = _genesisHash;
        metadata = GenesisMetadata(_metadata);

        emit GenesisCommitted(msg.sender, block.timestamp, _genesisHash);
    }

    function getGenesisSymbol() external view returns (string memory) {
        return metadata.symbolicPhrase();
    }

    function getGenesisDate() external view returns (string memory) {
        return metadata.genesisDate();
    }
}
