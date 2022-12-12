//smart contract that sends etehreum to a list of Addresses, this contract was created with chatGPT- for educational purpuse only

pragma solidity ^0.8.0;

contract MultiSender {
    address payable[] public recipients; // array to store addresses of recipients

   

    // function to add addresses of recipients
    function addRecipient(address payable _recipient) public {
        recipients.push(_recipient);
    }

    // function to send Ether to multiple recipients
    function sendEther() public payable {
        // check if contract has sufficient balance
        require(msg.value > 0 && address(this).balance >= msg.value);

        // calculate the amount of Ether to send to each recipient
        uint256 amount = msg.value / recipients.length;

        // send Ether to each recipient
        for (uint256 i = 0; i < recipients.length; i++) {
            recipients[i].transfer(amount);
        }
    }
}
