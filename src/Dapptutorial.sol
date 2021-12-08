// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract Dapptutorial {
    bool public received;

    receive() external payable {
        received = !received;
    }

    function withdraw(uint256 password) public {
        require(password == 42, "Wrong Password");
        payable(msg.sender).transfer(address(this).balance);
    }
}
