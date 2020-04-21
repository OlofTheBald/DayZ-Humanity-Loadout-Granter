/*=============================================================================
 |    File name:    loadout.sqf
 |       Author:    [OlofTheBald (https://github.com/OlofTheBald)]
 |
 |  Description:    Grants a spawn loadout to a player depending on that
 |                  player's humanity level. Loadouts are not granted to
 |                  players that spawn infected. Loadouts are static
 |                  (not randomized).
 |
 |                  Originally written for DayZ Epoch 1.0.5; script is
 |                  updated for Epoch 1.0.6.x. No testing done with any
 |                  other DayZ versions or mods. No compatibility testing
 |                  with Infistar has been done. There are no issues with
 |                  Battleye, and no BE filter changes are required.
 |
 |                  See README.md for install instructions.
 |
 |     Language:    Status Quo Function (SQF)
 |      License:    The MIT License (https://opensource.org/licenses/MIT)
 *===========================================================================*/

Private ["_humanity","_banditLevel1","_banditLevel2","_heroLevel1","_heroLevel2"];

FNC_removeDefault = {
	removeAllWeapons player;
	removeAllItems player;
	removeBackpack player;
};

waitUntil {!isNil ("PVDZ_plr_LoginRecord")}; // Check that player is logged in

_humanity = (player getVariable["humanity",0]); // Get and set humanity

// Check if player is new spawn, not a zombie, and has the minimum amount of humanity for a special loadout
if (PVCDZ_plr_Login2 select 3 && !(player isKindOf "PZombie_VB") && (_humanity >= 5000 || _humanity <= -5000)) then {

	_banditLevel1 = ((_humanity <= -5000) && (_humanity > -10000));
	_banditLevel2 = (_humanity <= -10000);
	_heroLevel1 = ((_humanity >= 5000) && (_humanity < 10000));
	_heroLevel2 = (_humanity >= 10000);

	switch (true) do {
		case _banditLevel1: {
			call FNC_removeDefault;
			player addMagazine '17Rnd_9x19_glock17';
			player addWeapon 'glock17_EP1';
			player addWeapon 'ItemMap';
			player addMagazine '17Rnd_9x19_glock17';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemMorphine';
			player addMagazine 'ItemPainkiller';
			player addMagazine 'ItemNewspaper';
			player addMagazine 'SmokeShellYellow';
            player addMagazine 'Skin_Bandit1_DZ';
			player addBackpack 'DZ_ALICE_Pack_EP1';
		};
		case _banditLevel2: {
			call FNC_removeDefault;
			player addMagazine '100Rnd_556x45_BetaCMag';
			player addWeapon 'M16A4_ACG';
			player addWeapon 'NVGoggles';
			player addWeapon 'Binocular';
			player addWeapon 'M9SD';
			player addWeapon 'ItemGPS';
			player addMagazine '15Rnd_9x19_M9SD';
			player addMagazine '15Rnd_9x19_M9SD';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemMorphine';
			player addMagazine 'ItemPainkiller';
			player addMagazine 'ItemNewspaper';
			player addMagazine 'FoodMRE';
			player addMagazine 'ItemWaterbottleBoiled';
			player addMagazine 'SmokeShellRed';
            player addMagazine 'Skin_Bandit2_DZ';
			player addBackpack 'DZ_British_ACU';
		};
		case _heroLevel1: {
			call FNC_removeDefault;
			player addMagazine '17Rnd_9x19_glock17';
			player addWeapon 'glock17_EP1';
			player addWeapon 'ItemMap';
			player addMagazine '17Rnd_9x19_glock17';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemMorphine';
			player addMagazine 'ItemPainkiller';
			player addMagazine 'ItemNewspaper';
			player addMagazine 'SmokeShellYellow';
            player addMagazine 'Soldier_Sniper_PMC_DZ';
			player addBackpack 'DZ_ALICE_Pack_EP1';
		};
		case _heroLevel2: {
			call FNC_removeDefault;
			player addMagazine '100Rnd_556x45_BetaCMag';
			player addWeapon 'M16A4_ACG';
			player addWeapon 'NVGoggles';
			player addWeapon 'Binocular';
			player addWeapon 'M9SD';
			player addWeapon 'ItemGPS';
			player addMagazine '15Rnd_9x19_M9SD';
			player addMagazine '15Rnd_9x19_M9SD';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemBandage';
			player addMagazine 'ItemMorphine';
			player addMagazine 'ItemPainkiller';
			player addMagazine 'ItemNewspaper';
			player addMagazine 'FoodMRE';
			player addMagazine 'ItemWaterbottleBoiled';
			player addMagazine 'SmokeShellRed';
            player addMagazine 'Soldier_Sniper_PMC_DZ';
			player addBackpack 'DZ_British_ACU';
		};
	};
};