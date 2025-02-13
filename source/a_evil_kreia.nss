#include "thematic_sith"

void main() {
	int nParam1 = GetScriptParameter(1);
	switch( nParam1 ) {
	case 0: {
			ActionPauseConversation();
			object oAtton = SpawnAvailableNPC(NPC_ATTON, GetLocation(GetObjectByTag("sp_atton")));
			if( !GetIsObjectValid(oAtton) ) {
				// AurPostString("Atton not in party table, WTF.", 5, 18, 10.0);
				oAtton = CreateObject(OBJECT_TYPE_CREATURE, "p_atton", GetLocation(GetObjectByTag("sp_atton")));
				IncrementGlobalNumber("711KOR_Party_Count", 1);
			}
			AssignCommand(oAtton, ClearAllActions());
			AssignCommand(oAtton, ActionMoveToObject(GetObjectByTag("wp_atton")));
			AssignCommand(oAtton, ActionDoCommand(AssignCommand(GetFirstPC(), SetFacingPoint(GetPosition(oAtton)))));
			DelayCommand(2.0, ActionResumeConversation());
		} break;
	case 1: {
			DelayCommand(1.0, SetLightsaberPowered(GetObjectByTag("Atton"), TRUE, TRUE, TRUE));
			DelayCommand(1.0, SetLightsaberPowered(GetObjectByTag("KreiaEvil"), TRUE, TRUE, TRUE));
		} break;
	case 2: {
			ActionPauseConversation();
			object oBaoDur = SpawnAvailableNPC(NPC_BAO_DUR, GetLocation(GetObjectByTag("sp_baodur")));
			if( !GetIsObjectValid(oBaoDur) ) {
				// AurPostString("Bao-Dur not in party table, WTF.", 5, 18, 10.0);
				oBaoDur = CreateObject(OBJECT_TYPE_CREATURE, "p_baodur", GetLocation(GetObjectByTag("sp_baodur")));
				IncrementGlobalNumber("711KOR_Party_Count", 1);
			}
			AssignCommand(oBaoDur, ClearAllActions());
			AssignCommand(oBaoDur, ActionMoveToObject(GetObjectByTag("wp_baodur")));
			DelayCommand(2.0, ActionResumeConversation());
		} break;
	case 3: {
			ActionPauseConversation();
			object oT3 = SpawnAvailableNPC(NPC_T3_M4, GetLocation(GetObjectByTag("sp_t3m4")));
			if( !GetIsObjectValid(oT3) ) {
				// AurPostString("T3 not in party table, WTF.", 5, 18, 10.0);
				oT3 = CreateObject(OBJECT_TYPE_CREATURE, "p_t3m4", GetLocation(GetObjectByTag("sp_t3m4")));
				IncrementGlobalNumber("711KOR_Party_Count", 1);
			}
			AssignCommand(oT3, ClearAllActions());
			AssignCommand(oT3, ActionMoveToObject(GetObjectByTag("wp_t3m4")));
			DelayCommand(2.0, ActionResumeConversation());
		} break;
	case 4: {
			SetGlobalFadeOut();
			SetGlobalFadeIn(0.5, 1.5);
			ActionPauseConversation();
			SpawnAvailableNPC(NPC_HANDMAIDEN, GetLocation(GetObjectByTag("wp_handmaiden")));
			SpawnAvailableNPC(NPC_DISCIPLE, GetLocation(GetObjectByTag("wp_disciple")));
			SpawnAvailableNPC(NPC_VISAS, GetLocation(GetObjectByTag("wp_visas")));
			SpawnAvailableNPC(NPC_MIRA, GetLocation(GetObjectByTag("wp_mira")));
			SpawnAvailableNPC(NPC_CANDEROUS, GetLocation(GetObjectByTag("wp_mandalore")));
			SpawnAvailableNPC(NPC_G0T0, GetLocation(GetObjectByTag("wp_goto")));
			SpawnAvailableNPC(NPC_HANHARR, GetLocation(GetObjectByTag("wp_hanharr")));
			SpawnAvailableNPC(NPC_HK_47, GetLocation(GetObjectByTag("wp_hk47")));
			DelayCommand(2.0, ActionResumeConversation());
		} break;
	case 5: {
			DelayCommand(1.0, CreatureFlourishWeapon(GetObjectByTag("BaoDur")));
		} break;
	case 6: {
			TSL_BeginVision();
			TSL_ChangeKreiaVisionFaction(STANDARD_FACTION_HOSTILE_1);
			TSL_ChangePartyVisionFaction(STANDARD_FACTION_FRIENDLY_1);
		} break;
	case 7:	{
			TSL_BeginVision();
			TSL_ChangeKreiaVisionFaction(STANDARD_FACTION_FRIENDLY_1);
			TSL_ChangePartyVisionFaction(STANDARD_FACTION_HOSTILE_1);
		} break;
	case 8:	{
			TSL_BeginVision();
			TSL_ChangeKreiaVisionFaction(STANDARD_FACTION_HOSTILE_1);
			TSL_ChangePartyVisionFaction(STANDARD_FACTION_HOSTILE_1);
		} break;
	}
}