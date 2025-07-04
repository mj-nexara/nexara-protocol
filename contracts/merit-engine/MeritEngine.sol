// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./RoleRegistry.sol";

contract MeritEngine {
    RoleRegistry public roleRegistry;

    mapping(address => uint256) public meritScore;

    event MeritAssigned(address indexed contributor, uint256 score);
    event MeritAdjusted(address indexed contributor, int256 delta);

    constructor(address _roleRegistry) {
        roleRegistry = RoleRegistry(_roleRegistry);
    }

    function assignMerit(address contributor, uint256 score) external {
        require(roleRegistry.hasRole(msg.sender, "Maintainer"), "Not authorized");
        meritScore[contributor] = score;
        emit MeritAssigned(contributor, score);
    }

    function adjustMerit(address contributor, int256 delta) external {
        require(roleRegistry.hasRole(msg.sender, "Maintainer"), "Not authorized");
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

    function getMerit(address contributor) external view returns (uint256) {
        return meritScore[contributor];
    }
}
