// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract FurryFriends is ERC721A {
    address public contractOwner;

    uint256 public maxMintAmount = 5;

    string baseURI =
        "https://indigo-immense-barnacle-223.mypinata.cloud/ipfs/QmYAguVHDGpTpHTP1bpG9VmVhZHJt5RHQii4TvAxbCWUqo/";

    string public description = "this is the poly";

    constructor() ERC721A("FurryFriends", "FF") {
        contractOwner = msg.sender;
    }

    modifier onlyContractOwner() {
        require(msg.sender == contractOwner, "Only the contract owner can perform this action!");
        _;
    }

    function mintTokens(uint256 amount) external payable onlyContractOwner {
        require(
            totalSupply() + amount <= maxMintAmount,
            "You cannot mint more than the maximum allowed"
        );
        _mint(msg.sender, amount);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function getDescription() external view returns (string memory) {
        return description;
    }
}
