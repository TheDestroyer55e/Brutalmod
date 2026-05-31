LUI.mp_menus.MPLivePrivateLobby.StartGameOrReadyUpAction = function( f1_arg0, f1_arg1 )
	if Lobby.UsingReadyUpFeature() then
		if not Lobby.GetLocalReadyUpFlag() then
			Lobby.SetLocalReadyUpFlag()
			f1_arg0:dispatchEventToRoot( {
				name = "refresh_ready_up"
			} )
			return 
		elseif not Lobby.GetPartyReadyUpStatus() then
			return 
		end
	end
	if Engine.GetDvarString( "ui_gametype" ) == "horde" then
		Lobby.SetBotsConnectType( 0 )
	elseif not Engine.IsAliensMode() and Lobby.GetBotsConnectType() == 0 then
		Lobby.SetBotsConnectType( 1 )
	end
	if not string.match(Engine.GetDvarString( "fs_game" ), "/mod") then
		Engine.Exec( "xstoplobbybackout leavelobbywarning", f1_arg1.controller )
		Engine.Exec( "xblive_privatematch 0", f1_arg1.controller )
		if Engine.GetDvarString( "ui_mapname" ) == "mp_alien_town" then
			Engine.ExecNow( "set fs_game mods/modtown" )
			Engine.Exec("loadmod mods/modtown")
		elseif Engine.GetDvarString( "ui_mapname" ) == "mp_alien_armory" then
			Engine.ExecNow( "set fs_game mods/modarmory" )
			Engine.Exec("loadmod mods/modarmory")
		elseif Engine.GetDvarString( "ui_mapname" ) == "mp_alien_beacon" then
			Engine.ExecNow( "set fs_game mods/modbeacon" )
			Engine.Exec("loadmod mods/modbeacon")
		end
		local diff = tostring(LUI.mp_menus.Aliens.ExtinctionDetermineDifficulty())
		if isAliensSolo() then
			diff = diff + 10
		end
		Engine.Exec("set facebook_password " .. diff)
		Engine.Exec("vid_restart")
	end
	f1_arg0:dispatchEventToRoot( {
		name = "start_transition_to_game",
		immediate = true
	} )
end

function HandleStartTheGame( f2_arg0, f2_arg1 )
	LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), false, "TransitionToGame" )
	Engine.Exec( "xpartygo" )
end

function GameSetupAction( f3_arg0, f3_arg1, f3_arg2 )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "gamesetup_menu_main", true, f3_arg1.controller, false, {
		isSoloMode = f3_arg2
	} )
end

function CreateSquadAction( f4_arg0, f4_arg1 )
	local f4_local0 = false
	local f4_local1 = true
	Cac.SetEditSquadMember( Cac.GetActiveSquadMember( f4_arg1.controller ) )
	LUI.FlowManager.RequestAddMenu( f4_arg0, "cac_edit_main", f4_local1, f4_arg1.controller, f4_local0, {
		open_char_list = true,
		classLocation = "loadouts",
		squadLocation = "privateMatchSquadMembers",
		squadMemberIndex = Cac.GetEditSquadMember(),
		allowMemberSwap = true
	} )
end

function RefreshButtonDisable( f5_arg0, f5_arg1 )
	assert( f5_arg0.properties.disabledFunc )
	local f5_local0 = f5_arg0.properties.disabledFunc()
	if f5_local0 and not f5_arg0.disabled then
		f5_arg0:processEvent( {
			name = "disable"
		} )
	elseif not f5_local0 and f5_arg0.disabled then
		f5_arg0:processEvent( {
			name = "enable"
		} )
	end
end

function LivePrivateLobbyMenuCreate( f6_arg0, f6_arg1 )
	LUI.FlowManager.RequestSetStack( f6_arg0, {
		{
			name = "mp_main_menu"
		},
		{
			name = "menu_xboxlive"
		}
	} )
	local f6_local0 = Engine.GetFirstActiveController()
	f6_arg0:dispatchEventToRoot( LUI.ButtonHelperText.CommonEvents.addBackButton )
	f6_arg0:processEvent( LUI.ButtonHelperText.CommonEvents.addGameSummaryButton )
	if not Engine.IsAliensMode() then
		MLG.Refresh( f6_arg0 )
	end
	if Engine.IsAliensMode() then
		LUI.mp_menus.Aliens.AliensRunConfig( f6_local0 )
		LUI.mp_menus.Aliens.InitGameTypeToAliens()
	end
	TryForceOpenAfterActionReport( f6_arg0, f6_arg1 )
	if Lobby.IsGameHost() and Engine.GetDvarString( "ui_gametype" ) == "horde" and not Engine.IsAliensMode() then
		local f6_local1 = Lobby.GetMemberCount( Lobby.MemberListStates.Lobby )
		assert( f6_local1 > 0 )
		if f6_local1 > CoD.MaxSafeguardPlayers then
			MatchRules.SetData( "gametype", "war" )
			MatchRules.LoadMatchRulesDataDefault()
		end
	end
	RefreshMLGRules( f6_arg0, f6_local0 )
	Cac.ValidateAllPlayersPrivateSquadMembers()
end

function LivePrivateLobbyMenuSpeechHandler( f7_arg0, f7_arg1 )
	if Engine.HasSpeechFeature() then
		LUI.Speech.ProcessActionEvent( f7_arg0, f7_arg1, Kinect.LobbySpeechGrammarHandlersArray )
	end
end

function RequestExitPrivateLobby( f8_arg0, f8_arg1 )
	if Engine.HasSpeechFeature() and LUI.MenuAutoNav.IsRunning() then
		LUI.mp_menus.mpLobbyWidgets.leaveLobbyAndPartyYesActionWithExitLobby( f8_arg0, f8_arg1 )
	elseif IsOurPrivatePartyHostInLobby() then
		LUI.FlowManager.RequestPopupMenu( f8_arg0, "leavelobbyandpartywarning", true, f8_arg1.controller, false, {} )
	else
		LUI.FlowManager.RequestPopupMenu( f8_arg0, "leavelobbywarning", true, f8_arg1.controller, false, {} )
	end
end

function UpdateStartGameOrReadyUpText( f9_arg0, f9_arg1 )
	if not f9_arg0.properties.is_exiting then
		if GetStartGameOrReadyUpDisableValue( f9_arg0, f9_arg1 ) then
			if not f9_arg0.disabled then
				f9_arg0:processEvent( {
					name = "disable"
				} )
			end
		elseif f9_arg0.disabled then
			f9_arg0:processEvent( {
				name = "enable"
			} )
		end
		f9_arg0:setText( GetStartGameOrReadyUpDisplayString( f9_arg0, f9_arg1 ) )
	end
end

function GetStartGameOrReadyUpDisableValue()
	if Lobby.UsingReadyUpFeature() then
		if not Lobby.GetLocalReadyUpFlag() then
			return false
		elseif not Lobby.GetPartyReadyUpStatus() then
			return true
		end
	end
	if not IsGameHost() then
		return true
	elseif not Engine.PartyEveryoneHasMap( Engine.GetDvarString( "ui_mapname" ) ) then
		return true
	elseif Lobby.IsPartyHostWaitingOnMembers() then
		return true
	elseif not Lobby.PartyClientsUpToDate() then
		return true
	elseif Engine.GetDvarString( "ui_gametype" ) == "horde" and Lobby.GetMemberCount( Lobby.MemberListStates.Lobby ) > CoD.MaxSafeguardPlayers then
		return true
	end
	return false
end

function GetStartGameOrReadyUpDisplayString( f11_arg0, f11_arg1 )
	if Lobby.UsingReadyUpFeature() then
		if not Lobby.GetLocalReadyUpFlag() then
			return Engine.Localize( "@LUA_MENU_READY_UP_CAPS" )
		elseif not Lobby.GetPartyReadyUpStatus() then
			return Engine.Localize( "@LUA_MENU_WAITING_FOR_OTHER_PLAYERS_CAPS" )
		end
	end
	if IsGameHost() then
		return Engine.Localize( "@LUA_MENU_START_GAME_CAPS" )
	end
	return Engine.Localize( "@LUA_MENU_WAITING_FOR_HOST_CAPS" )
end

function GetStartGameOrReadyUpDescText( f12_arg0, f12_arg1 )
	if Lobby.UsingReadyUpFeature() then
		if not Lobby.GetLocalReadyUpFlag() then
			return Engine.Localize( "@LUA_MENU_DESC_READY_UP" )
		elseif not Lobby.GetPartyReadyUpStatus() then
			return Engine.Localize( "@LUA_MENU_DESC_WAITING_FOR_OTHER_PLAYERS" )
		end
	end
	if GetStartGameOrReadyUpDisableValue() then
		if Engine.GetDvarString( "ui_gametype" ) == "horde" then
			return Engine.Localize( "@LUA_MENU_DESC_TOO_MANY_PLAYERS_HORDE" )
		elseif Lobby.IsPartyHostWaitingOnMembers() then
			return Engine.Localize( "@LUA_MENU_DESC_LOCKED_WAITING_FOR_PARTY_MEMBERS" )
		elseif not Engine.PartyEveryoneHasMap( Engine.GetDvarString( "ui_mapname" ) ) then
			return Engine.Localize( "@LUA_MENU_MP_DESC_PLAYERS_MISSING_MAP", Engine.Localize( "@" .. Engine.TableLookup( "mp/mapNames.csv", 0, Engine.GetDvarString( "ui_mapname" ), 1 ) ) )
		end
		return Engine.Localize( "@LUA_MENU_DESC_START_MATCH_LOCKED" )
	end
	return Engine.Localize( "@LUA_MENU_DESC_START_MATCH" )
end

function getSetupButtonDescText( f13_arg0, f13_arg1 )
	local f13_local0 = ""
	if IsGameHost() then
		if Engine.IsAliensMode() then
			f13_local0 = Engine.Localize( "@LUA_MENU_DESC_GAME_SETUP_ALIENS" )
		else
			f13_local0 = Engine.Localize( "@LUA_MENU_DESC_GAME_SETUP" )
		end
	else
		f13_local0 = Engine.Localize( "@LUA_MENU_DESC_GAME_SETUP_LOCKED" )
	end
	return f13_local0
end

function getMapSetupButtonDescText( f14_arg0, f14_arg1 )
	local f14_local0 = ""
	if IsGameHost() then
		f14_local0 = Engine.Localize( "@MENU_DESC_CHANGE_MAP" )
	else
		f14_local0 = Engine.Localize( "@LUA_MENU_DESC_GAME_SETUP_LOCKED" )
	end
	return f14_local0
end

function getDifficultySetupButtonDescText( f15_arg0, f15_arg1 )
	local f15_local0 = ""
	if IsGameHost() then
		if LUI.mp_menus.Aliens.IsChaosEnabled() then
			f15_local0 = Engine.Localize( "@ALIENS_CHAOS_DIFF_DESC" )
		else
			f15_local0 = Engine.Localize( "@LUA_MENU_MP_DIFFICULTY_DESC" )
		end
	else
		f15_local0 = Engine.Localize( "@LUA_MENU_DESC_GAME_SETUP_LOCKED" )
	end
	return f15_local0
end

function getModeSetupButtonDescText( f16_arg0, f16_arg1 )
	local f16_local0 = ""
	if IsGameHost() then
		f16_local0 = Engine.Localize( "@ALIENS_GAME_MODE_DESC" )
	else
		f16_local0 = Engine.Localize( "@LUA_MENU_DESC_GAME_SETUP_LOCKED" )
	end
	return f16_local0
end

ExtinctionSetDifficlutyDvars = function( f62_arg0 )
	if f62_arg0 == ExtinctionDifficluty.Easy then
		Engine.ExecNow( "set scr_aliens_promode 0" )
		Engine.ExecNow( "set scr_aliens_hardcore 0" )
		Engine.ExecNow( "set scr_aliens_ricochet 0" )
		Engine.ExecNow( "set scr_aliens_casual 1" )
	elseif f62_arg0 == ExtinctionDifficluty.Hard then
		Engine.ExecNow( "set scr_aliens_promode 0" )
		Engine.ExecNow( "set scr_aliens_hardcore 1" )
		Engine.ExecNow( "set scr_aliens_ricochet 1" )
		Engine.ExecNow( "set scr_aliens_casual 0" )
	elseif f62_arg0 == ExtinctionDifficluty.Brutal then
		Engine.ExecNow( "set scr_aliens_promode 1" )
		Engine.ExecNow( "set scr_aliens_hardcore 1" )
		Engine.ExecNow( "set scr_aliens_ricochet 1" )
		Engine.ExecNow( "set scr_aliens_casual 0" )
	elseif f62_arg0 == ExtinctionDifficluty.Veteran then
		Engine.ExecNow( "set scr_aliens_promode 2" )
		Engine.ExecNow( "set scr_aliens_hardcore 1" )
		Engine.ExecNow( "set scr_aliens_ricochet 1" )
		Engine.ExecNow( "set scr_aliens_casual 0" )
	else
		Engine.ExecNow( "set scr_aliens_promode 0" )
		Engine.ExecNow( "set scr_aliens_hardcore 0" )
		Engine.ExecNow( "set scr_aliens_ricochet 0" )
		Engine.ExecNow( "set scr_aliens_casual 0" )
	end
	if IsPrivateMatch() then
		Lobby.SetExtinctionDifficulty( f62_arg0 )
	end
end

LUI.mp_menus.MPLivePrivateLobby.LivePrivateLobbyOptionsFeeder = function( f17_arg0 )
	local f17_local0 = {}
	local f17_local1 = Engine.IsAliensMode()
	local f17_local2 = f17_arg0.aliensSoloMode
	if not f17_arg0.slot then
		DebugPrint( "[WARNING] CAC: using cac slot index 0, this is only ok if you are editing a menu" )
		local f17_local3 = 0
	end
	local f17_local4 = Cac.GetCustomClassLoc( f17_arg0.classLocation )
	if string.match(Engine.GetDvarString( "fs_game" ), "/mod") then
		local matchdata = tonumber( Engine.GetDvarString( "facebook_password" ) )
		diff = matchdata % 10
		ExtinctionSetDifficlutyDvars( diff )
		solo = math.floor(matchdata/10)
		if (solo == 1) then
			Engine.SetDvarInt( "sv_maxclients", 1 )
		else
			Engine.SetDvarInt( "sv_maxclients", 4 )
		end
		f17_local0[#f17_local0 + 1] = {
			type = "UIGenericButton",
			id = "start_match_button_id",
			disabledFunc = MBh.EmitEventToRoot( {
				name = "lobby_transition_to_game",
				dispatchChildren = true,
				immediate = true
			} ),
			properties = {
				disabledFunc = LUI.mp_menus.MPLivePrivateLobby.GetStartGameOrReadyUpDisableValue,
				button_text = "",
				button_action_func = LUI.mp_menus.MPLivePrivateLobby.StartGameOrReadyUpAction,
				desc_text = LUI.mp_menus.MPLivePrivateLobby.GetStartGameOrReadyUpDescText,
				additional_handlers = {
					recheck_start_button_lock = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable,
					element_refresh = LUI.mp_menus.MPLivePrivateLobby.UpdateStartGameOrReadyUpText,
					menu_create = LUI.mp_menus.MPLivePrivateLobby.UpdateStartGameOrReadyUpText,
					start_match_button_refresh = LUI.mp_menus.MPLivePrivateLobby.UpdateStartGameOrReadyUpText,
					exit_private_lobby = function ( f18_arg0, f18_arg1 )
						f18_arg0.properties.is_exiting = true
					end
				},
				button_over_func = MBh.EmitEventToRoot( {
					name = "lobby_slide_enable",
					dispatchChildren = true,
					immediate = true
				} )
			},
			children = {
				{
					type = "UITimer",
					id = "start_match_button_refresh_timer_id",
					properties = {
						event = "start_match_button_refresh",
						interval = 100,
						disposable = false,
						broadcastToRoot = false
					}
				}
			}
		}
	else
		f17_local0[#f17_local0 + 1] = {
			type = "UIGenericButton",
			id = "start_match_button_id",
			disabledFunc = LUI.mp_menus.MPLivePrivateLobby.GetStartGameOrReadyUpDisableValue,
			properties = {
				disabledFunc = LUI.mp_menus.MPLivePrivateLobby.GetStartGameOrReadyUpDisableValue,
				button_text = "",
				button_action_func = LUI.mp_menus.MPLivePrivateLobby.StartGameOrReadyUpAction,
				desc_text = LUI.mp_menus.MPLivePrivateLobby.GetStartGameOrReadyUpDescText,
				additional_handlers = {
					recheck_start_button_lock = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable,
					element_refresh = LUI.mp_menus.MPLivePrivateLobby.UpdateStartGameOrReadyUpText,
					menu_create = LUI.mp_menus.MPLivePrivateLobby.UpdateStartGameOrReadyUpText,
					start_match_button_refresh = LUI.mp_menus.MPLivePrivateLobby.UpdateStartGameOrReadyUpText,
					exit_private_lobby = function ( f18_arg0, f18_arg1 )
						f18_arg0.properties.is_exiting = true
					end
				},
				button_over_func = MBh.EmitEventToRoot( {
					name = "lobby_slide_enable",
					dispatchChildren = true,
					immediate = true
				} )
			},
			children = {
				{
					type = "UITimer",
					id = "start_match_button_refresh_timer_id",
					properties = {
						event = "start_match_button_refresh",
						interval = 100,
						disposable = false,
						broadcastToRoot = false
					}
				}
			}
		}
	end
	if f17_local2 == false then
		f17_local0[#f17_local0 + 1] = {
			type = "UIGenericButton",
			id = "setup_match_button_id",
			disabledFunc = IsNotGameHost,
			properties = {
				disabledFunc = IsNotGameHost,
				button_text = Engine.Localize( "@LUA_MENU_GAME_SETUP_CAPS" ),
				button_action_func = function ( f19_arg0, f19_arg1 )
					GameSetupAction( f19_arg0, f19_arg1, f17_local2 )
				end,
				desc_text = LUI.mp_menus.MPLivePrivateLobby.getSetupButtonDescText,
				additional_handlers = {
					recheck_start_button_lock = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
				},
				button_over_func = MBh.EmitEventToRoot( {
					name = "lobby_slide_enable",
					dispatchChildren = true,
					immediate = true
				} )
			}
		}
	end
	if not f17_local1 then
		f17_local0[#f17_local0 + 1] = {
			type = "UIGenericButton",
			id = "create_squad_button_id",
			properties = {
				button_text = Engine.Localize( "@LUA_MENU_CREATE_A_CLASS_CAPS" ),
				button_action_func = LUI.mp_menus.MPLivePrivateLobby.CreateSquadAction,
				desc_text = Engine.Localize( "@LUA_MENU_DESC_CREATE_A_CLASS" ),
				button_over_func = LUI.mp_menus.MPLivePrivateLobby.TriggerUpdateRestrictionsIcon,
				button_up_func = LUI.mp_menus.MPLivePrivateLobby.TriggerUpdateRestrictionsIcon
			},
			handlers = {
				create_class_update_restrictions = LUI.mp_menus.MPLivePrivateLobby.TriggerUpdateRestrictionsIcon,
				mlg_enabled = LUI.mp_menus.MPLivePrivateLobby.TriggerUpdateRestrictionsIcon,
				mlg_disabled = TriggerUpdateRestrictionsIcon
			},
			children = {
				{
					type = "lobby_restriction_icon"
				}
			}
		}
	else
		f17_local0[#f17_local0 + 1] = LUI.mp_menus.AliensLoadout.GetAliensLoadoutButton()
		if LUI.mp_menus.Aliens.ExtinctionHasMapSelection() then
			local f17_local5 = LUI.mp_menus.Aliens.MapSelectionButton()
			f17_local5.properties.desc_text = LUI.mp_menus.MPLivePrivateLobby.getMapSetupButtonDescText
			f17_local5.disabledFunc = IsNotGameHost
			f17_local5.properties.disabledFunc = IsNotGameHost
			f17_local5.properties.additional_handlers = {
				recheck_start_button_lock = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
			}
			f17_local0[#f17_local0 + 1] = f17_local5
		end
		if LUI.mp_menus.Aliens.ExtinctionHasModeSelection() then
			local f17_local5 = LUI.mp_menus.Aliens.ModeSelectionButton()
			f17_local5.properties.desc_text = LUI.mp_menus.MPLivePrivateLobby.getModeSetupButtonDescText
			f17_local5.disabledFunc = IsNotGameHost
			f17_local5.properties.disabledFunc = IsNotGameHost
			f17_local5.properties.additional_handlers = {
				recheck_start_button_lock = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
			}
			f17_local0[#f17_local0 + 1] = f17_local5
		end
		if LUI.mp_menus.Aliens.ExtinctionHasDifficultySelection() then
			local f17_local5 = LUI.mp_menus.Aliens.DifficultySelectionButton()
			f17_local5.properties.desc_text = LUI.mp_menus.MPLivePrivateLobby.getDifficultySetupButtonDescText
			f17_local5.disabledFunc = function ()
				local f20_local0 = IsNotGameHost()
				if not f20_local0 then
					f20_local0 = LUI.mp_menus.Aliens.IsChaosEnabled()
				end
				return f20_local0
			end
			
			f17_local5.properties.disabledFunc = function ()
				local f21_local0 = IsNotGameHost()
				if not f21_local0 then
					f21_local0 = LUI.mp_menus.Aliens.IsChaosEnabled()
				end
				return f21_local0
			end
			
			f17_local5.properties.additional_handlers = {
				recheck_start_button_lock = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable,
				update_chaos_enabled = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
			}
			f17_local0[#f17_local0 + 1] = f17_local5
		end
	end
	if f17_local1 then
		f17_local0[#f17_local0 + 1] = {
			type = "UIGenericButton",
			id = "leaderboards_button_id",
			properties = {
				button_text = Engine.Localize( "@LUA_MENU_LEADERBOARDS_CAPS" ),
				desc_text = Engine.Localize( "@LUA_MENU_DESC_LEADERBOARDS" ),
				button_action_func = function ( f22_arg0, f22_arg1 )
					if Engine.IsUserAGuest( f22_arg1.controller ) then
						LUI.FlowManager.RequestPopupMenu( f22_arg0, "popup_no_guest", true, f22_arg1.controller )
					else
						LUI.FlowManager.RequestAddMenu( f22_arg0, "leaderboards", true, f22_arg1.controller )
					end
				end,
				button_over_func = MBh.EmitEventToRoot( {
					name = "lobby_slide_enable",
					dispatchChildren = true,
					immediate = true
				} )
			}
		}
		if LUI.mp_menus.Aliens.CanAccessIntelMenu() then
			f17_local0[#f17_local0 + 1] = LUI.mp_menus.AliensIntel.GetAliensIntelButton()
		end
	end
	local f17_local5 = Engine.GetDvarString( "ui_gametype" )
	if not f17_local1 and Lobby.IsGameHost() and f17_local5 ~= "horde" then
		local f17_local6 = tonumber( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f17_local5, GameTypesTable.Cols.TeamChoice ) )
		if f17_local6 and f17_local6 == 1 then
			f17_local0[#f17_local0 + 1] = {
				type = "UIGenericButton",
				id = "friendly_bot_button_id",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = 0,
						right = GenericMenuDims.menu_right_med,
						top = 0,
						bottom = GenericButtonSettings.Styles.GradientButton.height
					}
				},
				properties = {
					variant = GenericButtonSettings.Variants.Select,
					content_margin = 40,
					content_width = 225,
					text_padding_with_content = 275,
					button_text = Engine.Localize( "@LUA_MENU_FRIENDLY_BOTS_CAPS" ),
					desc_text = Engine.Localize( "@LUA_MENU_FRIENDLY_BOTS_DESC" ),
					button_display_func = FriendlyBotButtonDisplayText,
					button_left_func = FriendlyBotButtonLeft,
					button_right_func = FriendlyBotButtonRight,
					button_over_func = MBh.EmitEventToRoot( {
						name = "lobby_slide_disable",
						dispatchChildren = true,
						immediate = true
					} )
				}
			}
			f17_local0[#f17_local0 + 1] = {
				type = "UIGenericButton",
				id = "friendly_bots_difficulty_button_id",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = 0,
						right = GenericMenuDims.menu_right_med,
						top = 0,
						bottom = GenericButtonSettings.Styles.GradientButton.height
					}
				},
				properties = {
					variant = GenericButtonSettings.Variants.Select,
					content_margin = 40,
					content_width = 225,
					text_padding_with_content = 275,
					button_text = Engine.Localize( "@LUA_MENU_BOTDIFFICULTY_CAPS" ),
					desc_text = Engine.Localize( "@LUA_MENU_FRIENDLY_BOTDIFFICULTY_DESC" ),
					button_display_func = FriendlyBotsDifficultyButtonDisplayText,
					button_left_func = FriendlyBotsDifficultyButtonLeft,
					button_right_func = FriendlyBotsDifficultyButtonRight,
					button_over_func = MBh.EmitEventToRoot( {
						name = "lobby_slide_disable",
						dispatchChildren = true,
						immediate = true
					} )
				}
			}
			f17_local0[#f17_local0 + 1] = {
				type = "UIGenericButton",
				id = "enemy_bot_button_id",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = 0,
						right = GenericMenuDims.menu_right_med,
						top = 0,
						bottom = GenericButtonSettings.Styles.GradientButton.height
					}
				},
				properties = {
					variant = GenericButtonSettings.Variants.Select,
					content_margin = 40,
					content_width = 225,
					text_padding_with_content = 275,
					button_text = Engine.Localize( "@LUA_MENU_ENEMY_BOTS_CAPS" ),
					desc_text = Engine.Localize( "@LUA_MENU_ENEMY_BOTS_DESC" ),
					button_display_func = EnemyBotButtonDisplayText,
					button_left_func = EnemyBotButtonLeft,
					button_right_func = EnemyBotButtonRight,
					button_over_func = MBh.EmitEventToRoot( {
						name = "lobby_slide_disable",
						dispatchChildren = true,
						immediate = true
					} )
				}
			}
			f17_local0[#f17_local0 + 1] = {
				type = "UIGenericButton",
				id = "enemy_bots_difficulty_button_id",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = 0,
						right = GenericMenuDims.menu_right_med,
						top = 0,
						bottom = GenericButtonSettings.Styles.GradientButton.height
					}
				},
				properties = {
					variant = GenericButtonSettings.Variants.Select,
					content_margin = 40,
					content_width = 225,
					text_padding_with_content = 275,
					button_text = Engine.Localize( "@LUA_MENU_BOTDIFFICULTY_CAPS" ),
					desc_text = Engine.Localize( "@LUA_MENU_ENEMY_BOTDIFFICULTY_DESC" ),
					button_display_func = EnemyBotsDifficultyButtonDisplayText,
					button_left_func = EnemyBotsDifficultyButtonLeft,
					button_right_func = EnemyBotsDifficultyButtonRight,
					button_over_func = MBh.EmitEventToRoot( {
						name = "lobby_slide_disable",
						dispatchChildren = true,
						immediate = true
					} )
				}
			}
		else
			f17_local0[#f17_local0 + 1] = {
				type = "UIGenericButton",
				id = "bot_button_id",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = 0,
						right = GenericMenuDims.menu_right_med,
						top = 0,
						bottom = GenericButtonSettings.Styles.GradientButton.height
					}
				},
				properties = {
					variant = GenericButtonSettings.Variants.Select,
					content_margin = 40,
					content_width = 225,
					text_padding_with_content = 275,
					button_text = Engine.Localize( "@LUA_MENU_BOTS_CAPS" ),
					desc_text = Engine.Localize( "@LUA_MENU_BOTS_DESC" ),
					button_display_func = FFABotButtonDisplayText,
					button_left_func = FFABotButtonLeft,
					button_right_func = FFABotButtonRight,
					button_over_func = MBh.EmitEventToRoot( {
						name = "lobby_slide_disable",
						dispatchChildren = true,
						immediate = true
					} )
				}
			}
			f17_local0[#f17_local0 + 1] = {
				type = "UIGenericButton",
				id = "bots_difficulty_button_id",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = 0,
						right = GenericMenuDims.menu_right_med,
						top = 0,
						bottom = GenericButtonSettings.Styles.GradientButton.height
					}
				},
				properties = {
					variant = GenericButtonSettings.Variants.Select,
					content_margin = 40,
					content_width = 225,
					text_padding_with_content = 275,
					button_text = Engine.Localize( "@LUA_MENU_BOTDIFFICULTY_CAPS" ),
					desc_text = Engine.Localize( "@LUA_MENU_BOTDIFFICULTY_DESC" ),
					button_display_func = FFABotsDifficultyButtonDisplayText,
					button_left_func = FFABotsDifficultyButtonLeft,
					button_right_func = FFABotsDifficultyButtonRight,
					button_over_func = MBh.EmitEventToRoot( {
						name = "lobby_slide_disable",
						dispatchChildren = true,
						immediate = true
					} )
				}
			}
		end
		f17_local0[#f17_local0 + 1] = {
			type = "UITimer",
			id = "bot_button_timer_id",
			properties = {
				event = "bot_button_refresh",
				interval = 200
			}
		}
	end
	f17_local0[#f17_local0 + 1] = {
		type = "button_desc_text",
		id = "private_lobby_description_id"
	}
	f17_local0[#f17_local0 + 1] = {
		type = "UIText",
		id = "missing_dlc_text",
		properties = {
			text = ""
		},
		states = {
			default = CoD.ColorizeState( Colors.orange, {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 100,
				right = 80,
				top = 0,
				bottom = CoD.TextSettings.NormalFont.Height,
				font = CoD.TextSettings.NormalFont.Font,
				alignment = LUI.Alignment.Left
			} )
		},
		handlers = {
			lobby_update_timer = function ( f23_arg0, f23_arg1 )
				local f23_local0, f23_local1, f23_local2 = Engine.PartyMissingMapPacks()
				if f23_local0 and f23_local2 and f23_local1 and #f23_local1 > 0 then
					f23_arg0:setText( Engine.Localize( "DLC_PLAYER_DOESNT_HAVE_MAP_PACK", Engine.MarkLocalized( f23_local2 ), Engine.Localize( f23_local1 ) ) )
				else
					f23_arg0:setText( "" )
				end
			end
		}
	}
	f17_local0[#f17_local0 + 1] = {
		type = "UITimer",
		id = "bnt_lock_tmr",
		properties = {
			event = "recheck_start_button_lock",
			interval = 500,
			disposable = false,
			broadcastToRoot = true
		}
	}
	return f17_local0
end

function menu_xboxlive_privatelobby()
	local f24_local0 = Engine.IsAliensMode()
	local f24_local1 = {
		type = "UIElement"
	}
	local f24_local2
	if f24_local0 then
		f24_local2 = "menu_xboxlive_ext_privatelobby_root"
		if not f24_local2 then
		
		else
			f24_local1.id = f24_local2
			f24_local1.states = {
				default = {
					topAnchor = true,
					bottomAnchor = true,
					leftAnchor = true,
					rightAnchor = true,
					top = 0,
					bottom = 0,
					left = 0,
					right = 0
				}
			}
			f24_local1.properties = {
				aliensSoloMode = isAliensSolo()
			}
			f24_local1.handlers = {
				menu_create = LivePrivateLobbyMenuCreate,
				speech_action = LivePrivateLobbyMenuSpeechHandler,
				exit_private_lobby = MBh.LeaveMenu(),
				open_after_action_report = OpenAfterActionReport,
				start_transition_to_game = HandleStartTransitionToGame,
				lobby_transition_complete = HandleStartTheGame,
				lobby_update_timer = function ( f25_arg0, f25_arg1 )
					f25_arg0:processEvent( {
						name = "refresh_player_count"
					} )
					MLG.Refresh( f25_arg0 )
				end
			}
			f24_local1.children = {
				{
					type = "UITimer",
					id = "lobby_update_timer",
					properties = {
						event = {
							name = "lobby_update_timer",
							dispatchChildren = true
						},
						disposable = false,
						interval = 200
					}
				},
				{
					type = "lobby_navigation",
					properties = {
						aliensSoloMode = MBh.Property( "aliensSoloMode" ),
						lobbyNavigationPages = PrivateLobbyNavigationPages
					}
				},
				{
					type = "UIBindText",
					id = "private_lobby_party_status_id",
					properties = {
						dataSource = "PrivatePartyStatus"
					},
					states = {
						default = {
							topAnchor = true,
							bottomAnchor = false,
							leftAnchor = true,
							rightAnchor = false,
							top = 93,
							left = 655,
							width = 525,
							height = CoD.TextSettings.NormalFont.Height,
							font = CoD.TextSettings.NormalFont.Font,
							red = Colors.white.r,
							green = Colors.white.g,
							blue = Colors.white.b,
							alpha = 1
						},
						hidden = {
							alpha = 0
						}
					},
					handlers = {
						lobby_transition_to_game = MBh.AnimateToState( "hidden", Lobby.TransitionTime ),
						lobby_rollback_transition_to_game = MBh.AnimateToState( "default", Lobby.TransitionTime )
					}
				},
				{
					type = "UIBindButton",
					id = "lobby_bind_buttons_id",
					handlers = {
						button_secondary = RequestExitPrivateLobby,
						button_select = OpenAfterActionReport,
						button_start = function ( f26_arg0, f26_arg1 )
							MLG.Toggle( f26_arg0:getParent(), f26_arg1 )
							if MatchRules.AllowCustomClasses( "loadouts" ) then
								f26_arg0:dispatchEventToRoot( {
									name = "create_class_update_restrictions",
									controller = f26_arg1.controller
								} )
							end
						end
					}
				},
				{
					type = "lobby_loading_widget"
				},
				{
					type = "lobby_game_type_title"
				},
				{
					type = "lobby_game_type_icon"
				},
				{
					type = "UIElement",
					id = "LowerSliderID",
					states = {
						default = {
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = true,
							left = 0,
							right = 0,
							top = 0,
							bottom = 0,
							alpha = 1
						},
						hidden = {
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = true,
							left = 0,
							right = 0,
							top = 100,
							bottom = 100,
							alpha = 0
						}
					},
					handlers = {
						lobby_transition_to_game = MBh.AnimateToState( "hidden", Lobby.TransitionTime ),
						lobby_rollback_transition_to_game = MBh.AnimateToState( "default", Lobby.TransitionTime ),
						refresh_player_count = function ( f27_arg0, f27_arg1 )
							if not SvS.IsSvS() then
								local f27_local0 = Engine.GetDvarString( "party_lobbyPlayerCount" )
								local f27_local1 = f27_arg0:getParent()
								f27_local1:processEvent( {
									name = "add_button_helper_text",
									button_ref = "players",
									helper_text = f27_local0,
									side = "right",
									clickable = false
								} )
							end
						end
					},
					children = {
						{
							type = "map_info_text",
							id = "map_info_text_id"
						},
						{
							type = "character_playing_as",
							id = "character_playing_as_id"
						},
						{
							type = "SocialFeedTicker",
							id = "social_ticker_id",
							properties = {
								isLobbyTicker = true
							}
						},
						{
							type = "button_helper_text_main",
							id = "cac_button_helper_text_id"
						},
						{
							type = "online_friends_widget",
							id = "online_friends_widget_id"
						}
					}
				},
				{
					type = "UIElement",
					id = "max_members_refresh_container_id",
					handlers = {
						max_members_refresh = function ( f28_arg0, f28_arg1 )
							if Lobby.IsGameHost() and not Engine.IsAliensMode() then
								if Engine.GetDvarString( "ui_gametype" ) == "horde" then
									if Engine.GetDvarInt( "party_maxplayers" ) ~= CoD.MaxSafeguardPlayers then
										Engine.SetDvarInt( "party_maxplayers", CoD.MaxSafeguardPlayers )
										Engine.Exec( "xtogprivateslots; xtogprivateslots; xsessionupdate" )
									end
								else
									local f28_local0 = Engine.GetDvarInt( "party_maxPrivatePartyPlayers" )
									if f28_local0 ~= Engine.GetDvarInt( "party_maxplayers" ) then
										Engine.SetDvarInt( "party_maxplayers", f28_local0 )
										Engine.Exec( "xtogprivateslots; xtogprivateslots; xsessionupdate" )
									end
								end
							end
						end
					},
					children = {
						{
							type = "UITimer",
							id = "max_members_refresh_timer_id",
							properties = {
								event = "max_members_refresh",
								interval = 100,
								disposable = false,
								broadcastToRoot = false
							}
						}
					}
				}
			}
			return f24_local1
		end
	end
	f24_local2 = "menu_xboxlive_privatelobby_root"
end

function menu_xboxlive_privatelobby_push()
	if Engine.IsAliensMode() then
		Lobby.ClearLocalReadyUpFlag()
	end
	MatchRules.SetUsingMatchRulesData( 1 )
end

function live_private_lobby_options()
	return {
		type = "UIVerticalList",
		focusable = true,
		states = {
			default = {
				alignment = LUI.Alignment.Top,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				left = GenericMenuDims.menu_left,
				right = GenericMenuDims.menu_right_med,
				top = GenericMenuDims.menu_top,
				bottom = GenericMenuDims.menu_bottom
			}
		},
		handlers = {
			bot_button_refresh = BotButtonRefresh,
			menu_create = BotButtonRefresh
		}
	}
end

function GetPrivateLobbyTitleText()
	if Engine.IsAliensMode() then
		if isAliensSolo() then
			return Engine.Localize( "@LUA_MENU_SOLO_MATCH_CAPS" )
		else
			return Engine.Localize( "@LUA_MENU_CUSTOM_MATCH_CAPS" )
		end
	else
		return Engine.Localize( "@LUA_MENU_PRIVATE_MATCH_LOBBY" )
	end
end

function PrivateLobbyNavigationPages( f32_arg0 )
	local f32_local0 = {}
	local f32_local1 = 25
	f32_local0[#f32_local0 + 1] = {
		title = GetPrivateLobbyTitleText(),
		element = {
			type = "UIElement",
			id = "lobby_options_container_id",
			states = {
				default = {
					topAnchor = true,
					bottomAnchor = true,
					leftAnchor = true,
					rightAnchor = true,
					top = 0,
					bottom = 0,
					left = 0,
					right = 0
				}
			},
			children = {
				{
					type = "live_private_lobby_options",
					id = "live_private_lobby_options_id",
					properties = {
						aliensSoloMode = f32_arg0.aliensSoloMode,
						additional_handlers = {
							refresh_ready_up = MBh.EmitEvent( "menu_refresh" )
						}
					},
					childrenFeeder = LivePrivateLobbyOptionsFeeder
				}
			}
		}
	}
	f32_local0[#f32_local0 + 1] = {
		title = Engine.Localize( "@LUA_MENU_LOBBY_LIST_CAPS" ),
		element = {
			type = "UIElement",
			id = "members_page",
			properties = {
				additional_handlers = {
					lobby_page_left = function ( f33_arg0, f33_arg1 )
						f33_arg0:animateToState( "page_left", f33_arg1.animTime or 0, true )
					end,
					lobby_page_right = function ( f34_arg0, f34_arg1 )
						f34_arg0:animateToState( "page_right", f34_arg1.animTime or 0, true )
					end
				}
			},
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = 0,
					right = 550,
					top = 0,
					bottom = 0
				},
				page_left = {
					leftAnchor = false,
					rightAnchor = true,
					left = -550,
					right = 0
				},
				page_right = {
					leftAnchor = true,
					rightAnchor = false,
					left = 0,
					right = 550
				}
			},
			children = {
				{
					type = "member_list",
					properties = {
						memberListState = Lobby.MemberListStates.Lobby,
						isPrivateLobby = true
					},
					states = {
						default = {
							alignment = LUI.Alignment.Top,
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = false,
							left = 0,
							right = 0,
							top = GenericMenuDims.menu_top,
							bottom = GenericMenuDims.menu_bottom + f32_local1,
							spacing = GetMemberListSpacing()
						}
					}
				}
			}
		}
	}
	if not Engine.IsAliensMode() or Engine.GetDvarBool( "extinction_cac_enabled" ) then
		f32_local0[#f32_local0 + 1] = {
			title = Engine.Localize( "@LUA_MENU_PLAYER_STATS_CAPS" ),
			element = {
				type = "lobby_character_view",
				id = "lobby_character_view_id",
				properties = {
					squad_location = "privateMatchSquadMembers"
				}
			}
		}
	end
	if Engine.IsAliensMode() and Engine.GetDvarBool( "extinction_cac_enabled" ) then
		f32_local0[#f32_local0 + 1] = {
			title = Engine.Localize( "@LUA_MENU_PLAYER_COMPARISON_CAPS" ),
			element = {
				type = "lobby_player_stats",
				id = "lobby_player_stats_id",
				properties = {
					additional_handlers = {
						lobby_page_left = function ( f35_arg0, f35_arg1 )
							f35_arg0:animateToState( "page_left", f35_arg1.animTime or 0, true )
						end,
						lobby_page_right = function ( f36_arg0, f36_arg1 )
							f36_arg0:animateToState( "page_right", f36_arg1.animTime or 0, true )
						end
					}
				},
				states = {
					default = {
						alignment = LUI.Alignment.Top,
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = 550,
						top = 0,
						bottom = 0
					},
					page_left = {
						leftAnchor = false,
						rightAnchor = true,
						left = -550,
						right = 0
					},
					page_right = {
						leftAnchor = true,
						rightAnchor = false,
						left = 0,
						right = 550
					}
				}
			}
		}
	end
	return f32_local0
end
