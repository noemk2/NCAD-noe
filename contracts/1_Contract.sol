//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
/*
ideas implementar: 

MEJORAR EL MEDIO AMBIENTE (es una cadena de varios integrantes)
- crear una ruta arboles semprados -- crear un crud -- crar un fronted - usar thegraph
        ayudaria a saber cuanto se ayuda a cuidar el planeta

*/
    /*
    interfaces
    methods 
    events 
    */

import "hardhat/console.sol";

contract PlantTree {

    // interfaces
    struct Tree {
        uint id;
        uint height;
        uint age;
        uint health;
        uint water;
        uint food;
        uint energy;
        uint waste;
        uint pollution;
        uint money;
        uint happiness;
        uint happiness_level;
        uint happiness_level_max;
}

// roles

    // volunteers aniway
    struct Volunteer {
        uint id;
        uint money;
        uint water;
        uint food;
        uint energy;
        uint waste;
        uint pollution;
        uint happiness;
        uint happiness_level;
        uint happiness_level_max;
    }


struct gardener{
    uint id;
    uint money;
    uint water;
    uint food;
    uint energy;
    uint waste;
    uint pollution;
    uint happiness;
    uint happiness_level;
    uint happiness_level_max;
}



    //unique gardener
    address public gardener;
    mapping(address => Volunteer) public volunteers;
    Tree[] public proposals;

// methods 

    constructor(bytes32[] memory proposalNames){
        gardener = msg.sender;
        volunteers[gardener].id= 1;

        for (uint i = 0; i < proposalNames.length; i++) {
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
            proposals.push(Tree({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

  function giveRightPlant(address voter) public {
    require(
      msg.sender == gardener,
      "Only gardener can give right to plant."
    );
    require(
      !volunteers[voter].voted,
      "The voter already voted."
    );
    require(volunteers[voter].id == 0);
    volunteers[voter].id = 1;
  }

  function delegate (address to) public {
    Volunteer storage sender = volunteers[msg.sender];
    require(!sender.voted, "You already voted.");
    require(to != msg.sender, "Self-delegation is disallowed.");

    while (volunteers[to].delegate != address(0)) {
      to = volunteers[to].delegate;

      // We found a loop in the delegation, not allowed.
      require(to != msg.sender, "Found loop in delegation.");
    }
    sender.voted = true;
  }

  
function plant(uint id, uint height, uint age, uint health, uint water, uint food, uint energy, uint waste, uint pollution, uint money, uint happiness, uint happiness_level, uint happiness_level_max) public {
    require(
      volunteers[msg.sender].id == 1,
      "Only gardener can plant."
    );
    require(
      volunteers[msg.sender].money >= money,
      "Not enough money."
    );
    require(
      volunteers[msg.sender].water >= water,
      "Not enough water."
    );
    require(
      volunteers[msg.sender].food >= food,
      "Not enough food."
    );
}


function getTotalPlantedTrees() public view returns (uint) {
    uint total = 0;
    for (uint i = 0; i < proposals.length; i++) {
        total += proposals[i].voteCount;
    }
    return total;
}






}
