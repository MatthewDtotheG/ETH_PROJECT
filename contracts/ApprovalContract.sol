pragma solidity ^0.4.23;

contract ApprovalContract {

  address public sender;
  address public receiver;
  address constant public approver = 0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef;

  function deposit(address _receiver) external payable {
    require(msg.value > 0);
    sender = msg.sender;
    receiver = _receiver;
  }

  // pure functions do not use much gas
  function viewApprover() external pure returns(address){
    return(approver);
  }

  function approve() external {
    require(msg.sender == approver);
    receiver.transfer(address(this).balance);
  }




}
