// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TreasuryPolicy
/// @notice Defines approved purposes for fund release
contract TreasuryPolicy {
    mapping(string => bool) public approvedPurposes;

    constructor() {
        approvedPurposes["Development"] = true;
        approvedPurposes["Audit"] = true;
        approvedPurposes["CommunityGrant"] = true;
        approvedPurposes["EmergencyRelief"] = true;
    }

    function isApprovedPurpose(string memory purpose) external view returns (bool) {
        return approvedPurposes[purpose];
    }

    function addPurpose(string memory purpose) external {
        // In production, restrict this to governance
        approvedPurposes[purpose] = true;
    }
}
