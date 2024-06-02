// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Enum {

    enum Status{Pending,Shipped,Accepted,Rejected,Cancelled}

    Status public status;

    function get() public view returns(Status) {
        return status;
    }

    // Pending=0
    // Shipped=1
    // Accepted=2
    // Rejected=3
    // Cancelled=4
    // update Status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // you can update to a specific enum like this
    function cancel() public {
        status = Status.Cancelled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }

}
