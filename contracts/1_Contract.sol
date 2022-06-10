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

    //unique gardener
    struct gardener {
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







}
