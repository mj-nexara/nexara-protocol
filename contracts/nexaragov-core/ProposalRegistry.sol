// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProposalRegistry {
    struct Proposal {
        address proposer;
        string title;
        string description;
        bytes executionData;
        bool executed;
    }

    mapping(uint256 => Proposal) public proposals;
    uint256 public proposalCount;

    function registerProposal(
        address proposer,
        string memory title,
        string memory description,
        bytes memory executionData
    ) external returns (uint256) {
        proposalCount++;
        proposals[proposalCount] = Proposal(proposer, title, description, executionData, false);
        return proposalCount;
    }

    function executeProposal(uint256 proposalId) external {
        Proposal storage p = proposals[proposalId];
        require(!p.executed, "Already executed");
        // Execution logic placeholder
        p.executed = true;
    }
}
