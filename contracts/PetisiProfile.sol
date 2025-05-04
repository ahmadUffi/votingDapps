// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PetisiProfile {
    struct UserProfile{
        string username;
        string bio;
        bool isRegistered;
    }

    mapping(address => UserProfile) public profile;

    function setProfile(string memory _username, string memory _bio) public {
        profile[msg.sender] = UserProfile(_username, _bio, true);
    }

    function getProfile(address _user) public view returns(UserProfile memory){
        return  profile[_user];
    }
}