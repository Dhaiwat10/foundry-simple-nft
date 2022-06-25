// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

import "forge-std/Test.sol";
import "src/NFT.sol";

contract NFTTest is Test {
    NFT nft;
    string public constant COMMON_TOKEN_URI =
        "https://gateway.pinata.cloud/ipfs/QmPf2x91DoemnhXSZhGDP8TX9Co8AScpvFzTuFt9BGAoBY";

    function setUp() public {
        nft = new NFT(COMMON_TOKEN_URI, 0.001 ether);
    }

    function testTokenURI() public {
        string memory tokenURI = nft.commonTokenURI();
        assertEq(tokenURI, COMMON_TOKEN_URI);
    }

    function testMintCost() public {
        assertEq(nft.mintCost(), 0.001 ether);
    }

    function testMint() public {
        address owner = msg.sender;
        uint256 tokenId = nft.mint{value: 0.001 ether}(owner);
        assertEq(tokenId, 0);
        assertEq(nft.balanceOf(owner), 1);
        assertEq(nft.ownerOf(tokenId), owner);
    }
}
