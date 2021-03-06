// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "../Dapptutorial.sol";

contract DapptutorialTest is DSTest {
    Dapptutorial dapptutorial;

    function setUp() public {
        dapptutorial = new Dapptutorial();
    }

    function test_withdraw() public {
        payable(address(dapptutorial)).transfer(1 ether);
        uint256 preBalance = address(this).balance;

        dapptutorial.withdraw(42);

        uint256 postBalance = address(this).balance;

        assertEq(preBalance + 1 ether, postBalance);
    }

    function testFail_withdraw_wrong_pass() public {
        payable(address(dapptutorial)).transfer(1 ether);
        uint256 preBalance = address(this).balance;

        dapptutorial.withdraw(1);

        uint256 postBalance = address(this).balance;

        assertEq(preBalance + 1 ether, postBalance);
    }

    function proveFail_withdraw(uint256 guess) public {
        payable(address(dapptutorial)).transfer(1 ether);
        uint256 preBalance = address(this).balance;
        dapptutorial.withdraw(guess);
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + 1 ether, postBalance);
    }

    receive() external payable {}
}
