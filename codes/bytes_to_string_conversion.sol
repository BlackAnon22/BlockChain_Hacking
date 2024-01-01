// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

contract SolidityTest{
    constructor() public{

    }

    function getResult() public view returns(string memory){
        uint a = 100;
        uint b = 200;
        uint result = a + b;
        return integerToString(result);
    }

    function integerToString(uint _i) internal pure returns(string memory){
        //checks for zero
        if (_i == 0){
            return "0";
        }
        //calculates string length
        uint j = _i;
        uint len;

        while(j != 0){
            len++;
            j /= 10;
        }
        //allocated memory string
        bytes memory bstr = new bytes(len);
        uint k = len - 1;

        //extracts digits and converts them to ascii
        while(_i != 0){
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        //converts bytes array to strings
        return string(bstr);
    }
}
