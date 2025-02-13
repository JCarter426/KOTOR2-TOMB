#include "k_inc_utility"
#include "thematic_sith"

void main() {
	switch( GetUserDefinedEventNumber() ) {
	case 1003: // SW_FLAG_EVENT_ON_COMBAT_ROUND_END
		if( TSL_ShouldVisionFail() ) {
			ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
			SurrenderToEnemies();
			AssignCommand(GetArea(GetFirstPC()), TSL_FailVision());
		}
		break;
	case 1006: // KOTOR_DEFAULT_EVENT_ON_DAMAGE
		if( GetCurrentHitPoints(OBJECT_SELF) < 5 && !GetLocalBoolean(OBJECT_SELF, 40) ) {
			SetLocalBoolean(OBJECT_SELF, 40, TRUE);
			SurrenderToEnemies();
			ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
			DestroyObject(OBJECT_SELF);
			AssignCommand(GetArea(GetFirstPC()), TSL_EndVision());
		}
		break;
	case 1100: // HOSTILE_RETREAT
		UT_ReturnToBase("wp_homebase");
		break;
	}
}