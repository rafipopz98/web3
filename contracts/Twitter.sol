//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Twitter{
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    uint8 constant maxTweetLength=10;
    mapping (address =>Tweet[] ) public tweets;

    function addTweet(string memory _tweet)public {
        require(bytes(_tweet).length<=maxTweetLength,"tooo long");
        Tweet memory newTweet=Tweet({
            author:msg.sender,
            content:_tweet,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }
    function getTweet(address _addrs,uint i) public view returns (Tweet memory) {
        return tweets[_addrs][i];
    }
    function getAllTweet() public view returns (Tweet[] memory) {
        return tweets[msg.sender];
    }
}