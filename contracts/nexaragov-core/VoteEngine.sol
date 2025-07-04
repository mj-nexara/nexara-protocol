// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../merit-engine/IMeritEngine.sol";

contract VoteEngine {
    IMeritEngine public meritEngine;

    struct Vote {
        uint256 yesWeight;
        uint256 noWeight;
        mapping(address => bool) hasVoted;
    }

    mapping(uint256 => Vote) public votes;

    constructor(address _meritEngine) {
        meritEngine = IMeritEngine(_meritEngine);
    }

    function castVote(address voter, uint256 proposalId, bool support) external {
        Vote storage v = votes[proposalId];
        require(!v.hasVoted[voter], "Already voted");

        uint256 weight = meritEngine.getMerit(voter);
        require(weight > 0, "No merit");

        if (support) {
            v.yesWeight += weight;
        } else {
            v.noWeight += weight;
        }

        v.hasVoted[voter] = true;
    }

    function isApproved(uint256 proposalId) external view returns (bool) {
        Vote storage v = votes[proposalId];
        return v.yesWeight > v.noWeight;
    }
}
