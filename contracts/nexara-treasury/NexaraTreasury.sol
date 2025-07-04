// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./TreasuryPolicy.sol";
import "../RoleRegistry.sol";

/// @title NexaraTreasury
/// @notice Ethical fund management and distribution system for Nexara
contract NexaraTreasury {
    address public immutable nxnToken;
    RoleRegistry public roleRegistry;
    TreasuryPolicy public policy;

    event FundsReleased(address indexed recipient, uint256 amount, string purpose);

    modifier onlyTreasurer() {
        require(roleRegistry.hasRole(msg.sender, "Treasurer"), "Access denied: Not Treasurer");
        _;
    }

    constructor(address _nxnToken, address _roleRegistry, address _policy) {
        nxnToken = _nxnToken;
        roleRegistry = RoleRegistry(_roleRegistry);
        policy = TreasuryPolicy(_policy);
    }

    function releaseFunds(address recipient, uint256 amount, string memory purpose) external onlyTreasurer {
        require(policy.isApprovedPurpose(purpose), "Unapproved purpose");
        require(recipient != address(0), "Invalid recipient");

        (bool success, ) = nxnToken.call(abi.encodeWithSignature("transfer(address,uint256)", recipient, amount));
        require(success, "Transfer failed");

        emit FundsReleased(recipient, amount, purpose);
    }
}
