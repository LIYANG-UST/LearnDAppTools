// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "ds-test/test.sol";
import "../ArrayRemoveByShifting.sol";

contract TestArrayShift is ArrayRemoveByShifting, DSTest {
    uint256[] copy;

    function test_remove(uint256[] memory _arr, uint256 _i) public {
        if (_i >= _arr.length) {
            return;
        }

        arr = _arr;

        // reset copy
        delete copy;
        // copy elements except _i th element
        for (uint256 i = 0; i < arr.length; i++) {
            if (i != _i) {
                copy.push(arr[i]);
            }
        }

        remove(_i);

        assertEq(arr.length, copy.length);
    }
}
