//Airdrop app created with chatGPT from openAI, for educational purpuse only!
// First deposit ERC20 token to the contract and than send to a list of ethereum addresses

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract Airdrop {
    ERC20 public token;

    constructor(ERC20 _token)  {
        token = _token;
    }

    
    function distribute(address[] memory recipients, uint256[] memory amounts) public {
        require(recipients.length == amounts.length, "Length of recipients and amounts must be equal");

        for (uint256 i = 0; i < recipients.length; i++) {
            require(token.transfer(recipients[i], amounts[i]), "Transfer failed");
        }
    }
}
