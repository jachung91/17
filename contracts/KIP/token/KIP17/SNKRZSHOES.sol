// SPDX-License-Identifier: MIT
// Klaytn Contract Library v1.0.0 (KIP/token/KIP17/KIP17.sol)

pragma solidity ^0.8.0;

import "./KIP17.sol";
import "./extensions/KIP17Burnable.sol";
import "./extensions/KIP17Enumerable.sol";
import "./extensions/KIP17MetadataMintable.sol";
// import "./extensions/KIP17Mintable.sol";
import "./extensions/KIP17Pausable.sol";
import "./extensions/KIP17URIStorage.sol";
import "./extensions/KIP17BurnablePause.sol";



contract SNKRZSHOES is KIP17Burnable, KIP17Enumerable, KIP17MetadataMintable, KIP17BurnablePause {

    constructor (string memory name, string memory symbol) public KIP17(name, symbol) {

    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(KIP17Burnable, KIP17Enumerable, KIP17MetadataMintable, KIP17BurnablePause) returns (bool) {
        return
            KIP17Burnable.supportsInterface(interfaceId) ||
            KIP17Enumerable.supportsInterface(interfaceId) ||
            KIP17MetadataMintable.supportsInterface(interfaceId) ||
            KIP17BurnablePause.supportsInterface(interfaceId);
            // KIP17URIStorage.supportsInterface(interfaceId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override(KIP17, KIP17Enumerable, KIP17BurnablePause) {
        super._beforeTokenTransfer(from, to, tokenId);

        // do stuff before every transfer
        // e.g. check that vote (other than when minted) 
        // being transferred to registered candidate
    }

    function _burn(uint256 tokenId) internal virtual override(KIP17, KIP17URIStorage) {
        super.burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view virtual override(KIP17, KIP17URIStorage) returns (string memory) {
        super.tokenURI(tokenId);
    }

    // function

}