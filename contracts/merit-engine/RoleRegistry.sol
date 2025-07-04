// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RoleRegistry {
    mapping(address => mapping(string => bool)) public roles;

    function assignRole(address user, string memory role) external {
        roles