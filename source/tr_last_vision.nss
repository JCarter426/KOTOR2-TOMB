#include "thematic_sith"

void main() {
	if( (GetGlobalNumber("711KOR_Vision_Track") <= 5) )
		return;
	object oEntering = GetEnteringObject();
	if( !GetIsPartyLeader(oEntering) )
		return;
	if(GetLocalBoolean(OBJECT_SELF, 34) )
		return;
	SetLocalBoolean(OBJECT_SELF, 34, TRUE);
	SetGlobalNumber("711KOR_Vision_Track", 9);
	TSL_BeginVision();
}