// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// import "hardhat/console.sol";

contract PlantTree {
    struct Tree {
        uint256 plantingDate;
        uint256 height;
        string direction;
        bool planted;
    }


    struct Volunteer {
        uint weight;
        uint256[] treesPlanted;
    }


//  event FCalled(Tree _t);
 event FCalled(Tree );
 event FCalledVol(Volunteer );

    address public gardener;
    uint256 hashTree;
    uint initialNumber;

    mapping(address => Volunteer) volunteers;
    mapping(uint256 => Tree) trees;

    uint256[] treesPlanted;


    constructor()  {
        gardener = msg.sender;
        volunteers[gardener].weight = 1;
    }

    function giveRight(address _volunteer) public {
        require(
            msg.sender == gardener,
            "Only gardener can give right to plan trees."
        );
        require(volunteers[_volunteer].weight == 0);
        volunteers[_volunteer].weight = 1;
    }


    function delegate(address _to, address _volunteer) public {
       require( _to != _volunteer);

        require(
            msg.sender == gardener,
            "Only gardener can delegate."
        );

       require(volunteers[_volunteer].weight > 0);       

        volunteers[_volunteer].weight = 0;
        volunteers[_to].weight = 1;

    }

    function registerTree(uint _height, string memory _direction) public returns (uint) {
        require(
            msg.sender == gardener,
            "Only gardener can register trees."
        );

        uint timestamp = block.timestamp;
        hashTree = uint(keccak256(abi.encodePacked(initialNumber++))) % timestamp;

        Tree storage senderTree = trees[hashTree];
        senderTree.height = _height;
        senderTree.direction = _direction;

        return hashTree;

    }

    function plant(uint _numberTree) public{
        Tree storage senderTree = trees[_numberTree];
        require(volunteers[msg.sender].weight != 0);
        require(!senderTree.planted);

        senderTree.planted = true;
        senderTree.plantingDate = block.timestamp;

        treesPlanted.push(_numberTree);
    }

    function getTree(uint _numberTree) public {
        Tree memory a = trees[_numberTree];

        // console.log(a.height);
        emit FCalled(a);
    }


    // function getVolunteer(address _volunteer) public {
    //     Volunteer memory b = volunteers[_volunteer];

    //     // console.log(a.weight);
    //     emit FCalledVol(b);
    // }


    function getTotalPlantedTrees() public view returns (uint) {
        return treesPlanted.length;
    }
}
