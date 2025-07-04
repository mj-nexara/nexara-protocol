// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IMeritEngine
/// @notice Interface for the MeritEngine contract used in Nexara Protocol
interface IMeritEngine {
    /// @notice Returns the merit score of a given contributor
    /// @param contributor The address of the contributor
    /// @return score The merit score
    function getMerit(address contributor) external view returns (uint256 score);

    /// @notice Assigns a fixed merit score to a contributor
    /// @param contributor The address of the contributor
    /// @param score The merit score to assign
    function assignMerit(address contributor, uint256 score) external;

    /// @notice Adjusts the merit score of a contributor by a delta
    /// @param contributor The address of the contributor
    /// @param delta The amount to adjust (positive or negative)
    function adjustMerit(address contributor, int256 delta) external;
}
