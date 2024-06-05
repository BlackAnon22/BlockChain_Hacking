// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// This declares an event named "HighestPayBidder" that logs the bidder's address and the bid amount.
event HigghestPayBidder(address bidder, uint amount); // creating an event

contract SimpleAuction {

    function bid() public payable {
        emit HigghestPayBidder(msg.sender, msg.value); // triggering the event
    }
    

}
