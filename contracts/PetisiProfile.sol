// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PetisiProfile {
    struct UserProfile{
        string username;
        string bio;
        string imgProfile;
        bool isRegistered;
    }

    mapping(address => UserProfile) public profile;

    function setProfile(string memory _username, string memory _bio, string memory _imgProfile) public {
        profile[msg.sender] = UserProfile(_username, _bio, _imgProfile,true);
    }
    function getImgProfile(address _user) public  view returns(string memory){
        return profile[_user].imgProfile;
    }

    function getUsernameProfile(address _user) public view returns (string memory){
        return profile[_user].username;
    }

    function getProfile(address _user) public view returns(UserProfile memory){
        return  profile[_user];
    }
}