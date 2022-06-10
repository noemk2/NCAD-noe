//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract PlantTree {
    struct Tree {
        uint256 plantingDate;
        uint256 height;
        string direction;
    }


    struct Volunteer {
        bool enabled;
        uint256[] treesPlanted;
    }


    address public gardener;

    mapping(address => Volunteer) public volunteers;
    mapping(uint256 => Tree) public trees;

    uint256[] public treesPlanted;

    constructor(address _gardener) {
        gardener = _gardener;
        volunteers[gardener].enabled = true;
    }


    function giveRightPlant(address _volunteer) public {
        require(
            msg.sender == gardener,
            "Only gardener can give right to plant."
        );
        volunteers[_volunteer].enabled = true;
    }


    function delegate(address to) public {
        require(msg.sender == gardener, "Only gardener can delegate.");
        msg.sender.transfer(to, msg.value);
    }

    // _tree posiblemente cambio


    function plant(uint256 _tree) public {
        require(
            volunteers[msg.sender].enabled,
            "You are not allowed to plant."
        );
        require(trees[_tree].height == 0, "Tree already planted.");
        trees[_tree].plantingDate = block.timestamp;
        trees[_tree].height = 1;
        trees[_tree].direction = "up";
        volunteers[msg.sender].treesPlanted.push(_tree);
        treesPlanted.push(_tree);
    }


    function getTotalPlantedTrees() public view returns (uint) {
        return treesPlanted.length;
    }
}
