#include "thematic_sith"

void HandleMines();
void HandleVision();

void main() {
	HandleMines();
	HandleVision();
}

void HandleMines() {	
	object oRevan = GetObjectByTag("revan_fake");
	string sMsg = "Revan's form is ";
	if (oRevan != OBJECT_INVALID) {
		if( IsFormActive(oRevan, FORM_SABER_I_SHII_CHO) )
			sMsg += "Form I: Shii-Cho";
		else if( IsFormActive(oRevan, FORM_SABER_II_MAKASHI) )
			sMsg += "Form II: Makashi";
		else if( IsFormActive(oRevan, FORM_SABER_III_SORESU) )
			sMsg += "Form III: Soresu";
		else if( IsFormActive(oRevan, FORM_SABER_IV_ATARU) )
			sMsg += "Form IV: Ataru";
		else if( IsFormActive(oRevan, FORM_SABER_V_SHIEN) )
			sMsg += "Form III: Shien";
		else if( IsFormActive(oRevan, FORM_SABER_VI_NIMAN) )
			sMsg += "Form III: Nima";
		else if( IsFormActive(oRevan, FORM_SABER_VII_JUYO) )
			sMsg += "Form VII: Juyo";
		else if( IsFormActive(oRevan, FORM_FORCE_I_FOCUS) )
			sMsg += "Force Focus";
		else if( IsFormActive(oRevan, FORM_FORCE_II_POTENCY) )
			sMsg += "Force Potency";
		else if( IsFormActive(oRevan, FORM_FORCE_III_AFFINITY) )
			sMsg += "Force Affinity";
		else if( IsFormActive(oRevan, FORM_FORCE_IV_MASTERY) )
			sMsg += "Force Mastery";
		else if( IsFormActive(oRevan, FORM_FORCE_I_FOCUS) )
			sMsg += "nothing";
		SendMessageToPC(GetFirstPC(), sMsg);
	}
	
	object oCheckMines = GetObjectByTag("check_mines");
	if( !GetLocalBoolean(oCheckMines, 40) ) {
		return;
	}
	SetLocalBoolean(oCheckMines, 40, FALSE);
	location loc = GetLocation(oCheckMines);
	object obj = GetFirstObjectInShape(4, 12.0, loc, FALSE, OBJECT_TYPE_TRIGGER);
	while( GetIsObjectValid(obj) ) {
		if( GetTrapBaseType(obj) != -1 ) {
			SetLocalBoolean(oCheckMines, 40, TRUE);
			break;
		}
		obj = GetNextObjectInShape(4, 12.0, loc, FALSE, OBJECT_TYPE_TRIGGER);
	}
	if( !GetLocalBoolean(oCheckMines, 40) ) {
		object oCaptain = GetObjectByTag("g_repsold_capt");
		object oPC = GetFirstPC();
		SetLocalBoolean(oCaptain, 55, TRUE);
		DelayCommand(0.1, AssignCommand(oCaptain, ActionStartConversation(oPC)));
		DelayCommand(2.0, AssignCommand(oPC, ActionForceMoveToObject(GetObjectByTag("wp_pc_mines", 0), 1, 1.0, 30.0)));
		DelayCommand(3.0, CreatureFlourishWeapon(oPC));
	}
}

void HandleVision() {
	if( TSL_IsVisionActive() ) {
		if( TSL_ShouldVisionFail() )
			TSL_FailVision();
		else if( TSL_ShouldVisionEnd() )
			TSL_EndVision();
	}
}