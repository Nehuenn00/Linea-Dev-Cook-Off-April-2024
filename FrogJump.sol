// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface IFrog {
    function name() external view returns (string memory);
    function jumps() external view returns (uint256);
}

interface IJumper {
    function jump() external; 
}

contract FrogJump is IFrog, IJumper {
    string public name;
    uint256 public jumps;

    constructor(string memory _name) {
        name = _name;
    }

    function jump() public {
        jumps++;
    }
}


interface IPayableJumper {
    function jump() external payable; 
}

contract PayFrogJump is IFrog, IPayableJumper {
    string public name;
    uint256 public jumps;
    uint256 public constant PRICE = 0.001 ether;

    constructor(string memory _name) {
        name = _name;
    }

    function jump() public payable {
        jumps += msg.value / PRICE;
    }
}