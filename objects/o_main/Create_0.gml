#region GAME STATES

enum e_game_states {
	editing,
	testing,
}

game_state = e_game_states.editing;

if (game_state == e_game_states.editing) room_goto(rm_editor);
if (game_state == e_game_states.testing) room_goto(rm_testing);

#endregion