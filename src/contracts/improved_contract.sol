// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BlockchainButterflies is ERC721, Ownable {
    using Strings for uint256;

    uint256 public constant MAX_SUPPLY = 2000;
    uint256 public currentTokenId;
    string baseURI;

    constructor(string memory _baseURI) ERC721("BlockchainButterflies", "BFLY") {
        baseURI = _baseURI;
        transferOwnership(msg.sender);
    }

    function mintTo(address recipient) public returns (uint256) {
        require(currentTokenId < MAX_SUPPLY, "Max supply reached");
        uint256 newTokenId = currentTokenId;
        currentTokenId++;
        _safeMint(recipient, newTokenId);
        return newTokenId;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return string(abi.encodePacked(baseURI, tokenId.toString(), ".json"));
    }

    function setBaseURI(string memory _baseURI) public onlyOwner {
        baseURI = _baseURI;
    }

    function mint(address recipient, uint256 n) public {
        require(n <= 20, "Max 20 tokens at a time");
        require(currentTokenId + n <= MAX_SUPPLY, "Exceeds max supply");

        for (uint256 i = 0; i < n; i++) {
            mintTo(recipient);
        }
    }

    function mintNOwner(address recipient, uint256 n) public onlyOwner {
        require(currentTokenId + n <= MAX_SUPPLY, "Exceeds max supply");

        for (uint256 i = 0; i < n; i++) {
            mintTo(recipient);
        }
    }
}
