// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

contract test{
    function testArray() public pure{ 
        uint len = 7; 
    
        //creating a dynamic array
        uint[] memory a = new uint[](7);

        //bytes is the same as byte[] 
        bytes memory b = new bytes(len);

        assert(a.length == 7);
        assert(b.length == len);
 
        //access array variable
        a[6] == 9;

        //test array variable
        assert(a[6] == 9);

        //static array
        uint[3] memory c = [uint(1), 2, 3];
        assert(c.length == 3);
    }
}
