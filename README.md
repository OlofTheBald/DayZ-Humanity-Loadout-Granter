# DayZ Epoch Humanity Loadout Granter
![Arma2OA_1.64.144629](https://img.shields.io/badge/Arma%202%20OA-1.64.144629-informational)    ![DayZEpoch_1.0.6.x](https://img.shields.io/badge/DayZ%20Epoch-1.0.6.x-success)

[OlofTheBald on Github](https://github.com/OlofTheBald/DayZ-Humanity-Loadout-Granter/)

## Summary
The DayZ Epoch loadout granter script adds items - including guns, magazines, and backpacks - to your players when they fresh-spawn depending on their humanity level.

## Why do players like it?
Humanity rewards are a great mechanic that gives your players a "level-up" style of gameplay. Especially on PvE servers, players enjoy having goals to accomplish while enduring the grind of Epoch.

## How To Configure Levels
Configuration of loadout levels takes a bit of work, but is not difficult.

1. Add or delete "Private" variables at the top of the loadout.sqf file. These variables depend on how many levels you want, and of which type. On my server, for example, I only have Hero levels so my Private variable line looks like this:
```sqf
Private ["_humanity","_heroLevel1","_heroLevel2","_heroLevel3","_heroLevel4"];

```
2. Adjust the humanity values on **line 35** so they reflect the **minimum humanity** a player must have in order to be granted a loadout.
```sqf
if (PVCDZ_plr_Login2 select 3 && !(player isKindOf "PZombie_VB") && (_humanity >= 5000 || _humanity <= -5000)) then {

```
In the above example, Hero Loadouts start at **5000 humanity or more**, and Bandit Loadouts start at **-5000 humanity or less**. Any player with humanity between -4999 to 4999 will be granted the default loadout set in your init.sqf.
You may also only grant Hero loadouts or Bandit loadouts. Another example from my server, which only grants Hero Loadouts:
```sqf
if (PVCDZ_plr_Login2 select 3 && !(player isKindOf "PZombie_VB") && (_humanity >= 10000)) then {

```
3. Follow the examples given for setting the range of humanity for each loadout level. This part can get tricky; always remember that Bandit humanity is a negative value and so will move in the opposite direction to Hero humanity. "-10000", in this case, can be thought of as a "higher" value than -5000 in the same way that "10000" is a higher value than 5000.

4. Adjust the switch cases accordingly. This part is pretty self-explanatory. You may choose to change the logic here to use [forEach loops](https://community.bistudio.com/wiki/forEach); I have avoided using them in order to increase readability for server operators in general.

## Installation
1. Unpack and open your mission PBO. Add loadout.sqf to your mission in whatever folder you choose. I have a folder named "**custom**" where I keep all my scripts.
2. In your **init.sqf**, find the following line:
```sqf
execFSM "\z\addons\dayz_code\system\player_monitor.fsm";
```
and add this right below (make this whatever the file location in your mission PBO is):
```sqf
execVM "custom\loadout.sqf";
```
3. Save your init.sqf file and repack your mission PBO.
4. Unpack your dayz_server PBO.
5. In your dayz_server files, open **compile\server_playerSetup.sqf** and find the following line:
```sqf
PVCDZ_plr_Login2 = [_worldspace,_state,_randomKey];
```
6. Change the line to
```sqf
PVCDZ_plr_Login2 = [_worldspace,_state,_randomKey,_randomSpot];
```
7. Save your server_playerSetup.sqf file and repack your dayz_server PBO.