AlienPurchasableItems = {
	File = "mp/alien/alien_purchasable_items.csv",
	Cols = {
		Idx = 0,
		Ref = 1,
		Name = 2,
		Desc = 3,
		Cost = 4,
		ReqiredMapPack = 5,
		AltDesc = 6
	},
	MaxItems = 32
}
CLASSIFIED_PACK_THRESHOLD = 4
SHOW_CLASSIFIED_UPGRADES = true
function UsingExtinctionTokens()
	local f1_local0 = Engine.GetDvarInt( "extinction_tokens_enabled" )
	return f1_local0 and f1_local0 > 0
end

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

LUI.mp_menus.AliensPurchasables.PurchasableItem_GetRef = function( f2_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Idx, tostring( f2_arg0 ), AlienPurchasableItems.Cols.Ref )
end

LUI.mp_menus.AliensPurchasables.PurchasableItem_GetIdx =  function( f3_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f3_arg0, AlienPurchasableItems.Cols.Idx )
end

LUI.mp_menus.AliensPurchasables.PurchasableItem_GetCost = function( f4_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f4_arg0, AlienPurchasableItems.Cols.Cost )
end

LUI.mp_menus.AliensPurchasables.PurchasableItem_GetName = function( f5_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f5_arg0, AlienPurchasableItems.Cols.Name )
end

LUI.mp_menus.AliensPurchasables.PurchasableItem_GetDesc = function( f6_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f6_arg0, AlienPurchasableItems.Cols.Desc )
end

LUI.mp_menus.AliensPurchasables.PurchasableItem_GetAltDesc = function( f7_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f7_arg0, AlienPurchasableItems.Cols.AltDesc )
end

LUI.mp_menus.AliensPurchasables.PurchasableItem_GetRequiredMapPack = function( f8_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, "multi_class", AlienPurchasableItems.Cols.ReqiredMapPack )
end

PurchasableItem_GetRef = function( f2_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Idx, tostring( f2_arg0 ), AlienPurchasableItems.Cols.Ref )
end

PurchasableItem_GetIdx =  function( f3_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f3_arg0, AlienPurchasableItems.Cols.Idx )
end

PurchasableItem_GetCost = function( f4_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f4_arg0, AlienPurchasableItems.Cols.Cost )
end

PurchasableItem_GetName = function( f5_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f5_arg0, AlienPurchasableItems.Cols.Name )
end

PurchasableItem_GetDesc = function( f6_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f6_arg0, AlienPurchasableItems.Cols.Desc )
end

PurchasableItem_GetAltDesc = function( f7_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f7_arg0, AlienPurchasableItems.Cols.AltDesc )
end

PurchasableItem_GetRequiredMapPack = function( f8_arg0 )
	return TableLookup( LUI.mp_menus.AliensPurchasables.AlienPurchasableItems.File, AlienPurchasableItems.Cols.Ref, f8_arg0, AlienPurchasableItems.Cols.ReqiredMapPack )
end

LUI.mp_menus.AliensPurchasables.PurchasableItems_IsRestricted = function( f9_arg0 )
	return false
end

LUI.mp_menus.AliensPurchasables.PurchasableItems_IsClassified = function( f10_arg0 )
	return false
end


PurchasableItems_IsRestricted = function( f9_arg0 )
	return false
end

PurchasableItems_IsClassified = function( f10_arg0 )
	return false
end

function GetPlayerTokens( f11_arg0 )
	return Engine.GetPlayerDataReservedInt( f11_arg0, CoD.StatsGroup.Coop, "extinction_tokens" ) or 0
end

function SetPlayerTokens( f12_arg0, f12_arg1 )
	Engine.SetPlayerDataReservedInt( f12_arg0, CoD.StatsGroup.Coop, "extinction_tokens", f12_arg1 )
end

function CheckCanAfford( f13_arg0, f13_arg1 )
	return f13_arg1 <= GetPlayerTokens( f13_arg0 )
end

function AliensSetIsUpgradeEnabledWrapper( f14_arg0, f14_arg1, f14_arg2 )
	Engine.AliensSetIsUpgradeEnabled( f14_arg0, f14_arg1, f14_arg2 )
	if f14_arg1 == "multi_class" and f14_arg2 then
		LUI.mp_menus.Aliens.setDefaultSecondaryClass( f14_arg0 )
	end
	if f14_arg1 == "combined_ammo_upgrade" and not f14_arg2 then
		if LUI.mp_menus.Aliens.GetAlienAbility( f14_arg0, "munition" ) == "dpad_placeholder_ammo_2" then
			LUI.mp_menus.Aliens.SetAlienAbility( f14_arg0, "munition", "dpad_team_ammo_reg" )
		end
	elseif f14_arg1 == "combined_ammo_upgrade" and f14_arg2 then
		LUI.mp_menus.Aliens.SetAlienAbility( f14_arg0, "munition", "dpad_placeholder_ammo_2" )
	end
end

LUI.mp_menus.Aliens.HasSeenVideo = function( f87_arg0, f87_arg1 )
	return true
end

if Engine.InFrontend() then
	function OpenTokenStore( f15_arg0, f15_arg1 )
		if UsingExtinctionTokens() then
			LUI.FlowManager.RequestPopupMenu( f15_arg0, "alien_purchasables_main", true, f15_arg1.controller, false, {} )
		end
	end
	
	LUI.mp_menus.AliensPurchasables.TryOneTimePrestigeAward = function( f16_arg0 )
		if not UsingExtinctionTokens() then
			return 
		elseif Engine.GetPlayerDataReservedInt( f16_arg0, CoD.StatsGroup.Coop, "awarded_prestige_tokens" ) == 0 then
			return
		end
	end
	
	TryOneTimePrestigeAward = function( f16_arg0 )
		if not UsingExtinctionTokens() then
			return 
		elseif Engine.GetPlayerDataReservedInt( f16_arg0, CoD.StatsGroup.Coop, "awarded_prestige_tokens" ) == 0 then
			return
		end
	end
	
	PurchasablesFeeder = function( f17_arg0 )
		local f17_local0 = f17_arg0.exclusiveController
		if not f17_local0 then
			f17_local0 = Engine.GetFirstActiveController()
		end
		local f17_local1 = {}
		for f17_local2 = 0, AlienPurchasableItems.MaxItems - 1, 1 do
			local f17_local5 = TableLookup( AlienPurchasableItems.File, AlienPurchasableItems.Cols.Idx, tostring( f17_local2 ), AlienPurchasableItems.Cols.Ref )
			if f17_local5 == "" then
				break
			end
			local f17_local6 = {
				type = "alien_purchasable_button",
				id = "purchase_btn_" .. tostring( f17_local2 ),
				properties = {
					controller = f17_local0,
					itemRef = f17_local5
				}
			}
			local f17_local7 = PurchasableItems_IsClassified( f17_local5 )
			if not f17_local7 then
				f17_local1[#f17_local1 + 1] = f17_local6
			end
			if f17_local7 and SHOW_CLASSIFIED_UPGRADES then
				f17_local1[#f17_local1 + 1] = f17_local6
			end
		end
		table.sort( f17_local1, function ( f18_arg0, f18_arg1 )
			if PurchasableItem_GetRequiredMapPack( f18_arg0.properties.itemRef ) < PurchasableItem_GetRequiredMapPack( f18_arg1.properties.itemRef ) then
				return true
			else
				return false
			end
		end )
		local customupgrade1 = "headstart_upgrade"
		local customupgrade1 = {
			type = "custom_armory_button",
			id = "purchase_btn_32",
			properties = {
				controller = f17_local0,
				itemRef = "2",
				cost = 750,
				name = "Headstart",
				desc = "Start with +1 in everything."
			}
		}
		local customupgrade2 = "triple_class_upgrade"
		local customupgrade2 = {
			type = "custom_armory_button",
			id = "purchase_btn_33",
			properties = {
				controller = f17_local0,
				itemRef = "1",
				cost = 2000,
				name = "Triple Class",
				desc = "Allows you to take a third class. This upgrade does nothing if you dont have double class already purchased."
			}
		}
		local customupgrade3 = "fast_box_use_upgrade"
		local customupgrade3 = {
			type = "custom_armory_button",
			id = "purchase_btn_34",
			properties = {
				controller = f17_local0,
				itemRef = "0",
				cost = 15,
				name = "Fast Box Use",
				desc = "Instantly take a dropped supply box when pressing the use button on it."
			}
		}
		local customupgrade4 = "gun_while_down_upgrade"
		local customupgrade4 = {
			type = "custom_armory_button",
			id = "purchase_btn_35",
			properties = {
				controller = f17_local0,
				itemRef = "3",
				cost = 100,
				name = "Primary In Last Stand",
				desc = "Allows you to use your primary weapon while in last stand."
			}
		}
		local customupgrade5 = "quadruple_class"
		local customupgrade5 = {
			type = "custom_armory_button",
			id = "purchase_btn_36",
			properties = {
				controller = f17_local0,
				itemRef = "4",
				cost = -1,
				name = "Quadruple Class",
				desc = "Mastery level upgrade. This upgrade allows you to take a fourth class. Does nothing if you do not already have double and triple class.",
				unlockReq = "Complete Point of Contact on Brutal difficulty."
			}
		}
		local customupgrade6 = "primary_expertise"
		local customupgrade6 = {
			type = "custom_armory_button",
			id = "purchase_btn_37",
			properties = {
				controller = f17_local0,
				itemRef = "5",
				cost = 1250,
				name = "Primary Expertise",
				desc = "Doubles all buffs of your primary class, and greatly increases the effectiveness of the class ability."
			}
		}
		local customupgrade7 = "hypno_everything"
		local customupgrade7 = {
			type = "custom_armory_button",
			id = "purchase_btn_38",
			properties = {
				controller = f17_local0,
				itemRef = "6",
				cost = 250,
				name = "Hypno All Aliens",
				desc = "Allows you to use a hypno knife on seeders, gargoyles, and mammoths."
			}
		}
		local customupgrade8 = "double_tactical"
		local customupgrade8 = {
			type = "custom_armory_button",
			id = "purchase_btn_39",
			properties = {
				controller = f17_local0,
				itemRef = "7",
				cost = 300,
				name = "Extra Tactical",
				desc = "Grants a second tactical slot that can be used to hold two different tacticals at the same time. Additionally, both slots can hold two items. Double tapping the bumper will use the other tactical."
			}
		}
		local customupgrade9 = "one_man_army"
		local customupgrade9 = {
			type = "custom_armory_button",
			id = "purchase_btn_40",
			properties = {
				controller = f17_local0,
				itemRef = "8",
				cost = -1,
				name = "One Man Army",
				desc = "Mastery level upgrade. This upgrade allows you to choose an additional Team Support item, as well as a second Equalizer and Strike Package.",
				unlockReq = "Complete Nightfall on Brutal difficulty."
			}
		}
		local customupgrade10 = "extra_support"
		local customupgrade10 = {
			type = "custom_armory_button",
			id = "purchase_btn_41",
			properties = {
				controller = f17_local0,
				itemRef = "9",
				cost = 500,
				name = Engine.Localize("@EXTRA_SUPPORT"),
				desc = Engine.Localize("@EXTRA_SUPPORT_DESC")
			}
		}
		f17_local1[#f17_local1 + 1] = customupgrade3
		f17_local1[#f17_local1 + 1] = customupgrade4
		f17_local1[#f17_local1 + 1] = customupgrade8
		f17_local1[#f17_local1 + 1] = customupgrade7
		f17_local1[#f17_local1 + 1] = customupgrade10
		f17_local1[#f17_local1 + 1] = customupgrade1
		f17_local1[#f17_local1 + 1] = customupgrade6
		f17_local1[#f17_local1 + 1] = customupgrade2
		f17_local1[#f17_local1 + 1] = customupgrade5
		return f17_local1
	end
	
	alien_purchasables_main = function( f19_arg0, f19_arg1, f19_arg2 )
		local self = LUI.UIElement.new()
		self.id = "alien_purchasables_root_menu"
		self:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = 0,
			right = 0,
			top = 0,
			bottom = 0
		} )
		self:registerEventHandler( "menu_create", function ( element, event )
			element:dispatchEventToRoot( {
				name = "hide_tip",
				immediate = true
			} )
			element:dispatchEventToRoot( {
				name = "dim_all",
				immediate = true
			} )
			if Engine.GetDvarBool( "extinction_cac_enabled" ) then
				element:dispatchEventToRoot( {
					name = "add_button_helper_text",
					button_ref = "button_alt1",
					helper_text = "",
					side = "left",
					clickable = true
				} )
			end
			TryOneTimePrestigeAward( element.properties.exclusiveController )
		end )
		self:registerEventHandler( "menu_close", function ( element, event )
			element:dispatchEventToRoot( {
				name = "show_all",
				immediate = true
			} )
			element:dispatchEventToRoot( {
				name = "show_tip",
				immediate = true
			} )
			if Engine.GetDvarBool( "extinction_cac_enabled" ) then
				element:dispatchEventToRoot( {
					name = "add_button_helper_text",
					button_ref = "button_alt1",
					helper_text = Engine.Localize( "@LUA_MENU_CUSTOMIZE_CHAR" ),
					side = "left",
					clickable = true
				} )
			end
		end )
		self:animateToState( "default" )
		local f19_local1 = LUI.UIElement.new()
		f19_local1.id = "scrolling_menu_group"
		f19_local1:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = 600,
			width = 555,
			top = 145,
			height = 276
		} )
		f19_local1:animateToState( "default" )
		self:addElement( f19_local1 )
		f19_local1:addElement( LUI.MenuGenerics.generic_menu_titlebar( nil, {
			title_bar_text = Engine.Localize( "@LUA_MENU_MP_ARMORY_CAPS" ),
			font = CoD.TextSettings.BoldFont,
			title_bar_text_indent = 25,
			title_bar_alignment = LUI.Alignment.Left
		} ) )
		f19_local1:addElement( LUI.MenuGenerics.generic_menu_background_withfade( {}, {} ) )
		local f19_local2 = {
			use_arrows = false,
			use_scrollbar = true,
			bar_width = 7
		}
		local f19_local3
		if f19_arg1 then
			f19_local3 = f19_arg1.exclusiveController
			if not f19_local3 then
			
			else
				f19_local2.exclusiveController = f19_local3
				f19_local3 = LUI.UIScrollingVerticalList.new( {
					childrenFeeder = PurchasablesFeeder
				}, f19_local2 )
				f19_local3:registerAnimationState( "default", {
					topAnchor = true,
					bottomAnchor = true,
					leftAnchor = true,
					rightAnchor = true,
					top = GenericTitleBarDims.TitleBarHeight + 4,
					bottom = 0,
					left = 4,
					right = -7,
					spacing = 4
				} )
				f19_local3:animateToState( "default" )
				f19_local1:addElement( f19_local3 )
				local f19_local4 = LUI.MenuGenerics.generic_menu_background_withfade( {}, {
					top_offset = 0
				} )
				f19_local4.id = "alien_purchasables_desc_window"
				f19_local4:registerAnimationState( "default", {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					left = 600,
					width = 555,
					top = 429,
					height = 200
				} )
				f19_local4:animateToState( "default" )
				self:addElement( f19_local4 )
				local f19_local5 = LUI.UIText.new()
				f19_local5.id = "nameLabelId"
				f19_local5:registerAnimationState( "default", {
					font = CoD.TextSettings.NormalFont.Font,
					alignment = LUI.Alignment.Right,
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					left = 0,
					right = 100,
					top = 15,
					height = CoD.TextSettings.NormalFont.Height,
					red = Colors.primary_text_color.r,
					green = Colors.primary_text_color.g,
					blue = Colors.primary_text_color.b
				} )
				f19_local5:setText( Engine.Localize( "@LUA_MENU_MP_PURCHASABLE_NAME" ) )
				f19_local5:animateToState( "default" )
				f19_local4:addElement( f19_local5 )
				local f19_local6 = LUI.UIText.new()
				f19_local6.id = "nameTextId"
				f19_local6:registerAnimationState( "default", {
					font = CoD.TextSettings.NormalFont.Font,
					alignment = LUI.Alignment.Left,
					leftAnchor = false,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = 5,
					right = 430,
					top = 0,
					bottom = 0,
					red = 1,
					green = 1,
					blue = 1
				} )
				f19_local6:registerAnimationState( "classified", {
					red = Colors.alien_frontend_hilite.r,
					green = Colors.alien_frontend_hilite.g,
					blue = Colors.alien_frontend_hilite.b
				} )
				f19_local6:registerAnimationState( "unlocked", {
					red = Colors.alien_frontend_hilite.r,
					green = 0.8,
					blue = Colors.alien_frontend_hilite.b
				} )
				f19_local6:registerEventHandler( "update_purchasable_item_desc", function ( element, event )
					element:setText( event.newName )
					if event.newCost == "-1" then
						if get_custom_upgrade(f19_local2.exclusiveController, event.index) == 0 then
							element:animateToState( "classified" )
							element:setTextStyle( CoD.TextStyle.Outlined )
						else
							element:animateToState( "unlocked" )
							element:setTextStyle( CoD.TextStyle.Outlined )
						end
					else
						element:animateToState( "default" )
						element:setTextStyle( CoD.TextStyle.None )
					end
				end )
				f19_local6:animateToState( "default" )
				f19_local5:addElement( f19_local6 )
				local f19_local7 = LUI.UIText.new()
				f19_local7.id = "costLabelId"
				f19_local7:registerAnimationState( "default", {
					font = CoD.TextSettings.NormalFont.Font,
					alignment = LUI.Alignment.Right,
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					left = 0,
					right = 100,
					top = 15 + CoD.TextSettings.NormalFont.Height + 2,
					height = CoD.TextSettings.NormalFont.Height,
					red = Colors.primary_text_color.r,
					green = Colors.primary_text_color.g,
					blue = Colors.primary_text_color.b
				} )
				f19_local7:setText( Engine.Localize( "@LUA_MENU_MP_PURCHASABLE_COST" ) )
				f19_local7:animateToState( "default" )
				f19_local4:addElement( f19_local7 )
				local f19_local8 = LUI.UIImage.new( {
					material = RegisterMaterial( "alien_icon_tooth" ),
					leftAnchor = false,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = 5,
					right = 22,
					top = 0,
					bottom = 0,
					alpha = 1
				} )
				f19_local8:registerAnimationState( "hidden", {
					alpha = 0
				} )
				f19_local8.id = "tokens_icon_id"
				f19_local8:registerEventHandler( "update_purchasable_item_desc", function ( element, event )
					if event.isClassified or event.isRestricted or event.newCost == "-1" then
						element:animateToState( "hidden" )
						f19_local7:setText( "Unlock:" )
					else
						element:animateToState( "default" )
						f19_local7:setText( Engine.Localize( "@LUA_MENU_MP_PURCHASABLE_COST" ) )
					end
				end )
				f19_local7:addElement( f19_local8 )
				local f19_local9 = LUI.UIText.new()
				f19_local9.id = "costTextId"
				f19_local9:registerAnimationState( "default", {
					font = CoD.TextSettings.NormalFont.Font,
					alignment = LUI.Alignment.Left,
					leftAnchor = false,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = 25,
					right = 430,
					top = 0,
					bottom = 0,
					red = 1,
					green = 1,
					blue = 1
				} )
				f19_local9:registerAnimationState( "unlocked", {
					font = CoD.TextSettings.NormalFont.Font,
					alignment = LUI.Alignment.Left,
					leftAnchor = false,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = 5,
					right = 430,
					top = 0,
					bottom = 0,
					red = 1,
					green = 1,
					blue = 1
				} )
				f19_local9:registerAnimationState( "classified", {
					leftAnchor = false,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = 5,
					right = 430,
					top = 0,
					bottom = 0,
					red = Colors.alien_frontend_hilite.r,
					green = Colors.alien_frontend_hilite.g,
					blue = Colors.alien_frontend_hilite.b
				} )
				f19_local9:registerEventHandler( "update_purchasable_item_desc", function ( element, event )
					if event.newCost == "-1" then
						element:setText( event.unlock )
						if get_custom_upgrade(f19_local2.exclusiveController, event.index) == 0 then
							element:animateToState( "classified" )
							element:setTextStyle( CoD.TextStyle.Outlined )
						else
							element:animateToState( "unlocked" )
							element:setTextStyle( CoD.TextStyle.None )
						end
					else
						element:setText( event.newCost )
						if event.isClassified or event.isRestricted then
							element:animateToState( "classified" )
							element:setTextStyle( CoD.TextStyle.Outlined )
						else
							element:animateToState( "default" )
							element:setTextStyle( CoD.TextStyle.None )
						end
					end
				end )
				f19_local9:animateToState( "default" )
				f19_local7:addElement( f19_local9 )
				local f19_local10 = LUI.UIText.new()
				f19_local10.id = "descLabelId"
				f19_local10:registerAnimationState( "default", {
					font = CoD.TextSettings.NormalFont.Font,
					alignment = LUI.Alignment.Right,
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					left = 0,
					right = 100,
					top = 15 + 2 * CoD.TextSettings.NormalFont.Height + 4,
					height = CoD.TextSettings.NormalFont.Height,
					red = Colors.primary_text_color.r,
					green = Colors.primary_text_color.g,
					blue = Colors.primary_text_color.b
				} )
				f19_local10:setText( Engine.Localize( "@LUA_MENU_MP_PURCHASABLE_UPGRADE" ) )
				f19_local10:animateToState( "default" )
				f19_local4:addElement( f19_local10 )
				local f19_local11 = LUI.UIText.new()
				f19_local11.id = "descTextId"
				f19_local11:registerAnimationState( "default", {
					font = CoD.TextSettings.NormalFont.Font,
					alignment = LUI.Alignment.Left,
					leftAnchor = false,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = 5,
					right = 430,
					top = 0,
					bottom = 0,
					red = 1,
					green = 1,
					blue = 1
				} )
				f19_local11:registerAnimationState( "classified", {
					red = Colors.alien_frontend_hilite.r,
					green = Colors.alien_frontend_hilite.g,
					blue = Colors.alien_frontend_hilite.b
				} )
				f19_local11:registerEventHandler( "update_purchasable_item_desc", function ( element, event )
					element:setText( event.newDesc )
					if event.newCost == "-1" and get_custom_upgrade(f19_local2.exclusiveController, event.index) == 0 then
						element:animateToState( "classified" )
						element:setTextStyle( CoD.TextStyle.Outlined )
					else
						element:animateToState( "default" )
						element:setTextStyle( CoD.TextStyle.None )
					end
				end )
				f19_local11:animateToState( "default" )
				f19_local10:addElement( f19_local11 )
				local f19_local12 = LUI.UIBindButton.new()
				f19_local12.id = "purchase_menu_bind_button_id"
				f19_local12.m_ownerController = f19_arg1.exclusiveController
				f19_local12:registerEventHandler( "button_secondary", MBh.LeaveMenu() )
				self:addElement( f19_local12 )
				return self
			end
		end
		f19_local3 = Engine.GetFirstActiveController()
	end
	
	alien_purchasable_button = function( f26_arg0, f26_arg1, f26_arg2 )
		local f26_local0 = 30
		local f26_local1 = 7
		local f26_local2 = 35
		local f26_local3 = f26_arg1.controller
		if not f26_local3 then
			f26_local3 = Engine.GetFirstActiveController()
		end
		local f26_local4 = f26_arg1.itemRef or nil
		local f26_local5 = tonumber( PurchasableItem_GetCost( f26_local4 ) )
		local f26_local6 = Engine.Localize( PurchasableItem_GetName( f26_local4 ) )
		local f26_local7 = nil
		if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() == 1 then
			f26_local7 = Engine.Localize( PurchasableItem_GetDesc( f26_local4 ) )
		else
			local f26_local8 = PurchasableItem_GetAltDesc( f26_local4 )
			if f26_local8 ~= "" then
				f26_local7 = Engine.Localize( f26_local8 )
			else
				f26_local7 = Engine.Localize( PurchasableItem_GetDesc( f26_local4 ) )
			end
		end
		local f26_local8 = Engine.AliensCheckIsItemPurchased( f26_local3, f26_local4 )
		local f26_local9 = Engine.AliensCheckIsUpgradeEnabled( f26_local3, f26_local4 )
		local f26_local10 = PurchasableItems_IsRestricted( f26_local4 )
		local f26_local11 = PurchasableItems_IsClassified( f26_local4 )
		if f26_local11 then
			local self = PurchasableItem_GetRequiredMapPack( f26_local4 )
			f26_local5 = Engine.Localize( "@ALIENS_UPGRADE_CLASSIFIED_CAPS" )
			f26_local6 = Engine.Localize( "@ALIENS_UPGRADE_CLASSIFIED_CAPS" )
			f26_local7 = Engine.Localize( "@ALIENS_NEXT_EPISODE" )
		elseif f26_local10 then
			f26_local5 = Engine.Localize( "@ALIENS_UPGRADE_REQ_DLC", Engine.Localize( "DLC_MAP_PACK_" .. PurchasableItem_GetRequiredMapPack( f26_local4 ) ) )
		end
		local self = LUI.UIButton.new()
		self.id = "alien_purchasable_id"
		self:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = 0,
			right = 0,
			top = 0,
			bottom = f26_local0
		} )
		self:registerEventHandler( "button_action", function ( element, event )
			local f27_local0 = Engine.AliensCheckIsItemPurchased( f26_local3, f26_local4 )
			if f26_local11 then
				
			elseif f26_local10 then
				if Engine.UserCanAccessStore( event.controller ) then
					OpenStorePrompt( event.controller, Engine.Localize( "DLC_MAP_PACK_" .. PurchasableItem_GetRequiredMapPack( f26_local4 ) ) )
				end
			elseif f27_local0 then
				AliensSetIsUpgradeEnabledWrapper( f26_local3, f26_local4, not Engine.AliensCheckIsUpgradeEnabled( f26_local3, f26_local4 ) )
				element:processEvent( {
					name = "refresh_enabled_state"
				} )
				element:dispatchEventToRoot( {
					name = "refresh_cac_menu_buttons",
					controller = event.controller,
					immediate = true
				} )
			else
				TryConfirmPurchase( element, f26_local3, f26_local4, f26_local5 )
			end
		end )
		self:registerEventHandler( "menu_create", function ( element, event )
			element:processEvent( {
				name = "refresh_purchased_state"
			} )
		end )
		self:registerEventHandler( "button_over", function ( element, event )
			element:dispatchEventToRoot( {
				name = "update_purchasable_item_desc",
				newDesc = f26_local7,
				newCost = tostring( f26_local5 ),
				newName = f26_local6,
				isClassified = f26_local11,
				isRestricted = f26_local10
			} )
		end )
		self:animateToState( "default" )
		local f26_local13 = LUI.UIImage.new()
		f26_local13.id = "btn_background_id"
		f26_local13:registerAnimationState( "default", {
			material = RegisterMaterial( "white" ),
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			alpha = 0
		} )
		f26_local13:registerAnimationState( "dimmed", {
			alpha = 0.5
		} )
		f26_local13:registerAnimationState( "focus", {
			alpha = 0.8
		} )
		f26_local13:registerEventHandler( "button_over", MBh.AnimateLoop( {
			{
				"focus",
				0,
				true,
				true
			},
			{
				"focus",
				350,
				true,
				true
			},
			{
				"dimmed",
				750,
				true,
				true
			},
			{
				"focus",
				750,
				true,
				true
			}
		} ) )
		f26_local13:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
		f26_local13:animateToState( "default" )
		self:addElement( f26_local13 )
		local f26_local14 = LUI.UIText.new()
		f26_local14.id = "main_text"
		local f26_local15 = f26_local14
		local f26_local16 = f26_local14.registerAnimationState
		local f26_local17 = "default"
		local f26_local18 = {
			font = CoD.TextSettings.NormalFont.Font,
			alignment = LUI.Alignment.Left,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = false,
			left = f26_local1,
			right = 0,
			top = -CoD.TextSettings.NormalFont.Height / 2,
			bottom = CoD.TextSettings.NormalFont.Height / 2
		}
		local f26_local19 = Colors.primary_text_color.r
	end

	function TryConfirmPurchase( f33_arg0, f33_arg1, f33_arg2, f33_arg3, upgradeid )
		local f33_local0 = {}
		if CheckCanAfford( f33_arg1, f33_arg3 ) then
			f33_local0.yes_action = function ( f34_arg0, f34_arg1 )
				ConfirmPurchase( f33_arg0, f33_arg1, f33_arg2, f33_arg3, upgradeid )
			end
			if f33_arg3 == -1 then
				f33_local0.message_text = "Access Denied! This upgrade can only be unlocked by completing the unlock requirement!"
				LUI.FlowManager.RequestPopupMenu( self, "aliens_cannot_purchase_popup", true, f33_arg1, false, f33_local0 )
			else
				f33_local0.message_text = Engine.Localize( "LUA_MENU_MP_PURCHASE_CONFIRM", f33_arg2, tostring( f33_arg3 ) )
				LUI.FlowManager.RequestPopupMenu( self, "aliens_confirm_purchase_popup", true, f33_arg1, false, f33_local0 )
			end
		else
			f33_local0.message_text = Engine.Localize( "LUA_MENU_MP_PUCRCHASE_DENIED", tostring( f33_arg3 ) )
			LUI.FlowManager.RequestPopupMenu( self, "aliens_cannot_purchase_popup", true, f33_arg1, false, f33_local0 )
		end
	end
	
	function ConfirmPurchase( f35_arg0, f35_arg1, f35_arg2, f35_arg3, upgradeid )
		if CheckCanAfford( f35_arg1, f35_arg3 ) then
			SetPlayerTokens( f35_arg1, GetPlayerTokens( f35_arg1 ) - f35_arg3 )
			set_custom_upgrade(f35_arg1, upgradeid, 2)
			f35_arg0:processEvent( {
				name = "refresh_purchased_state_" .. upgradeid,
				immediate = true
			} )
			f35_arg0:processEvent( {
				name = "refresh_enabled_state_" .. upgradeid,
				immediate = true
			} )
			f35_arg0:dispatchEventToRoot( {
				name = "refresh_cac_menu_buttons",
				controller = f35_arg1,
				immediate = true
			} )
		end
	end
	
	function aliens_confirm_purchase_popup()
		return {
			type = "generic_yesno_popup",
			id = "confirm_purchase_popup_id",
			properties = {
				popup_title = Engine.Localize( "@LUA_MENU_PURCHASE_CAPS" ),
				yes_text = Engine.Localize( "@MENU_YES" ),
				no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
			}
		}
	end
	
	function aliens_cannot_purchase_popup()
		return {
			type = "generic_confirmation_popup",
			id = "aliens_cannot_purchase_popup_id",
			properties = {
				popup_title = Engine.Localize( "@MENU_ERROR" ),
				button_text = Engine.Localize( "@MENU_OK" )
			}
		}
	end
	
	function aliens_gift_tokens_popup()
		return {
			type = "generic_confirmation_popup",
			id = "aliens_cannot_purchase_popup_id",
			properties = {
				popup_title = Engine.Localize( "@LUA_MENU_ALIENS" ),
				button_text = Engine.Localize( "@MENU_OK" )
			}
		}
	end
	
	function OpenStorePrompt( f39_arg0, f39_arg1 )
		if Engine.UserCanAccessStore( f39_arg0 ) then
			LUI.FlowManager.RequestPopupMenu( self, "aliens_prompt_to_real_money_store", true, f39_arg0, false, {
				message_text = Engine.Localize( "@ALIENS_UPGRADE_REQ_DLC_PROMPT", f39_arg1 )
			} )
		end
	end
	
	function GoToStore( f40_arg0, f40_arg1 )
		if Engine.UserCanAccessStore( f40_arg1.controller ) then
			LUI.FlowManager.RequestLeaveMenu( f40_arg0 )
			Engine.SetDvarBool( "ui_onlineRequired", true )
			if not Sns.OpenStoreMenu( f40_arg1.controller, "extinction_armory", false, "dlc3" ) then
				Engine.SetDvarBool( "ui_onlineRequired", false )
			else
				LUI.FlowManager.RequestLeaveMenuByName( "alien_purchasables_main" )
			end
		end
	end
	
	function aliens_prompt_to_real_money_store()
		return {
			type = "generic_yesno_popup",
			id = "aliens_prompt_to_real_money_store",
			properties = {
				popup_title = Engine.Localize( "@LUA_MENU_ALIENS" ),
				yes_text = Engine.Localize( "@MENU_YES" ),
				yes_action = GoToStore,
				no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
			}
		}
	end

	function set_custom_upgrade(controller, index, state)
		fixIndex = index % 5
		variable = math.floor(index/5) + 1
		n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "has_seen_episode_" .. variable .. "_intro" )
		n = n- get_custom_upgrade(controller, index) * (3 ^ fixIndex)
		Engine.SetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "has_seen_episode_" .. variable .. "_intro", n + (state * (3 ^ fixIndex)))
	end

	function get_custom_upgrade(controller, index)
		fixIndex = index % 5
		variable = math.floor(index/5) + 1
		n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "has_seen_episode_" .. variable .. "_intro" )
		return (math.floor(n / (3 ^ fixIndex))) % 3
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

	function custom_armory_button( arg_1, arg_2 )
		local f42_local0 = CoD.TextSettings.NormalFont.Height + 9
		local f42_local1 = 7
		local f42_local2 = 110
		local f42_local3 = CoD.TextSettings.NormalFont
		local f42_local4 = arg_2.name
		local f42_local5, f42_local6, f42_local7, f42_local8 = GetTextDimensions( f42_local4, f42_local3.Font, f42_local3.Height )
		local f42_local9 = f42_local7 - f42_local5 + f42_local1 + 10
		local f42_local15 = Engine.GetFirstActiveController()
		local f42_local16 = get_custom_upgrade(f42_local15, arg_2.itemRef)
		local self = LUI.UIButton.new()
		self.id = "custom_upgrade_button_" .. arg_2.itemRef 
		self:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = 0,
			right = 0,
			top = 0,
			bottom = f42_local0
		} )
		self:registerEventHandler( "button_over", function ( element, event )
			element:dispatchEventToRoot( {
				name = "update_purchasable_item_desc",
				newDesc = arg_2.desc,
				newCost = tostring(arg_2.cost),
				newName = arg_2.name,
				isClassified = false,
				isRestricted = false,				
				index = arg_2.itemRef,
				unlock = arg_2.unlockReq
			} )
		end )
		self:registerEventHandler( "button_action", function ( element, event )
			if ( get_custom_upgrade(f42_local15, arg_2.itemRef) == 0 ) then
				TryConfirmPurchase( element, f42_local15, arg_2.name, arg_2.cost, arg_2.itemRef )
			else
				local f42_local23 = get_custom_upgrade(f42_local15, arg_2.itemRef)
				if ( f42_local23 == 1 ) then
					set_custom_upgrade(f42_local15, arg_2.itemRef, 2)
				elseif ( f42_local23 == 2 ) then
					set_custom_upgrade(f42_local15, arg_2.itemRef, 1)
				end
				element:processEvent( {
					name = "refresh_enabled_state_" .. arg_2.itemRef
				} )
				element:dispatchEventToRoot( {
					name = "refresh_cac_menu_buttons",
					controller = event.controller,
					immediate = true
				} )
			end
		end )
		self:animateToState( "default", 0 )
		local f42_local12 = LUI.UIImage.new()
		f42_local12.id = "armory_button_background"
		f42_local12:registerAnimationState( "default", {
			material = RegisterMaterial( "white" ),
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0
		} )
		f42_local12:registerAnimationState( "dimmed", {
			alpha = 0.5
		} )
		f42_local12:registerAnimationState( "focus", {
			alpha = 0.8
		} )
		f42_local12:registerEventHandler( "button_over", MBh.AnimateLoop( {
			{
				"focus",
				0,
				true,
				true
			},
			{
				"focus",
				350,
				true,
				true
			},
			{
				"dimmed",
				750,
				true,
				true
			},
			{
				"focus",
				750,
				true,
				true
			}
		} ) )
		f42_local12:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
		f42_local12:registerEventHandler( "button_locked", MBh.AnimateToState( "focus", 0 ) )
		f42_local12:animateToState( "default" )
		self:addElement( f42_local12 )
		local f42_local13 = LUI.UIText.new()
		f42_local13.id = "button_lable"
		f42_local13:registerAnimationState( "default", {
			font = f42_local3.Font,
			alignment = LUI.Alignment.Left,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = f42_local1,
			right = 0,
			top = 5,
			bottom = 5 + f42_local3.Height,
			red = 0.55,
			green = 0.55,
			blue = 0.55,
			alpha = 1
		} )
		f42_local13:registerAnimationState( "focus", {
			red = 0.24,
			green = 0.24,
			blue = 0.24
		} )
		f42_local13:registerAnimationState( "unlocked", {
			red = Colors.alien_frontend_hilite.r,
			green = 0.8,
			blue = Colors.alien_frontend_hilite.b
		} )
		f42_local13:registerAnimationState( "locked", {
			red = Colors.alien_frontend_hilite.r,
			green = Colors.alien_frontend_hilite.g,
			blue = Colors.alien_frontend_hilite.b
		} )
		f42_local13:registerEventHandler( "button_over", function ( element, event )
			if arg_2.cost == -1 then
				f42_local13:setTextStyle( CoD.TextStyle.Outlined )
				if get_custom_upgrade(f42_local15, arg_2.itemRef) == 0 then
					f42_local13:animateToState( "locked" )
				else
					f42_local13:animateToState( "unlocked" )
				end
			else
				f42_local13:animateToState( "focus" )
			end
		end )
		f42_local13:registerEventHandler( "button_up", function ( element, event )
			if arg_2.cost == -1 then
				f42_local13:setTextStyle( CoD.TextStyle.Outlined )
				if get_custom_upgrade(f42_local15, arg_2.itemRef) == 0 then
					f42_local13:animateToState( "locked" )
				else
					f42_local13:animateToState( "unlocked" )
				end
			else
				f42_local13:animateToState( "default" )
			end
		end )
		f42_local13:animateToState( "default" )
		if arg_2.cost == -1 then
			f42_local13:setTextStyle( CoD.TextStyle.Outlined )
			if get_custom_upgrade(f42_local15, arg_2.itemRef) == 0 then
				f42_local13:animateToState( "locked" )
			else
				f42_local13:animateToState( "unlocked" )
			end
		else
			f42_local13:animateToState( "default" )
		end
		f42_local13:setText( f42_local4 )
		self:addElement( f42_local13 )

		local f42_local17 = LUI.UIImage.new()
		f42_local17.id = "restricted_icon"
		f42_local17:registerAnimationState( "default", {
			material = RegisterMaterial( "icon_unlock_active" ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = true,
			top = -8,
			bottom = 8,
			left = -24,
			right = -8,
			alpha = 1
		} )
		f42_local17:registerAnimationState( "hidden", {
			material = RegisterMaterial( "icon_unlock_active" ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = true,
			top = -8,
			bottom = 8,
			left = -24,
			right = -8,
			alpha = 0
		} )
		f42_local17:registerEventHandler( "refresh_purchased_state_" .. arg_2.itemRef, function ( element, event )
			local f42_local21 = get_custom_upgrade(f42_local15, arg_2.itemRef)
			if ( f42_local21 == 0 ) then
				f42_local17:animateToState( "default" )
			else
				f42_local17:animateToState( "hidden" )
			end
		end )
		if (f42_local16 == 0 ) then
			f42_local17:animateToState( "default" )
		else
			f42_local17:animateToState( "hidden" )
		end
		self:addElement( f42_local17 )

		local f42_local18 = LUI.UIImage.new()
		f42_local18.id = "checkbox"
		f42_local18:registerAnimationState( "default", {
			material = RegisterMaterial( "box_empty" ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = true,
			top = -6,
			bottom = 6,
			left = -22,
			right = -10,
			alpha = 1
		} )
		f42_local18:registerAnimationState( "hidden", {
			material = RegisterMaterial( "box_empty" ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = true,
			top = -6,
			bottom = 6,
			left = -22,
			right = -10,
			alpha = 0
		} )

		f42_local18:registerEventHandler( "refresh_purchased_state_" .. arg_2.itemRef, function ( element, event )
			local f42_local22 = get_custom_upgrade(f42_local15, arg_2.itemRef)
			if ( f42_local22 == 0 ) then
				f42_local18:animateToState( "hidden" )
			else
				f42_local18:animateToState( "default" )
			end
		end )
		if (f42_local16 == 0 ) then
			f42_local18:animateToState( "hidden" )
		else
			f42_local18:animateToState( "default" )
		end
		self:addElement( f42_local18 )
		local f42_local19 = LUI.UIImage.new( {
			material = RegisterMaterial( "white" ),
			red = Colors.alien_frontend_hilite.r,
			green = Colors.alien_frontend_hilite.g,
			blue = Colors.alien_frontend_hilite.b,
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 2,
			bottom = -2,
			left = 2,
			right = -2,
			alpha = 0
		} )
		f42_local19.id = "checkmark"
		f42_local19:registerAnimationState( "checked", {
			alpha = 1
		} )
		f42_local19:registerEventHandler( "refresh_enabled_state_" .. arg_2.itemRef, function ( element, event )
			local f42_local20 = get_custom_upgrade(f42_local15, arg_2.itemRef)
			if (arg_2.itemRef == "1") then
				if ( f42_local20 == 2 ) then
					setDefaultThirdClass(f42_local15)
				elseif ( f42_local20 == 1 ) then
					Engine.SetPlayerDataReservedInt( f42_local15, CoD.StatsGroup.Coop, "secondary_class", math.floor(Engine.GetPlayerDataReservedInt( f42_local15, CoD.StatsGroup.Coop, "secondary_class" )/5)*5 )
				end
			elseif (arg_2.itemRef == "9") then
				if ( f42_local20 == 2 ) then
					setDefaultSecondSupport( f42_local15 )
				elseif ( f42_local20 == 1 ) then
					set_extra_loadout(f42_local15, 0, 0)
				end
			end
			if ( f42_local20 == 2 ) then
				f42_local19:animateToState( "checked" )
			elseif ( f42_local20 == 1 ) then
				f42_local19:animateToState( "default" )
			end
		end )
		if (f42_local16 == 2 ) then
			f42_local19:animateToState( "checked" )
		else
			f42_local19:animateToState( "default" )
		end
		f42_local18:addElement( f42_local19 )
		return self
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

	function aliens_cac_armory_button()
		local f42_local0 = CoD.TextSettings.NormalFont.Height + 10
		local f42_local1 = 120
		local f42_local2 = 110
		local f42_local3 = CoD.TextSettings.NormalFont
		local f42_local4 = Engine.Localize( "@LUA_MENU_MP_ARMORY_CAPS" )
		local f42_local5, f42_local6, f42_local7, f42_local8 = GetTextDimensions( f42_local4, f42_local3.Font, f42_local3.Height )
		local f42_local9 = f42_local7 - f42_local5 + f42_local1 + 10
		local self = LUI.UIButton.new()
		self.id = "armory_button_id"
		self:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = 0,
			right = 0,
			top = 0,
			bottom = f42_local0
		} )
		self:registerEventHandler( "button_action", function ( element, event )
			element:dispatchEventToRoot( {
				name = "hide_tip",
				immediate = true
			} )
			element:dispatchEventToRoot( {
				name = "dim_all",
				immediate = true
			} )
			element:dispatchEventToChildren( {
				name = "button_locked",
				immediate = true
			} )
			OpenTokenStore( element, event )
		end )
		self:registerEventHandler( "button_over", function ( element, event )
			element:dispatchEventToRoot( {
				name = "show_all",
				immediate = true
			} )
			element:dispatchEventToRoot( {
				name = "update_tip",
				immediate = true,
				new_Text = Engine.Localize( "@LUA_MENU_MP_ARMORY_DESC" )
			} )
			element:dispatchEventToRoot( {
				name = "show_tip",
				immediate = true
			} )
			element:dispatchEventToRoot( {
				name = "selection_info_set_header_text",
				newText = Engine.Localize( "@LUA_MENU_MP_ARMORY_CAPS" ),
				disabled_in_chaos = true
			} )
			element:dispatchEventToRoot( {
				name = "show_bonus_pool",
				immediate = true
			} )
		end )
		self:registerEventHandler( "button_up", function ( element, event )
			element:dispatchEventToRoot( {
				name = "hide_bonus_pool",
				immediate = true
			} )
		end )
		self:animateToState( "default", 0 )
		local f42_local11 = LUI.UIImage.new()
		f42_local11.id = "btn_divider_id"
		f42_local11:registerAnimationState( "default", {
			material = RegisterMaterial( "white" ),
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = true,
			left = 0,
			right = 0,
			top = 0,
			bottom = 1,
			alpha = 0.1
		} )
		f42_local11:animateToState( "default" )
		self:addElement( f42_local11 )
		local f42_local12 = LUI.UIImage.new()
		f42_local12.id = "armory_button_background"
		f42_local12:registerAnimationState( "default", {
			material = RegisterMaterial( "btn_alien_loadout_rtcap_f" ),
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = 0,
			right = 0,
			top = 0,
			bottom = 10,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0
		} )
		f42_local12:registerAnimationState( "dim", {
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0.5
		} )
		f42_local12:registerAnimationState( "focus", {
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0.8
		} )
		f42_local12:registerAnimationState( "locked", {
			red = Colors.frontend_hilite.r,
			green = Colors.frontend_hilite.g,
			blue = Colors.frontend_hilite.b,
			alpha = 1
		} )
		f42_local12:registerEventHandler( "button_over", MBh.AnimateLoop( {
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
		} ) )
		f42_local12:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
		f42_local12:registerEventHandler( "button_locked", MBh.AnimateToState( "focus", 0 ) )
		f42_local12:animateToState( "default" )
		self:addElement( f42_local12 )
		local f42_local13 = LUI.UIText.new()
		f42_local13.id = "button_lable"
		f42_local13:registerAnimationState( "default", {
			font = f42_local3.Font,
			alignment = LUI.Alignment.Left,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = f42_local1,
			right = 0,
			top = 5,
			bottom = 5 + f42_local3.Height,
			red = 0.7,
			green = 0.7,
			blue = 0.7,
			alpha = 1
		} )
		f42_local13:registerAnimationState( "focus", {
			red = 0,
			green = 0,
			blue = 0
		} )
		f42_local13:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
		f42_local13:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
		f42_local13:registerEventHandler( "button_locked", MBh.AnimateToState( "focus" ) )
		f42_local13:animateToState( "default" )
		f42_local13:setText( f42_local4 )
		self:addElement( f42_local13 )
		local f42_local14 = LUI.UIText.new()
		f42_local14.id = "button_subtext"
		f42_local14:registerAnimationState( "default", {
			font = CoD.TextSettings.BoldFont.Font,
			alignment = LUI.Alignment.Left,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = f42_local9,
			right = 0,
			top = 5,
			bottom = 5 + CoD.TextSettings.BoldFont.Height,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1
		} )
		f42_local14:registerAnimationState( "focus", {
			red = 0,
			green = 0,
			blue = 0
		} )
		f42_local14:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
		f42_local14:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
		f42_local14:registerEventHandler( "button_locked", MBh.AnimateToState( "focus" ) )
		f42_local14:animateToState( "default" )
		f42_local14:setText( Engine.Localize( "@LUA_MENU_MP_ARMORY_SUBTEXT" ) )
		self:addElement( f42_local14 )
		return self
	end
	
	function weekly_bonus_widget( f46_arg0, f46_arg1, f46_arg2 )
		local f46_local0 = f46_arg1 or {}
		local f46_local1 = f46_local0.controller
		if not f46_local1 then
			f46_local1 = Engine.GetFirstActiveController()
		end
		local f46_local2 = f46_local0.xPos or 0
		local f46_local3 = f46_local0.yPos or 0
		local self = LUI.UIElement.new()
		self.id = "weekly_bonus_widget"
		self:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = f46_local2,
			right = 0,
			top = f46_local3,
			bottom = 0,
			alpha = 0
		} )
		self:registerAnimationState( "visible", {
			alpha = 1
		} )
		self:registerEventHandler( "show_bonus_pool", MBh.AnimateToState( "visible" ) )
		self:registerEventHandler( "hide_bonus_pool", MBh.AnimateToState( "default" ) )
		self:animateToState( "default" )
		if UsingExtinctionTokens() and IsOnlineMatch() then
			local f46_local5 = LUI.UIHorizontalList.new()
			f46_local5.id = "TextLineOneId"
			f46_local5:registerAnimationState( "default", {
				alignment = LUI.Alignment.Left,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = 0,
				bottom = CoD.TextSettings.NormalFont.Height
			} )
			f46_local5:animateToState( "default" )
			self:addElement( f46_local5 )
			local f46_local6 = Engine.Localize( "@ALIENS_BONUS_POOL" )
			local f46_local7, f46_local8, f46_local9, f46_local10 = GetTextDimensions( f46_local6, CoD.TextSettings.NormalFont.Font, CoD.TextSettings.NormalFont.Height )
			local f46_local11 = f46_local9 - f46_local7 + 5
			local f46_local12 = LUI.UIText.new()
			f46_local12.id = "title_text"
			f46_local12:registerAnimationState( "default", {
				font = CoD.TextSettings.NormalFont.Font,
				alignment = LUI.Alignment.Left,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = f46_local11,
				top = 0,
				bottom = 0,
				red = Colors.primary_text_color.r,
				green = Colors.primary_text_color.g,
				blue = Colors.primary_text_color.b
			} )
			f46_local12:setText( f46_local6 )
			f46_local12:animateToState( "default" )
			f46_local5:addElement( f46_local12 )
			local f46_local13 = tostring( Engine.GetPlayerDataReservedInt( f46_local1, CoD.StatsGroup.Coop, "bonus_pool_size" ) or 0 )
			local f46_local14, f46_local15, f46_local16, f46_local17 = GetTextDimensions( f46_local13, CoD.TextSettings.NormalFont.Font, CoD.TextSettings.NormalFont.Height )
			f46_local10 = f46_local17
			f46_local9 = f46_local16
			f46_local8 = f46_local15
			f46_local14 = f46_local9 - f46_local14 + 2
			f46_local15 = LUI.UIText.new()
			f46_local15.id = "pool_text"
			f46_local15:registerAnimationState( "default", {
				font = CoD.TextSettings.NormalFont.Font,
				alignment = LUI.Alignment.Left,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = f46_local14,
				top = 0,
				bottom = 0,
				red = Colors.alien_frontend_hilite.r,
				green = Colors.alien_frontend_hilite.g,
				blue = Colors.alien_frontend_hilite.b
			} )
			f46_local15:setTextStyle( CoD.TextStyle.Outlined )
			f46_local15:setText( f46_local13 )
			f46_local15:animateToState( "default" )
			f46_local5:addElement( f46_local15 )
			f46_local16 = LUI.UIImage.new()
			f46_local16.id = "tokens_icon_id"
			f46_local16:registerAnimationState( "default", {
				material = RegisterMaterial( "alien_icon_tooth" ),
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = CoD.TextSettings.NormalFont.Height,
				top = 0,
				bottom = 0
			} )
			f46_local16:animateToState( "default" )
			f46_local5:addElement( f46_local16 )
			f46_local17 = LUI.UIText.new()
			f46_local17.id = "timer_text"
			f46_local17:registerAnimationState( "default", {
				font = CoD.TextSettings.NormalFont.Font,
				alignment = LUI.Alignment.Left,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = CoD.TextSettings.NormalFont.Height,
				bottom = 2 * CoD.TextSettings.NormalFont.Height,
				red = Colors.primary_text_color.r,
				green = Colors.primary_text_color.g,
				blue = Colors.primary_text_color.b
			} )
			local f46_local18, f46_local19, f46_local20, f46_local21 = Engine.GetExtinctionBonusDeadline( f46_local1 )
			f46_local17:setText( Engine.Localize( "LUA_MENU_DAYS_HOURS_MINUTES_SECONDS", f46_local18, f46_local19, f46_local20, f46_local21 ) )
			f46_local17:registerEventHandler( "set_countdown_time", function ( element, event )
				local f47_local0, f47_local1, f47_local2, f47_local3 = Engine.GetExtinctionBonusDeadline( f46_local1 )
				element:setText( Engine.Localize( "LUA_MENU_DAYS_HOURS_MINUTES_SECONDS", f47_local0, f47_local1, f47_local2, f47_local3 ) )
				Engine.UpdateExtinctionBonusDeadline( f46_local1 )
			end )
			f46_local17:animateToState( "default" )
			self:addElement( f46_local17 )
			local f46_local22 = LUI.UITimer.new( 500, "set_countdown_time", nil, false, false, false, false )
			f46_local22.id = "bonus_countdown_timer"
			f46_local17:addElement( f46_local22 )
			local f46_local23 = LUI.UIText.new()
			f46_local23.id = "subText1"
			f46_local23:registerAnimationState( "default", {
				font = CoD.TextSettings.NormalFont.Font,
				alignment = LUI.Alignment.Left,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = 2 * CoD.TextSettings.NormalFont.Height,
				bottom = 3 * CoD.TextSettings.NormalFont.Height,
				red = Colors.primary_text_color.r,
				green = Colors.primary_text_color.g,
				blue = Colors.primary_text_color.b
			} )
			f46_local23:setText( Engine.Localize( "@ALIENS_BONUS_POOL_TIP" ) )
			f46_local23:animateToState( "default" )
			self:addElement( f46_local23 )
			local f46_local24 = LUI.UIText.new()
			f46_local24.id = "subText2"
			f46_local24:registerAnimationState( "default", {
				font = CoD.TextSettings.NormalFont.Font,
				alignment = LUI.Alignment.Left,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = 3 * CoD.TextSettings.NormalFont.Height,
				bottom = 4 * CoD.TextSettings.NormalFont.Height,
				red = Colors.primary_text_color.r,
				green = Colors.primary_text_color.g,
				blue = Colors.primary_text_color.b
			} )
			f46_local24:setText( Engine.Localize( "@ALIENS_BONUS_POOL_DESC" ) )
			f46_local24:animateToState( "default" )
			self:addElement( f46_local24 )
		end
		return self
	end
	LUI.MenuBuilder.m_types[ "alien_purchasables_main" ] = alien_purchasables_main
	LUI.MenuBuilder.m_types[ "custom_armory_button" ] = custom_armory_button
end

function alien_tokens_widget( f48_arg0, f48_arg1, f48_arg2 )
	LUI.mp_menus.AliensPurchasables.alien_tokens_widget( f48_arg0, f48_arg1, f48_arg2 )
end


