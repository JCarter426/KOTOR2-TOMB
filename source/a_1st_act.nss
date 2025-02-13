#include "k_inc_fab"
#include "thematic_sith"

void main() {
	int nParam1 = GetScriptParameter(1);
	int nParam2 = GetScriptParameter(2);
	object Jedi;
	object o1stJedi;
	switch (nParam1) {
	case 0:
		o1stJedi = GetObjectByTag("wp_1st_jedi" + IntToString(nParam2), 0);
		Jedi = GetObjectByTag("g_jedi" + IntToString(nParam2), 0);
		AssignCommand(Jedi, ActionMoveToObject(o1stJedi, 0, 1.0));
		FAB_Face(Jedi, OBJECT_INVALID);
		DelayCommand(2.5, AssignCommand(Jedi, ClearAllActions()));
		DelayCommand(2.5, FAB_Face(Jedi, OBJECT_INVALID));
		break;
	case 1:
		SetGlobalNumber("711KOR_Vision_Track", 1);
		break;
	}
}