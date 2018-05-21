pragma solidity ^0.4.20;

contract Claims {
    mapping(address => mapping(address => mapping(bytes32 => bytes32))) claims;

    event Set(
        address indexed issuer,
        address indexed subject,
        bytes32 indexed key,
        bytes32 value,
        uint updatedAt);

    event Unset(
        address indexed issuer,
        address indexed subject,
        bytes32 indexed key,
        bytes32 value,
        uint updatedAt);

    function set(address subject, bytes32 key, bytes32 value) public {
        claims[msg.sender][subject][key] = value;
        emit Set(msg.sender, subject, key, value, now);
    }
}