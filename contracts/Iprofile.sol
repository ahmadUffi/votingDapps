// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IProfile {
    struct profile {
        string Usernmae;
        string Bio;
        bool isRegistered;
    }


    function setUser(string memory _username, string memory _bio) external;
    function getProfile(address _user) external view returns(profile memory);
    function getImgProfile(address _user) external view returns (string memory);
    function getUsernameProfile(address _user) external view returns (string memory);

}