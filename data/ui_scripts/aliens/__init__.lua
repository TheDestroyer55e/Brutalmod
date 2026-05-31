AlienPerks = {
	File = "mp/alien/perks_tree.csv",
	Cols = {
		Idx = 0,
		Ref = 1,
		UnlockedAtRank = 2,
		PointCost = 3,
		Name = 4,
		Desc = 5,
		Icon = 6,
		IsUpgrade = 7,
		Category = 8,
		TokenUpgradeName = 9
	},
	MaxPerks = 100
}

AlienAbilities = {
	File = "mp/alien/dpad_tree.csv",
	FileAlt = "mp/alien/dpad_tree_beacon.csv",
	Cols = {
		Idx = 0,
		Ref = 1,
		UnlockedAtRank = 2,
		PointCost = 3,
		CurrencyCost = 4,
		Name = 5,
		Desc = 6,
		Icon = 7,
		DpadIcon = 8,
		IsUpgrade = 9,
		Category = 10
	},
	MaxAbilities = 100,
	Up = 0,
	Down = 100,
	Left = 200,
	Right = 300,
	Types = {
		"munition",
		"support",
		"offense",
		"defense"
	}
}

ExtinctionDifficluty = {
	Regular = 0,
	Easy = 1,
	Hard = 2,
	Veteran = 3,
	Brutal = 4
}

TableLookup = function( arg1, arg2, arg3, arg4 )
	if ( Engine.TableLookup( arg1, arg2, arg3, arg4 ) == nil ) then
		print(arg3)
		return Engine.TableLookup( arg1, arg2, "multi_class", arg4 )
	else
		return Engine.TableLookup( arg1, arg2, arg3, arg4 )
	end
end

function tprint (tbl, indent)
	if not indent then indent = 0 end
	local toprint = string.rep(" ", indent) .. "{\r\n"
	indent = indent + 2 
	for k, v in pairs(tbl) do
		toprint = toprint .. string.rep(" ", indent)
		if (type(k) == "number") then
			toprint = toprint .. "[" .. k .. "] = "
		elseif (type(k) == "string") then
			toprint = toprint  .. k ..  "= "   
		end
		if (type(v) == "number") then
			toprint = toprint .. v .. ",\r\n"
		elseif (type(v) == "string") then
			toprint = toprint .. "\"" .. v .. "\",\r\n"
		elseif (type(v) == "table") then
			toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
		else
			toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
		end
	end
	toprint = toprint .. string.rep(" ", indent-2) .. "}"
	return toprint
end

LUI.mp_menus.Aliens.GetFieldForPerk = function( f10_arg0, f10_arg1 )
	local f10_local1
	if f10_arg1 < AlienPerks.Cols.Idx or f10_arg1 > AlienPerks.Cols.TokenUpgradeName then
		f10_local1 = false
	else
		f10_local1 = true
	end
	assert( f10_local1, "Invalid field_ref in GetFieldForPerk( perk_ref, field_ref )" )
	if Engine.TableLookup( AlienPerks.File, AlienPerks.Cols.Ref, f10_arg0, f10_arg1 ) == "ALIENS_PERK_RIGGER_DESC_2" then
		return "Take less damage while repairing, traps cost less and last longer."
	elseif Engine.TableLookup( AlienPerks.File, AlienPerks.Cols.Ref, f10_arg0, f10_arg1 ) == "ALIENS_PERK_RIGGER_DESC_3" then
		return "Kills earn 20% more cash."
	else
		return Engine.TableLookup( AlienPerks.File, AlienPerks.Cols.Ref, f10_arg0, f10_arg1 )
	end
end

LUI.mp_menus.Aliens.GetFieldForAbility = function( f13_arg0, f13_arg1 )
	local f13_local0 = assert
	local f13_local1
	if f13_arg1 < AlienAbilities.Cols.Idx or f13_arg1 > AlienAbilities.Cols.Category then
		f13_local1 = false
	else
		f13_local1 = true
	end
	f13_local0( f13_local1, "Invalid field_ref in GetFieldForAbility( ability_ref, field_ref )" )
	f13_local0 = Engine.GetDvarString( "ui_mapname" )
--TODO: LOCALIZE
	if Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 ) == "ALIENS_DEATH_MACHINE_DESC" then
		return "Portable Minigun with 200 rounds."
	elseif Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 ) == "ALIENS_DEATH_MACHINE_DESC_3" then
		return "Minigun gains specialized ammo."
	elseif Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 ) == "ALIENS_DEATH_MACHINE_DESC_4" then
		return "Doubles the ammo count to 400."
	elseif Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 ) == "ALIENS_RIOTSHIELD_DESC_2" then
		return "Aliens that hit the Riot Shield are stunned."
	elseif Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 ) == "ALIENS_TEAM_BOOST_DESC_1" then
		return "Move 20% faster while boosted and increases the booster's duration to 30 sec."
	elseif Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 ) == "ALIENS_TEAM_BOOST_DESC_2" then
		return "Repair the drill faster."
	elseif Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 ) == "ALIENS_TEAM_BOOST_DESC_3" then
		return "Increases the booster's duration to 45 sec."
	elseif Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 ) == "ALIENS_TEAM_BOOST_DESC_4" then
		return "Increases the booster's duration to 60 sec and adds increased sprint endurance."
	end
	if f13_local0 == "mp_alien_beacon" or f13_local0 == "mp_alien_dlc3" or f13_local0 == "mp_alien_last" then
		return Engine.TableLookup( AlienAbilities.FileAlt, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 )
	else
		return Engine.TableLookup( AlienAbilities.File, AlienAbilities.Cols.Ref, f13_arg0, f13_arg1 )
	end
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

function ExtinctionDetermineDifficulty()
	local f63_local0 = ExtinctionDifficluty.Regular
	if IsPrivateMatch() then
		f63_local0 = Lobby.GetExtinctionDifficulty()
	elseif Engine.GetDvarInt( "scr_aliens_hardcore" ) == 1 then
		f63_local0 = ExtinctionDifficluty.Hard
	elseif Engine.GetDvarInt( "scr_aliens_casual" ) == 1 then
		f63_local0 = ExtinctionDifficluty.Easy
	elseif Engine.GetDvarInt( "scr_aliens_promode" ) == 1 then
		f63_local0 = ExtinctionDifficluty.Brutal
	elseif Engine.GetDvarInt( "scr_aliens_promode" ) == 2 then
		f63_local0 = ExtinctionDifficluty.Veteran
	end
	return f63_local0
end

ExtinctionDifficultyDisplayText = function( f64_arg0 )
	local f64_local0 = ""
	if f64_arg0 == ExtinctionDifficluty.Easy then
		f64_local0 = Engine.Localize( "LUA_MENU_MP_ALIENS_DIFF_CASUAL" )
	elseif f64_arg0 == ExtinctionDifficluty.Hard then
		f64_local0 = Engine.Localize( "LUA_MENU_MP_ALIENS_DIFF_HARD" )
	elseif f64_arg0 == ExtinctionDifficluty.Brutal then
		f64_local0 = "Brutal"
	elseif f64_arg0 == ExtinctionDifficluty.Veteran then
		f64_local0 = "Veteran"
	else
		f64_local0 = Engine.Localize( "LUA_MENU_MP_ALIENS_DIFF_NORMAL" )
	end
	return f64_local0
end

LUI.mp_menus.Aliens.ExtinctionDifficultyDisplayText = function( f64_arg0 )
	local f64_local0 = ""
	if f64_arg0 == ExtinctionDifficluty.Easy then
		f64_local0 = Engine.Localize( "LUA_MENU_MP_ALIENS_DIFF_CASUAL" )
	elseif f64_arg0 == ExtinctionDifficluty.Hard then
		f64_local0 = Engine.Localize( "LUA_MENU_MP_ALIENS_DIFF_HARD" )
	elseif f64_arg0 == ExtinctionDifficluty.Brutal then
		f64_local0 = "Brutal"
	elseif f64_arg0 == ExtinctionDifficluty.Veteran then
		f64_local0 = "Veteran"
	else
		f64_local0 = Engine.Localize( "LUA_MENU_MP_ALIENS_DIFF_NORMAL" )
	end
	return f64_local0
end

function extinctionDifficlutyFeederL( f65_arg0 )
	local f65_local0 = {}
	local f65_local1 = ExtinctionDetermineDifficulty()
	local f65_local2 = {
		[1] = {
			difficulty_val = ExtinctionDifficluty.Easy,
			text = ExtinctionDifficultyDisplayText( ExtinctionDifficluty.Easy )
		},
		[2] = {
			difficulty_val = ExtinctionDifficluty.Regular,
			text = ExtinctionDifficultyDisplayText( ExtinctionDifficluty.Regular )
		},
		[3] = {
			difficulty_val = ExtinctionDifficluty.Hard,
			text = ExtinctionDifficultyDisplayText( ExtinctionDifficluty.Hard )
		},
		[4] = {
			difficulty_val = ExtinctionDifficluty.Veteran,
			text = ExtinctionDifficultyDisplayText( ExtinctionDifficluty.Veteran )
		},
		[5] = {
			difficulty_val = ExtinctionDifficluty.Brutal,
			text = ExtinctionDifficultyDisplayText( ExtinctionDifficluty.Brutal )
		}
	}
	for f65_local3 = 1, #f65_local2, 1 do
		local f65_local6 = f65_local3
		f65_local0[#f65_local0 + 1] = {
			type = "UIGenericButton",
			listDefaultFocus = f65_local2[f65_local6].difficulty_val == f65_local1,
			id = "difficulty_button_" .. f65_local6,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				text = f65_local2[f65_local6].text,
				button_action_func = function ( f66_arg0, f66_arg1 )
					ExtinctionSetDifficlutyDvars( f65_local2[f65_local6].difficulty_val )
					LUI.FlowManager.RequestLeaveMenu( f66_arg0, true )
					if f65_local2[f65_local6].difficulty_val == ExtinctionDifficluty.Easy and IsOnlineMatch() then
						LUI.FlowManager.RequestPopupMenu( f66_arg0, "extinction_casual_notice", true, f66_arg1.controller )
					elseif f65_local2[f65_local6].difficulty_val == ExtinctionDifficluty.Brutal and IsOnlineMatch() then
						LUI.FlowManager.RequestPopupMenu( f66_arg0, "extinction_brutal_notice", true, f66_arg1.controller )
					end
				end
			}
		}
	end
	return f65_local0
end

function extinction_difficulty_menu()
	return {
		type = "generic_selectionList_popup",
		id = "extinction_difficulty_menu_popup",
		properties = {
			popup_title = Engine.Localize( "@MENU_SELECT_DIFFICULTY" ),
			popup_childfeeder = extinctionDifficlutyFeederL
		}
	}
end

function extinction_brutal_notice()
	return {
		type = "generic_confirmation_popup",
		id = "extinciont_brutal_notice_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = ( "This difficulty is EXTREMELY hard, and is nearly impossible solo. It is recommended to have every upgrade in the armory before playing this." ),
			button_text = "Bring it on!"
		}
	}
end

function GetFieldForPerkL( f10_arg0, f10_arg1 )
	if f10_arg0 == "perk_bullet_damage" then
		class = 0
	elseif f10_arg0 == "perk_health" then
		class = 5
	elseif f10_arg0 == "perk_rigger" then
		class = 10
	elseif f10_arg0 == "perk_medic" then
		class = 15
	end
	return class
end

function GetNameOfPerkL( f10_arg0)
	if f10_arg0 == "1" then
		class = "perk_bullet_damage"
	elseif f10_arg0 == "2" then
		class = "perk_health"
	elseif f10_arg0 == "3" then
		class = "perk_rigger"
	elseif f10_arg0 == "4" then
		class = "perk_medic"
	end
	return class
end

function GetFieldForSupport( f10_arg0 )
	if f10_arg0 == "dpad_team_explosives" then
		perk = 0
	elseif f10_arg0 == "dpad_team_adrenaline" then
		perk = 1
	elseif f10_arg0 == "dpad_team_armor" then
		perk = 2
	elseif f10_arg0 == "dpad_team_boost" then
		perk = 3
	elseif f10_arg0 == "dpad_team_randombox" then
		perk = 4
	end
	return perk
end

function GetNameOfSupport( f10_arg0 )
	if f10_arg0 == 0 then
		perk = "alien_icon_team_explosives"
	elseif f10_arg0 == 1 then
		perk = "alien_icon_feral_instincts"
	elseif f10_arg0 == 2 then
		perk = "alien_icon_armor"
	elseif f10_arg0 == 3 then
		perk = "alien_icon_boost"
	elseif f10_arg0 == 4 then
		perk = "alien_icon_random_supply"
	end
	return perk
end

function GetIdOfSupport( f10_arg0 )
	if f10_arg0 == 0 then
		perk = "dpad_team_explosives"
	elseif f10_arg0 == 1 then
		perk = "dpad_team_adrenaline"
	elseif f10_arg0 == 2 then
		perk = "dpad_team_armor"
	elseif f10_arg0 == 3 then
		perk = "dpad_team_boost"
	elseif f10_arg0 == 4 then
		perk = "dpad_team_randombox"
	end
	return perk
end

alien_description_item = function()
	local f54_local0 = 68
	local f54_local1 = 48
	local f54_local2 = 48
	return {
		type = "UIButton",
		id = "desc_item_id",
		properties = {
			descText = "descText",
			upgradeText = "+1",
			icon = RegisterMaterial( "specialty_armorvest" ),
			costText = "$1111",
			background_alpha = 0
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = 0,
				bottom = f54_local0
			}
		},
		children = {
			{
				type = "UIImage",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = 2,
						right = -2,
						top = 0,
						bottom = 0,
						material = RegisterMaterial( "white" ),
						alpha = MBh.Property( "background_alpha" )
					}
				}
			},
			{
				type = "UIImage",
				id = "icon_image_id",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = false,
						bottomAnchor = false,
						left = 10,
						right = 10 + f54_local1,
						height = f54_local1,
						material = MBh.Property( "icon" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					}
				}
			},
			{
				type = "UIText",
				id = "plus_text_id",
				properties = {
					text = MBh.Property( "upgradeText" )
				},
				states = {
					default = {
						font = CoD.TextSettings.NormalFont.Font,
						alignment = LUI.Alignment.Left,
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = f54_local1 + 8,
						right = f54_local1 + 60,
						top = 2,
						bottom = 2 + CoD.TextSettings.NormalFont.Height,
						red = 0.7,
						green = 0.7,
						blue = 0.7,
						alpha = 1
					}
				}
			},
			{
				type = "UIText",
				id = "desc_text_id",
				properties = {
					text = MBh.Property( "descText" ),
					textStyle = CoD.TextStyle.Shadowed
				},
				states = {
					default = CoD.ColorizeState( Colors.primary_text_color, {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = 115,
						right = -55,
						top = 12,
						bottom = 12 + CoD.TextSettings.NormalFont.Height,
						font = CoD.TextSettings.NormalFont.Font,
						alignment = LUI.Alignment.Left
					} )
				}
			}
		}
	}
end

aliens_cac_menu_button = function()
	return {
		type = "UIButton",
		id = "loadoutbutton_id",
		properties = {
			isPerkSlot = 0,
			perkSlot = -1,
			isActionSlot = 0,
			actionSlot = -1,
			isNerfSlot = 0,
			nerfSlot = -1,
			ability_text = "",
			ability_text_width = 0,
			selected_ability_text = "",
			selected_ability_desc_text = "",
			icon = "white",
			dpadAlpha = 0,
			leftArrowAlpha = 0,
			rightArrowAlpha = 0,
			upArrowAlpha = 0,
			downArrowAlpha = 0
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = 0,
				bottom = 70
			}
		},
		children = {
			{
				type = "UIImage",
				id = "btn_divider",
				states = {
					default = {
						material = RegisterMaterial( "white" ),
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = false,
						bottomAnchor = true,
						left = 0,
						right = 0,
						top = 0,
						bottom = 1,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.1
					}
				}
			},
			{
				type = "UIImage",
				id = "btn_bkg",
				states = {
					default = {
						material = RegisterMaterial( "btn_alien_loadout_rtcap_f" ),
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = 0,
						top = 0,
						bottom = 25,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					dim = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.5
					},
					focus = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.8
					},
					locked = {
						red = Colors.frontend_hilite.r,
						green = Colors.frontend_hilite.g,
						blue = Colors.frontend_hilite.b,
						alpha = 1
					}
				},
				handlers = {
					button_over = MBh.AnimateLoop( {
						{
							"focus",
							0
						},
						{
							"dim",
							750
						},
						{
							"focus",
							750
						}
					} ),
					button_up = MBh.AnimateToState( "default", 0 ),
					button_locked = MBh.AnimateToState( "focus", 0 )
				}
			},
			{
				type = "UIImage",
				id = "SecondaryClassIcon",
				properties = {
					isPerkSlot = MBh.Property( "isPerkSlot" ),
					perkSlot = MBh.Property( "perkSlot" )
				},
				states = {
					default = {
						material = RegisterMaterial( "white" ),
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = true,
						left = 23,
						right = 55,
						top = 33,
						bottom = -5,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					invisible = {
						alpha = 0
					},
					visible = {
						alpha = 1
					},
					focused = {
						red = 0,
						green = 0,
						blue = 0
					},
					unfocused = {
						red = 1,
						green = 1,
						blue = 1
					}
				},
				handlers = {
					refresh_cac_menu_buttons = function ( f35_arg0, f35_arg1 )
						local f35_local0 = f35_arg0.properties.isPerkSlot
						local f35_local1 = f35_arg0.properties.perkSlot
						local f35_local2 = f35_arg1.controller
						local f35_local3 = LUI.mp_menus.Aliens.GetSecondaryClassRef( f35_local2 )
						if Engine.AliensCheckIsUpgradeEnabled( f35_local2, "multi_class" ) and f35_local3 and f35_local0 == 1 and f35_local1 == 0 then
							f35_arg0:setImage( RegisterMaterial( LUI.mp_menus.Aliens.GetFieldForPerk( f35_local3, LUI.mp_menus.Aliens.AlienPerks.Cols.Icon ) ) )
							f35_arg0:animateToState( "visible" )
						else
							f35_arg0:animateToState( "invisible" )
						end
					end
					,
					menu_create = function ( f36_arg0, f36_arg1 )
						local f36_local0 = f36_arg0.properties.exclusiveController
						if Engine.AliensCheckIsUpgradeEnabled( f36_local0, "multi_class" ) then
							local f36_local1 = LUI.mp_menus.Aliens.GetSecondaryClassRef( f36_local0 )
							f36_arg0:processEvent( {
								name = "refresh_cac_menu_buttons",
								controller = f36_local0
							} )
						end
					end
					,
					button_over = MBh.AnimateToState( "focused", 0 ),
					button_up = MBh.AnimateToState( "unfocused", 0 ),
					button_locked = MBh.AnimateToState( "focused", 0 )
				}
			},
			{
				type = "UIImage",
				id = "ThirdClassIcon",
				properties = {
					isPerkSlot = MBh.Property( "isPerkSlot" ),
					perkSlot = MBh.Property( "perkSlot" )
				},
				states = {
					default = {
						material = RegisterMaterial( "white" ),
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = true,
						left = 23,
						right = 55,
						top = 3,
						bottom = -35,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					invisible = {
						alpha = 0
					},
					visible = {
						alpha = 1
					},
					focused = {
						red = 0,
						green = 0,
						blue = 0
					},
					unfocused = {
						red = 1,
						green = 1,
						blue = 1
					}
				},
				handlers = {
					refresh_cac_menu_buttons = function ( f35_arg0, f35_arg1 )
						local f35_local0 = f35_arg0.properties.isPerkSlot
						local f35_local1 = f35_arg0.properties.perkSlot
						local f35_local2 = f35_arg1.controller
						local f35_local3 = LUI.mp_menus.Aliens.GetSecondaryClassRef( f35_local2 )
						local class3id = string.sub(f35_local3, -1)
						if Engine.AliensCheckIsUpgradeEnabled( f35_local2, "multi_class" ) and tonumber(class3id) ~= nil and f35_local0 == 1 and f35_local1 == 0 then
							local class3 = GetNameOfPerkL(class3id)
							f35_arg0:setImage( RegisterMaterial( LUI.mp_menus.Aliens.GetFieldForPerk( class3, LUI.mp_menus.Aliens.AlienPerks.Cols.Icon ) ) )
							f35_arg0:animateToState( "visible" )
						else
							f35_arg0:animateToState( "invisible" )
						end
					end
					,
					menu_create = function ( f36_arg0, f36_arg1 )
						local f36_local0 = f36_arg0.properties.exclusiveController
						if Engine.AliensCheckIsUpgradeEnabled( f36_local0, "multi_class" ) then
							local f36_local1 = LUI.mp_menus.Aliens.GetSecondaryClassRef( f36_local0 )
							f36_arg0:processEvent( {
								name = "refresh_cac_menu_buttons",
								controller = f36_local0
							} )
						end
					end
					,
					button_over = MBh.AnimateToState( "focused", 0 ),
					button_up = MBh.AnimateToState( "unfocused", 0 ),
					button_locked = MBh.AnimateToState( "focused", 0 )
				}
			},
			{
				type = "UIImage",
				id = "SecondarySupportIcon",
				properties = {
					isActionSlot = MBh.Property( "isActionSlot" ),
					actionSlot = MBh.Property( "actionSlot" )
				},
				states = {
					default = {
						material = RegisterMaterial( "white" ),
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = true,
						left = 23,
						right = 55,
						top = 33,
						bottom = -5,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					invisible = {
						alpha = 0
					},
					visible = {
						alpha = 1
					},
					focused = {
						red = 0,
						green = 0,
						blue = 0
					},
					unfocused = {
						red = 1,
						green = 1,
						blue = 1
					}
				},
				handlers = {
					refresh_cac_menu_buttons = function ( f35_arg0, f35_arg1 )
						local f35_local0 = f35_arg0.properties.isActionSlot
						local f35_local1 = f35_arg0.properties.actionSlot
						local f35_local2 = f35_arg1.controller
						local f35_local3 = GetNameOfSupport( get_extra_loadout( f35_local2, 0 ) )
						if get_custom_upgrade(f35_local2, 9) == 2 and f35_local0 == 1 and f35_local1 == 100 then
							f35_arg0:setImage( RegisterMaterial( f35_local3 ) )
							f35_arg0:animateToState( "visible" )
						else
							f35_arg0:animateToState( "invisible" )
						end
					end
					,
					menu_create = function ( f36_arg0, f36_arg1 )
						local f36_local0 = f36_arg0.properties.exclusiveController
						if get_custom_upgrade(f36_local0, 9) == 2 then
							local f36_local1 = get_extra_loadout( f36_local0, 0 )
							f36_arg0:processEvent( {
								name = "refresh_cac_menu_buttons",
								controller = f36_local0
							} )
						end
					end
					,
					button_over = MBh.AnimateToState( "focused", 0 ),
					button_up = MBh.AnimateToState( "unfocused", 0 ),
					button_locked = MBh.AnimateToState( "focused", 0 )
				}
			},
			{
				type = "UIElement",
				id = "dpad_icon_id",
				properties = {
					dpadAlpha = MBh.Property( "dpadAlpha" ),
					leftArrowAlpha = MBh.Property( "leftArrowAlpha" ),
					rightArrowAlpha = MBh.Property( "rightArrowAlpha" ),
					upArrowAlpha = MBh.Property( "upArrowAlpha" ),
					downArrowAlpha = MBh.Property( "downArrowAlpha" )
				},
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = 50,
						top = 10,
						bottom = -10,
						alpha = MBh.Property( "dpadAlpha" )
					}
				},
				children = {
					{
						type = "UIImage",
						id = "up_id",
						states = {
							default = {
								material = RegisterMaterial( "alien_cash_dpad_up" ),
								leftAnchor = true,
								rightAnchor = true,
								topAnchor = true,
								bottomAnchor = true,
								left = 0,
								right = 0,
								top = 0,
								bottom = 0,
								alpha = MBh.Property( "upArrowAlpha" )
							}
						}
					},
					{
						type = "UIImage",
						id = "down_id",
						states = {
							default = {
								material = RegisterMaterial( "alien_cash_dpad_dn" ),
								leftAnchor = true,
								rightAnchor = true,
								topAnchor = true,
								bottomAnchor = true,
								left = 0,
								right = 0,
								top = 0,
								bottom = 0,
								alpha = MBh.Property( "downArrowAlpha" )
							}
						}
					},
					{
						type = "UIImage",
						id = "left_id",
						states = {
							default = {
								material = RegisterMaterial( "alien_cash_dpad_lt" ),
								leftAnchor = true,
								rightAnchor = true,
								topAnchor = true,
								bottomAnchor = true,
								left = 0,
								right = 0,
								top = 0,
								bottom = 0,
								alpha = MBh.Property( "leftArrowAlpha" )
							}
						}
					},
					{
						type = "UIImage",
						id = "right_id",
						states = {
							default = {
								material = RegisterMaterial( "alien_cash_dpad_rt" ),
								leftAnchor = true,
								rightAnchor = true,
								topAnchor = true,
								bottomAnchor = true,
								left = 0,
								right = 0,
								top = 0,
								bottom = 0,
								alpha = MBh.Property( "rightArrowAlpha" )
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "ability_icon",
				properties = {
					isPerkSlot = MBh.Property( "isPerkSlot" ),
					perkSlot = MBh.Property( "perkSlot" ),
					isActionSlot = MBh.Property( "isActionSlot" ),
					actionSlot = MBh.Property( "actionSlot" ),
					isNerfSlot = MBh.Property( "isNerfSlot" ),
					nerfSlot = MBh.Property( "nerfSlot" ),
					icon = MBh.Property( "icon" )
				},
				states = {
					default = CoD.ColorizeState( Colors.white, {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = false,
						bottomAnchor = false,
						left = 58,
						width = 48,
						height = 48
					} ),
					focused = CoD.ColorizeState( Colors.black, {
						scale = 0.1
					} ),
					unfocused = CoD.ColorizeState( Colors.black, {
						scale = 0
					} )
				},
				handlers = {
					refresh_cac_menu_buttons = function ( f37_arg0, f37_arg1 )
						if f37_arg0.properties.isPerkSlot == 1 then
							f37_arg0.properties.icon = LUI.mp_menus.Aliens.GetFieldForPerk( LUI.mp_menus.Aliens.GetAlienPerk( f37_arg1.controller, f37_arg0.properties.perkSlot ), LUI.mp_menus.Aliens.AlienPerks.Cols.Icon )
						elseif f37_arg0.properties.isActionSlot == 1 then
							f37_arg0.properties.icon = LUI.mp_menus.Aliens.GetFieldForAbility( LUI.mp_menus.Aliens.GetAlienAbility( f37_arg1.controller, LUI.mp_menus.Aliens.GetDataLabelForSlot( f37_arg0.properties.actionSlot ) ), LUI.mp_menus.Aliens.AlienAbilities.Cols.Icon )
						end
						f37_arg0:setImage( RegisterMaterial( f37_arg0.properties.icon ) )
					end
					,
					button_over = MBh.AnimateSequence( {
						{
							"unfocused",
							0
						},
						{
							"focused",
							100
						},
						{
							"unfocused",
							100
						}
					} ),
					button_up = MBh.AnimateToState( "default", 0 ),
					button_locked = MBh.AnimateToState( "unfocused", 0 ),
					menu_create = function ( f38_arg0, f38_arg1 )
						f38_arg0:setImage( f38_arg0.properties.icon )
					end
					
				}
			},
			{
				type = "UIText",
				id = "ability_text_id",
				properties = {
					text = MBh.Property( "ability_text" )
				},
				states = {
					default = {
						font = CoD.TextSettings.NormalFont.Font,
						alignment = LUI.Alignment.Left,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = 120,
						right = 0,
						top = 5,
						bottom = 5 + CoD.TextSettings.NormalFont.Height,
						red = 0.7,
						green = 0.7,
						blue = 0.7,
						alpha = 1
					},
					focus = {
						red = 0,
						green = 0,
						blue = 0
					}
				},
				handlers = {
					button_over = MBh.AnimateToState( "focus", 0 ),
					button_up = MBh.AnimateToState( "default", 0 ),
					button_locked = MBh.AnimateToState( "focus", 0 )
				}
			},
			{
				type = "UIText",
				id = "selected_ability_text_id",
				properties = {
					isPerkSlot = MBh.Property( "isPerkSlot" ),
					perkSlot = MBh.Property( "perkSlot" ),
					isActionSlot = MBh.Property( "isActionSlot" ),
					actionSlot = MBh.Property( "actionSlot" ),
					isNerfSlot = MBh.Property( "isNerfSlot" ),
					nerfSlot = MBh.Property( "nerfSlot" ),
					text = "",
					text_selected = MBh.Property( "selected_ability_text" ),
					w = MBh.Property( "ability_text_width" )
				},
				states = {
					default = {
						font = CoD.TextSettings.BoldFont.Font,
						alignment = LUI.Alignment.Left,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = MBh.Property( "w" ),
						right = 0,
						top = 5,
						bottom = 5 + CoD.TextSettings.BoldFont.Height,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					},
					focus = {
						red = 0,
						green = 0,
						blue = 0
					},
					highlight = {
						red = 0,
						green = 0,
						blue = 0
					}
				},
				handlers = {
					button_over = MBh.AnimateToState( "highlight", 0 ),
					button_up = MBh.AnimateToState( "default", 0 ),
					button_locked = MBh.AnimateToState( "focus", 0 ),
					refresh_cac_menu_buttons = RefreshButtonTitleText,
					menu_create = RefreshButtonTitleText
				}
			},
			{
				type = "UIText",
				id = "action_slot_selection_desc",
				properties = {
					isPerkSlot = MBh.Property( "isPerkSlot" ),
					perkSlot = MBh.Property( "perkSlot" ),
					isActionSlot = MBh.Property( "isActionSlot" ),
					actionSlot = MBh.Property( "actionSlot" ),
					isNerfSlot = MBh.Property( "isNerfSlot" ),
					nerfSlot = MBh.Property( "nerfSlot" ),
					text = MBh.Property( "selected_ability_desc_text" )
				},
				states = {
					default = {
						font = CoD.TextSettings.NormalFont.Font,
						alignment = LUI.Alignment.Left,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = 120,
						right = -5,
						top = 25,
						bottom = 25 + CoD.TextSettings.NormalFont.Height,
						red = 0.5,
						green = 0.5,
						blue = 0.5,
						alpha = 1
					},
					focus = {
						red = 0,
						green = 0,
						blue = 0
					}
				},
				handlers = {
					button_over = MBh.AnimateToState( "focus", 0 ),
					button_up = MBh.AnimateToState( "default", 0 ),
					button_locked = MBh.AnimateToState( "focus", 0 ),
					refresh_cac_menu_buttons = function ( f39_arg0, f39_arg1 )
						if f39_arg0.properties.isPerkSlot == 1 then
							f39_arg0.properties.text = Engine.Localize( LUI.mp_menus.Aliens.GetFieldForPerk( LUI.mp_menus.Aliens.GetAlienPerk( f39_arg1.controller, f39_arg0.properties.perkSlot ), LUI.mp_menus.Aliens.AlienPerks.Cols.Desc ) )
						elseif f39_arg0.properties.isActionSlot == 1 then
							f39_arg0.properties.text = Engine.Localize( LUI.mp_menus.Aliens.GetFieldForAbility( LUI.mp_menus.Aliens.GetAlienAbility( f39_arg1.controller, LUI.mp_menus.Aliens.GetDataLabelForSlot( f39_arg0.properties.actionSlot ) ), LUI.mp_menus.Aliens.AlienAbilities.Cols.Desc ) )
						end
						f39_arg0:setText( f39_arg0.properties.text )
					end
					
				}
			}
		}
	}
end

aliens_cac_select_ability_menu = function()
	return {
		type = "UIElement",
		id = "aliens_cac_select_ability_menu_id",
		properties = {
			isPerkSlot = 0,
			perkSlot = -1,
			isActionSlot = 0,
			actionSlot = -1,
			isNerfSlot = 0
		},
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
				alpha = 0
			}
		},
		handlers = {
			hide_select_ability_menu = MBh.AnimateToState( "hidden", 0 ),
			show_select_ability_menu = MBh.AnimateToState( "default", 0 ),
			update_selection = function ( f30_arg0, f30_arg1 )
				f30_arg0:processEvent( {
					name = "updateInfoPanel",
					ref = f30_arg1.ref,
					isPerk = f30_arg0.properties.isPerkSlot,
					isAction = f30_arg0.properties.isActionSlot,
					isNerf = f30_arg0.properties.isNerfSlot,
					dispatchChildren = true
				} )
			end
			,
			menu_create = function ( f31_arg0, f31_arg1 )
				f31_arg0:dispatchEventToRoot( {
					name = "rebind_back_button",
					immediate = true
				} )
				if Engine.GetDvarBool( "extinction_cac_enabled" ) then
					f31_arg0:dispatchEventToRoot( {
						name = "add_button_helper_text",
						button_ref = "button_alt1",
						helper_text = "",
						side = "left",
						clickable = true
					} )
				end
			end
			,
			menu_close = function ( f32_arg0, f32_arg1 )
				if Engine.GetDvarBool( "extinction_cac_enabled" ) then
					f32_arg0:dispatchEventToRoot( {
						name = "add_button_helper_text",
						button_ref = "button_alt1",
						helper_text = Engine.Localize( "@LUA_MENU_CUSTOMIZE_CHAR" ),
						side = "left",
						clickable = true
					} )
				end
			end
			
		},
		children = {
			{
				type = "alien_info_panel",
				id = "info_panel_id"
			},
			{
				type = "UIGrid",
				id = "selection_options_list",
				properties = {
					isPerkSlot = MBh.Property( "isPerkSlot" ),
					perkSlot = MBh.Property( "perkSlot" ),
					isActionSlot = MBh.Property( "isActionSlot" ),
					actionSlot = MBh.Property( "actionSlot" ),
					isNerfSlot = MBh.Property( "isNerfSlot" ),
					exclusiveController = MBh.Property( "exclusiveController" ),
					hSpacing = 15,
					vSpacing = 22
				},
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = true,
						left = 600,
						width = 555,
						top = 150,
						bottom = 0
					}
				},
				childrenFeeder = ActionSlotFeeder
			},
			{
				type = "UIBindButton",
				id = "bind_button_id",
				properties = {
					current_selected_ref = "",
					isPerk = MBh.Property( "isPerkSlot" ),
					isAction = MBh.Property( "isActionSlot" ),
					isNerf = MBh.Property( "isNerfSlot" ),
					exclusiveController = MBh.Property( "exclusiveController" )
				},
				handlers = {
					button_secondary = MBh.LeaveMenu()
				}
			}
		}
	}
end

function ActionSlotFeeder( f25_arg0 )
	local f25_local0 = LUI.mp_menus.AliensLoadout.ActionSlotFeeder( f25_arg0 )
	if (f25_arg0.actionSlot == 100 and f25_arg0.isActionSlot == 1) then
		local f25_local5 = Lobby.GetAlienRankForXP( LUI.mp_menus.Aliens.getAliensExperience( f25_arg0.exclusiveController ) )
		local f25_local2 = LUI.mp_menus.Aliens.GetBaseAbilityListForActionSlot( f25_arg0.actionSlot )
		for f25_local1 = 1, #f25_local0, 1 do
			local f25_local18 = f25_local2[f25_local1]
			local f25_local15 = tonumber( LUI.mp_menus.Aliens.GetFieldForAbility( f25_local18, LUI.mp_menus.Aliens.AlienAbilities.Cols.UnlockedAtRank ) )
			if LUI.mp_menus.Aliens.getAliensHasPlayerPrestiged( f25_arg0.exclusiveController ) then
				f25_local15 = 0
			end
			f25_local0[f25_local1].handlers.button_action = function ( f27_arg0, f27_arg1 )
				if f25_local5 < f25_local15 then
					return 
				else
					LUI.mp_menus.Aliens.SetAlienAbility( f27_arg1.controller, LUI.mp_menus.Aliens.GetDataLabelForSlot( f25_arg0.actionSlot ), f25_local18 )
					LUI.FlowManager.RequestLeaveMenu( f27_arg0 )
					if get_custom_upgrade(f25_arg0.exclusiveController, 9) == 2 then
						setDefaultSecondSupport( f27_arg1.controller )
						LUI.FlowManager.RequestPopupMenu( nil, "extinction_secondary_support_popup", true, f27_arg1.controller )
					end
					f27_arg0:dispatchEventToRoot( {
						name = "refresh_cac_menu_buttons",
						controller = f27_arg1.controller,
						immediate = true
					} )
				end
			end
		end
	end
	return f25_local0
end

function secondarySupportOptionsFeeder( f71_arg0 )
	local f71_local0 = LUI.mp_menus.Aliens
	local f71_local1 = 100
	local f71_local2 = f71_arg0.exclusiveController
	local f71_local3 = Engine.GetPlayerDataEx( f71_local2, CoD.StatsGroup.Coop, "alienPlayerLoadout", "support")
	local f71_local4 = {}
	local f71_local5 = f71_local0.GetBaseAbilityListForActionSlot( f71_local1 )
	for f71_local6 = 1, #f71_local5, 1 do
		local f71_local9 = f71_local6
		if f71_local5[f71_local9] ~= f71_local3 and f71_local5[f71_local9] ~= "dpad_placeholder_sup_1" then
			f71_local4[#f71_local4 + 1] = {
				type = "UIGenericButton",
				id = "support_button_" .. f71_local9,
				properties = {
					style = GenericButtonSettings.Styles.GlassButton,
					substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
					text = Engine.Localize( f71_local0.GetFieldForAbility( f71_local5[f71_local9], f71_local0.AlienAbilities.Cols.Name ) ),
					button_action_func = function ( f72_arg0, f72_arg1 )
						set_extra_loadout(f71_local2, 0, GetFieldForSupport(f71_local5[f71_local9]))
						f72_arg0:dispatchEventToRoot( {
							name = "refresh_cac_menu_buttons",
							controller = f72_arg1.controller
						} )
						LUI.FlowManager.RequestLeaveMenu( f72_arg0, true )
					end
				}
			}
		end
	end
	return f71_local4
end

function extinction_secondary_support_popup()
	return {
		type = "generic_selectionList_popup",
		id = "extinction_secondary_support_popup",
		properties = {
			popup_title = "Choose a second support item",
			popup_childfeeder = secondarySupportOptionsFeeder,
			additional_handlers = {
				popup_back = function ( f74_arg0, f74_arg1 )
					DebugPrint( "YO BITCHES x2" )
					local f74_local0 = LUI.mp_menus.Aliens
					if ( Engine.GetPlayerDataEx( f74_arg1.controller, CoD.StatsGroup.Coop, "alienPlayerLoadout", "support") == GetIdOfSupport( get_extra_loadout( f74_arg1.controller, 0 ) )) then
						setDefaultSecondSupport( f27_arg1.controller )
						f74_arg0:dispatchEventToRoot( {
							name = "refresh_cac_menu_buttons",
							controller = f74_arg1.controller
						} )
					end
				end
				
			}
		}
	}
end

function setDefaultThirdClass( f22_arg0 )
	if get_custom_upgrade(f22_arg0, 1) == 2 then
		local f22_local0 = Engine.GetPlayerDataEx( f22_arg0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 )
		local f22_local1 = math.floor(Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" )/5)
		if f22_local0 == "perk_none" then
			Engine.SetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class", 20 )
		elseif f22_local0 == "perk_bullet_damage" then
			if f22_local1 == 1 then
				Engine.SetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class", Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" ) + 3 )
			else
				Engine.SetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class", Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" ) + 2 )
			end
		elseif f22_local0 == "perk_health" then
			if f22_local1 == 0 then
				Engine.SetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class", Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" ) + 3 )
			else
				Engine.SetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class", Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" ) + 1 )
			end
		else
			if f22_local1 == 0 then
				Engine.SetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class", Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" ) + 2 )
			else
				Engine.SetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class", Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" ) + 1 )
			end
		end
	else
		Engine.SetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class", math.floor(Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" )/5)*5 )
	end
end

function SetThirdClassL( f23_arg0, f23_arg1 )
	Engine.SetPlayerDataReservedInt( f23_arg0, CoD.StatsGroup.Coop, "secondary_class", (GetFieldForPerkL( f23_arg1, AlienPerks.Cols.Idx )/5)+1 + class2id )
end

function SetSecondaryClassL( f23_arg0, f23_arg1 )
	Engine.SetPlayerDataReservedInt( f23_arg0, CoD.StatsGroup.Coop, "secondary_class", GetFieldForPerkL( f23_arg1, AlienPerks.Cols.Idx ) )
end

thirdClassOptionsFeeder = function( f71_arg0 )
	local f71_local0 = LUI.mp_menus.Aliens
	local f71_local1 = 0
	local f71_local2 = f71_arg0.exclusiveController
	local f71_local3 = f71_local0.GetAlienPerk( f71_local2, f71_local1 )
	local f71_local4 = {}
	local f71_local5 = f71_local0.GetBasePerkList( f71_local1 )
	for f71_local6 = 1, #f71_local5, 1 do
		local f71_local9 = f71_local6
		if f71_local5[f71_local9] ~= f71_local3 and f71_local5[f71_local9] ~= class2 and f71_local5[f71_local9] ~= "perk_none" then
			f71_local4[#f71_local4 + 1] = {
				type = "UIGenericButton",
				id = "class_button_" .. f71_local9,
				properties = {
					style = GenericButtonSettings.Styles.GlassButton,
					substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
					text = Engine.Localize( f71_local0.GetFieldForPerk( f71_local5[f71_local9], f71_local0.AlienPerks.Cols.Name ) ),
					button_action_func = function ( f72_arg0, f72_arg1 )
						f71_local0.SetThirdClassL( f71_local2, f71_local5[f71_local9] )
						f72_arg0:dispatchEventToRoot( {
							name = "refresh_cac_menu_buttons",
							controller = f72_arg1.controller
						} )
						LUI.FlowManager.RequestLeaveMenu( f72_arg0, true )
					end
				}
			}
		end
	end
	return f71_local4
end

function get_custom_upgrade(controller, index)
	fixIndex = index % 5
	variable = math.floor(index/5) + 1
	n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "has_seen_episode_" .. variable .. "_intro" )
	return (math.floor(n / (3 ^ fixIndex))) % 3
end

function set_extra_loadout(controller, index, state)
	n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "eggstra_award_flags" )
	n = n- get_extra_loadout(controller, index) * (5 ^ index)
	Engine.SetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "eggstra_award_flags", n + (state * (5 ^ index)))
end

function get_extra_loadout(controller, index)
	n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "eggstra_award_flags" )
	return (math.floor(n / (5 ^ index))) % 5
end

function setDefaultSecondSupport( f22_arg0 )
	if ( Engine.GetPlayerDataEx( f22_arg0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "support") == "dpad_team_explosives" ) then
		set_extra_loadout(f22_arg0, 0, 1)
	else
		set_extra_loadout(f22_arg0, 0, 0)
	end
end

local secondaryClassOptionsFeeder = function( f71_arg0 )
	local f71_local0 = LUI.mp_menus.Aliens
	local f71_local1 = 0
	local f71_local2 = f71_arg0.exclusiveController
	local f71_local3 = f71_local0.GetAlienPerk( f71_local2, f71_local1 )
	local f71_local4 = {}
	local f71_local5 = f71_local0.GetBasePerkList( f71_local1 )
	for f71_local6 = 1, #f71_local5, 1 do
		local f71_local9 = f71_local6
		if f71_local5[f71_local9] ~= f71_local3 and f71_local5[f71_local9] ~= "perk_none" then
			f71_local4[#f71_local4 + 1] = {
				type = "UIGenericButton",
				id = "class_button_" .. f71_local9,
				properties = {
					style = GenericButtonSettings.Styles.GlassButton,
					substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
					text = Engine.Localize( f71_local0.GetFieldForPerk( f71_local5[f71_local9], f71_local0.AlienPerks.Cols.Name ) ),
					button_action_func = function ( f72_arg0, f72_arg1 )
						class2 = f71_local5[f71_local9]
						class2id = GetFieldForPerkL( f71_local5[f71_local9] )
						f71_local0.SetSecondaryClass( f71_local2, f71_local5[f71_local9] )
						f72_arg0:dispatchEventToRoot( {
							name = "refresh_cac_menu_buttons",
							controller = f72_arg1.controller
						} )
						LUI.FlowManager.RequestLeaveMenu( f72_arg0, true )
						if get_custom_upgrade(f72_arg1.controller, 1) == 2 then
							LUI.FlowManager.RequestPopupMenu( nil, "extinction_third_class_popup", true, f72_arg1.controller )
						end
					end
				}
			}
		end
	end
	return f71_local4
end


extinction_third_class_popup = function()
	return {
		type = "generic_selectionList_popup",
		id = "extinction_third_class_popup",
		properties = {
			popup_title = "Choose a third class",
			popup_childfeeder = thirdClassOptionsFeeder,
			additional_handlers = {
				popup_back = function ( f74_arg0, f74_arg1 )
					local f74_local0 = LUI.mp_menus.Aliens
					if f74_local0.GetAlienPerk( f74_arg1.controller, 0 ) == f74_local0.GetSecondaryClassRef( f74_arg1.controller ) then
						f74_local0.setDefaultSecondaryClass( f74_arg1.controller )
						f74_arg0:dispatchEventToRoot( {
							name = "refresh_cac_menu_buttons",
							controller = f74_arg1.controller
						} )
					end
				end
				
			}
		}
	}
end

extinction_secondary_class_popup = function()
	return {
		type = "generic_selectionList_popup",
		id = "extinction_secondary_class_popup",
		properties = {
			popup_title = "Choose a secondary class",
			popup_childfeeder = secondaryClassOptionsFeeder,
			additional_handlers = {
				popup_back = function ( f74_arg0, f74_arg1 )
					local f74_local0 = LUI.mp_menus.Aliens
					if f74_local0.GetAlienPerk( f74_arg1.controller, 0 ) == f74_local0.GetSecondaryClassRef( f74_arg1.controller ) then
						f74_local0.setDefaultSecondaryClass( f74_arg1.controller )
						f74_arg0:dispatchEventToRoot( {
							name = "refresh_cac_menu_buttons",
							controller = f74_arg1.controller
						} )
					end
				end
				
			}
		}
	}
end

LUI.MenuBuilder.m_definitions[ "extinction_difficulty_menu" ] = extinction_difficulty_menu
LUI.MenuBuilder.m_definitions[ "extinction_brutal_notice"] = extinction_brutal_notice
LUI.MenuBuilder.m_definitions[ "aliens_cac_select_ability_menu"] = aliens_cac_select_ability_menu
LUI.MenuBuilder.m_definitions[ "aliens_cac_menu_button" ] = aliens_cac_menu_button
LUI.MenuBuilder.m_definitions[ "extinction_secondary_class_popup" ] = extinction_secondary_class_popup
LUI.MenuBuilder.m_definitions[ "extinction_third_class_popup" ] = extinction_third_class_popup
LUI.MenuBuilder.m_definitions[ "extinction_secondary_support_popup" ] = extinction_secondary_support_popup