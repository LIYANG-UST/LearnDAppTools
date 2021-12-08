// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract ArrayRemoveByShifting {
    uint256[] internal arr;

    function remove(uint256 _index) internal {
        require(_index < arr.length, "index out of bound");

        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }

        arr.pop();
    }
}
