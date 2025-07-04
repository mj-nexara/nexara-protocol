// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./RoleRegistry.sol";

/// @title MeritEngine
/// @notice Core merit-based weighting system for NexaraGov decision logic
contract MeritEngine {
    RoleRegistry public roleRegistry;

    mapping(address => uint256) private meritScore;

    event MeritAssigned(address indexed contributor, uint256 score);
    event MeritAdjusted(address indexed contributor, int256 delta);

    modifier onlyMaintainer() {
        require(roleRegistry.hasRole(msg.sender, "Maintainer"), "Access denied: Not a Maintainer");
        _;
    }

    constructor(address _roleRegistry) {
        require(_roleRegistry != address(0), "Invalid RoleRegistry address");
        roleRegistry = RoleRegistry(_roleRegistry);
    }

    /// @notice Assigns a fixed merit score to a contributor
    function assignMerit(address contributor, uint256 score) external onlyMaintainer {
        meritScore[contributor] = score;
        emit MeritAssigned(contributor, score);
    }

    /// @notice Adjusts a contributor's merit score by a delta (positive or negative)
    function adjustMerit(address contributor, int256 delta) external onlyMaintainer {
        if (delta >= 0) {
            meritScore[contributor] += uint256(delta);
        } else {
            uint256 absDelta = uint256(-delta);
            meritScore[contributor] = meritScore[contributor] > absDelta
                ? meritScore[contributor] - absDelta
                : 0;
        }
        emit MeritAdjusted(contributor, delta);
    }

    /// @notice Returns the merit score of a contributor
    function getMerit(address contributor) external view returns (uint256) {
        return meritScore[contributor];
    }
}
