// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BlockchainButterflies is ERC721URIStorage, Ownable {
    uint256 public constant MAX_SUPPLY = 2000;
    uint256 public currentTokenId;
    string baseURI;

    constructor(string memory _baseURI) ERC721("BlockchainButterflies", "BFLY") Ownable(msg.sender){
        baseURI = _baseURI; 
    }

    function mintTo(address recipient) public returns (uint256) {
        require(currentTokenId < MAX_SUPPLY, "Max supply reached");
        uint256 newTokenId = currentTokenId;
        currentTokenId++;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI(newTokenId));
        return newTokenId;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return string(abi.encodePacked(baseURI, toString(tokenId), ".json"));
    }

    function setBaseURI(string memory _baseURI) public onlyOwner {
        baseURI = _baseURI;
    }

   function mintNPublic(address recipient, uint256 n) public {
    require(n <= 20, "Max 20 tokens at a time");
    require(currentTokenId + n <= MAX_SUPPLY, "Exceeds max supply");

    for (uint256 i = 0; i < n; i++) {
        mintTo(recipient);
        }
    }

    function mintN(address recipient, uint256 n) public onlyOwner{
    require(currentTokenId + n <= MAX_SUPPLY, "Exceeds max supply");

    for (uint256 i = 0; i < n; i++) {
        mintTo(recipient);
        }
    }


   function toString(uint256 value) internal pure returns (string memory) {
    if (value == 0) {
        return "0";
    }

    uint256 temp = value;
    uint256 digits;
    while (temp != 0) {
        digits++;
        temp /= 10;
    }

    bytes memory buffer = new bytes(digits);

    while (value != 0) {
        digits -= 1;
        buffer[digits] = bytes1(uint8(48 + value % 10));
        value /= 10;
    }

    return string(buffer);
    }
}
