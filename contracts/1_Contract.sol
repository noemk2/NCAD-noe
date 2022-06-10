// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// 0xAefaa59a7B73C4714E613662Ff76E92e12E546EC

// import "hardhat/console.sol";

contract PlantTree {
    struct Tree {
        uint256 plantingDate;
        uint256 height;
        string direction;
        bool planted;
    }

    struct Volunteer {
        uint256 weight;
        uint256[] treesPlanted;
    }

    struct HashSub {
        uint256 index;
    }

    //  event FCalled(Tree _t);
    event FCalled(Tree);
    event FCalledVol(Volunteer);
    event FCalledVol2(HashSub);

    address public gardener;
    // uint256 hashTree;
    uint256 initialNumber;

    mapping(address => Volunteer) volunteers;
    mapping(uint256 => Tree) trees;

    uint256[] treesPlanted;

    constructor() {
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
        require(_to != _volunteer);

        require(msg.sender == gardener, "Only gardener can delegate.");

        require(volunteers[_volunteer].weight > 0);

        volunteers[_volunteer].weight = 0;
        volunteers[_to].weight = 1;
    }

    function registerTree(uint256 _height, string memory _direction)
        public
        returns (uint256)
    {
        Volunteer memory vol = volunteers[msg.sender];
        require(vol.weight != 0, "You are not allowed to register trees.");

        uint timestamp = block.timestamp;

        uint256 hashTree = uint256(
            keccak256(abi.encodePacked(initialNumber++))
        ) % timestamp;

        HashSub memory hub = HashSub(hashTree);

        Tree storage senderTree = trees[hashTree];
        senderTree.height = _height;
        senderTree.direction = _direction;

        emit FCalledVol2(hub);

        return hashTree;
    }

    function plant(uint256 _numberTree) public {
        Tree storage senderTree = trees[_numberTree];
        require(volunteers[msg.sender].weight != 0);
        require(!senderTree.planted);

        senderTree.planted = true;
        senderTree.plantingDate = block.timestamp;

        treesPlanted.push(_numberTree);
    }

    function getTree(uint256 _numberTree) public {
        Tree memory a = trees[_numberTree];

        // console.log(a.height);
        emit FCalled(a);
    }

    // function getVolunteer(address _volunteer) public {
    //     Volunteer memory b = volunteers[_volunteer];

    //     // console.log(a.weight);
    //     emit FCalledVol(b);
    // }

    function getTotalPlantedTrees() public view returns (uint256) {
        return treesPlanted.length;
    }
}
