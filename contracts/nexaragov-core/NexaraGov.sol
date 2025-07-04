// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ProposalRegistry.sol";
import "./VoteEngine.sol";
import "../merit-engine/IMeritEngine.sol";
import "../RoleRegistry.sol";

/// @title NexaraGov
/// @notice Core governance contract for Nexara Protocol
contract NexaraGov {
    RoleRegistry public roleRegistry;
    IMeritEngine public meritEngine;
    ProposalRegistry public proposalRegistry;
    VoteEngine public voteEngine;

    event ProposalSubmitted(uint256 indexed proposalId, address indexed proposer);
    event ProposalExecuted(uint256 indexed proposalId);

    modifier onlyProposer() {
        require(roleRegistry.hasRole(msg.sender, "Contributor"), "Not authorized to propose");
        _;
    }

    constructor(
        address _roleRegistry,
        address _meritEngine,
        address _proposalRegistry,
        address _voteEngine
    ) {
        roleRegistry = RoleRegistry(_roleRegistry);
        meritEngine = IMeritEngine(_meritEngine);
        proposalRegistry = ProposalRegistry(_proposalRegistry);
        voteEngine = VoteEngine(_voteEngine);
    }

    function submitProposal(string memory title, string memory description, bytes memory executionData)
        external
        onlyProposer
        returns (uint256)
    {
        uint256 proposalId = proposalRegistry.registerProposal(msg.sender, title, description, executionData);
        emit ProposalSubmitted(proposalId, msg.sender);
        return proposalId;
    }

    function vote(uint256 proposalId, bool support) external {
        voteEngine.castVote(msg.sender, proposalId, support);
    }

    function executeProposal(uint256 proposalId) external {
        require(voteEngine.isApproved(proposalId), "Proposal not approved");
        proposalRegistry.executeProposal(proposalId);
        emit ProposalExecuted(proposalId);
    }
}
