// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/access/Ownable.sol";
import "contracts/Iprofile.sol";

contract Voting is Ownable { 
    IProfile private profileContract;

    constructor(address _profileContract) Ownable(msg.sender){
        profileContract = IProfile(_profileContract);
    }

    struct Proposal {
        uint256 id;
        string title;
        string description;
        string imgUrl;
        uint256 votes;
        address author;
    }

    uint256 counterProposal = 0;
    // event
    event proposalCreated(uint256 id, string title, string description, uint256 votes, address author);
    // mapping
    mapping (address => Proposal[]) public myProposal;
    mapping(uint256 => Proposal) public proposals;
    mapping(address => bool) public hasvoted;
    // array
    Proposal[] public proposalList;

    modifier onlyRegisterd(){
        IProfile.profile memory profileTemp =  profileContract.getProfile(msg.sender);
        require(profileTemp.isRegistered, "You have to Registerd");
        _;
    }

    modifier onlyHasNoVoted(){
        require(!hasvoted[msg.sender ], "You are already Voted!");
        _;      
    }

    function createProposal(string memory _title, string memory _description, string memory _imgUrl) onlyRegisterd public {
        Proposal memory newProposal = Proposal(counterProposal, _title, _description, _imgUrl, 0, msg.sender);
        proposals[counterProposal] = newProposal;
        myProposal[msg.sender].push(newProposal);
        proposalList.push(proposals[counterProposal]);
        counterProposal++;
    }

    function gerAllProposal() public view returns (Proposal[] memory){
        return proposalList;
    }

    function getMyProposal(address _user) public view returns (Proposal[] memory){
        return myProposal[_user];
    }

    function getProposal(uint256 _id) public view returns(string memory, string memory){
        Proposal memory proposalTemp = proposals[_id];
        return (proposalTemp.title, proposalTemp.description);
    }

    function vote(uint256 _id) public onlyRegisterd onlyHasNoVoted{
        proposals[_id].votes += 1;
        hasvoted[msg.sender] = true;   
    }


    function serach(string memory keyword) public view returns(Proposal[] memory result){
        uint256 count = 0;
        // hitung berapa yang cocok
        for(uint i = 0; i < proposalList.length; i++){
            
        }
    }

    function contains(string memory str, string memory substr) internal pure returns(bool){
        bytes memory stryBytes = bytes(str);
        bytes memory subStrBytes = bytes(str);

        for(uint i = 0; i < subStrBytes.length - subStrBytes.length; i++){
            
        }
    }
}
