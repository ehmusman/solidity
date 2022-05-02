// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Twitter {
    // Tweets struct
    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 createdAt;
    }

    // Users Tweets IDs
    mapping(address => uint256[]) internal tweetsOf;

    // Tweets Mapping
    mapping(uint256 => Tweet) internal tweets;
    // Operators
    mapping(address => mapping(address => bool)) internal operators;

    // Current Tweet ID
    uint256 public currentTweetId = 1;

    // Following
    mapping(address => address[]) internal following;

    // Followers
    mapping(address => address[]) internal followers;

    ///////////////////////////////////////////////////////////////////////////////////////////
    //                                  Tweets Section
    ///////////////////////////////////////////////////////////////////////////////////////////

    // Add a new Tweet, Internal Method
    function _tweet(address _from, string memory _content) internal {
        // Authenticating if the address is tweeting itself or tweeting on  behalf of other
        require(
            _from == msg.sender || // tweeting itself
                operators[_from][msg.sender], // any operator is tweeting on behalf of owner and operator is allowed to do tweet
            "You do not have access"
        );
        require(keccak256(abi.encodePacked(_content)) != keccak256(abi.encodePacked("")),"Content Should be valid");
        // Add New Tweet in Tweets mapping
        tweets[currentTweetId] = Tweet(
            currentTweetId,
            _from,
            _content,
            block.timestamp
        );
        tweetsOf[_from].push(currentTweetId);
        currentTweetId++;
    }

    // Tweet by Owner
    function tweet(string memory _content) public {
        _tweet(msg.sender, _content);
    }

    // Tweet by Owner
    function tweet(address _from, string memory _content) public {
        _tweet(_from, _content);
    }

    // Get Latest Tweeets
    function getLatestTweets(uint256 count)
        public
        view
        returns (Tweet[] memory)
    {
        require(count > 0 && count <= currentTweetId, "Count is not valid");
        Tweet[] memory _tweets = new Tweet[](count); //array length - count
        uint256 j;
        for (uint256 i = currentTweetId - count; i < currentTweetId; i++) {
            //count = 5 currentTweetId=7; 7-5=2,3,4,5,6
            Tweet storage _structure = tweets[i];
            _tweets[j] = Tweet(
                _structure.id,
                _structure.author,
                _structure.content,
                _structure.createdAt
            );
            j = j + 1;
        }
        return _tweets;
    }
        // Get Latest Tweeets
    function getSelfTweets()
        public
        view
        returns (Tweet[] memory)
    {
        uint[] memory myTweetIds= tweetsOf[msg.sender];

        Tweet[] memory _tweets = new Tweet[](myTweetIds.length); //array length - count
        for (uint256 i = 0; i < myTweetIds.length; i++) {
            //count = 5 currentTweetId=7; 7-5=2,3,4,5,6
            Tweet storage _structure = tweets[i];
            _tweets[i] = Tweet(
                _structure.id,
                _structure.author,
                _structure.content,
                _structure.createdAt
            );
        }
        return _tweets;
    }

    ///////////////////////////////////////////////////////////////////////////////////////////
    //                                  Follow Section
    ///////////////////////////////////////////////////////////////////////////////////////////

    function follow(address _followed) public {

        require(msg.sender != _followed, "You cannot Follow Yourself");
        // caller is following other person
        // adding the caller address in the follower section of person that is being followed
        followers[_followed].push(msg.sender); //

        // adding the person address that is being followed by the caller in following section of caller
        following[msg.sender].push(_followed);
    }

    function getFollowers()public view returns(address[] memory){
        return followers[msg.sender];
    }
     function getFollowings()public view returns(address[] memory){
        return following[msg.sender];
    }

    ///////////////////////////////////////////////////////////////////////////////////////////
    //                                  Operator Access Section
    ///////////////////////////////////////////////////////////////////////////////////////////

    // Allow Operator for tweets
    function allow(address _operator) public {
        operators[msg.sender][_operator] = true;
    }

    // Allow Operator for tweets
    function disAllow(address _operator) public {
        operators[msg.sender][_operator] = false;
    }
}

// 0x584cDF68927ADc4468dB020D35cd860eb999Fa4A