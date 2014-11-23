/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	///////////////////////////////////////////////////////////////////////////////////////////////////////////// U_I_CombatUniform
[] spawn
{
    while {true} do
    {
        waitUntil {uniform player == "U_Rangemaster"};
        player setObjectTextureGlobal [0,"textures\uniform\adac\recruit_uniform_adac.paa"]; //Rekrut
        waitUntil {uniform player != "U_Rangemaster"};
    };
};
[] spawn
{
    while {true} do
    {
        waitUntil {uniform player == "U_I_CombatUniform"};
        player setObjectTextureGlobal [0,"textures\uniform\reb\Gorka_camo_04.paa"]; //gschmarre do GorkaTarnanzug
        waitUntil {uniform player != "U_I_CombatUniform"};
    };
};
[] spawn
{
    while {true} do
    {
        waitUntil {uniform player == "U_B_CTRG_2"};
        player setObjectTextureGlobal [0,"textures\uniform\reb\tarn.paa"]; //gschmarre do GorkaTarnanzug
        waitUntil {uniform player != "U_B_CTRG_2"};
    };
};
////////////////////////////////////////////////////////////////////
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;