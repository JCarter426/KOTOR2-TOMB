#include "k_inc_fab"
#include "thematic_sith"

void main() {
	FAB_Spawn("g_mand_first", 0);
	FAB_Spawn("g_mand_first", 1);
	FAB_Spawn("g_mand_first", 2);
	FAB_Spawn("g_mand_first", 3);
	FAB_Spawn("g_mand_first", 4);
	FAB_Spawn("g_mand_first", 5);
	DelayCommand(1.0, TSL_BeginVision());
}