/*=============================================================================
 |    File name:    loadout.sqf v1.0.3
 |       Author:    [OlofTheBald (https://github.com/OlofTheBald)]
 |
 |  Description:    Grants a spawn loadout to a player depending on that
 |                  player's humanity level. Loadouts are not granted to
 |                  players that spawn infected. Loadouts are static
 |                  (not randomized).
 |
 |                  Originally written for DayZ Epoch 1.0.5; script is
 |                  updated for Epoch 1.0.5.1. No testing done with any
 |                  other DayZ versions or mods. No compatibility testing
 |                  with Infistar has been done. There are no issues with
 |                  Battleye, and no BE filter changes are required.
 |
 |                  See README.md for install instructions.
 |
 |       Thanks:    Thac0 Gaming (http://thac0gaming.com)
 |                  Vert Hosting (https://verthosting.com)
 |                  Halvhjearne (EpochMod.com Forums)
 |
 |     Language:    Status Quo Function (SQF)
 |      License:    The MIT License (https://opensource.org/licenses/MIT)
 *===========================================================================*/

Private ["_humanity","_banditLevel1","_banditLevel2","_heroLevel1","_heroLevel2"];


 // Check that player is properly loaded
waitUntil {!isNil ("PVDZE_plr_LoginRecord")};

 // Get player's humanity value
_humanity = (player getVariable["humanity",0]);

// Humanity levels. You can add your own, just follow these as examples
// If you add new levels, don't forget to create the private variable as well
// ("Private" line at the top)
_banditLevel1 = ((_humanity < -5000) && (_humanity > -10000));
_banditLevel2 = (_humanity <= -10000);
_heroLevel1 = ((_humanity >= 5000) && (_humanity < 10000));
_heroLevel2 = (_humanity >= 10000);

 // Check if player is new spawn and not infected
 // If player is a zombie, script will exit without doing anything
if (dayzPlayerLogin2 select 2 && !(player isKindOf "PZombie_VB")) then {

    if (_banditLevel1) then {
        
        // Remove default loadout
        removeAllWeapons player;
        removeAllItems player;
        removeBackpack player;
        
        // Populate _banditLevel1 loadout
        { player addMagazine _x } forEach [
        'ItemBandage',
        'ItemBandage',
        'ItemBandage',
        'ItemBandage',
        'ItemMorphine',
        'ItemPainkiller',
        'ItemNewspaper',
        'SmokeShellYellow',
        '17Rnd_9x19_glock17',
        '17Rnd_9x19_glock17'];

        { player addWeapon _x } forEach [
        'glock17_EP1',
        'ItemMap'];

        player addBackpack 'DZ_ALICE_Pack_EP1';
        // End _banditLevel1 loadout

    } else {

        if (_banditLevel2) then {
        
            // Remove default loadout
            removeAllWeapons player;
            removeAllItems player;
            removeBackpack player;
            
            // Populate _banditLevel2 loadout
            { player addMagazine _x } forEach [
            '15Rnd_9x19_M9SD',
            '15Rnd_9x19_M9SD',
            'ItemBandage',
            'ItemBandage',
            'ItemBandage',
            'ItemBandage',
            'ItemMorphine',
            'ItemPainkiller',
            'ItemNewspaper',
            'FoodMRE',
            'ItemWaterbottleBoiled',
            'SmokeShellRed',
            '100Rnd_556x45_BetaCMag'];

            { player addWeapon _x } forEach [
            'M16A4_ACG',
            'NVGoggles',
            'Binocular',
            'ItemGPS',
            'M9SD'];

            player addBackpack 'DZ_British_ACU';
            // End _banditLevel2 loadout

        } else {

            if (_heroLevel1) then {
        
                // Remove default loadout
                removeAllWeapons player;
                removeAllItems player;
                removeBackpack player;
                
                // Populate _heroLevel1 loadout
                { player addMagazine _x } forEach [
                'ItemBandage',
                'ItemBandage',
                'ItemBandage',
                'ItemBandage',
                'ItemMorphine',
                'ItemPainkiller',
                'ItemNewspaper',
                'SmokeShellYellow',
                '17Rnd_9x19_glock17',
                '17Rnd_9x19_glock17'];

                { player addWeapon _x } forEach [
                'glock17_EP1',
                'ItemMap'];

                player addBackpack 'DZ_ALICE_Pack_EP1';
                // End _heroLevel1 loadout
        
            } else {

                if (_heroLevel2) then {
        
                    // Remove default loadout
                    removeAllWeapons player;
                    removeAllItems player;
                    removeBackpack player;
                    
                    // Populate _heroLevel2 loadout
                    { player addMagazine _x } forEach [
                    '15Rnd_9x19_M9SD',
                    '15Rnd_9x19_M9SD',
                    'ItemBandage',
                    'ItemBandage',
                    'ItemBandage',
                    'ItemBandage',
                    'ItemMorphine',
                    'ItemPainkiller',
                    'ItemNewspaper',
                    'FoodMRE',
                    'ItemWaterbottleBoiled',
                    'SmokeShellRed',
                    '100Rnd_556x45_BetaCMag'];

                    { player addWeapon _x } forEach [
                    'M16A4_ACG',
                    'NVGoggles',
                    'Binocular',
                    'ItemGPS',
                    'M9SD'];

                    player addBackpack 'DZ_British_ACU';
                    // End _heroLevel2 loadout
                };
            };
        };
    };
};
