#include "k_inc_generic"
#include "k_inc_utility"
#include "thematic_sith"

void AttackPC(object oAttacker) {
	if (GetIsObjectValid(oAttacker)) {
		DelayCommand(0.2, ChangeToStandardFaction(oAttacker, STANDARD_FACTION_HOSTILE_1));
		DelayCommand(0.2, AssignCommand(oAttacker, ActionAttack(GetFirstPC(), 0)));
	}
}

void SetForm(object oTarget, int nForm) {
	GrantSpell(nForm, oTarget);
	DelayCommand(1.0, SetCurrentForm(oTarget, nForm));
}

void main() {
	switch( GetScriptParameter(1) ) {
		case 0:
			SetLocalBoolean(OBJECT_SELF, 51, 1);
			UT_DarkSml(GetPCSpeaker());
			break;
		case 1:
			SetLocalBoolean(OBJECT_SELF, 52, 1);
			UT_DarkSml(GetPCSpeaker());
			break;
		case 2:
			SetLocalBoolean(OBJECT_SELF, 53, 1);
			UT_DarkSml(GetPCSpeaker());
			break;
		case 3:
			// Updated to set lightsaber forms ~JC 2024-07-29
			object oAttacker = GetObjectByTag("npc_v_malak");
			SetForm(oAttacker, FORM_SABER_IV_ATARU);
			TSL_ResetVision(oAttacker);
			GN_DetermineCombatRound();
			oAttacker = GetObjectByTag("g_jedi1");
			SetForm(oAttacker, FORM_SABER_I_SHII_CHO);
			TSL_ResetVision(oAttacker);
			AttackPC(oAttacker);
			oAttacker = GetObjectByTag("g_jedi2");
			TSL_ResetVision(oAttacker);
			AttackPC(oAttacker);
			oAttacker = GetObjectByTag("g_jedi3");
			TSL_ResetVision(oAttacker);
			AttackPC(oAttacker);
			oAttacker = GetObjectByTag("g_jedi4");
			SetForm(oAttacker, FORM_SABER_I_SHII_CHO);
			TSL_ResetVision(oAttacker);
			AttackPC(oAttacker);
			oAttacker = GetObjectByTag("g_jedi5");
			TSL_ResetVision(oAttacker);
			AttackPC(oAttacker);
			TSL_BeginVision();
			break;
	}
}