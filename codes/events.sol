// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

event HigghestPayBidder(address bidder, uint amount);

contract SimpleAuction {

    function bid() public payable {
        emit HigghestPayBidder(msg.sender, msg.value);
    }
    

}
