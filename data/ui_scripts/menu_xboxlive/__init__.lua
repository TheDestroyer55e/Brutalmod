if (game:issingleplayer() or not Engine.InFrontend()) then
	return
end

local Lobby = luiglobals.Lobby

local FindMatchAfterThrottleEvent = function( f4_arg0, f4_arg1 )
	local f4_local0 = false
	local f4_local1 = -1
	for f4_local2 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f4_local2 ) and IsFirstTimeFlowRequired( f4_local2 ) then
			f4_local0 = true
			if f4_local1 < 0 then
				f4_local1 = f4_local2
			end
		end
	end
	if f4_local0 then
		LUI.FlowManager.RequestAddMenu( f4_arg0, "cac_member_select_main", true, f4_local1, false, {
			next_screen = "cac_edit_main",
			squad_location = "squadMembers",
			class_location = "loadouts",
			findMatch = true
		} )
	elseif not LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons() then
		Engine.Exec( "xblive_privatematch 0" )
		if Engine.IsAliensMode() then
			LUI.mp_menus.Aliens.AliensRunConfig( f4_arg1.controller )
		end
		if LUI.mp_menus.MPXboxLiveMenu.CheckHasRequiredDLC( f4_arg0 ) then
			if LUI.mp_menus.MPXboxLiveMenu.DisplayLowRepWarning( f4_arg0, f4_arg1 ) then
				return 
			elseif SvS.IsSvS() then
				local f4_local3 = SvS.GetCurrentSquadModeInfo()
				local f4_local4, f4_local5 = SvS.GetPlaylistFromSquadMode( f4_local3 )
				local f4_local6 = false
				if f4_arg1.squadsPlayNow then
					f4_local6 = true
				end
				if not f4_arg1.squadsPlayNow and f4_local3.DynamicMatchmaking then
					Playlist.DoAction( f4_local4, f4_local5, true, f4_local6 )
				else
					Playlist.DoAction( f4_local4, f4_local5, false, f4_local6 )
				end
				if Engine.GetDvarBool( "squad_match" ) then
					Squad.StartMatch( f4_arg1.controller, true )
					Engine.SetDvarBool( "squad_find_match", true )
				end
				LUI.FlowManager.RequestAddMenu( f4_arg0, "menu_xboxlive_lobby", false, f4_arg1.controller, false )
			else
				LUI.FlowManager.RequestPopupMenu( f4_arg0, "menu_systemlink_join" ) -- open server list instead of playlist_main
			end
		end
	end
end

local FindMatchAction = function( f5_arg0, f5_arg1 )
	if Lobby.EnteringLobby() == true then
		LUI.FlowManager.RequestPopupMenu( f5_arg0, "popup_throttling", true, f5_arg1.controller, false, {
			eventData = f5_arg1
		} )
	else
		FindMatchAfterThrottleEvent( f5_arg0, f5_arg1 )
	end
end

local BarracksAction = function( f9_arg0, f9_arg1 )
	LUI.FlowManager.RequestPopupMenu( nil, "extinction_save_file_switcher_popup", true, Engine.GetFirstActiveController() )
end

function live_dialog_text_box_custom()
	return {
		type = "UIElement",
		properties = {
			message = "",
			indent = 15,
			overlay_alpha = 0.85,
			top = -75,
			left = -DialogPopupDims.Width / 2
		},
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
				type = "UIImage",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = 0,
						bottom = 0,
						left = 0,
						right = 0,
						material = RegisterMaterial( "white" ),
						red = 0.1,
						green = 0.14,
						blue = 0.16,
						alpha = MBh.Property( "overlay_alpha" )
					}
				}
			},
			{
				type = "UIElement",
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = false,
						leftAnchor = false,
						rightAnchor = false,
						top = MBh.Property( "top" ),
						left = MBh.Property( "left" ),
						width = DialogPopupDims.Width,
						height = DialogPopupDims.Height
					}
				},
				handlers = {
					menu_create = MBh.EmitEvent( "reposition_elements" ),
					reposition_elements = function ( f48_arg0, f48_arg1 )
						local f48_local0 = 10
						local f48_local1, f48_local2, f48_local3, f48_local4 = GetTextDimensions( f48_arg0.properties.message, CoD.TextSettings.NormalFont.Font, CoD.TextSettings.NormalFont.Height )
						local f48_local5 = f48_local3 - f48_local1
						local f48_local6 = DialogWidgetDims.Width + f48_local0 + f48_local5
						local f48_local7 = f48_arg0:getChildById( "popup_text_id" )
						f48_local7:registerAnimationState( "updated", {
							topAnchor = false,
							bottomAnchor = false,
							leftAnchor = false,
							rightAnchor = false,
							height = CoD.TextSettings.NormalFont.Height * 1.2,
							left = -80,
							width = 250
						} )
						f48_local7:animateToState( "updated", 0 )
						local f48_local8 = f48_arg0:getChildById( "popup_diamond_id" )
						f48_local8:registerAnimationState( "updated", {
							topAnchor = false,
							bottomAnchor = false,
							leftAnchor = false,
							rightAnchor = false,
							left = -120,
							height = DialogWidgetDims.Height,
							width = DialogWidgetDims.Width
						} )
						f48_local8:animateToState( "updated", 0 )
					end
					
				},
				children = {
					{
						type = "live_dialog_popup_background"
					},
					{
						type = "UIText",
						id = "popup_text_id",
						properties = {
							message = MBh.Property( "message" ),
							text = MBh.Property( "message" ),
							indent = MBh.Property( "indent" )
						},
						states = {
							default = {
								topAnchor = false,
								bottomAnchor = false,
								leftAnchor = false,
								rightAnchor = false,
								left = 0,
								right = 0,
								height = CoD.TextSettings.NormalFont.Height,
								font = CoD.TextSettings.NormalFont.Font,
								alignment = LUI.Alignment.Left,
								red = 0.85,
								green = 0.85,
								blue = 0.88
							}
						}
					},
					{
						type = "live_dialog_processing_widget",
						id = "popup_diamond_id",
						states = {
							default = {
								topAnchor = false,
								bottomAnchor = false,
								leftAnchor = false,
								rightAnchor = false,
								width = DialogWidgetDims.Width,
								height = DialogWidgetDims.Height
							}
						}
					}
				}
			}
		}
	}
end

menu_blank_1 = function()
	return {
		type = "live_dialog_text_box_custom",
		id = "blankmenu_1",
		properties = {
			message = "Switching to player 1..."
		}
	}
end

menu_blank_2 = function()
	return {
		type = "live_dialog_text_box_custom",
		id = "blankmenu_2",
		properties = {
			message = "Switching to player 2..."
		}
	}
end

menu_blank_3 = function()
	return {
		type = "live_dialog_text_box_custom",
		id = "blankmenu_3",
		properties = {
			message = "Switching to player 3..."
		}
	}
end

menu_blank_4 = function()
	return {
		type = "live_dialog_text_box_custom",
		id = "blankmenu_4",
		properties = {
			message = "Switching to player 4..."
		}
	}
end

savefileoptionsfeeder = function( f71_arg0 )
	local f71_local1 = 0
	local f71_local2 = Engine.GetFirstActiveController()
	local f71_local4 = {}
	for f71_local6 = 1, 4, 1 do
		local f71_local9 = f71_local6
		f71_local4[#f71_local4 + 1] = {
			type = "UIGenericButton",
			id = "player" .. f71_local9,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				text = Engine.Localize( "Player " .. f71_local9 ),
				button_action_func = function ( f72_arg0, f72_arg1 )
					class2 = f71_local9
					print(class2)
					LUI.FlowManager.RequestLeaveMenu( f72_arg0, true )
					LUI.FlowManager.RequestAddMenu( f9_arg0, "menu_blank_" .. class2, true, f71_local2 )
				end
			}
		}
	end
	return f71_local4
end

extinction_save_file_switcher_popup = function()
	return {
		type = "generic_selectionList_popup",
		id = "extinction_savefile_popup",
		properties = {
			popup_title = "Choose a save file",
			popup_childfeeder = savefileoptionsfeeder,
		}
	}
end

package.loaded["LUI.mp_menus.MPXboxLiveMenu"].XboxLiveOptionsFeeder = function( f29_arg0 )
	local f29_local0 = Engine.IsAliensMode()
	local f29_local1 = SvS.IsSvS()
	local f29_local2 = SvS.IsSvS()
	if f29_local2 then
		f29_local2 = SvS.GetCurrentSquadModeInfo()
	end
	local f29_local3 = {}
	local f29_local4 = nil
	if f29_local0 then
		f29_local4 = Engine.Localize( "@LUA_MENU_STORE_CAPS" ) -- Orginally @LUA_MENU_PUBLIC_MATCH_CAPS but we need to use @LUA_MENU_STORE_CAPS
	elseif f29_local1 then
		f29_local4 = Engine.Localize( "@PLATFORM_FIND_GAME_CAPS" )
	else
		f29_local4 = Engine.Localize( "@LUA_MENU_STORE_CAPS" ) -- Orginally @PLATFORM_FIND_GAME_CAPS but we need to use @LUA_MENU_STORE_CAPS
	end
	Engine.SetDvarFloat("cg_scoreboardHeight", 0)
	Engine.SetDvarInt("sv_cheats", 1)
	Engine.ExecNow( "set scr_aliens_promode 0" )
	if string.match(Engine.GetDvarString( "fs_game" ), "/mod") then
		Engine.SetDvarBool( "xblive_privatematch", true )
		local matchdata = tonumber( Engine.GetDvarString( "facebook_password" ) )
		solo = math.floor(matchdata/10)
		if (solo == 1) then
			SetIsAliensSolo( true )
			Engine.SetDvarInt( "party_maxplayers", 1 )
			Engine.SetDvarInt( "sv_maxclients", 1 )
		end
		Engine.Exec( "xstartprivatematch" )
		LUI.FlowManager.RequestAddMenu( f29_arg0, "menu_xboxlive_privatelobby", false, Engine.GetFirstActiveController, false, {} )
	end
	f29_local3[#f29_local3 + 1] = {
		type = "UIGenericButton",
		id = "find_match_button_id",
		disabled = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons(),
		properties = {
			button_text = f29_local4,
			button_action_func = FindMatchAction,
			desc_text = SvS.IsSvS() and Engine.Localize( "@LUA_MENU_SQUADS_FIND_MATCH_DESC" ) or Engine.Localize( "@LUA_MENU_STORE_DESC" ), -- Orginally @PLATFORM_DESC_FIND_GAME but we need to use @LUA_MENU_STORE_DESC
			disabledFunc = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons,
			additional_handlers = {
				check_buttons = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
			}
		}
	}
	if f29_local0 then
		f29_local3[#f29_local3 + 1] = {
			type = "UIGenericButton",
			id = "solo_match_button_id",
			disabled = LUI.mp_menus.MPXboxLiveMenu.shouldDisableSoloMatch(),
			properties = {
				button_text = Engine.Localize( "@LUA_MENU_SOLO_MATCH_CAPS" ),
				button_action_func = LUI.mp_menus.MPXboxLiveMenu.SoloMatchAction,
				desc_text = Engine.Localize( "@LUA_MENU_SOLO_MATCH_DESC" ),
				disabledFunc = LUI.mp_menus.MPXboxLiveMenu.shouldDisableSoloMatch,
				additional_handlers = {
					check_buttons = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
				}
			}
		}
		f29_local3[#f29_local3 + 1] = {
			type = "UIGenericButton",
			id = "private_match_button_id",
			disabled = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons(),
			properties = {
				button_text = Engine.Localize( "@LUA_MENU_CUSTOM_MATCH_CAPS" ),
				button_action_func = LUI.mp_menus.MPXboxLiveMenu.PrivateMatchAction,
				desc_text = Engine.Localize( "@LUA_MENU_DESC_PRIVATE_MATCH" ),
				disabledFunc = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons,
				additional_handlers = {
					check_buttons = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
				}
			}
		}
	end
	if not f29_local0 then
		f29_local3[#f29_local3 + 1] = {
			type = "UIGenericButton",
			id = "create_squad_button_id",
			disabled = false,
			properties = {
				button_text = Engine.Localize( "@LUA_MENU_CREATE_A_CLASS_CAPS" ),
				button_action_func = LUI.mp_menus.MPXboxLiveMenu.CreateSquadAction,
				desc_text = Engine.Localize( "@LUA_MENU_DESC_CREATE_A_CLASS" ),
				additional_handlers = {
					refresh_new_icons = function ( f30_arg0, f30_arg1 )
						if Cac.AnyUnseenMDLCItems( Engine.GetFirstActiveController(), NewIconsTable.CACItemTypes ) then
							f30_arg0:processEvent( {
								name = "show_new_icon"
							} )
						end
					end
				}
			}
		}
	else
		f29_local3[#f29_local3 + 1] = LUI.mp_menus.AliensLoadout.GetAliensLoadoutButton()
	end

	-- Disable Leaderboard (Code Removed)
	-- Disable Squad Reports (Code Removed)

	if not f29_local0 and ( Engine.GetDvarFloat( "r_aspectRatioCustom" ) == 32/9 ) then
		f29_local3[#f29_local3 + 1] = {
			type = "UIGenericButton",
			id = "operations_button_id",
			properties = {
				button_text = Engine.Localize( "SAVE FILE" ),
				button_action_func = BarracksAction,
				desc_text = Engine.Localize( "Switch between players 1 through 4." )
			}
		}
	end
	if not f29_local0 then
		if not f29_local1 then
			f29_local3[#f29_local3 + 1] = {
				type = "UIGenericButton",
				id = "barracks_button_id",
				disabled = false,
				properties = {
					button_text = Engine.Localize( "@LUA_MENU_BARRACKS_CAPS" ),
					button_action_func = BarracksAction,
					desc_text = Clan.IsEnabled() and Engine.Localize( "@LUA_MENU_DESC_BARRACKS" ) or Engine.Localize( "@LUA_MENU_DESC_BARRACKS_PRIVATE" )
				}
			}
		end
		if not f29_local1 or f29_local2 ~= SvS.SquadModes.SquadVsSquad then
			f29_local3[#f29_local3 + 1] = {
				type = "generic_separator"
			}
		end
		if not f29_local1 then
			f29_local3[#f29_local3 + 1] = {
				type = "UIGenericButton",
				id = "private_match_button_id",
				disabled = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons(),
				properties = {
					button_text = Engine.Localize( "@LUA_MENU_PRIVATE_MATCH_CAPS" ),
					button_action_func = LUI.mp_menus.MPXboxLiveMenu.PrivateMatchAction,
					desc_text = Engine.Localize( "@LUA_MENU_DESC_PRIVATE_MATCH" ),
					disabledFunc = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons,
					additional_handlers = {
						check_buttons = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
					}
				}
			}
		end

		-- Add Combat Training Button
		if not f29_local0 and not f29_local1 then
			game:addlocalizedstring("LUA_MENU_COMBAT", "COMBAT TRAINING");
			game:addlocalizedstring("LUA_MENU_COMBAT_DESC", "Rank up offline with bots.");

			f29_local3[#f29_local3 + 1] = {
				type = "UIGenericButton",
				id = "find_match_button_id2",
				disabled = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons(),
				properties = {
					button_text = Engine.Localize("@LUA_MENU_COMBAT"), -- Engine.Localize( "@PLATFORM_FIND_GAME_CAPS" ),
					button_action_func = LUI.mp_menus.MPXboxLiveMenu.FindMatchAction,
					desc_text = Engine.Localize( "@LUA_MENU_COMBAT_DESC" ),  -- Engine.Localize( "@LUA_MENU_SQUADS_FIND_MATCH_DESC" ) 
					disabledFunc = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons,
					additional_handlers = {
						check_buttons = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
					}
				}
			}
	    end
		
		if f29_local1 then
			-- Disable Challenge Friend Button (Code Removed)
			if f29_local2 then
				f29_local3[#f29_local3 + 1] = {
					type = "UIGenericButton",
					id = "play_now_button_id",
					disabled = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons(),
					properties = {
						button_text = Engine.Localize( "LUA_MENU_PLAY_NOW_CAPS" ),
						button_action_func = function ( f36_arg0, f36_arg1 )
							f36_arg1.squadsPlayNow = true
							FindMatchAction( f36_arg0, f36_arg1 )
						end,
						desc_text = Engine.Localize( "LUA_MENU_PLAY_NOW_DESC" ),
						disabledFunc = LUI.mp_menus.MPXboxLiveMenu.disableCreateGameButtons,
						additional_handlers = {
							check_buttons = LUI.mp_menus.MPLivePrivateLobby.RefreshButtonDisable
						}
					}
				}
			end
		end
	end
	local f29_local6 = #f29_local3 + 1
	local f29_local7 = {
		type = "button_desc_text",
		id = "prelobby_description_id"
	}
	local f29_local8 = {}
	local f29_local9
	if (SvS.IsSvS() or f29_local2 ~= SvS.SquadModes.SquadAssault) or Engine.IsAliensMode() or Engine.IsCoreMode() then
		f29_local9 = 1
		if f29_local9 then
			f29_local8.lines = f29_local9
			f29_local7.properties = f29_local8
			f29_local3[f29_local6] = f29_local7
			f29_local3[#f29_local3 + 1] = {
				type = "UITimer",
				id = "bnt_lock_tmr",
				properties = {
					event = "check_buttons",
					interval = 500,
					disposable = false,
					broadcastToRoot = true
				}
			}
			return f29_local3
		end
	end
	f29_local9 = nil
end

LUI.MenuBuilder.m_definitions[ "extinction_save_file_switcher_popup" ] = extinction_save_file_switcher_popup
LUI.MenuBuilder.m_definitions[ "live_dialog_text_box_custom" ] = live_dialog_text_box_custom
LUI.MenuBuilder.m_definitions[ "menu_blank_1" ] = menu_blank_1
LUI.MenuBuilder.m_definitions[ "menu_blank_2" ] = menu_blank_2
LUI.MenuBuilder.m_definitions[ "menu_blank_3" ] = menu_blank_3
LUI.MenuBuilder.m_definitions[ "menu_blank_4" ] = menu_blank_4