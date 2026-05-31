function get_custom_upgrade(controller, index)
	fixIndex = index % 5
	variable = math.floor(index/5) + 1
	n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "has_seen_episode_" .. variable .. "_intro" )
	return (math.floor(n / (3 ^ fixIndex))) % 3
end

LUI.ActionsControls.OptionsFeeder = function( f16_arg0 )
	local f16_local0 = {}
	Engine.ExecNow( "profile_menuDvarsSetup" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.OptionFactoryProfileData( "leanEnabled", "profile_toggleLean", "@LUA_MENU_LEAN_TOGGLE", {
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		},
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		}
	} )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@MENU_FIRE_WEAPON", "+attack" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@MENU_AIM_DOWN_THE_SIGHT", "+toggleads_throw" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@MENU_HOLD_AIM_DOWN_SIGHT", "+speed_throw" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@MENU_RELOAD_WEAPON", "+reload" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@MENU_SWITCH_WEAPON", "weapnext" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@PLATFORM_MELEEZOOM", "+melee_zoom" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@MENU_USE", "+activate" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@MENU_FRAG_EQUIPMENT", "+frag" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@MENU_THROW_SPECIAL_GRENADE", "+smoke" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( Engine.IsAliensMode() and "@ALIENS_CONTROLS_STRIKE_PACKAGE" or "@MENU_KILLSTREAK_REWARD_SLOT_1", "+actionslot 4" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( Engine.IsAliensMode() and "@ALIENS_CONTROLS_TEAM_AMMO" or "@MENU_KILLSTREAK_REWARD_SLOT_2", "+actionslot 1" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( Engine.IsAliensMode() and "@ALIENS_CONTROLS_TEAM_SUPPORT" or "@MENU_KILLSTREAK_REWARD_SLOT_3", "+actionslot 2" )
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( Engine.IsAliensMode() and "@ALIENS_CONTROLS_EQUALIZER" or "@MENU_KILLSTREAK_REWARD_SLOT_4", "+actionslot 3" )
	if get_custom_upgrade(Engine.GetFirstActiveController(), 9) == 2 and Engine.IsAliensMode() then
		f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( "@ALIENS_CONTROLS_TEAM_SUPPORT2", "+actionslot 5" )
	end
	f16_local0[#f16_local0 + 1] = LUI.ActionsControls.ControlBindFactory( Engine.IsAliensMode() and "ALIENS_UPGRADE_ABILITIES" or "@PLATFORM_UI_SHOW_SCORES", "togglescores" )
	return f16_local0
end