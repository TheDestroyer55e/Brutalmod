function PushTechTree()
	local f1_local0 = Engine.GetLuiRoot()
	f1_local0:processEvent( {
		name = "push_tech_tree"
	} )
end

function GetNameOfPerkL2( f10_arg0)
	if f10_arg0 == "1" then
		class = "perk_bullet_damage"
	elseif f10_arg0 == "2" then
		class = "perk_health"
	elseif f10_arg0 == "3" then
		class = "perk_rigger"
	elseif f10_arg0 == "4" then
		class = "perk_medic"
	else
		class = false
	end
	return class
end

function get_custom_upgrade(controller, index)
	fixIndex = index % 5
	variable = math.floor(index/5) + 1
	n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "has_seen_episode_" .. variable .. "_intro" )
	return (math.floor(n / (3 ^ fixIndex))) % 3
end

function GetMenuScopedDataL( f9_arg0, f9_arg1 )
	if not f9_arg0.menuInfoData[f9_arg1] then
		f9_arg0.menuInfoData[f9_arg1] = {}
	end
	if not f9_arg0.menuInfoData[f9_arg1].scopedData then
		f9_arg0.menuInfoData[f9_arg1].scopedData = {}
	end
	return f9_arg0.menuInfoData[f9_arg1].scopedData
end

function GetMenuScopedDataByMenuNameL( f11_arg0 )
	local f11_local0 = Engine.GetLuiRoot()
	f11_local0 = f11_local0.flowManager
	for f11_local1 = #f11_local0.menuInfoStack, 1, -1 do
		local f11_local4 = f11_local0.menuInfoStack[f11_local1]
		if f11_local4.name == f11_arg0 then
			return f11_local0:GetMenuScopedDataL( f11_local4 )
		end
	end
	if f11_arg0 then
		DebugPrint( "WARNING: could not find scoped data for menu named " .. f11_arg0 .. ". This is expected if you've just hit LUI Reload, otherwise not so much." )
	end
	return {}
end

function PopTechTree()
	local f2_local0 = Engine.GetLuiRoot()
	f2_local0:processEvent( {
		name = "pop_tech_tree"
	} )
end

function UtilitiesFactory( f3_arg0, f3_arg1 )
	local f3_local0 = {}
	local f3_local1 = LUI.mp_menus.Aliens
	f3_local0.upgradeString = "_try_upgrade"
	f3_local0.baseRefGetter = function ( f4_arg0 )
		return ""
	end
	
	f3_local0.currentLevelRefGetter = function ( f5_arg0 )
		return ""
	end
	
	f3_local0.currentLevelGetter = function ( f6_arg0 )
		return 0
	end
	
	f3_local0.fieldGetter = function ( f7_arg0, f7_arg1 )
		return ""
	end
	
	f3_local0.fieldColumns = {}
	f3_local0.secondaryClassGetter = function ( f8_arg0 )
		return nil
	end
	
	if f3_arg1 then
		f3_local0.upgradeString = f3_local1.GetDataLabelForSlot( f3_arg1 ) .. f3_local0.upgradeString
		f3_local0.fieldGetter = f3_local1.GetFieldForAbility
		f3_local0.fieldColumns = f3_local1.AlienAbilities.Cols
		local f3_local2 = f3_local1.GetDataLabelForSlot( f3_arg1 )
		f3_local0.baseRefGetter = function ( f9_arg0 )
			return f3_local1.GetAlienAbility( f9_arg0, f3_local2 )
		end
		
		f3_local0.currentLevelGetter = function ( f10_arg0 )
			return f3_local1.GetAlienAbilityLevel( f10_arg0, f3_local2 )
		end
		
		f3_local0.specificLevelRefGetter = function ( f11_arg0, f11_arg1 )
			return f3_local1.GetAbilityRefFromBaseAndLevel( f3_local0.baseRefGetter( f11_arg0 ), f11_arg1 )
		end
		
		f3_local0.currentLevelRefGetter = function ( f12_arg0 )
			return f3_local0.specificLevelRefGetter( f12_arg0, f3_local0.currentLevelGetter( f12_arg0 ) )
		end
		
	else
		f3_local0.upgradeString = f3_local1.GetDataLabelForPerk( f3_arg0 ) .. f3_local0.upgradeString
		f3_local0.fieldGetter = f3_local1.GetFieldForPerk
		f3_local0.fieldColumns = f3_local1.AlienPerks.Cols
		f3_local0.baseRefGetter = function ( f13_arg0 )
			return f3_local1.GetAlienPerk( f13_arg0, f3_arg0 )
		end
		
		f3_local0.currentLevelGetter = function ( f14_arg0 )
			return f3_local1.GetAlienPerkLevel( f14_arg0, f3_arg0 )
		end
		
		f3_local0.specificLevelRefGetter = function ( f15_arg0, f15_arg1 )
			return f3_local1.GetPerkRefFromBaseAndLevel( f3_local0.baseRefGetter( f15_arg0 ), f15_arg1 )
		end
		
		f3_local0.currentLevelRefGetter = function ( f16_arg0 )
			return f3_local0.specificLevelRefGetter( f16_arg0, f3_local0.currentLevelGetter( f16_arg0 ) )
		end
		
		f3_local0.secondaryClassGetter = function ( f17_arg0 )
			if f3_arg0 == 0 and Engine.AliensCheckIsUpgradeEnabled( f17_arg0, "multi_class" ) then
				return f3_local1.GetSecondaryClassRef( f17_arg0 )
			else
				return nil
			end
		end
		
	end
	return f3_local0
end

function purchase_row_head( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = f18_arg1 == LUI.mp_menus.Aliens.AlienAbilities.Up
	local f18_local1 = f18_arg1 == LUI.mp_menus.Aliens.AlienAbilities.Down
	local f18_local2 = f18_arg1 == LUI.mp_menus.Aliens.AlienAbilities.Right
	local f18_local3 = f18_arg1 == LUI.mp_menus.Aliens.AlienAbilities.Left
	local f18_local4 = GetMenuScopedDataByMenuNameL( "alien_tech_tree" )
	local self = LUI.UIButton.new()
	self.id = "element"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		right = 495
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "button_up", function ( element, event )
		local f19_local0 = math.min( 1 + f18_arg2.currentLevelGetter( f18_local4.controller ), 4 )
		local f19_local1 = element:getParent()
		f19_local1:processEvent( {
			name = "unfocus_elem_" .. f19_local0
		} )
	end )
	self:registerEventHandler( "skill_points_update", function ( element, event )
		if element:isInFocus() then
			element:processEvent( {
				name = "button_over"
			} )
		end
	end )
	self:registerEventHandler( "button_over", function ( element, event )
		local f21_local0 = math.min( 1 + f18_arg2.currentLevelGetter( f18_local4.controller ), 4 )
		local f21_local1 = element:getParent()
		f21_local1:processEvent( {
			name = "focus_elem_" .. f21_local0
		} )
	end )
	self:registerEventHandler( "button_action", function ( element, event )
		local f22_local0 = tonumber( f18_arg2.fieldGetter( f18_arg2.specificLevelRefGetter( f18_local4.controller, f18_arg2.currentLevelGetter( f18_local4.controller ) + 1 ), f18_arg2.fieldColumns.PointCost ) )
		local f22_local1 = Engine.GetPlayerDataEx( f18_local4.controller, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 )
		if f22_local0 and f22_local0 <= Game.GetAlienSkillPoints() then
			Engine.NotifyServer( f18_arg2.upgradeString, 0 )
		end
	end )
	local f18_local6 = LUI.UIImage.new()
	f18_local6.id = "focus_bar"
	f18_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "btn_alien_loadout_rtcap_f" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 22,
		left = 0,
		right = -10,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0
	} )
	f18_local6:registerAnimationState( "visible", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	f18_local6:registerEventHandler( "button_over", MBh.AnimateToState( "visible" ) )
	f18_local6:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	f18_local6:animateToState( "default" )
	self:addElement( f18_local6 )
	local f18_local7 = LUI.UIImage.new()
	f18_local7.id = "bg"
	f18_local7:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = -10,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.3
	} )
	f18_local7:animateToState( "default" )
	self:addElement( f18_local7 )
	if f18_arg1 then
		local f18_local8 = ""
		if f18_local0 then
			f18_local8 = "alien_cash_dpad_up"
		elseif f18_local1 then
			f18_local8 = "alien_cash_dpad_dn"
		elseif f18_local2 then
			f18_local8 = "alien_cash_dpad_rt"
		elseif f18_local3 then
			f18_local8 = "alien_cash_dpad_lt"
		end
		local f18_local9 = nil
		if 1 == Engine.IsGamepadEnabled() then
			f18_local9 = 1
		else
			f18_local9 = 0
		end
		local f18_local10 = LUI.UIImage.new()
		f18_local10.id = "dpad"
		f18_local10:registerAnimationState( "default", {
			material = RegisterMaterial( f18_local8 ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = -22,
			bottom = 22,
			left = 10.5,
			width = 44,
			alpha = f18_local9
		} )
		f18_local10:animateToState( "default" )
		self:addElement( f18_local10 )
	end
	local f18_local8 = LUI.UIImage.new()
	f18_local8.id = "icon"
	f18_local8:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -18,
		bottom = 26,
		left = 65,
		width = 44,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.8
	} )
	f18_local8:registerAnimationState( "focused", {
		red = 0,
		green = 0,
		blue = 0
	} )
	f18_local8:registerEventHandler( "button_over", MBh.AnimateToState( "focused" ) )
	f18_local8:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	f18_local8:registerEventHandler( "skill_points_update", function ( element, event )
		element:setImage( RegisterMaterial( f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Icon ) ) )
	end )
	f18_local8:animateToState( "default" )
	self:addElement( f18_local8 )
	local f18_local9 = LUI.UIImage.new()
	f18_local9.id = "secondary_icon"
	f18_local9:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 30,
		left = 32,
		width = 30,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	f18_local9:registerAnimationState( "visible", {
		alpha = 0.8
	} )
	f18_local9:registerAnimationState( "focused", {
		red = 0,
		green = 0,
		blue = 0
	} )
	f18_local9:registerAnimationState( "unfocused", {
		red = 1,
		green = 1,
		blue = 1
	} )
	f18_local9:registerEventHandler( "button_over", MBh.AnimateToState( "focused" ) )
	f18_local9:registerEventHandler( "button_up", MBh.AnimateToState( "unfocused" ) )
	f18_local9:registerEventHandler( "skill_points_update", function ( element, event )
		local f24_local0 = f18_arg2.secondaryClassGetter( f18_local4.controller )
		if f24_local0 then
			f18_local9:animateToState( "visible" )
			element:setImage( RegisterMaterial( f18_arg2.fieldGetter( f24_local0, f18_arg2.fieldColumns.Icon ) ) )
		end
	end )
	f18_local9:animateToState( "default" )
	self:addElement( f18_local9 )
	local f18_local93 = LUI.UIImage.new()
	f18_local93.id = "third_icon"
	f18_local93:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -30,
		bottom = 0,
		left = 32,
		width = 30,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	f18_local93:registerAnimationState( "visible", {
		alpha = 0.8
	} )
	f18_local93:registerAnimationState( "focused", {
		red = 0,
		green = 0,
		blue = 0
	} )
	f18_local93:registerAnimationState( "unfocused", {
		red = 1,
		green = 1,
		blue = 1
	} )
	f18_local93:registerEventHandler( "button_over", MBh.AnimateToState( "focused" ) )
	f18_local93:registerEventHandler( "button_up", MBh.AnimateToState( "unfocused" ) )
	f18_local93:registerEventHandler( "skill_points_update", function ( element, event )
		local f24_local0 = f18_arg2.secondaryClassGetter( f18_local4.controller )
		if f24_local0 then
			local class3id = string.sub(f24_local0, -1)
			local class3 = GetNameOfPerkL2(class3id)
			if class3 then
				f18_local93:animateToState( "visible" )
				element:setImage( RegisterMaterial( f18_arg2.fieldGetter( class3, f18_arg2.fieldColumns.Icon ) ) )
				end
		end
	end )
	f18_local93:animateToState( "default" )
	self:addElement( f18_local93 )
	local f18_local10 = LUI.UIText.new()
	f18_local10.id = "level"
	f18_local10:registerAnimationState( "default", CoD.ColorizeState( Colors.alien_tech_tree_bright_grey, {
		font = CoD.TextSettings.BoldFont.Font,
		alignment = LUI.Alignment.Right,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 6,
		right = 0,
		height = CoD.TextSettings.BoldFont.Height
	} ) )
	f18_local10:registerAnimationState( "focused", {
		red = 0,
		green = 0,
		blue = 0
	} )
	f18_local10:registerEventHandler( "button_over", MBh.AnimateToState( "focused" ) )
	f18_local10:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	f18_local10:registerEventHandler( "skill_points_update", function ( element, event )
		local f25_local0 = f18_arg2.currentLevelGetter( f18_local4.controller )
		local f25_local1 = element
		local f25_local2 = element.setText
		local f25_local3
		if f25_local0 > 0 then
			f25_local3 = "+" .. f25_local0
			if not f25_local3 then
			
			else
				f25_local2( f25_local1, f25_local3 )
			end
		end
		f25_local3 = ""
	end )
	f18_local10:animateToState( "default" )
	f18_local8:addElement( f18_local10 )
	local f18_local11 = LUI.UIText.new()
	f18_local11.id = "name"
	f18_local11:registerAnimationState( "default", {
		red = 0.7,
		green = 0.7,
		blue = 0.7,
		alpha = 1,
		font = CoD.TextSettings.BoldFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 120,
		top = 0,
		right = -10,
		height = CoD.TextSettings.BoldFont.Height,
		alpha = 1
	} )
	f18_local11:setTextStyle( CoD.TextStyle.ShadowedMore )
	f18_local11:registerAnimationState( "focused", {
		red = 0,
		green = 0,
		blue = 0
	} )
	f18_local11:registerEventHandler( "button_over", function ( element, event )
		element:animateToState( "focused" )
		element:setTextStyle( CoD.TextStyle.None )
	end )
	f18_local11:registerEventHandler( "button_up", function ( element, event )
		element:animateToState( "default" )
		element:setTextStyle( CoD.TextStyle.ShadowedMore )
	end )
	f18_local11:registerEventHandler( "skill_points_update", function ( element, event )
		element:setText( Engine.Localize( f18_arg2.fieldGetter( f18_arg2.specificLevelRefGetter( f18_local4.controller, 0 ), f18_arg2.fieldColumns.Name ) ) )
	end )
	f18_local11:animateToState( "default" )
	self:addElement( f18_local11 )
	local f18_local12 = LUI.UIText.new()
	f18_local12.id = "currentDesc"
	f18_local12:registerAnimationState( "default", {
		red = 0.45,
		green = 0.45,
		blue = 0.45,
		alpha = 1,
		font = CoD.TextSettings.NormalFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 120,
		top = -11,
		right = -10,
		height = CoD.TextSettings.NormalFont.Height
	} )
	f18_local12:setTextStyle( CoD.TextStyle.ShadowedMore )
	f18_local12:registerAnimationState( "focused", {
		red = 0,
		green = 0,
		blue = 0
	} )
	f18_local12:registerEventHandler( "button_over", function ( element, event )
		element:animateToState( "focused" )
		element:setTextStyle( CoD.TextStyle.None )
	end )
	f18_local12:registerEventHandler( "button_up", function ( element, event )
		element:animateToState( "default" )
		element:setTextStyle( CoD.TextStyle.ShadowedMore )
	end )
	f18_local12:registerEventHandler( "skill_points_update", function ( element, event )
	--TODO: LOCALIZE
		if f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_PERK_RIGGER_DESC_2" then
			element:setText( Engine.Localize( "Take less damage while repairing, traps cost less and last longer." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_PERK_RIGGER_DESC_3" then
			element:setText( Engine.Localize( "Kills earn 20% more cash." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_DEATH_MACHINE_DESC" then
			element.setText( Engine.Localize( "Portable Minigun with 200 rounds." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_DEATH_MACHINE_DESC_3" then
			element.setText( Engine.Localize( "Minigun gains specialized ammo." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_DEATH_MACHINE_DESC_4" then
			element.setText( Engine.Localize( "Doubles the ammo count to 400." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_RIOTHSHIELD_DESC_2" then
			element.setText( Engine.Localize( "Aliens that hit the Riot Shield are stunned." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_TEAM_BOOST_DESC_1" then
			element.setText( Engine.Localize( "Move 20% faster while boosted and increases the booster's duration to 30 sec." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_TEAM_BOOST_DESC_2" then
			element.setText( Engine.Localize( "Repair the drill faster." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_TEAM_BOOST_DESC_3" then
			element.setText( Engine.Localize( "Increases the booster's duration to 45 sec." ) )
		elseif f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) == "ALIENS_TEAM_BOOST_DESC_4" then
			element.setText( Engine.Localize( "Increases the booster's duration to 60 sec and adds increased sprint endurance." ) )
		else
			element:setText( Engine.Localize( f18_arg2.fieldGetter( f18_arg2.currentLevelRefGetter( f18_local4.controller ), f18_arg2.fieldColumns.Desc ) ) )
		end
	end )
	f18_local12:animateToState( "default" )
	self:addElement( f18_local12 )
	return self
end

function purchase_row_item( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
	Memory.CheckLow()
	local f32_local0 = GetMenuScopedDataByMenuNameL( "alien_tech_tree" )
	local self = LUI.UIElement.new()
	self.id = "element_" .. f32_arg2
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		width = 65,
		alpha = 1
	} )
	self:registerAnimationState( "transparent", {
		alpha = 0.5
	} )
	self:registerEventHandler( "skill_points_update", function ( element, event )
		local f33_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		if f32_arg2 < f32_arg3.currentLevelGetter( f33_local0.controller ) + 1 then
			self:animateToState( "transparent" )
		else
			self:animateToState( "default" )
		end
	end )
	self:animateToState( "default" )
	self:animateToState( "transparent" )
	local f32_local2 = LUI.UIImage.new()
	f32_local2.id = "icon"
	f32_local2:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		left = -22,
		bottom = -10,
		width = 44,
		height = 44,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	f32_local2:registerAnimationState( "visible", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	f32_local2:registerAnimationState( "dim", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.1
	} )
	f32_local2:registerAnimationState( "red", {
		red = 1,
		green = 0.3,
		blue = 0.3,
		alpha = 0.75
	} )
	f32_local2:registerAnimationState( "focused", CoD.ColorizeState( Colors.white, {
		alpha = 0.75
	} ) )
	f32_local2:animateToState( "default", 0 )
	f32_local2:animateToState( "dim" )
	f32_local2:registerEventHandler( "skill_points_update", function ( element, event )
		local f34_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		local f34_local1 = f32_arg3.currentLevelGetter( f34_local0.controller )
		f32_local2:setImage( RegisterMaterial( f32_arg3.fieldGetter( f32_arg3.specificLevelRefGetter( f34_local0.controller, f32_arg2 ), f32_arg3.fieldColumns.Icon ) ) )
		if f34_local1 + 1 < f32_arg2 then
			f32_local2:animateToState( "default" )
		end
	end )
	self:addElement( f32_local2 )
	local f32_local3 = function ( f35_arg0, f35_arg1 )
		f35_arg0:animateToState( "hidden" )
		local f35_local0 = f32_arg3.currentLevelGetter( f32_local0.controller )
		if f32_arg2 < f35_local0 + 1 then
			f32_local2:animateToState( "visible" )
		elseif f32_arg2 == f35_local0 + 1 then
			f32_local2:animateToState( "dim" )
		elseif f35_local0 + 1 < f32_arg2 then
			f32_local2:animateToState( "default" )
		end
	end
	
	local f32_local4 = LUI.MenuGenerics.generic_border( {}, {
		inner = true,
		thickness = 3,
		border_red = Colors.white.r,
		border_green = Colors.white.g,
		border_blue = Colors.white.b
	} )
	f32_local4.id = "selectedBorder"
	f32_local4:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f32_local4:registerAnimationState( "visible", {
		alpha = 0.75
	} )
	f32_local4:registerEventHandler( "unfocus_elem_" .. f32_arg2, f32_local3 )
	f32_local4:registerEventHandler( "focus_elem_" .. f32_arg2, function ( element, event )
		local f36_local0 = f32_arg3.specificLevelRefGetter( f32_local0.controller, f32_arg2 )
		local f36_local1 = f32_arg3.fieldGetter( f36_local0, f32_arg3.fieldColumns.PointCost )
		local f36_local2 = f32_arg3.currentLevelGetter( f32_local0.controller )
		if f36_local2 == f32_arg2 then
			element:animateToState( "visible" )
			f32_local2:animateToState( "visible", 175 )
		elseif f36_local1 and tonumber( f36_local1 ) > Game.GetAlienSkillPoints() then
			element:animateToState( "visible" )
			f32_local2:animateToState( "red", 175 )
		else
			element:animateToState( "visible" )
			f32_local2:animateToState( "focused", 175 )
		end
		element:dispatchEventToRoot( {
			name = "update_selection_helper",
			dispatchChildren = true,
			title = f32_arg3.fieldGetter( f36_local0, f32_arg3.fieldColumns.Name ),
			desc = f32_arg3.fieldGetter( f36_local0, f32_arg3.fieldColumns.Desc ),
			price = f32_arg1 and f32_arg3.fieldGetter( f36_local0, f32_arg3.fieldColumns.CurrencyCost ) or "",
			upgradeCost = f36_local1,
			icon = f32_arg3.fieldGetter( f36_local0, f32_arg3.fieldColumns.Icon ),
			level = f32_arg2,
			curLevel = f36_local2,
			reference = f36_local0
		} )
	end )
	f32_local4:registerEventHandler( "skill_points_update", function ( element, event )
		local f37_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		if f32_arg2 ~= f32_arg3.currentLevelGetter( f37_local0.controller ) + 1 then
			f32_local3( element, event )
		end
	end )
	f32_local4:animateToState( "hidden" )
	self:addElement( f32_local4 )
	return self
end

function purchase_row( f38_arg0, f38_arg1, f38_arg2 )
	local f38_local0 = UtilitiesFactory( f38_arg1, f38_arg2 )
	local self = LUI.UIElement.new()
	self.id = "row_" .. f38_arg0
	self:makeFocusable()
	self:setHandleMouseMove( true )
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 65,
		left = -80,
		right = 0,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 65,
		left = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:animateToState( "visible", 120, false, true )
	local f38_local2 = LUI.UIImage.new()
	f38_local2.id = "bg"
	f38_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 485,
		right = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.45
	} )
	f38_local2:animateToState( "default" )
	self:addElement( f38_local2 )
	if tonumber( f38_arg0 ) < 5 then
		local f38_local3 = LUI.UIImage.new()
		f38_local3.id = "divider_" .. f38_arg0
		f38_local3:registerAnimationState( "default", {
			material = RegisterMaterial( "box_alien_header_footer" ),
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = true,
			left = 0,
			right = 0,
			top = -10,
			bottom = 16,
			alpha = 1
		} )
		f38_local3:animateToState( "default" )
		self:addElement( f38_local3 )
	end
	local f38_local3 = LUI.UIHorizontalList.new()
	f38_local3.id = "content"
	f38_local3:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		spacing = 20
	} )
	f38_local3:animateToState( "default" )
	f38_local3:addElement( purchase_row_head( f38_arg1, f38_arg2, f38_local0 ) )
	for f38_local4 = 0, 4, 1 do
		f38_local3:addElement( purchase_row_item( f38_arg1, f38_arg2, f38_local4, f38_local0 ) )
	end
	self:addElement( f38_local3 )
	return self
end

function points_counter()
	local self = LUI.UIElement.new()
	self.id = "points_counter"
	local f39_local1 = LUI.UIHorizontalList.new()
	f39_local1.id = "list"
	f39_local1:registerAnimationState( "default", {
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 260,
		right = 0
	} )
	f39_local1:animateToState( "default" )
	self:addElement( f39_local1 )
	local f39_local2 = Engine.Localize( "@ALIENS_POINT_BALANCE" )
	local f39_local3, f39_local4, f39_local5, f39_local6 = GetTextDimensions( f39_local2, CoD.TextSettings.BoldFont.Font, CoD.TextSettings.BoldFont.Height )
	local f39_local7 = f39_local5 - f39_local3
	local f39_local8 = LUI.UIText.new()
	f39_local8.id = "balance"
	f39_local8:setText( f39_local2 )
	f39_local8:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		alignment = LUI.Alignment.Right,
		font = CoD.TextSettings.BoldFont.Font,
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		width = f39_local7,
		top = 0,
		bottom = 0
	} ) )
	f39_local8:animateToState( "default" )
	f39_local1:addElement( f39_local8 )
	local f39_local9 = LUI.UIText.new()
	f39_local8.id = "balance"
	f39_local9:setupUIBindText( "AlienSkillPoints" )
	f39_local9:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		alignment = LUI.Alignment.Right,
		font = CoD.TextSettings.BoldFont.Font,
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 20,
		top = 0,
		bottom = 0
	} ) )
	f39_local9:animateToState( "default" )
	f39_local1:addElement( f39_local9 )
	return self
end

function isweaponspec( f22_arg0 )
	local f22_local0 = Engine.GetPlayerDataEx( f22_arg0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 )
	local f22_local1 = math.floor(Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" )/5)
	local f22_local2 = Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" ) - (f22_local1 * 5)
	if f22_local0 == "perk_bullet_damage" then
		return true
	elseif f22_local1 == 0 and Engine.AliensCheckIsUpgradeEnabled( f22_arg0, "multi_class" ) then
		return true
	elseif f22_local2 == 1 then
		return true
	elseif get_custom_upgrade(f22_arg0, 4) == 2 then
		return true
	else
		return false
	end
end

function selection_help()
	local f40_local0 = LUI.mp_menus.Aliens
	local self = LUI.UIElement.new()
	self.id = "selection_help"
	local f40_local2 = LUI.UIImage.new()
	f40_local2.id = "background"
	f40_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		alpha = 0.25,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 0,
		right = 0,
		height = 140
	} )
	f40_local2:animateToState( "default" )
	self:addElement( f40_local2 )
	local f40_local3 = LUI.UIImage.new()
	f40_local3.id = "icon"
	f40_local3:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = 38,
		bottom = 84,
		left = 0,
		width = 44,
		alpha = 0
	} ) )
	f40_local3:registerAnimationState( "visible", {
		alpha = 1
	} )
	f40_local3:registerEventHandler( "update_selection_helper", function ( element, event )
		element:setImage( RegisterMaterial( event.icon ) )
		if event.curLevel == 4 then
			element:animateToState( "default" )
		else
			element:animateToState( "visible" )
		end
	end )
	f40_local3:animateToState( "default" )
	local f40_local4 = LUI.UIText.new()
	f40_local4.id = "level"
	f40_local4:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		font = CoD.TextSettings.BoldFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		left = 0,
		width = 30,
		bottom = 60,
		height = CoD.TextSettings.BoldFont.Height,
		alpha = 0
	} ) )
	f40_local4:registerAnimationState( "visible", {
		alpha = 1
	} )
	f40_local4:registerEventHandler( "update_selection_helper", function ( element, event )
		element:setText( "+" .. event.level )
		element:setTextStyle( CoD.TextStyle.ShadowedMore )
		if event.curLevel == 4 or event.upgradeCost and tonumber( event.upgradeCost ) >= 9999 then
			element:animateToState( "default" )
		else
			element:animateToState( "visible" )
		end
	end )
	f40_local4:animateToState( "default" )
	local f40_local5 = Engine.Localize( "@ALIENS_NEXT_UPGRADE" )
	local f40_local6, f40_local7, f40_local8, f40_local9 = GetTextDimensions( f40_local5, CoD.TextSettings.BoldFont.Font, CoD.TextSettings.BoldFont.Height )
	local f40_local10 = f40_local8 - f40_local6
	local f40_local11 = LUI.UIText.new()
	f40_local11.id = "upgrade"
	f40_local11:setText( f40_local5 )
	f40_local11:setTextStyle( CoD.TextStyle.ShadowedMore )
	f40_local11:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		top = 47,
		width = 0,
		height = CoD.TextSettings.BoldFont.Height,
		alpha = 0
	} ) )
	f40_local11:registerAnimationState( "visible", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		top = 47,
		width = f40_local10,
		height = CoD.TextSettings.BoldFont.Height,
		alpha = 1
	} )
	f40_local11:registerEventHandler( "update_selection_helper", function ( element, event )
		if event.curLevel == 4 or event.upgradeCost and tonumber( event.upgradeCost ) >= 9999 then
			element:animateToState( "default" )
		else
			element:animateToState( "visible" )
		end
	end )
	f40_local11:animateToState( "default" )
	local f40_local12 = LUI.UIHorizontalList.new()
	f40_local12.id = "content"
	f40_local12:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0,
		spacing = 1
	} )
	f40_local12:registerAnimationState( "visible", {
		alpha = 1
	} )
	f40_local12:registerEventHandler( "update_selection_helper", function ( element, event )
		if event.curLevel == 4 then
			element:animateToState( "default" )
		else
			element:animateToState( "visible" )
		end
	end )
	f40_local12:animateToState( "default" )
	f40_local12:addElement( f40_local3 )
	f40_local12:addElement( f40_local4 )
	f40_local12:addElement( f40_local11 )
	self:addElement( f40_local12 )
	local f40_local13 = LUI.UIText.new()
	f40_local13.id = "desc"
	f40_local13:registerAnimationState( "default", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		font = CoD.TextSettings.BoldFont.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 10,
		top = 90,
		right = -10,
		height = CoD.TextSettings.BoldFont.Height
	} )
	f40_local13:animateToState( "default" )
	f40_local13:registerEventHandler( "update_selection_helper", function ( element, event )
		if event.curLevel == 4 then
			element:setText( Engine.Localize( "@ALIENS_MAX_LEVEL" ) )
			element:setTextStyle( CoD.TextStyle.ShadowedMore )
		else
	--TODO: LOCALIZE
			if event.desc == "ALIENS_PERK_RIGGER_DESC_2" then
				event.desc = "Take less damage while repairing, traps cost less and last longer."
			elseif event.desc == "ALIENS_PERK_RIGGER_DESC_3" then
				event.desc = "Kills earn 20% more cash."
			elseif event.desc == "ALIENS_DEATH_MACHINE_DESC" then
				event.desc = "Portable Minigun with 200 rounds."
			elseif event.desc == "ALIENS_DEATH_MACHINE_DESC_3" then
				event.desc = "Minigun gains specialized ammo."
			elseif event.desc == "ALIENS_DEATH_MACHINE_DESC_4" then
				event.desc = "Doubles the ammo count to 400."
			elseif event.desc == "ALIENS_RIOTSHIELD_DESC_4" then
				event.desc = "Aliens that hit the Riot Shield are stunned."
			elseif event.desc == "ALIENS_PERK_MEDIC_DESC_3" then
				event.desc = "Ignore ongoing damage from the Scorpions' gas clouds."
			elseif event.desc == "ALIENS_TEAM_BOOST_DESC_1" then
				event.desc = "Move 20% faster while boosted and increases the booster's duration to 30 sec."
			elseif event.desc == "ALIENS_TEAM_BOOST_DESC_2" then
				event.desc = "Repair the drill faster."
			elseif event.desc == "ALIENS_TEAM_BOOST_DESC_3" then
				event.desc = "Increases the booster's duration to 45 sec."
			elseif event.desc == "ALIENS_TEAM_BOOST_DESC_4" then
				event.desc = "Increases the booster's duration to 60 sec and adds increased sprint endurance."
			end
			element:setText( Engine.Localize( event.desc ) )
			element:setTextStyle( CoD.TextStyle.ShadowedMore )
		end
	end )
	self:addElement( f40_local13 )
	local f40_local14 = LUI.UIImage.new()
	f40_local14.id = "bottomStrip"
	f40_local14:registerAnimationState( "current", {
		material = RegisterMaterial( "white" ),
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 0,
		right = 0,
		height = CoD.TextSettings.BoldFont.Height + 3
	} )
	f40_local14:animateToState( "current" )
	self:addElement( f40_local14 )
	local f40_local15 = LUI.UIText.new()
	f40_local15.id = "cost"
	f40_local15:registerAnimationState( "default", CoD.ColorizeState( Colors.alien_tech_tree_bright_grey, {
		font = CoD.TextSettings.BoldFont.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 10,
		bottom = 0,
		right = -10,
		height = CoD.TextSettings.BoldFont.Height
	} ) )
	f40_local15:registerAnimationState( "yellow", CoD.ColorizeState( Colors.frontend_hilite, {} ) )
	f40_local15:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f40_local15:registerAnimationState( "red", {
		red = 1,
		green = 0.3,
		blue = 0.3,
		alpha = 1
	} )
	f40_local15:registerEventHandler( "update_selection_helper", function ( element, event )
		element:setText( Engine.Localize( "@ALIENS_UPGRADE_COST", event.upgradeCost ) )
		if event.curLevel == 4 or event.upgradeCost and tonumber( event.upgradeCost ) >= 9999 then
			element:animateToState( "hidden" )
		elseif not event.upgradeCost or tonumber( event.upgradeCost ) > Game.GetAlienSkillPoints() then
			element:animateToState( "red" )
		else
			element:animateToState( "yellow" )
		end
	end )
	f40_local15:animateToState( "default" )
	self:addElement( f40_local15 )
	local f40_local16 = Engine.IsConsoleGame()
	if not f40_local16 then
		f40_local16 = 1 == Engine.IsGamepadEnabled()
	end
	if f40_local16 then
		local f40_local17 = Engine.Localize( "@ALIENS_PURCHASE" )
		local f40_local18 = LUI.UIText.new()
		f40_local18.id = "purchase"
		f40_local18:setText( f40_local17 )
		f40_local18:registerAnimationState( "default", {
			font = CoD.TextSettings.SmallFont.Font,
			alignment = LUI.Alignment.Left,
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = false,
			rightAnchor = true,
			left = 0,
			bottom = 0,
			right = -20,
			height = CoD.TextSettings.SmallFont.Height,
			alpha = 0
		} )
		f40_local18:registerAnimationState( "visible", {
			alpha = 1
		} )
		f40_local18:registerEventHandler( "update_selection_helper", function ( element, event )
			if not event.upgradeCost or tonumber( event.upgradeCost ) > Game.GetAlienSkillPoints() then
				element:animateToState( "default" )
			else
				element:animateToState( "visible" )
			end
		end )
		f40_local18:animateToState( "default" )
		self:addElement( f40_local18 )
		local f40_local19, f40_local20, f40_local21, f40_local22 = GetTextDimensions( f40_local17, CoD.TextSettings.SmallFont.Font, CoD.TextSettings.SmallFont.Height )
		local f40_local23 = LUI.UIText.new()
		f40_local23.id = "A"
		f40_local23:setText( Engine.Localize( ButtonMap.button_action.string ) )
		f40_local23:registerAnimationState( "default", {
			font = CoD.TextSettings.ExtraBigFont.Font,
			alignment = LUI.Alignment.Left,
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = false,
			rightAnchor = true,
			left = 10,
			bottom = (CoD.TextSettings.ExtraBigFont.Height - CoD.TextSettings.SmallFont.Height) / 2,
			right = -10 - f40_local21 - f40_local19 - 10,
			height = CoD.TextSettings.ExtraBigFont.Height,
			alpha = 0
		} )
		f40_local23:registerAnimationState( "visible", {
			alpha = 1
		} )
		f40_local23:registerEventHandler( "update_selection_helper", function ( element, event )
			local f48_local0 = event.upgradeCost
			if f48_local0 then
				f48_local0 = tonumber( event.upgradeCost ) <= Game.GetAlienSkillPoints()
			end
			if f48_local0 then
				element:animateToState( "visible" )
			else
				element:animateToState( "default" )
			end
		end )
		f40_local23:animateToState( "default" )
		self:addElement( f40_local23 )
	end
	return self
end

function nerfs_active( f49_arg0 )
	local f49_local0 = LUI.mp_menus.Aliens
	local self = LUI.UIElement.new()
	local f49_local2 = LUI.mp_menus.Aliens.GetBaseNerfList()
	self.id = "active_nerfs"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 0,
		right = 0
	} )
	self:animateToState( "default" )
	local f49_local3 = LUI.UIImage.new()
	f49_local3.id = "background"
	f49_local3:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.2,
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 0,
		right = 0,
		top = 0
	} )
	f49_local3:registerEventHandler( "menu_create", function ( element, event )
		for f50_local0 = 1, #f49_local2, 1 do
			if Engine.AliensCheckIsRelicEnabled( event.controller, f49_local2[f50_local0] ) then
				element:animateToState( "default" )
				break
			end
		end
	end )
	self:addElement( f49_local3 )
	local f49_local4 = LUI.UIHorizontalList.new( {
		alignment = LUI.Alignment.Center,
		spacing = 10,
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = -5,
		left = 11,
		right = 0
	} )
	f49_local4.id = "nerf_container"
	self:addElement( f49_local4 )
	for f49_local5 = 1, #f49_local2, 1 do
		if Engine.AliensCheckIsRelicEnabled( f49_arg0, f49_local2[f49_local5] ) then
			local f49_local8 = LUI.UIImage.new( {
				material = RegisterMaterial( LUI.mp_menus.Aliens.GetFieldForNerf( f49_local2[f49_local5], LUI.mp_menus.Aliens.AlienNerfs.Cols.Icon ) ),
				red = 1,
				green = 1,
				blue = 1,
				alpha = 0.8,
				alignment = LUI.Alignment.Center,
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				top = 11,
				height = 38,
				left = -10,
				width = 38,
				alpha = 0.5
			} )
			f49_local8.id = "nerfIcon_" .. f49_local5
			f49_local4:addElement( f49_local8 )
		end
	end
	return self
end

function crafting_active( f51_arg0, f51_arg1, f51_arg2 )
	return LUI.mp_hud.AlienHudTechTree.crafting_active( f51_arg0, f51_arg1, f51_arg2 )
end

function MainCreate( f54_arg0, f54_arg1 )
	if not f54_arg0.properties.exclusiveController then
		DebugPrint( "WARNING: Alien upgrade screen opened without exclusive controller. This should only happen while debugging, a default value will be use." )
		f54_arg0.properties.exclusiveController = 0
	end
	local f54_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f54_arg0 )
	f54_local0.controller = f54_arg0.properties.exclusiveController
end

function set_cheats_value(index, state)
	n = Engine.GetDvarFloat("cg_scoreboardHeight")
	n = n- get_cheats_value(index) * (2 ^ index)
	Engine.SetDvarFloat("cg_scoreboardHeight", n + (state * (2 ^ index)))
end

function get_cheats_value(index)
	n = Engine.GetDvarFloat("cg_scoreboardHeight")
	return (math.floor(n / (2 ^ index))) % 2
end

function cheat_item( f38_arg0, f38_arg1, f38_arg2 )
	local self = LUI.UIElement.new()
	self:makeFocusable()
	self:setHandleMouseMove( true )
	self.id = "row_" .. f38_arg0
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 35,
		left = -80,
		right = 0,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 30,
		left = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:animateToState( "visible", 120, false, true )
	local cheatbutton = LUI.UIButton.new()
	cheatbutton.id = "cheats_menu" 
	cheatbutton:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	cheatbutton:registerEventHandler( "button_action", function ( element, event )
		if f38_arg0 == 6 then
			Engine.ExecNow( "god" )
		elseif f38_arg0 == 7 then
			Engine.ExecNow( "notarget" )
		elseif f38_arg0 == 8 then
			Engine.ExecNow( "noclip" )
		end
		if get_cheats_value(f38_arg0 + 1) == 0 then
			if f38_arg0 == 12 then
				Engine.ExecNow( "g_speed 500" )
			end
			set_cheats_value(f38_arg0 + 1, 1)
		else
			if f38_arg0 == 12 then
				Engine.ExecNow( "g_speed 190" )
			end
			set_cheats_value(f38_arg0 + 1, 0)
		end
		element:dispatchEventToRoot( {
			name = "refresh_enabled_state",
			immediate = true
		} )
	end )
	cheatbutton:animateToState( "default", 0 )
	local cheatbutton_bg = LUI.UIImage.new()
	cheatbutton_bg.id = "cheat_button_background"
	cheatbutton_bg:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = -600,
		top = 0,
		bottom = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.3
	} )
	cheatbutton_bg:registerAnimationState( "highlight", {
		material = RegisterMaterial( "btn_alien_loadout_rtcap_f" ),
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		right = -600,
		bottom = 10,
		top = 0,
		red = 0.7,
		green = 0.7,
		blue = 0.7,
		alpha = 1
	} )
	cheatbutton_bg:registerEventHandler( "button_over", MBh.AnimateToState( "highlight", 0 ) )
	cheatbutton_bg:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
	cheatbutton_bg:animateToState( "default" )
	local cheatbutton_text = LUI.UIText.new()
	cheatbutton_text.id = "button_lable"
	cheatbutton_text:registerAnimationState( "default", {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 30,
		right = 0,
		top = 5,
		bottom = -5,
		red = 0.7,
		green = 0.7,
		blue = 0.7,
		alpha = 1
	} )
	cheatbutton_text:registerAnimationState( "focus", {
		red = 0,
		green = 0,
		blue = 0
	} )
	cheatbutton_text:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
	cheatbutton_text:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	cheatbutton_text:animateToState( "default" )
	cheatbutton_text:setText( f38_arg2 )
	cheatbutton:addElement( cheatbutton_bg )
	cheatbutton:addElement( cheatbutton_text )
	self:addElement(cheatbutton)
	local cheatbutton_desc = LUI.UIText.new()
	cheatbutton_desc.id = "cheat_description"
	cheatbutton_desc:registerAnimationState( "default", {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 340,
		right = 0,
		top = 5,
		bottom = -5,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	cheatbutton_desc:animateToState( "default" )
	cheatbutton_desc:setText( f38_arg1 )
	self:addElement(cheatbutton_desc)
	local cheatbutton_desc_bg = LUI.UIImage.new()
	cheatbutton_desc_bg.id = "cheat_description_background"
	cheatbutton_desc_bg:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 320,
		right = -435,
		top = 0,
		bottom = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.4
	} )
	cheatbutton_desc_bg:animateToState( "default" )
	self:addElement(cheatbutton_desc_bg)
	local f38_local2 = LUI.UIImage.new()
	f38_local2.id = "bg"
	f38_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 485,
		right = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.45
	} )
	f38_local2:animateToState( "default" )
	self:addElement( f38_local2 )
	local f42_local18 = LUI.UIImage.new()
	f42_local18.id = "checkbox"
	f42_local18:registerAnimationState( "default", {
		material = RegisterMaterial( "box_empty" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = -7,
		bottom = 6,
		left = -912,
		right = -899,
		alpha = 1
	} )
	f42_local18:animateToState( "default" )
	if tonumber( f38_arg0 ) < 14 then
		self:addElement( f42_local18 )
	end
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
	f42_local19:registerEventHandler( "refresh_enabled_state", function ( element, event )
		if ( get_cheats_value(f38_arg0 + 1) == 1 ) then
			f42_local19:animateToState( "checked" )
		else
			f42_local19:animateToState( "default" )
		end
	end )
	if ( get_cheats_value(f38_arg0 + 1) == 1 ) then
		f42_local19:animateToState( "checked" )
	else
		f42_local19:animateToState( "default" )
	end
	f42_local18:addElement( f42_local19 )
	if tonumber( f38_arg0 ) < 16 then
		local f38_local3 = LUI.UIImage.new()
		f38_local3.id = "divider_" .. f38_arg0
		f38_local3:registerAnimationState( "default", {
			material = RegisterMaterial( "white" ),
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = true,
			red = 0,
			blue = 0,
			green = 0,
			left = 0,
			right = 0,
			top = 0,
			bottom = 1.5,
			alpha = 1
		} )
		f38_local3:animateToState( "default" )
		self:addElement( f38_local3 )
	end
	return self
end

function alien_cheats_menu()
	local f55_local0, f55_local1, f55_local2, f55_local3 = GameX.GetAdjustedSafeZoneSize()
	local self = LUI.UIElement.new()
	self.id = "alien_cheats_menu"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "menu_create", MainCreate )
	local f55_local6 = LUI.UIImage.new()
	f55_local6.id = "fade"
	f55_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.3
	} )
	f55_local6:animateToState( "default" )
	self:addElement( f55_local6 )
	local f55_local7 = LUI.UIVerticalList.new()
	f55_local7.id = "mainTable"
	f55_local7:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = 65,
		bottom = 100,
		left = -460,
		width = 920,
		spacing = 0,
		scale = 0
	} )
	self:addElement( f55_local7 )
	local cheatsmenu = LUI.UIButton.new()
	cheatsmenu.id = "cheats_menu" 
	cheatsmenu:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		top = 0,
		bottom = 25,
		left = 0,
		right = -785
	} )
	cheatsmenu:registerEventHandler( "button_action", function ( element, event )
		LUI.FlowManager.RequestCloseAllMenus( 0 )
		LUI.FlowManager.RequestAddMenu( self, "alien_tech_tree", true, Engine.GetFirstActiveController(), false )
	end )
	cheatsmenu:animateToState( "default", 0 )
	local cheatsmenu_background = LUI.UIImage.new()
	cheatsmenu_background.id = "cheats_menu_background"
	cheatsmenu_background:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		top = 2,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.3
	} )
	cheatsmenu_background:registerAnimationState( "highlight", {
		material = RegisterMaterial( "btn_alien_loadout_rtcap_f" ),
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		bottom = 10,
		top = 2,
		red = 0.7,
		green = 0.7,
		blue = 0.7,
		alpha = 1
	} )
	cheatsmenu_background:registerEventHandler( "button_over", MBh.AnimateToState( "highlight", 0 ) )
	cheatsmenu_background:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
	cheatsmenu_background:animateToState( "default" )
	local cheatsmenu_text = LUI.UIText.new()
	cheatsmenu_text.id = "button_lable"
	cheatsmenu_text:registerAnimationState( "default", {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 8,
		right = 0,
		top = 3,
		bottom = -2,
		red = 0.7,
		green = 0.7,
		blue = 0.7,
		alpha = 1
	} )
	cheatsmenu_text:registerAnimationState( "focus", {
		red = 0,
		green = 0,
		blue = 0
	} )
	cheatsmenu_text:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
	cheatsmenu_text:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	cheatsmenu_text:animateToState( "default" )
	cheatsmenu_text:setText( "Cheats Options" )
	cheatsmenu:addElement( cheatsmenu_background )
	cheatsmenu:addElement( cheatsmenu_text )	cheatsmenu_background:registerEventHandler( "button_over", MBh.AnimateToState( "highlight", 0 ) )
	cheatsmenu_background:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
	cheatsmenu_background:animateToState( "default" )
	local cheatsmenu_text = LUI.UIText.new()
	cheatsmenu_text.id = "button_lable"
	cheatsmenu_text:registerAnimationState( "default", {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 8,
		right = 0,
		top = 3,
		bottom = -2,
		red = 0.7,
		green = 0.7,
		blue = 0.7,
		alpha = 1
	} )
	cheatsmenu_text:registerAnimationState( "focus", {
		red = 0,
		green = 0,
		blue = 0
	} )
	cheatsmenu_text:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
	cheatsmenu_text:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	cheatsmenu_text:animateToState( "default" )
	cheatsmenu_text:setText( "Skill Point Menu" )
	cheatsmenu:addElement( cheatsmenu_background )
	cheatsmenu:addElement( cheatsmenu_text )
	if get_cheats_value(0) == 1 then
		f55_local7:addElement( cheatsmenu )
	end
	f55_local7:addElement( cheat_item( 0, "Makes hives complete instantly (the challenge will count as completed)", "Instant Hives" ) )
	f55_local7:addElement( cheat_item( 1, "Sets your money to $10,000, and prevents it from decreasing", "Unlimited Money" ) )
	f55_local7:addElement( cheat_item( 2, "Sets your skill points to 50, and prevents them from decreasing", "Unlimited Skill Points" ) )
	f55_local7:addElement( cheat_item( 3, "Sets your downs to 10, and prevents them from decreasing", "Unlimited Downs" ) )
	f55_local7:addElement( cheat_item( 4, "Reloading does not take ammo from your reserve", "Unlimited Ammo" ) )
	f55_local7:addElement( cheat_item( 5, "Ammo is not drained from your mag", "Bottomless Mags" ) )
	f55_local7:addElement( cheat_item( 6, "Makes you unable to take damage", "Godmode" ) )
	f55_local7:addElement( cheat_item( 7, "Makes aliens not target you", "Notarget" ) )
	f55_local7:addElement( cheat_item( 8, "Allows you to fly and move through objects", "Noclip" ) )
	f55_local7:addElement( cheat_item( 9, "Makes the drill not take damage", "Invincible Drill" ) )
	f55_local7:addElement( cheat_item( 10, "Makes your class abilities cool down 10x faster", "Fast Ability Cooldown" ) )
	f55_local7:addElement( cheat_item( 11, "Makes most damage you deal functionally infinite", "Infinite Damage" ) )
	f55_local7:addElement( cheat_item( 12, "Significantly increases your movement speed", "Faster Movement" ) )
	f55_local7:addElement( cheat_item( 13, "Toggles printing of various debug information", "Debug Print" ) )
	f55_local7:addElement( cheat_item( 14, "Kills all currently alive aliens", "Kill All Aliens" ) )
	f55_local7:addElement( cheat_item( 15, "Sets all your upgrades to +0", "Reset Skill Points" ) )
	f55_local7:addElement( cheat_item( 16, "Disables cheats, cannot be re-enabled without restarting the match", "Disable Cheats" ) )
	f55_local7:animateToState( "default" )
	local f55_local20 = LUI.UIBindButton.new()
	f55_local20.id = "back"
	f55_local20:registerEventHandler( "button_secondary", MBh.LeaveMenu() )
	self:addElement( f55_local20 )
	return self
end

function alien_tech_tree()
	local f55_local0, f55_local1, f55_local2, f55_local3 = GameX.GetAdjustedSafeZoneSize()
	local f55_local4 = GetMenuScopedDataByMenuNameL( "alien_tech_tree" )
	local self = LUI.UIElement.new()
	self.id = "alien_tech_tree"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "menu_create", MainCreate )
	local f55_local6 = LUI.UIImage.new()
	f55_local6.id = "fade"
	f55_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.3
	} )
	f55_local6:animateToState( "default" )
	self:addElement( f55_local6 )
	local accountforcheats = 30
	if get_cheats_value(0) == 1 then
		accountforcheats = 0
	end
	local f55_local7 = LUI.UIVerticalList.new()
	f55_local7.id = "mainTable"
	f55_local7:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = Engine.UsingSplitscreenUpscaling() and f55_local1 - 25 or 60 + accountforcheats,
		bottom = 100,
		left = Engine.UsingSplitscreenUpscaling() and -690 or -460,
		width = 920,
		spacing = 5,
		scale = Engine.UsingSplitscreenUpscaling() and -0.13 or 0
	} )
	self:addElement( f55_local7 )
	local cheatsmenu = LUI.UIButton.new()
	cheatsmenu.id = "cheats_menu" 
	cheatsmenu:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		top = 0,
		bottom = 25,
		left = 0,
		right = -785
	} )
	cheatsmenu:registerEventHandler( "button_action", function ( element, event )
		LUI.FlowManager.RequestCloseAllMenus( 0 )
		LUI.FlowManager.RequestAddMenu( self, "alien_cheats_menu", true, Engine.GetFirstActiveController(), false )
	end )
	cheatsmenu:animateToState( "default", 0 )
	local cheatsmenu_background = LUI.UIImage.new()
	cheatsmenu_background.id = "armory_button_background"
	cheatsmenu_background:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 7,
		bottom = 5,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.3
	} )
	cheatsmenu_background:registerAnimationState( "highlight", {
		material = RegisterMaterial( "btn_alien_loadout_rtcap_f" ),
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		bottom = 15,
		top = 7,
		red = 0.7,
		green = 0.7,
		blue = 0.7,
		alpha = 1
	} )
	cheatsmenu_background:registerEventHandler( "button_over", MBh.AnimateToState( "highlight", 0 ) )
	cheatsmenu_background:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
	cheatsmenu_background:animateToState( "default" )
	local cheatsmenu_text = LUI.UIText.new()
	cheatsmenu_text.id = "button_lable"
	cheatsmenu_text:registerAnimationState( "default", {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 8,
		right = 0,
		top = 8,
		bottom = 3,
		red = 0.7,
		green = 0.7,
		blue = 0.7,
		alpha = 1
	} )
	cheatsmenu_text:registerAnimationState( "focus", {
		red = 0,
		green = 0,
		blue = 0
	} )
	cheatsmenu_text:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
	cheatsmenu_text:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	cheatsmenu_text:animateToState( "default" )
	cheatsmenu_text:setText( "Cheats Options" )
	cheatsmenu:addElement( cheatsmenu_background )
	cheatsmenu:addElement( cheatsmenu_text )
	if get_cheats_value(0) == 1 then
		f55_local7:addElement( cheatsmenu )
	end
	f55_local7:addElement( purchase_row( 0, 0, nil ) )
	f55_local7:animateToState( "default" )
	local f55_local8 = LUI.UITimer.new( 60, {
		name = "build_tech_tree"
	}, nil, false, f55_local7, false )
	f55_local8.id = "buildTimer"
	self:addElement( f55_local8 )
	f55_local7:registerEventHandler( "skill_points_update", function ( element, event )
		element.skillPoints = event.newValue
	end )
	f55_local7:registerEventHandler( "build_tech_tree", function ( element, event )
		element.next = element.next and element.next + 1 or 1
		local f57_local0 = nil
		if element.next == 1 then
			f57_local0 = purchase_row( "1", 1, nil )
		elseif element.next == 2 then
			f57_local0 = purchase_row( "2", nil, LUI.mp_menus.Aliens.AlienAbilities.Up )
		elseif element.next == 3 then
			f57_local0 = purchase_row( "3", nil, LUI.mp_menus.Aliens.AlienAbilities.Down )
		elseif element.next == 4 then
			f57_local0 = purchase_row( "4", nil, LUI.mp_menus.Aliens.AlienAbilities.Left )
		elseif element.next == 5 then
			f57_local0 = purchase_row( "5", nil, LUI.mp_menus.Aliens.AlienAbilities.Right )
		else
			f55_local8:close()
		end
		if f57_local0 and element.skillPoints then
			element:addElement( f57_local0 )
			f57_local0:processEvent( {
				name = "skill_points_update",
				dispatchChildren = true,
				newValue = element.skillPoints
			} )
		end
	end )

	local f55_local9 = Engine.UsingSplitscreenUpscaling() and f55_local1 + 20 or f55_local1 + 50
	if Engine.UsingSplitscreenUpscaling() then
		local f55_local10 = f55_local9
	end
	local f55_local11 = f55_local10 or 470
	local f55_local12 = Engine.UsingSplitscreenUpscaling() and 650 or 460
	local f55_local13 = Engine.UsingSplitscreenUpscaling() and f55_local1 + 192 or 505
	local f55_local14 = Engine.UsingSplitscreenUpscaling() and 680 or 26
	local f55_local15
	if (LUI.mp_menus.Aliens.getNumEnabledNerfs( f55_local4.exclusiveController ) + 1) > 0 then
		f55_local15 = 75
		if not f55_local15 then
		
		else
			local f55_local16 = Engine.UsingSplitscreenUpscaling() and f55_local1 + 192 + f55_local15 or 505 + f55_local15
			local f55_local17 = points_counter()
			f55_local17:registerAnimationState( "default", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				top = f55_local9,
				right = f55_local12,
				width = 432,
				height = CoD.TextSettings.BoldFont.Height
			} )
			f55_local17:animateToState( "default" )
			self:addElement( f55_local17 )
			local f55_local18 = selection_help()
			f55_local18:registerAnimationState( "default", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				top = f55_local11,
				right = f55_local12,
				width = 432,
				height = 175
			} )
			f55_local18:animateToState( "default" )
			self:addElement( f55_local18 )
			local f55_local19 = nerfs_active( f55_local4.exclusiveController )
			f55_local19:registerAnimationState( "default", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				top = f55_local13,
				height = 65,
				right = f55_local14,
				width = 486
			} )
			f55_local19:animateToState( "default" )
			self:addElement( f55_local19 )
			local f55_local20 = LUI.UIBindButton.new()
			f55_local20.id = "back"
			f55_local20:registerEventHandler( "button_secondary", MBh.LeaveMenu() )
			self:addElement( f55_local20 )
			if Engine.GetDvarString( "ui_mapname" ) == "mp_alien_beacon" or Engine.GetDvarString( "ui_mapname" ) == "mp_alien_dlc3" or Engine.GetDvarString( "ui_mapname" ) == "mp_alien_last" then
				local f55_local21 = crafting_active( f55_local20, f55_local14, f55_local16 )
				self:addElement( f55_local21 )
				if Game.GetOmnvar( "ui_alien_hudcraftinginfo" ) > -1 then
					f55_local21:animateToState( "visible" )
				else
					f55_local21:animateToState( "hidden" )
				end
			end
			local f55_local21 = LUI.UIElement.new()
			f55_local21:setupUIIntWatch( "AlienSkillPoints" )
			f55_local21.id = "pointsWatch"
			f55_local21:registerEventHandler( "int_watch_alert", function ( element, event )
				event.name = "skill_points_update"
				event.dispatchChildren = true
				self:processEvent( event )
			end )
			self:addElement( f55_local21 )
			if LUI.mp_menus.AliensPurchasables.UsingExtinctionTokens() then
				local f55_local22 = Engine.UsingSplitscreenUpscaling() and 1035 or 150
				local f55_local23 = GetMenuScopedDataByMenuNameL( "alien_tech_tree" )
				self:addElement( LUI.MenuBuilder.BuildRegisteredType( "alien_tokens_widget", {
					controller = f55_local23.exclusiveController,
					xPos = f55_local22,
					yPos = f55_local9
				} ) )
			end
			self:registerOmnvarHandler( "ui_alien_player_in_laststand", function ( f59_arg0, f59_arg1 )
				if f59_arg1.value then
					LUI.FlowManager.RequestLeaveMenu( f59_arg0 )
				end
			end )
			self:registerOmnvarHandler( "ui_alien_eog_score_total", function ( f60_arg0, f60_arg1 )
				LUI.FlowManager.RequestLeaveMenu( f60_arg0 )
			end )
			return self
		end
	end
	f55_local15 = 0
end

function CraftItem()
	LUI.mp_hud.AlienHudTechTree.CraftItem()
end

LUI.MenuBuilder.m_types[ "alien_tech_tree" ] = alien_tech_tree
LUI.MenuBuilder.m_types[ "alien_cheats_menu" ] = alien_cheats_menu
LUI.FlowManager.RegisterStackPushBehaviour( "alien_tech_tree", PushTechTree )
LUI.FlowManager.RegisterStackPopBehaviour( "alien_tech_tree", PopTechTree )
LUI.FlowManager.RegisterStackPushBehaviour( "alien_cheats_menu", PushTechTree )
LUI.FlowManager.RegisterStackPopBehaviour( "alien_cheats_menu", PopTechTree )

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