// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VotingProfile {
    struct UserProfile{
        string username;
        string bio;
        string imgUrl;
        bool isRegistered;
    }

    mapping(address => UserProfile) public profile;

    function setProfile(string memory _username, string memory _bio, string memory _imgUrl) public {
        profile[msg.sender] = UserProfile(_username, _bio, _imgUrl, true);
    }

    function getProfile(address _user) public view returns(UserProfile memory){
        return  profile[_user];
    }
}