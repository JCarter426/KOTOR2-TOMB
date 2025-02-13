void TSL_BeginVision();
void TSL_ChangeKreiaVisionFaction(int nFaction);
void TSL_ChangePartyVisionFaction(int nFaction);
void TSL_CopyAlignment(object oFrom, object oTo);
void TSL_CopyAttributes(object oFrom, object oTo);
void TSL_CopyFeats(object oFrom, object oTo);
void TSL_CopyForms(object oFrom, object oTo);
void TSL_CopyForcePowers(object oFrom, object oTo);
void TSL_CopyForcePowersWithoutHealing(object oFrom, object oTo);
void TSL_CopyInventorySlot(object oFrom, object oTo, int nSlot);
void TSL_CopySkills(object oFrom, object oTo);
void TSL_EndVision();
void TSL_FailVision();
int TSL_FailedExileVision();
void TSL_GiveXP();
void TSL_HealPlayerForce();
void TSL_HealPlayerFull();
void TSL_HealPlayerMin();
void TSL_HealPlayerPartial();
int TSL_IsAnyPartyVisionAlive();
int TSL_IsKreiaVisionAlive();
int TSL_IsKreiaVisionHostile();
int TSL_IsPartyVisionHostile();
int TSL_IsVisionActive();
int TSL_IsVisionAlive(object obj);
void TSL_ResetVision(object obj);
int TSL_ShouldVisionEnd();
int TSL_ShouldVisionFail();


int tsl_CalcLightMasteryHP();
void tsl_EndMalakVision();
void tsl_EndMandalorianVision();
void tsl_EndPartyVision();
void tsl_EndExileVision();
void tsl_EndRevanVision();
void tsl_FailDefaultVision();
void tsl_FailExileVision();
void tsl_FailRevanVision();
void tsl_FakeDeath();
void tsl_HealFull(object obj);
void tsl_InitializePartyVision();
void tsl_InitializeRevanVision();
int tsl_ShouldMalakVisionEnd();
int tsl_ShouldMandalorianVisionEnd();
int tsl_ShouldPartyVisionEnd();
int tsl_ShouldExileVisionEnd();
int tsl_ShouldRevanVisionEnd();
void tsl_SpawnDarkExile();

void TSL_BeginVision() {
	// SendMessageToPC(GetFirstPC(), "Begin vision " + IntToString(GetGlobalNumber("711KOR_Vision_Track")));
	SetLocalBoolean(GetArea(GetFirstPC()), 30, TRUE);
	SetMinOneHP(GetFirstPC(), TRUE);
}

void TSL_ChangeKreiaVisionFaction(int nFaction) {
	object obj = GetObjectByTag("KreiaEvil");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	SetLocalBoolean(GetArea(GetFirstPC()), 31, nFaction == STANDARD_FACTION_HOSTILE_1);
}

void TSL_ChangePartyVisionFaction(int nFaction) {
	object obj = GetObjectByTag("Atton");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("Disciple");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("T3M4");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("Mira");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("Handmaiden");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("Mand");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("BaoDur");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("VisasMarr");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("G0T0");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("HK47");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	obj = GetObjectByTag("Hanharr");
	ChangeToStandardFaction(obj, nFaction);
	TSL_ResetVision(obj);
	SetLocalBoolean(GetArea(GetFirstPC()), 32, nFaction == STANDARD_FACTION_HOSTILE_1);
}

void TSL_CopyAlignment(object oFrom, object oTo) {
	AdjustAlignment(oTo, GetAlignmentGoodEvil(oFrom), abs(GetGoodEvilValue(oFrom) - GetGoodEvilValue(oTo)), TRUE);
}

void TSL_CopyAttributes(object oFrom, object oTo) {
	AdjustCreatureAttributes(oTo, ABILITY_STRENGTH, GetAbilityScore(oFrom, ABILITY_STRENGTH) - GetAbilityScore(oTo, ABILITY_STRENGTH));
	AdjustCreatureAttributes(oTo, ABILITY_DEXTERITY, GetAbilityScore(oFrom, ABILITY_DEXTERITY) - GetAbilityScore(oTo, ABILITY_DEXTERITY));
	AdjustCreatureAttributes(oTo, ABILITY_CONSTITUTION, GetAbilityScore(oFrom, ABILITY_CONSTITUTION) - GetAbilityScore(oTo, ABILITY_CONSTITUTION));
	AdjustCreatureAttributes(oTo, ABILITY_INTELLIGENCE, GetAbilityScore(oFrom, ABILITY_INTELLIGENCE) - GetAbilityScore(oTo, ABILITY_INTELLIGENCE));
	AdjustCreatureAttributes(oTo, ABILITY_WISDOM, GetAbilityScore(oFrom, ABILITY_WISDOM) - GetAbilityScore(oTo, ABILITY_WISDOM));
	AdjustCreatureAttributes(oTo, ABILITY_CHARISMA, GetAbilityScore(oFrom, ABILITY_CHARISMA) - GetAbilityScore(oTo, ABILITY_CHARISMA));
}

void TSL_CopyForms(object oFrom, object oTo) {
	int i;
	for( i = FORM_SABER_I_SHII_CHO; i <= FORM_SABER_VII_JUYO; ++i ) {
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
		if( IsFormActive(oFrom, i) )
			DelayCommand(1.0, SetCurrentForm(oTo, i));
	}
	for( i = FORM_FORCE_I_FOCUS; i <= FORM_FORCE_IV_MASTERY; ++i ) {
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
		if( IsFormActive(oFrom, i) )
			DelayCommand(1.0, SetCurrentForm(oTo, i));
	}
}

void TSL_CopyFeats(object oFrom, object oTo) {
	int i;
	for( i = 0; i <= 204; ++i )
		if( GetFeatAcquired(i, oFrom) )
			GrantFeat(i, oTo);
	for( i = 206; i <= 244; ++i )
		if( GetFeatAcquired(i, oFrom) )
			GrantFeat(i, oTo);
}

void TSL_CopyForcePowers(object oFrom, object oTo) {
	int i = 0;
	for( i = 0; i <= 63; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	for( i = 133; i <= 184; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	for( i = 200; i <= 201; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	for( i = 269; i <= 273; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
}

void TSL_CopyForcePowersWithoutHealing(object oFrom, object oTo) {
	int i = 0;
	for( i = 0; i <= 9; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	for( i = 12; i <= 14; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	for( i = 16; i <= 27; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	for( i = 29; i <= 63; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	if( GetSpellAcquired(133, oFrom) )
		GrantSpell(i, oTo);
	for( i = 135; i <= 184; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	for( i = 200; i <= 201; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
	for( i = 269; i <= 273; ++i )
		if( GetSpellAcquired(i, oFrom) )
			GrantSpell(i, oTo);
}

void TSL_CopyInventorySlot(object oFrom, object oTo, int nSlot) {
	AssignCommand(oTo, ActionUnequipItem(GetItemInSlot(nSlot, oTo), TRUE));
	DelayCommand(0.1, AssignCommand(oTo, ActionEquipItem(CreateItemOnObject(GetTag(GetItemInSlot(nSlot, oFrom)), oTo, 1, 1), nSlot, TRUE)));
}

void TSL_CopySkills(object oFrom, object oTo) {
	AdjustCreatureSkills(oTo, SKILL_COMPUTER_USE, GetSkillRankBase(SKILL_COMPUTER_USE, oFrom) - GetSkillRankBase(SKILL_COMPUTER_USE, oTo));
	AdjustCreatureSkills(oTo, SKILL_DEMOLITIONS, GetSkillRankBase(SKILL_DEMOLITIONS, oFrom) - GetSkillRankBase(SKILL_DEMOLITIONS, oTo));
	AdjustCreatureSkills(oTo, SKILL_STEALTH, GetSkillRankBase(SKILL_STEALTH, oFrom) - GetSkillRankBase(SKILL_STEALTH, oTo));
	AdjustCreatureSkills(oTo, SKILL_AWARENESS, GetSkillRankBase(SKILL_AWARENESS, oFrom) - GetSkillRankBase(SKILL_AWARENESS, oTo));
	AdjustCreatureSkills(oTo, SKILL_PERSUADE, GetSkillRankBase(SKILL_PERSUADE, oFrom) - GetSkillRankBase(SKILL_PERSUADE, oTo));
	AdjustCreatureSkills(oTo, SKILL_REPAIR, GetSkillRankBase(SKILL_REPAIR, oFrom) - GetSkillRankBase(SKILL_REPAIR, oTo));
	AdjustCreatureSkills(oTo, SKILL_SECURITY, GetSkillRankBase(SKILL_SECURITY, oFrom) - GetSkillRankBase(SKILL_SECURITY, oTo));
	AdjustCreatureSkills(oTo, SKILL_TREAT_INJURY, GetSkillRankBase(SKILL_TREAT_INJURY, oFrom) - GetSkillRankBase(SKILL_TREAT_INJURY, oTo));
}

void TSL_EndVision() {
	if( !GetLocalBoolean(GetArea(GetFirstPC()), 30) )
		return;
	// SendMessageToPC(GetFirstPC(), "Ending vision " + IntToString(GetGlobalNumber("711KOR_Vision_Track")) + "...");
	SetLocalBoolean(GetArea(GetFirstPC()), 30, FALSE);
	switch( GetGlobalNumber("711KOR_Vision_Track") ) {
	case 1:
		tsl_EndMalakVision();
		break;
	case 3:
		tsl_EndMandalorianVision();
		break;
	case 5:
		tsl_EndPartyVision();
		break;
	case 9:
		tsl_EndExileVision();
		break;
	case 10:
		tsl_EndRevanVision();
		break;
	}
	SetMinOneHP(GetFirstPC(), FALSE);
	IncrementGlobalNumber("711KOR_Vision_Track", 1);
}

int TSL_FailedExileVision() {
	if( GetLocalBoolean(GetArea(GetFirstPC()), 33) )
		return TRUE;
	return FALSE;
}


void TSL_FailVision() {
	// SendMessageToPC(GetFirstPC(), "Failing vision " + IntToString(GetGlobalNumber("711KOR_Vision_Track")) + "...");
	switch( GetGlobalNumber("711KOR_Vision_Track") ) {
	case 9:
		tsl_FailExileVision();
		break;
	case 10:
		tsl_FailRevanVision();
		break;
	default:
		tsl_FailDefaultVision();
		break;
	}
}

void TSL_GiveXP() {
	SetXP(GetFirstPC(), (GetHitDice(OBJECT_SELF) - 1) * 50 + GetXP(GetFirstPC()));
}

void TSL_HealPlayerForce() {
	object oPC = GetFirstPC();
	AssignCommand(oPC, ClearAllEffects());
	int nHeal = GetMaxForcePoints(oPC) - GetCurrentForcePoints(oPC);
	if( nHeal > 0 )
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHealForcePoints(nHeal), oPC);
}

void TSL_HealPlayerFull() {
	object oPC = GetFirstPC();
	AssignCommand(oPC, ClearAllEffects());
	int nHeal = GetMaxHitPoints(oPC) - GetCurrentHitPoints(oPC);
	if( nHeal > 0 )
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oPC);
	nHeal = GetMaxForcePoints(oPC) - GetCurrentForcePoints(oPC);
	if( nHeal > 0 )
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHealForcePoints(nHeal), oPC);
}

void TSL_HealPlayerMin() {
	object oPC = GetFirstPC();
	AssignCommand(oPC, ClearAllEffects());
	int nHeal = 5 + tsl_CalcLightMasteryHP() - GetCurrentHitPoints(oPC);
	if( nHeal > 0 )
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oPC);
}

void TSL_HealPlayerPartial() {
	object oPC = GetFirstPC();
	AssignCommand(oPC, ClearAllEffects());
	int nHeal = (GetMaxHitPoints(oPC) + 3) / 4 - GetCurrentHitPoints(oPC);
	if( nHeal > 0 )
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oPC);
	nHeal = (GetMaxForcePoints(oPC) + 3) / 4 - GetCurrentForcePoints(oPC);
	if( nHeal > 0 )
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHealForcePoints(nHeal), oPC);
}

int TSL_IsAnyPartyVisionAlive() {
	if( TSL_IsVisionAlive(GetObjectByTag("Atton")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("Disciple")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("T3M4")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("Mira")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("Handmaiden")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("Mand")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("BaoDur")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("VisasMarr")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("G0T0")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("HK47")) )
		return TRUE;
	if( TSL_IsVisionAlive(GetObjectByTag("Hanharr")) )
		return TRUE;
	return FALSE;
}

int TSL_IsKreiaVisionAlive() {
	return TSL_IsVisionAlive(GetObjectByTag("KreiaEvil"));
}

int TSL_IsKreiaVisionHostile() {
	if( GetLocalBoolean(GetArea(GetFirstPC()), 31) )
		return TRUE;
	return FALSE;
}

int TSL_IsPartyVisionHostile() {
	if( GetLocalBoolean(GetArea(GetFirstPC()), 32) )
		return TRUE;
	return FALSE;
}

int TSL_IsVisionActive() {
	return GetLocalBoolean(GetArea(GetFirstPC()), 30);
}
			
int TSL_IsVisionAlive(object obj) {
	if ( obj == OBJECT_INVALID )
		return FALSE;
	if( GetCurrentHitPoints(obj) < 5 )
		return FALSE;
	return TRUE;
}

void TSL_ResetVision(object obj) {
	SetLocalBoolean(obj, 40, FALSE);
}

int TSL_ShouldVisionEnd() {
	switch( GetGlobalNumber("711KOR_Vision_Track") ) {
	case 1: return tsl_ShouldMalakVisionEnd();
	case 3: return tsl_ShouldMandalorianVisionEnd();
	case 5: return tsl_ShouldPartyVisionEnd();
	case 9: return tsl_ShouldExileVisionEnd();
	case 10: return tsl_ShouldRevanVisionEnd();
	}
	return FALSE;
}

int TSL_ShouldVisionFail() {
	if( GetCurrentHitPoints(GetFirstPC()) < 5 )
		return TRUE;
	return FALSE;
}

int tsl_CalcLightMasteryHP() {
	object oPC = GetFirstPC();
	if( GetGoodEvilValue(oPC) < 100 )
		return 0;
	int nBonus = 0;
	if( GetLevelByClass(CLASS_TYPE_JEDISENTINEL, oPC) > 0 )
		nBonus += 3;
	if( GetLevelByClass(CLASS_TYPE_JEDIWATCHMAN, oPC) > 0 )
		nBonus += 3;
	if( GetLevelByClass(CLASS_TYPE_SITHASSASSIN, oPC) > 0 )
		nBonus += 3;
	if( (GetAbilityScore(oPC, ABILITY_CONSTITUTION) - nBonus) % 2 != 0 )
		nBonus += 1;
	return (nBonus / 2) * GetHitDice(oPC);	
}

void tsl_EndMalakVision() {
	// SendMessageToPC(GetFirstPC(), "Ending Malak vision...");
	TSL_HealPlayerMin();
	TSL_HealPlayerForce();
	DelayCommand(1.0, AddJournalQuestEntry("hidden_power", 40, 0));
	DestroyObject(GetObjectByTag("npc_v_malak"));
	int i;
	for( i = 1; i <= 5; ++i )
		DestroyObject(GetObjectByTag("g_jedi" + IntToString(i)));
	AssignCommand(GetFirstPC(), ClearAllEffects());
	i = 0;
	object oDoor = GetObjectByTag("711_norm_door", i);
	while( GetIsObjectValid(oDoor) ) {
		SetLocked(oDoor, FALSE);
		SetPlotFlag(oDoor, FALSE);
		oDoor = GetObjectByTag("711_norm_door", i++);
	}
	tsl_InitializePartyVision();
	// Make Hsssiss invisible
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(8000), GetObjectByTag("Hssiss"));
}

void tsl_EndMandalorianVision() {
	// SendMessageToPC(GetFirstPC(), "Ending Mandalorian vision...");
	TSL_HealPlayerMin();
	TSL_HealPlayerForce();
	DelayCommand(1.0, AddJournalQuestEntry("hidden_power", 50, 0));
	object obj = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
	string s = "";
	while( GetIsObjectValid(obj) ) {
		s = GetStringLeft(GetTag(obj), 6);
		if( s == "g_reps" || s == "g_mand" ) {
			AssignCommand(obj, SurrenderToEnemies());
			AssignCommand(obj, CancelCombat(GetFirstPC()));
			DestroyObject(obj);
		}
		obj = GetNextObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
	}
	int i = 0;
	object oDoor = GetObjectByTag("711_2nd_door", i);
	while( GetIsObjectValid(oDoor) ) {
		SetLocked(oDoor, FALSE);
		SetPlotFlag(oDoor, FALSE);
		oDoor = GetObjectByTag("711_2nd_door", i++);
	}
}

void tsl_EndPartyVision() {
	// SendMessageToPC(GetFirstPC(), "Ending party vision...");
	TSL_HealPlayerMin();
	TSL_HealPlayerForce();
	object obj = GetObjectByTag("KreiaEvil");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("Atton");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("Disciple");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("Hanharr");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("HK47");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("T3M4");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("G0T0");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("Mira");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("Handmaiden");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("Mand");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("BaoDur");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	obj = GetObjectByTag("VisasMarr");
	AssignCommand(obj, ClearAllActions());
	AssignCommand(obj, DestroyObject(obj));
	int i = 0;
	object oDoor = GetObjectByTag("711_last_door", i);
	while( GetIsObjectValid(oDoor) ) {
		SetLocked(oDoor, FALSE);
		SetPlotFlag(oDoor, FALSE);
		oDoor= GetObjectByTag("711_last_door", i++);
	}
	tsl_InitializeRevanVision();
}

void tsl_EndExileVision() {
	if( !TSL_FailedExileVision() )
		TSL_HealPlayerFull();
	AssignCommand(GetFirstPC(), ClearAllEffects());
	DestroyObject(GetObjectByTag("g_darkpc"));
	object oRevan = GetObjectByTag("revan_fake");
	if( !GetIsObjectValid(oRevan) )
		return;
	AssignCommand(oRevan, ClearAllActions());
	AssignCommand(oRevan, ActionWait(1.0));
	AssignCommand(oRevan, ActionStartConversation(GetFirstPC(), "revan", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
	DelayCommand(1.0, AssignCommand(oRevan, TSL_BeginVision()));
}

void tsl_EndRevanVision() {
	// SendMessageToPC(GetFirstPC(), "Ending Revan vision...");
	int bFail = TSL_ShouldVisionFail();
	TSL_HealPlayerMin();
	TSL_HealPlayerForce();
	int i = 0;
	object oDoor = GetObjectByTag("crypt_door", i);
	while( GetIsObjectValid(oDoor) ) {
		SetLocked(oDoor, FALSE);
		SetPlotFlag(oDoor, FALSE);
		oDoor = GetObjectByTag("crypt_door", i++);
	}
	object oEnd = GetObjectByTag("rev_end");
	AssignCommand(oEnd, ClearAllActions());
	AssignCommand(oEnd, ActionWait(2.0));
	if( bFail ) {
		DelayCommand(0.5, AssignCommand(oEnd, ActionStartConversation(GetFirstPC(), "rev_end", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else {
		if(TSL_FailedExileVision() )
			GiveXPToCreature(GetFirstPC(), 500);
		else
			GiveXPToCreature(GetFirstPC(), 1000);
		DelayCommand(0.5, AssignCommand(oEnd, ActionStartConversation(GetFirstPC(), "kreia_tm", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		DestroyObject(GetObjectByTag("revan_fake"));
	}
}

void tsl_FailDefaultVision() {
	// SendMessageToPC(GetFirstPC(), "Failing vision... (" + IntToString(GetGlobalNumber("711KOR_Vision_Track")) + ")");
	NoClicksFor(1.2);
	AssignCommand(GetFirstPC(), ClearAllActions());
	tsl_FakeDeath();
	TSL_EndVision();
}

void tsl_FailExileVision() {
	// SendMessageToPC(GetFirstPC(), "Failing Exile vision...");
	TSL_HealPlayerMin();
	SetLocalBoolean(GetArea(GetFirstPC()), 33, TRUE);
	NoClicksFor(4.0);
	AssignCommand(GetFirstPC(), ClearAllActions());
	DelayCommand(0.5, AssignCommand(GetFirstPC(), ActionPlayAnimation(ANIMATION_LOOPING_DEAD, 1.0, -1.0)));
	DelayCommand(2.0, AssignCommand(GetObjectByTag("g_darkpc"), ActionPlayAnimation(ANIMATION_FIREFORGET_BOW)));
	DelayCommand(3.0, TSL_EndVision());
}

void tsl_FailRevanVision() {
	// SendMessageToPC(GetFirstPC(), "Failing Revan vision...");
	// IncrementGlobalNumber("711KOR_Vision_Track", 1);
	TSL_EndVision();
}

void tsl_FakeDeath() {
	object oDeath = GetObjectByTag("death_invis");
	if (GetIsObjectValid(oDeath)) {
		AssignCommand(oDeath, DelayCommand(0.5, ClearAllActions()));
		AssignCommand(oDeath, DelayCommand(0.5, ActionStartConversation(GetFirstPC(), "pc_death", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
}

void tsl_HealFull(object obj) {
	int nAmount = GetMaxHitPoints(obj) - GetCurrentHitPoints(obj);
	if( nAmount > 0 )
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nAmount), obj);
	nAmount = GetMaxForcePoints(obj) - GetCurrentForcePoints(obj);
	if( nAmount > 0 )
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHealForcePoints(nAmount), obj);
}
	
void tsl_InitializePartyVision() {
	object oFakeKreia = GetObjectByTag("KreiaEvil");
	object oKreia = SpawnAvailableNPC(NPC_KREIA, GetLocation(GetObjectByTag("i_mandcs")));
	DelayCommand(0.1, EnableRendering(oKreia, FALSE));
	DelayCommand(0.1, TSL_CopyAlignment(oKreia, oFakeKreia));
	DelayCommand(0.1, TSL_CopyAttributes(oKreia, oFakeKreia));
	DelayCommand(0.1, TSL_CopyFeats(oKreia, oFakeKreia));
	DelayCommand(0.1, TSL_CopyForms(oKreia, oFakeKreia));
	DelayCommand(0.1, TSL_CopyForcePowers(oKreia, oFakeKreia));
	DelayCommand(0.1, TSL_CopySkills(oKreia, oFakeKreia));
	DelayCommand(0.1, TSL_CopyInventorySlot(oKreia, oFakeKreia, INVENTORY_SLOT_BODY));
	object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oKreia);
	int nWeaponType = GetBaseItemType(oWeapon);
	if( nWeaponType == BASE_ITEM_LIGHTSABER || nWeaponType == BASE_ITEM_SHORT_LIGHTSABER || nWeaponType == BASE_ITEM_DOUBLE_BLADED_LIGHTSABER ) {
		TSL_CopyInventorySlot(oKreia, oFakeKreia, INVENTORY_SLOT_RIGHTWEAPON);
	}
	else {
		AssignCommand(oFakeKreia, ActionUnequipItem(oWeapon, TRUE));
		DelayCommand(0.1, AssignCommand(oFakeKreia, ActionEquipItem(CreateItemOnObject("g_w_lghtsbr05", oFakeKreia, 1, TRUE), INVENTORY_SLOT_RIGHTWEAPON, TRUE)));
	}
	DelayCommand(0.1, TSL_CopyInventorySlot(oKreia, oFakeKreia, INVENTORY_SLOT_HEAD));
	DelayCommand(0.1, TSL_CopyInventorySlot(oKreia, oFakeKreia, INVENTORY_SLOT_HANDS));
	DelayCommand(0.1, TSL_CopyInventorySlot(oKreia, oFakeKreia, INVENTORY_SLOT_LEFTARM));
	DelayCommand(0.1, TSL_CopyInventorySlot(oKreia, oFakeKreia, INVENTORY_SLOT_RIGHTARM));
	DelayCommand(0.1, TSL_CopyInventorySlot(oKreia, oFakeKreia, INVENTORY_SLOT_IMPLANT));
	DelayCommand(0.1, TSL_CopyInventorySlot(oKreia, oFakeKreia, INVENTORY_SLOT_BELT));
	DelayCommand(0.5, tsl_HealFull(oFakeKreia));
	DelayCommand(0.5, SetLightsaberPowered(oFakeKreia, TRUE, FALSE, FALSE));
	DelayCommand(0.5, DestroyObject(oKreia, 0.0, TRUE, 0.0, TRUE));
}

void tsl_InitializeRevanVision() {
	SetLocalBoolean(GetArea(GetFirstPC()), 33, FALSE); // Dark Exile not dead yet
	object oFakeRevan = GetObjectByTag("revan_fake");
	location locRevan = GetLocation(oFakeRevan);
	AssignCommand(oFakeRevan, ActionJumpToLocation(GetLocation(GetObjectByTag("i_mandcs"))));
	DelayCommand(0.2, AssignCommand(oFakeRevan, DestroyObject(oFakeRevan)));
	string sRevanTemplate = "";
	int nForm = -1;
	int isDark = GetGlobalNumber("101PER_Revan_End") == 1;
	if( GetGlobalNumber("Revan_Class") == CLASS_TYPE_JEDICONSULAR ) {
		if( isDark ) {
			sRevanTemplate = "them_revan_djc";
			nForm = FORM_FORCE_I_FOCUS;
		}
		else {
			sRevanTemplate = "them_revan_jc";
			nForm = FORM_FORCE_I_FOCUS;
		}
	}
	else {
		if( isDark ) {
			sRevanTemplate = "them_revan_djg";
			nForm = FORM_SABER_VII_JUYO;
		}
		else {
			sRevanTemplate = "them_revan_jg";
			nForm = FORM_SABER_II_MAKASHI;
		}
	}
	object oMyRevan = CreateObject(OBJECT_TYPE_CREATURE, sRevanTemplate, locRevan);
	DelayCommand(0.4, AssignCommand(oMyRevan, ActionJumpToLocation(locRevan)));
	DelayCommand(0.5, tsl_HealFull(oMyRevan));
	DelayCommand(1.0, GrantSpell(nForm, oMyRevan));
	DelayCommand(3.0, SetCurrentForm(oMyRevan, nForm));
	DelayCommand(0.5, tsl_SpawnDarkExile());
	DelayCommand(1.0, TSL_ResetVision(oMyRevan));
	if( !isDark )
		DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSavingThrowIncrease(SAVING_THROW_ALL, 60), oMyRevan));
}

int tsl_ShouldMalakVisionEnd() {
	return !TSL_IsVisionAlive(GetObjectByTag("npc_v_malak"))
		&& !TSL_IsVisionAlive(GetObjectByTag("g_jedi1"))
		&& !TSL_IsVisionAlive(GetObjectByTag("g_jedi2"))
		&& !TSL_IsVisionAlive(GetObjectByTag("g_jedi3"))
		&& !TSL_IsVisionAlive(GetObjectByTag("g_jedi4"))
		&& !TSL_IsVisionAlive(GetObjectByTag("g_jedi5"));
}

int tsl_ShouldMandalorianVisionEnd() {
	object obj = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
	while( obj != OBJECT_INVALID ) {
		if( GetStringLeft(GetTag(obj), 6) == "g_mand" && TSL_IsVisionAlive(obj) )
			return FALSE;
		obj = GetNextObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
	}
	return TRUE;
}

int tsl_ShouldPartyVisionEnd() {
	int isKreiaHostile = TSL_IsKreiaVisionHostile();
	int isPartyHostile = TSL_IsPartyVisionHostile();
	if( isKreiaHostile && isPartyHostile )
		return !TSL_IsKreiaVisionAlive() && !TSL_IsAnyPartyVisionAlive();
	else if( isKreiaHostile )
		return !TSL_IsKreiaVisionAlive();
	else if( isPartyHostile )
		return !TSL_IsAnyPartyVisionAlive();
	return FALSE;
}

int tsl_ShouldExileVisionEnd() {
	if( TSL_IsVisionAlive(GetObjectByTag("g_darkpc")) )
		return FALSE;
	return TRUE;
}

int tsl_ShouldRevanVisionEnd() {
	if( TSL_IsVisionAlive(GetObjectByTag("revan_fake")) )
		return FALSE;
	return TRUE;
}

void tsl_SpawnDarkExile() {
	object oPC = GetFirstPC();
	object oWP = GetObjectByTag("wp_pcfoil");
	// Female
	string sGender = "m";
	if( !GetGlobalBoolean("000_PLAYER_GENDER") )
		sGender = "f";
	string sClass = "js";
	int nClass = GetClassByPosition(1, oPC);
	if( nClass == CLASS_TYPE_JEDICONSULAR || nClass == CLASS_TYPE_JEDIMASTER || nClass == CLASS_TYPE_SITHLORD )
		sClass = "jc";
	if( nClass == CLASS_TYPE_JEDIGUARDIAN || nClass == CLASS_TYPE_JEDIWEAPONMASTER || nClass == CLASS_TYPE_SITHMARAUDER )
		sClass = "jg";
	object oDarkExile = CreateObject(OBJECT_TYPE_CREATURE, "them_" + sGender + "exile_" + sClass, GetLocation(oWP));
	DelayCommand(0.1, TSL_CopyAlignment(oPC, oDarkExile));
	DelayCommand(0.1, TSL_CopyAttributes(oPC, oDarkExile));
	DelayCommand(0.1, TSL_CopyFeats(oPC, oDarkExile));
	DelayCommand(0.1, TSL_CopyForms(oPC, oDarkExile));
	DelayCommand(0.1, TSL_CopyForcePowersWithoutHealing(oPC, oDarkExile));
	DelayCommand(0.1, TSL_CopySkills(oPC, oDarkExile));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_BODY));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_BODY));
	DelayCommand(0.6, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_LEFTWEAPON));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_RIGHTWEAPON));
	DelayCommand(0.6, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_LEFTWEAPON2));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_RIGHTWEAPON2));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_HEAD));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_HANDS));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_LEFTARM));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_RIGHTARM));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_IMPLANT));
	DelayCommand(0.1, TSL_CopyInventorySlot(oPC, oDarkExile, INVENTORY_SLOT_BELT));
	DelayCommand(0.1, DuplicateHeadAppearance(oDarkExile, oPC));
	DelayCommand(0.5, tsl_HealFull(oDarkExile));
	DelayCommand(1.0, SetLightsaberPowered(oDarkExile, TRUE, FALSE, FALSE));
	DelayCommand(1.0, TSL_ResetVision(oDarkExile));
	// Balance correction
	int nAC = GetAC(oDarkExile) - GetAC(oPC);
	if( nAC > 0 )
		DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectACDecrease(nAC), oDarkExile));
}