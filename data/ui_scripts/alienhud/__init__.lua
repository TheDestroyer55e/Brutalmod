function gradient_bar_factory( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8 )
	local self = LUI.UIImage.new()
	self.id = "cap"
	local f1_local1 = self
	local f1_local2 = self.registerAnimationState
	local f1_local3 = "default"
	local f1_local4 = {
		material = RegisterMaterial( "hud_health_bar_ltcap" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false
	}
	if f1_arg5 then
		local f1_local5 = f1_arg8
	end
	f1_local4.left = f1_local5 or 0
	local f1_local6
	if f1_arg5 then
		f1_local6 = 0
		if not f1_local6 then
		
		else
			f1_local4.right = f1_local6
			if f1_arg6 then
				local f1_local7 = f1_arg3
			end
			f1_local4.top = f1_local7 or 0
			if f1_arg6 then
				f1_local6 = 0
				if not f1_local6 then
				
				else
					f1_local4.bottom = f1_local6
					f1_local2( f1_local1, f1_local3, f1_local4 )
					self:animateToState( "default" )
					f1_local2 = LUI.UIImage.new()
					f1_local2.id = "fill"
					f1_local2:setupUIScorebar( f1_arg1 )
					f1_local3 = f1_local2
					f1_local1 = f1_local2.registerAnimationState
					f1_local4 = "default"
					f1_local6 = {
						material = RegisterMaterial( "hud_health_bar_mid" ),
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						left = 0,
						right = 0
					}
					if f1_arg6 then
						local f1_local8 = f1_arg3
					end
					f1_local6.top = f1_local8 or 0
					local f1_local9
					if f1_arg6 then
						f1_local9 = 0
						if not f1_local9 then
						
						else
							f1_local6.bottom = f1_local9
							f1_local1( f1_local3, f1_local4, f1_local6 )
							f1_local2:animateToState( "default" )
							f1_local1 = LUI.UIHorizontalList.new()
							f1_local1.id = "bar"
							f1_local4 = f1_local1
							f1_local3 = f1_local1.registerAnimationState
							f1_local6 = "default"
							f1_local9 = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = 0,
								bottom = 0
							}
							local f1_local10
							if f1_arg7 then
								f1_local10 = 0
								if not f1_local10 then
									if f1_arg5 then
										f1_local10 = -f1_arg8 * 0.6
										if not f1_local10 then
										
										else
											f1_local9.left = f1_local10
											if f1_arg7 then
												f1_local10 = 0
												if not f1_local10 then
													if f1_arg5 then
														f1_local10 = 0
														if not f1_local10 then
														
														else
															f1_local9.right = f1_local10
															if f1_arg5 then
																f1_local10 = LUI.Alignment.Left
																if not f1_local10 then
																
																else
																	f1_local9.alignment = f1_local10
																	f1_local3( f1_local4, f1_local6, f1_local9 )
																	f1_local1:animateToState( "default" )
																	f1_local1:addElement( f1_local2 )
																	f1_local1:addElement( self )
																	f1_local3 = LUI.UIElement.new()
																	f1_local3:setUseStencil( true )
																	f1_local3.id = f1_arg0 .. "_bar"
																	f1_local3:registerAnimationState( "default", {
																		topAnchor = true,
																		bottomAnchor = true,
																		leftAnchor = true,
																		rightAnchor = true,
																		top = 0,
																		bottom = 0,
																		left = 0,
																		right = 0
																	} )
																	f1_local3:animateToState( "default" )
																	f1_local3:addElement( f1_local1 )
																	f1_local3.colorize = function ( f2_arg0 )
																		local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
																		if f1_local3.currentColor ~= f2_local0 then
																			f1_local3.currentColor = f2_local0
																			f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																			f1_local2:animateToState( "current" )
																			self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																			self:animateToState( "current" )
																		end
																	end
																	
																	f1_local3.setMax = function ( f3_arg0, f3_arg1 )
																		f1_local2.m_maxScore = f3_arg0
																		f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
																	end
																	
																	f1_local3.setMax( f1_arg4, f1_arg2 )
																	return f1_local3
																end
															end
															f1_local10 = LUI.Alignment.Right
														end
													end
													f1_local10 = f1_arg8 * 0.6
												end
											else
												if f1_arg5 then
													f1_local10 = 0
													if not f1_local10 then
													
													else
														f1_local9.right = f1_local10
														if f1_arg5 then
															f1_local10 = LUI.Alignment.Left
															if not f1_local10 then
															
															else
																f1_local9.alignment = f1_local10
																f1_local3( f1_local4, f1_local6, f1_local9 )
																f1_local1:animateToState( "default" )
																f1_local1:addElement( f1_local2 )
																f1_local1:addElement( self )
																f1_local3 = LUI.UIElement.new()
																f1_local3:setUseStencil( true )
																f1_local3.id = f1_arg0 .. "_bar"
																f1_local3:registerAnimationState( "default", {
																	topAnchor = true,
																	bottomAnchor = true,
																	leftAnchor = true,
																	rightAnchor = true,
																	top = 0,
																	bottom = 0,
																	left = 0,
																	right = 0
																} )
																f1_local3:animateToState( "default" )
																f1_local3:addElement( f1_local1 )
																f1_local3.colorize = function ( f2_arg0 )
																	local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
																	if f1_local3.currentColor ~= f2_local0 then
																		f1_local3.currentColor = f2_local0
																		f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																		f1_local2:animateToState( "current" )
																		self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																		self:animateToState( "current" )
																	end
																end
																
																f1_local3.setMax = function ( f3_arg0, f3_arg1 )
																	f1_local2.m_maxScore = f3_arg0
																	f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
																end
																
																f1_local3.setMax( f1_arg4, f1_arg2 )
																return f1_local3
															end
														end
														f1_local10 = LUI.Alignment.Right
													end
												end
												f1_local10 = f1_arg8 * 0.6
											end
											f1_local9.right = f1_local10
											if f1_arg5 then
												f1_local10 = LUI.Alignment.Left
												if not f1_local10 then
												
												else
													f1_local9.alignment = f1_local10
													f1_local3( f1_local4, f1_local6, f1_local9 )
													f1_local1:animateToState( "default" )
													f1_local1:addElement( f1_local2 )
													f1_local1:addElement( self )
													f1_local3 = LUI.UIElement.new()
													f1_local3:setUseStencil( true )
													f1_local3.id = f1_arg0 .. "_bar"
													f1_local3:registerAnimationState( "default", {
														topAnchor = true,
														bottomAnchor = true,
														leftAnchor = true,
														rightAnchor = true,
														top = 0,
														bottom = 0,
														left = 0,
														right = 0
													} )
													f1_local3:animateToState( "default" )
													f1_local3:addElement( f1_local1 )
													f1_local3.colorize = function ( f2_arg0 )
														local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
														if f1_local3.currentColor ~= f2_local0 then
															f1_local3.currentColor = f2_local0
															f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
															f1_local2:animateToState( "current" )
															self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
															self:animateToState( "current" )
														end
													end
													
													f1_local3.setMax = function ( f3_arg0, f3_arg1 )
														f1_local2.m_maxScore = f3_arg0
														f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
													end
													
													f1_local3.setMax( f1_arg4, f1_arg2 )
													return f1_local3
												end
											end
											f1_local10 = LUI.Alignment.Right
										end
									end
									f1_local10 = 0
								end
							else
								if f1_arg5 then
									f1_local10 = -f1_arg8 * 0.6
									if not f1_local10 then
									
									else
										f1_local9.left = f1_local10
										if f1_arg7 then
											f1_local10 = 0
											if not f1_local10 then
												if f1_arg5 then
													f1_local10 = 0
													if not f1_local10 then
													
													else
														f1_local9.right = f1_local10
														if f1_arg5 then
															f1_local10 = LUI.Alignment.Left
															if not f1_local10 then
															
															else
																f1_local9.alignment = f1_local10
																f1_local3( f1_local4, f1_local6, f1_local9 )
																f1_local1:animateToState( "default" )
																f1_local1:addElement( f1_local2 )
																f1_local1:addElement( self )
																f1_local3 = LUI.UIElement.new()
																f1_local3:setUseStencil( true )
																f1_local3.id = f1_arg0 .. "_bar"
																f1_local3:registerAnimationState( "default", {
																	topAnchor = true,
																	bottomAnchor = true,
																	leftAnchor = true,
																	rightAnchor = true,
																	top = 0,
																	bottom = 0,
																	left = 0,
																	right = 0
																} )
																f1_local3:animateToState( "default" )
																f1_local3:addElement( f1_local1 )
																f1_local3.colorize = function ( f2_arg0 )
																	local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
																	if f1_local3.currentColor ~= f2_local0 then
																		f1_local3.currentColor = f2_local0
																		f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																		f1_local2:animateToState( "current" )
																		self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																		self:animateToState( "current" )
																	end
																end
																
																f1_local3.setMax = function ( f3_arg0, f3_arg1 )
																	f1_local2.m_maxScore = f3_arg0
																	f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
																end
																
																f1_local3.setMax( f1_arg4, f1_arg2 )
																return f1_local3
															end
														end
														f1_local10 = LUI.Alignment.Right
													end
												end
												f1_local10 = f1_arg8 * 0.6
											end
										else
											if f1_arg5 then
												f1_local10 = 0
												if not f1_local10 then
												
												else
													f1_local9.right = f1_local10
													if f1_arg5 then
														f1_local10 = LUI.Alignment.Left
														if not f1_local10 then
														
														else
															f1_local9.alignment = f1_local10
															f1_local3( f1_local4, f1_local6, f1_local9 )
															f1_local1:animateToState( "default" )
															f1_local1:addElement( f1_local2 )
															f1_local1:addElement( self )
															f1_local3 = LUI.UIElement.new()
															f1_local3:setUseStencil( true )
															f1_local3.id = f1_arg0 .. "_bar"
															f1_local3:registerAnimationState( "default", {
																topAnchor = true,
																bottomAnchor = true,
																leftAnchor = true,
																rightAnchor = true,
																top = 0,
																bottom = 0,
																left = 0,
																right = 0
															} )
															f1_local3:animateToState( "default" )
															f1_local3:addElement( f1_local1 )
															f1_local3.colorize = function ( f2_arg0 )
																local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
																if f1_local3.currentColor ~= f2_local0 then
																	f1_local3.currentColor = f2_local0
																	f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																	f1_local2:animateToState( "current" )
																	self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																	self:animateToState( "current" )
																end
															end
															
															f1_local3.setMax = function ( f3_arg0, f3_arg1 )
																f1_local2.m_maxScore = f3_arg0
																f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
															end
															
															f1_local3.setMax( f1_arg4, f1_arg2 )
															return f1_local3
														end
													end
													f1_local10 = LUI.Alignment.Right
												end
											end
											f1_local10 = f1_arg8 * 0.6
										end
										-- ERROR: Infinite loop detected
									end
								end
								f1_local10 = 0
							end
							f1_local9.left = f1_local10
							if f1_arg7 then
								f1_local10 = 0
								if not f1_local10 then
									if f1_arg5 then
										f1_local10 = 0
										if not f1_local10 then
										
										else
											-- ERROR: Infinite loop detected
										end
									end
									f1_local10 = f1_arg8 * 0.6
								end
							else
								-- ERROR: Infinite loop detected
							end
							-- ERROR: Infinite loop detected
						end
					end
					f1_local9 = f1_arg3
				end
			end
			f1_local6 = f1_arg3
		end
	end
	f1_local6 = f1_arg8
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

LUI.mp_hud.Hints.cursorHintDef = function()
	local self = LUI.UIElement.new()
	self.id = "cursorHintId"
	self:setupOwnerdraw( 72, 0.65, CoD.TextStyle.Shadowed )
	local f2_local1 = {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -160,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alpha = 0.6,
	}
	self:registerAnimationState( "default", f2_local1 )
	self:animateToState( "default", 0 )
	return self
end

function PauseAction( f4_arg0, f4_arg1 )
	if Engine.GetDvarString( "ui_game_state" ) == "postgame" == false then
		f4_arg0.is_paused = true
		LUI.FlowManager.RequestAddMenu( f4_arg0, "mp_pause_menu", true, f4_arg1.controller, false )
	end
	UpdateHUDVisibility( f4_arg0 )
end

function UnpauseAction( f5_arg0, f5_arg1 )
	f5_arg0.is_paused = false
	UpdateHUDVisibility( f5_arg0 )
end

function PushTechTreeAction( f6_arg0, f6_arg1 )
	f6_arg0.is_tech_tree_open = true
	UpdateHUDVisibility( f6_arg0 )
end

function PopTechTreeAction( f7_arg0, f7_arg1 )
	f7_arg0.is_tech_tree_open = false
	UpdateHUDVisibility( f7_arg0 )
end

function OpenTechTree( f8_arg0, f8_arg1 )
	if LUI.FlowManager.AnyActiveMenusInStack( f8_arg0:getRootParent() ) then
		return 
	elseif Game.IsSpectating() then
		return 
	elseif Engine.GetDvarString( "ui_game_state" ) == "postgame" then
		return 
	elseif Game.GetOmnvar( "ui_alien_player_in_laststand" ) then
		return 
	elseif not isPostGame then
		LUI.FlowManager.RequestAddMenu( f8_arg0, "alien_tech_tree", true, f8_arg1.controller, false )
	end
end

function CloseTechTree( f9_arg0, f9_arg1 )
	LUI.FlowManager.RequestLeaveMenuByName( "alien_tech_tree" )
end

function ToggleTechTree( f10_arg0, f10_arg1 )
	local f10_local0 = LUI.FlowManager.IsInStack
	local f10_local1 = f10_arg0:getRootParent()
	if f10_local0( f10_local1.flowManager, "alien_tech_tree" ) then
		CloseTechTree( f10_arg0, f10_arg1 )
	else
		OpenTechTree( f10_arg0, f10_arg1 )
	end
end

function spectating()
	local self = LUI.UIElement.new()
	self.id = "spectating"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f11_local1 = LUI.UIText.new()
	f11_local1.id = "spectating"
	f11_local1:setText( Engine.Localize( "@LUA_MENU_SPECTATING_CAPS" ) )
	f11_local1:setTextStyle( CoD.TextStyle.Shadowed )
	f11_local1:registerAnimationState( "default", {
		font = CoD.TextSettings.HudEuroBigFont.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 0,
		right = 0,
		height = CoD.TextSettings.HudEuroBigFont.Height,
		alpha = 0
	} )
	f11_local1:registerAnimationState( "visible", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = 60,
		right = 0,
		height = CoD.TextSettings.HudEuroBigFont.Height,
		alpha = 0.6
	} )
	f11_local1:registerOmnvarHandler( "ui_session_state", function ( f12_arg0, f12_arg1 )
		if f12_arg1.value == "spectator" then
			f12_arg0:animateToState( "visible", 150 )
		else
			f12_arg0:animateToState( "default", 150 )
		end
	end )
	f11_local1:animateToState( "default" )
	self:addElement( f11_local1 )
	self:addElement( LUI.mp_hud.Hints.spectatorControlsDef() )
	return self
end

LUI.mp_hud.AlienHud.clips_and_ammo = function()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = -33,
		left = 0,
		right = -45,
		alpha = 1
	} )
	self:registerAnimationState( "animateIn", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = -33,
		left = 0,
		right = 55,
		alpha = 0
	} )
	self:registerAnimationState( "animateOut", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = -33,
		bottom = -66,
		left = 0,
		right = -45,
		alpha = 0
	} )
	self.id = "clips_and_ammo"
	local f13_local1 = LUI.UIText.new( {
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		alignment = LUI.Alignment.Center,
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = -105,
		right = -105,
		height = CoD.TextSettings.HudDigitalNormalFont.Height,
		bottom = 0,
		alpha = 0
	} )
	f13_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f13_local1.id = "clipAmmoLeft"
	f13_local1:setupUIBindText( "ClipAmmoLeft" )
	self:addElement( f13_local1 )
	local f13_local2 = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_alien_ammo_bg_line" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -76,
		bottom = -2,
		width = 2,
		height = CoD.TextSettings.HudDigitalNormalFont.Height,
		alpha = 0
	} )
	f13_local2:registerAnimationState( "visible", {
		alpha = 1
	} )
	f13_local2.id = "hud_alien_ammo_bg_line"
	self:addElement( f13_local2 )
	local f13_local3 = LUI.UIText.new( {
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		alignment = LUI.Alignment.Center,
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = -60,
		right = -60,
		height = CoD.TextSettings.HudDigitalNormalFont.Height,
		bottom = 0,
		alpha = 1
	} )
	f13_local3:registerAnimationState( "invisible", {
		alpha = 0
	} )
	f13_local3.id = "clipAmmoRight"
	f13_local3:setupUIBindText( "ClipAmmoRight" )
	f13_local3:registerOmnvarHandler( "ui_alien_riotshield_equipped", function ( f18_arg0, f18_arg1 )
		if Game.GetOmnvar( "ui_alien_stowed_riotshield_ammo" ) == 100 then
			if f18_arg1.value == 1 then
				f13_local3:animateToState( "invisible" )
			else
				f13_local3:animateToState( "default" )
			end
		else
			f13_local3:animateToState( "default" )
		end
	end )
	self:addElement( f13_local3 )
	local f13_localm = LUI.UIText.new()
	f13_localm.id = "minigunammo"
	f13_localm:registerAnimationState( "default", {
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		alignment = LUI.Alignment.Center,
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = -60,
		right = -60,
		height = CoD.TextSettings.HudDigitalNormalFont.Height,
		bottom = 0,
		alpha = 0
	} )
	f13_localm:registerAnimationState( "visible", {
		alpha = 1
	} )
	f13_localm:registerOmnvarHandler( "ui_alien_riotshield_equipped", function ( f18_arg0, f18_arg1 )
		if f18_arg1.value == 1 then
			f18_arg0:animateToState( "visible" )
		else
			f18_arg0:animateToState( "default" )
		end
	end )
	f13_localm:registerOmnvarHandler( "ui_alien_turret_ammo", function ( mgtext_arg0, mgtext_arg1 )
		if Game.GetOmnvar( "ui_alien_stowed_riotshield_ammo" ) == 100 then
			if mgtext_arg1.value > 0 then
				mgtext_arg0:animateToState( "visible" )
				mgtext_arg0:setText( mgtext_arg1.value )
			else
				mgtext_arg0:animateToState( "default" )
			end
		else
			mgtext_arg0:animateToState( "default" )
		end
	end )
	self:addElement( f13_localm )
	local f13_local4 = LUI.UIText.new( {
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		alignment = LUI.Alignment.Right,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = 0,
		right = -21,
		height = CoD.TextSettings.HudDigitalNormalFont.Height,
		bottom = 0,
		alpha = 0.8
	} )
	f13_local4.id = "slash"
	f13_local4:setText( "/" )
	self:addElement( f13_local4 )
	local f13_local5 = LUI.UIText.new( {
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		alignment = LUI.Alignment.Center,
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		height = CoD.TextSettings.HudDigitalNormalFont.Height,
		bottom = 0,
		right = 0,
		left = 0
	} )
	f13_local5.id = "stockAmmo"
	f13_local5:setupUIBindText( "StockAmmo" )
	self:addElement( f13_local5 )
	self:registerEventHandler( "weapon_change", function ( element, event )
		if string.find( event.weapon_name, "akimbo" ) then
			f13_local1:animateToState( "visible" )
			f13_local2:animateToState( "visible" )
		else
			f13_local1:animateToState( "default" )
			f13_local2:animateToState( "default" )
		end
	end )
	return self
end

function isweaponspec3( f22_arg0 )
	local f22_local0 = Engine.GetPlayerDataEx( f22_arg0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 )
	local f22_local1 = math.floor(Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" )/5)
	local f22_local2 = Engine.GetPlayerDataReservedInt( f22_arg0, CoD.StatsGroup.Coop, "secondary_class" ) - (f22_local1 * 5)
	if Engine.GetPlayerDataEx( f22_arg0, CoD.StatsGroup.Coop, "alienSession", "perk_0_level" ) == 3 then
		if f22_local0 == "perk_bullet_damage" then
			return true
		elseif f22_local1 == 0 and Engine.AliensCheckIsUpgradeEnabled( f22_arg0, "multi_class" ) then
			return true
		elseif f22_local2 == 1 then
			return true
		else
			return false
		end
	else
		return false
	end
end

function get_custom_upgrade(controller, index)
	fixIndex = index % 5
	variable = math.floor(index/5) + 1
	n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "has_seen_episode_" .. variable .. "_intro" )
	return (math.floor(n / (3 ^ fixIndex))) % 3
end

LUI.mp_hud.AlienHud.weapon_info = function()
	local self = LUI.UIImage.new()
	self.id = "hud_alien_ammo_bg"
	self:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_alien_ammo_bg" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = 0,
		bottom = 0,
		width = 184,
		height = 97,
		alpha = 0.25
	} )
	self:animateToState( "default" )
	local f15_local1 = LUI.UIImage.new()
	f15_local1.id = "specialammo_icon"
	f15_local1:registerAnimationState( "hidden", {
		material = RegisterMaterial( "alien_dpad_icon_ammo_stun" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -174,
		bottom = -20,
		height = 40,
		width = 40,
		alpha = 0
	} )
	f15_local1:registerAnimationState( "stun", {
		material = RegisterMaterial( "alien_dpad_icon_ammo_stun" ),
		alpha = 1
	} )
	f15_local1:registerAnimationState( "incendiary", {
		material = RegisterMaterial( "alien_dpad_icon_ammo_incendiary" ),
		alpha = 1
	} )
	f15_local1:registerAnimationState( "explosive", {
		material = RegisterMaterial( "alien_dpad_icon_ammo_explosive" ),
		alpha = 1
	} )
	f15_local1:registerAnimationState( "piercing", {
		material = RegisterMaterial( "alien_dpad_icon_ammo_piercing" ),
		alpha = 1
	} )
	f15_local1:registerAnimationState( "combined", {
		material = RegisterMaterial( "alien_dpad_icon_ammo_combined" ),
		alpha = 1
	} )
	f15_local1:animateToState( "hidden" )
	f15_local1:registerOmnvarHandler( "ui_alien_specialammo", function ( f16_arg0, f16_arg1 )
		if f16_arg1.value < 0 then
			f16_arg0:animateToState( "hidden" )
		elseif f16_arg1.value == 1 then
			f16_arg0:animateToState( "stun" )
		elseif f16_arg1.value == 2 then
			f16_arg0:animateToState( "incendiary" )
		elseif f16_arg1.value == 3 then
			f16_arg0:animateToState( "explosive" )
		elseif f16_arg1.value == 4 then
			f16_arg0:animateToState( "piercing" )
		elseif f16_arg1.value == 5 then
			f16_arg0:animateToState( "combined" )
		end
	end )
	local f15_local2 = LUI.UIImage.new()
	f15_local2.id = "turretAmmoIcon"
	f15_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_icon_sentry" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -300,
		bottom = -32,
		height = 40,
		width = 40,
		alpha = 0
	} )
	f15_local2:registerAnimationState( "sentry", {
		material = RegisterMaterial( "alien_icon_sentry" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -300,
		bottom = -32,
		height = 40,
		alpha = 1,
		width = 40
	} )
	f15_local2:registerAnimationState( "minigun", {
		material = RegisterMaterial( "hud_icon_minigun" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -300,
		bottom = -32,
		height = 40,
		width = 70,
		alpha = 1
	} )
	local f15_local3 = LUI.UIText.new()
	f15_local3.id = "turretAmmoCount"
	f15_local3:registerAnimationState( "default", {
		alignment = LUI.Alignment.Right,
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -218,
		bottom = -26,
		height = 40,
		width = 40,
		alpha = 0
	} )
	f15_local3:registerAnimationState( "visible", {
		alpha = 1
	} )
	f15_local3:animateToState( "default" )
	f15_local2:animateToState( "default" )
	f15_local2:registerOmnvarHandler( "ui_alien_turret", function ( f17_arg0, f17_arg1 )
		if f17_arg1.value == 1 then
			f17_arg0:animateToState( "sentry" )
		elseif f17_arg1.value == 2 then
			f17_arg0:animateToState( "minigun" )
		else
			f17_arg0:animateToState( "default" )
		end
	end )
	f15_local3:registerOmnvarHandler( "ui_alien_turret", function ( f17_arg0, f17_arg1 )
		if f17_arg1.value >= 1 then
			f17_arg0:animateToState( "visible" )
		else
			f17_arg0:animateToState( "default" )
		end
	end )
	f15_local3:registerOmnvarHandler( "ui_alien_turret_ammo", function ( f18_arg0, f18_arg1 )
		if Game.GetOmnvar( "ui_alien_riotshield_equipped" ) ~= 1 then
			if f18_arg1.value > 0 then
				f18_arg0:animateToState( "visible" )
				f18_arg0:setText( f18_arg1.value )
			else
				f18_arg0:animateToState( "default" )
			end
		end
	end )
	local f15_local4 = 118
	local f15_local5 = 2
	local f15_local6 = LUI.UIImage.new()
	f15_local6.id = "fillBG"
	f15_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -220,
		bottom = -24,
		height = 8,
		width = f15_local4,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0
	} )
	f15_local6:animateToState( "default" )
	f15_local6:registerAnimationState( "visible", {
		alpha = 1
	} )
	local f15_local7 = LUI.UIImage.new()
	f15_local7.id = "OverheatBar"
	f15_local7:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		left = -220 - f15_local4 + f15_local5,
		bottom = -26,
		height = 4,
		width = 0,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		alpha = 0
	} )
	f15_local7:animateToState( "default" )
	f15_local7:registerAnimationState( "visible", {
		alpha = 1
	} )
	f15_local7:registerOmnvarHandler( "ui_alien_turret_overheat", function ( f19_arg0, f19_arg1 )
		if f19_arg1.value > -1 then
			f15_local6:animateToState( "visible" )
			f19_arg0:animateToState( "visible" )
		elseif f19_arg1.value < 0 then
			f15_local6:animateToState( "default" )
			f19_arg0:animateToState( "default" )
		end
		local f19_local0 = LUI.clamp( f19_arg1.value, 0, 100 ) / 100
		local f19_local1 = CoD.GradientMap( {
			{
				threshold = 0,
				color = {
					r = 1,
					g = 1,
					b = 1
				}
			},
			{
				threshold = 0.5,
				color = {
					r = 1,
					g = 1,
					b = 0
				}
			},
			{
				threshold = 1,
				color = {
					r = 1,
					g = 0,
					b = 0
				}
			}
		}, f19_local0 )
		f19_arg0:registerAnimationState( "updated", {
			material = RegisterMaterial( "white" ),
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = false,
			rightAnchor = true,
			left = -220 - f15_local4 + f15_local5,
			bottom = -26,
			height = 4,
			width = (f15_local4 - 2 * f15_local5) * f19_local0,
			alpha = 1
		} )
		f19_arg0:animateToState( "updated" )
		f19_arg0:registerAnimationState( "current", CoD.ColorizeState( f19_local1 ) )
		f19_arg0:animateToState( "current" )
	end )
	local f15_local8 = LUI.UIText.new()
	f15_local8.id = "weapon"
	f15_local8:setTextStyle( CoD.TextStyle.Shadowed )
	f15_local8:registerAnimationState( "default", CoD.ColorizeState( Colors.primary_text_color, {
		font = CoD.TextSettings.NormalFont.Font,
		alignment = LUI.Alignment.Right,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = 0,
		right = -22,
		height = CoD.TextSettings.NormalFont.Height,
		bottom = -58
	} ) )
	f15_local8:animateToState( "default" )
	local f15_local9 = LUI.mp_hud.AlienHud.clips_and_ammo()
	local f15_local10 = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_alien_ammo_infinite" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		height = 32,
		bottom = -33,
		width = 64,
		right = -25,
		alpha = 1
	} )
	f15_local10:registerAnimationState( "animateIn", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		height = 32,
		bottom = -33,
		width = 64,
		right = 50,
		alpha = 0
	} )
	f15_local10:registerAnimationState( "animateOut", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		height = 32,
		bottom = -66,
		width = 64,
		right = -25,
		alpha = 0
	} )
	f15_local10:animateToState( "animateIn" )
	f15_local10.id = "infiniteAmmo"
	local f15_local11 = LUI.UIElement.new()
	f15_local11.id = "grenades"
	f15_local11:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottom = -14,
		height = 16,
		right = -20,
		left = 0
	} )
	f15_local11:animateToState( "default" )
	for f15_local12 = 1, 5, 1 do
		local f15_local15 = f15_local12
		local f15_local16 = LUI.UIImage.new()
		f15_local16:setupUIBindImage( "FragMaterial" )
		f15_local16.id = "grenade_" .. f15_local15
		f15_local16:registerAnimationState( "default", {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = true,
			top = 0,
			right = (1 - f15_local15) * 12,
			width = 16,
			height = 16,
			alpha = 0
		} )
		f15_local16:registerAnimationState( "visible", {
			alpha = 1
		} )
		f15_local16:animateToState( "default" )
		f15_local16:registerEventHandler( "grenade_count_update", function ( element, event )
			if event.oldValue < f15_local15 and f15_local15 <= event.newValue then
				f15_local16:animateToState( "visible" )
			elseif f15_local15 <= event.oldValue and event.newValue < f15_local15 then
				f15_local16:animateToState( "default" )
			end
		end )
		f15_local11:addElement( f15_local16 )
	end
	local f15_local12 = LUI.UIElement.new()
	f15_local12:setupUIIntWatch( "FragAmmo" )
	f15_local12.id = "grenade_ammo_watch"
	f15_local12:registerEventHandler( "int_watch_alert", function ( element, event )
		event.name = "grenade_count_update"
		f15_local11:processEvent( event )
	end )
	local f15_local13 = LUI.UIElement.new()
	f15_local13.id = "tacticals"
	f15_local13:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottom = -14,
		height = 16,
		right = -110,
		left = 0
	} )
	f15_local13:animateToState( "default" )
	local f15_local14 = LUI.UIText.new()
	f15_local14.id = "tactical_divider"
	f15_local14:setText( "|" )
	f15_local14:registerAnimationState( "default", {
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		alignment = LUI.Alignment.Right,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		bottom = -12,
		right = 30,
		left = 0,
		alpha = 0.35,
		left = 0,
		right = -80,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f15_local14:animateToState( "default" )
	local f15_localtacdivider2 = LUI.UIText.new()
	f15_localtacdivider2.id = "tactical_divider_2"
	f15_localtacdivider2:setText( "/     " )
	f15_localtacdivider2:registerAnimationState( "default", {
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		alignment = LUI.Alignment.Right,
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		bottom = -12,
		right = -10,
		left = -20,
		alpha = 0.35,
		left = 0,
		right = -80,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f15_localtacdivider2:animateToState( "default" )
	for f15_local15 = 1, 5, 1 do
		local f15_local18 = f15_local15
		local f15_local19 = LUI.UIImage.new()
		if get_custom_upgrade( Engine.GetFirstActiveController(), 7) ~= 2 then
			f15_local19:setupUIBindImage( "FlashMaterial" )
		end
		f15_local19.id = "tactical" .. f15_local18
		f15_local19:registerAnimationState( "default", {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = true,
			top = 0,
			left = ((1 - f15_local18) * 10) + 5,
			width = 16,
			height = 16,
			alpha = 0
		} )
		f15_local19:registerAnimationState( "flare", {
			material = RegisterMaterial( "dpad_tacticalinsert" ),
			alpha = 1
		} )
		f15_local19:registerAnimationState( "hypno", {
			material = RegisterMaterial( "hud_us_throwknife" ),
			alpha = 1
		} )
		f15_local19:registerAnimationState( "trophy", {
			material = RegisterMaterial( "hud_icon_trophy" ),
			alpha = 1
		} )
		f15_local19:registerAnimationState( "stickyflare", {
			material = RegisterMaterial( "icon_alien_stickyflare" ),
			alpha = 1
		} )
		f15_local19:registerAnimationState( "visible", {
			alpha = 1
		} )
		f15_local19:registerAnimationState( "empty", {
			alpha = 0
		} )
		f15_local19:animateToState( "default" )
		f15_local19:registerEventHandler( "tactical_count_update", function ( element, event )
			if get_custom_upgrade( Engine.GetFirstActiveController(), 7) == 2 then
				event.newValue = Game.GetOmnvar( "ui_cranked_bomb_timer_end_milliseconds" ) % 3
				primarytype = (math.floor((Game.GetOmnvar( "ui_cranked_bomb_timer_end_milliseconds" )) / 36)) % 4
				if event.newValue < f15_local18 then
					f15_local19:animateToState( "default" )
				else
					if primarytype == 0 then
						f15_local19:animateToState( "flare" )
					elseif primarytype == 1 then
						f15_local19:animateToState( "trophy" )
					elseif primarytype == 2 then
						f15_local19:animateToState( "hypno" )
					elseif primarytype == 3 then
						f15_local19:animateToState( "stickyflare" )
					end
				end
			else
				if event.newValue < f15_local18 then
					f15_local19:animateToState( "default" )
				else
					f15_local19:animateToState( "visible" )
				end
			end
		end )
		f15_local13:addElement( f15_local19 )
	end
	local f15_local15 = LUI.UIElement.new()
	f15_local15:setupUIIntWatch( "FlashAmmo" )
	f15_local15.id = "tactical_ammo_watch"
	f15_local15:registerEventHandler( "int_watch_alert", function ( element, event )
		event.name = "tactical_count_update"
		f15_local13:processEvent( event )
	end )
	for f15_local15second = 1, 5, 1 do
		local f15_local18second = f15_local15second
		local f15_local19second = LUI.UIImage.new()
		f15_local19second.id = "secondtactical" .. f15_local18second
		f15_local19second:registerAnimationState( "default", {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = true,
			top = 0,
			left = ((1 - f15_local18second) * 10) - 35,
			width = 16,
			height = 16,
			alpha = 0
		} )
		f15_local19second:registerAnimationState( "flare", {
			material = RegisterMaterial( "dpad_tacticalinsert" ),
			alpha = 1
		} )
		f15_local19second:registerAnimationState( "hypno", {
			material = RegisterMaterial( "hud_us_throwknife" ),
			alpha = 1
		} )
		f15_local19second:registerAnimationState( "trophy", {
			material = RegisterMaterial( "hud_icon_trophy" ),
			alpha = 1
		} )
		f15_local19second:registerAnimationState( "stickyflare", {
			material = RegisterMaterial( "icon_alien_stickyflare" ),
			alpha = 1
		} )
		f15_local19second:registerAnimationState( "empty", {
			alpha = 0
		} )
		f15_local19second:animateToState( "default" )
		f15_local19second:registerEventHandler( "tactical_count_update2", function ( element, event )
			secondtype = (math.floor((Game.GetOmnvar( "ui_cranked_bomb_timer_end_milliseconds" )) / 9)) % 4
			if secondtype == 0 then
				f15_local19second:animateToState( "flare" )
			elseif secondtype == 1 then
				f15_local19second:animateToState( "trophy" )
			elseif secondtype == 2 then
				f15_local19second:animateToState( "hypno" )
			elseif secondtype == 3 then
				f15_local19second:animateToState( "stickyflare" )
			end
			if event.newValue < f15_local18second then
				f15_local19second:animateToState( "empty" )
			end
		end )
		f15_local13:addElement( f15_local19second )
	end
	local f15_local15second = LUI.UIElement.new()
	f15_local15second.id = "tactical_ammo_watch2"
	f15_local15second:registerOmnvarHandler( "ui_cranked_bomb_timer_end_milliseconds", function ( f25_arg0, f25_arg1 )
		event = {}
		event.name = "tactical_count_update2"
		event.oldValue = 0
		event.newValue = (math.floor(f25_arg1.value / 3)) % 3
		f15_local13:processEvent( event )
		event.name = "tactical_count_update"
		f15_local13:processEvent( event )
	end )
	f15_local13:addElement( f15_local15second )
	local f15_local16 = LUI.UIElement.new()
	f15_local16.id = "weapon_info"
	f15_local16:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 13,
		left = 0,
		right = 17
	} )
	f15_local16:animateToState( "default" )
	f15_local16:addElement( self )
	f15_local16:addElement( f15_local9 )
	f15_local16:addElement( f15_local10 )
	f15_local16:addElement( f15_local8 )
	f15_local16:addElement( f15_local11 )
	f15_local16:addElement( f15_local13 )
	f15_local16:addElement( f15_local12 )
	f15_local16:addElement( f15_local15 )
	f15_local16:addElement( f15_local14 )
	if get_custom_upgrade( Engine.GetFirstActiveController(), 7) == 2 then
		f15_local16:addElement( f15_localtacdivider2 )
	end
	f15_local16:addElement( f15_local1 )
	f15_local16:addElement( f15_local2 )
	f15_local16:addElement( f15_local3 )
	f15_local16:addElement( f15_local6 )
	f15_local16:addElement( f15_local7 )
	f15_local16:registerEventHandler( "weapon_change", function ( element, event )
		if event.display_name then
			f15_local8:setText( event.display_name )
		end
	end )
	f15_local16:registerOmnvarHandler( "ui_alien_unlimited_ammo", function ( f25_arg0, f25_arg1 )
		if f25_arg1.value then
			local f25_local0 = MBh.AnimateSequence( {
				{
					"animateOut",
					200
				},
				{
					"animateIn",
					0
				}
			} )
			f25_local0( f15_local9 )
			f15_local10:animateToState( "default", 150 )
		else
			local f25_local0 = MBh.AnimateSequence( {
				{
					"animateOut",
					200
				},
				{
					"animateIn",
					0
				}
			} )
			f25_local0( f15_local10 )
			f15_local9:animateToState( "default", 150 )
		end
	end )
	return f15_local16
end

function nx1_custom_reticle()
	local f26_local0 = Engine.GetLuiRoot()
	local f26_local1 = f26_local0.m_controllerIndex
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "reticle_hud_root"
	local f26_local3 = function ( f27_arg0, f27_arg1 )
		if f27_arg1 and 0 <= f27_arg1 then
			f27_arg0:animateToState( "visible", 0 )
			f27_arg0:processEvent( {
				name = "update_base_color"
			} )
			f27_arg0:processEvent( {
				name = "set_reticle_charges",
				num_charges = f27_arg1
			} )
		else
			f27_arg0:animateToState( "default", 0 )
		end
	end
	
	local f26_local4 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	f26_local4:registerAnimationState( "visible", {
		alpha = 1
	} )
	f26_local4.id = "nx1_custom_ret"
	f26_local4:registerOmnvarHandler( "ui_custom_reticle_state", function ( f28_arg0, f28_arg1 )
		f26_local3( f28_arg0, f28_arg1.value )
	end )
	f26_local4:registerEventHandler( "custom_reticle_timer", function ( element, event )
		f26_local3( element, Game.GetOmnvar( "ui_custom_reticle_state" ) )
	end )
	f26_local4:addElement( LUI.UITimer.new( 50, "custom_reticle_timer", nil, false, false, false, false ) )
	local f26_local5 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_center_cook_white" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -20,
		bottom = 20,
		left = -20,
		right = 20,
		alpha = 0.5,
		red = 1,
		green = 1,
		blue = 1
	} )
	f26_local5.id = "main_ret_image_id"
	f26_local5:registerAnimationState( "charged", {
		red = 0.9,
		green = 0.6,
		blue = 0
	} )
	f26_local5:registerEventHandler( "update_base_color", function ( element, event )
		local f30_local0 = 10
		if Engine.AliensCheckIsRelicEnabled( f26_local1, "nerf_min_ammo" ) then
			f30_local0 = 5
		end
		if f30_local0 <= Game.GetPlayerClipAmmo( 1 ) then
			element:animateToState( "charged", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	local f26_local6 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_nx1_cook" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		red = 0.9,
		green = 0.6,
		blue = 0,
		top = -20,
		bottom = 0,
		left = -20,
		right = 0,
		alpha = 0
	} )
	f26_local6:registerAnimationState( "visible", {
		alpha = 1
	} )
	f26_local6.id = "main_ret_image_tl_id"
	f26_local6:registerEventHandler( "set_reticle_charges", function ( element, event )
		if event.num_charges and event.num_charges >= 1 then
			element:animateToState( "visible", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	local f26_local7 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_nx1_cook" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		red = 0.9,
		green = 0.6,
		blue = 0,
		top = -20,
		bottom = 0,
		left = 20,
		right = 0,
		alpha = 0
	} )
	f26_local7:registerAnimationState( "visible", {
		alpha = 1
	} )
	f26_local7.id = "main_ret_image_tr_id"
	f26_local7:registerEventHandler( "set_reticle_charges", function ( element, event )
		if event.num_charges and event.num_charges >= 2 then
			element:animateToState( "visible", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	local f26_local8 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_nx1_cook" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		red = 0.9,
		green = 0.6,
		blue = 0,
		top = 20,
		bottom = 0,
		left = 20,
		right = 0,
		alpha = 0
	} )
	f26_local8:registerAnimationState( "visible", {
		alpha = 1
	} )
	f26_local8.id = "main_ret_image_br_id"
	f26_local8:registerEventHandler( "set_reticle_charges", function ( element, event )
		if event.num_charges and event.num_charges >= 3 then
			element:animateToState( "visible", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	local f26_local9 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_nx1_cook" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		red = 0.9,
		green = 0.6,
		blue = 0,
		top = 20,
		bottom = 0,
		left = -20,
		right = 0,
		alpha = 0
	} )
	f26_local9:registerAnimationState( "visible", {
		alpha = 1
	} )
	f26_local9.id = "main_ret_image_bl_id"
	f26_local9:registerEventHandler( "set_reticle_charges", function ( element, event )
		if event.num_charges and event.num_charges >= 4 then
			element:animateToState( "visible", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	self:addElement( f26_local4 )
	f26_local4:addElement( f26_local5 )
	f26_local4:addElement( f26_local6 )
	f26_local4:addElement( f26_local7 )
	f26_local4:addElement( f26_local8 )
	f26_local4:addElement( f26_local9 )
	f26_local3( f26_local4, Game.GetOmnvar( "ui_custom_reticle_state" ) )
	return self
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

LUI.mp_hud.AlienHud.health_only = function()
	local f35_local0 = 9
	local f35_local1 = 16
	local self = LUI.UIElement.new()
	self.id = "health"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -49,
		left = 0,
		right = 0,
		height = 16
	} )
	self:animateToState( "default" )
	local f35_local3 = LUI.UIHorizontalList.new()
	f35_local3.id = "healthBarBG"
	f35_local3:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alignment = LUI.Alignment.Left,
		alpha = 0.5
	} )
	f35_local3:animateToState( "default" )
	local f35_local4 = LUI.UIImage.new()
	f35_local4.id = "healthBarBGLeftCap"
	f35_local4:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_ltcap" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		width = 64,
		bottom = 0
	} )
	f35_local4:animateToState( "default" )
	f35_local3:addElement( f35_local4 )
	local f35_local5 = LUI.UIImage.new()
	f35_local5.id = "healthBarBGFill"
	f35_local5:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 5,
		left = 0,
		right = 0,
		height = 11,
		red = 0,
		green = 0,
		blue = 0
	} )
	f35_local5:animateToState( "default" )
	f35_local3:addElement( f35_local5 )
	local f35_local6 = LUI.UIImage.new()
	f35_local6.id = "healthBarBGRightCap"
	f35_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_rtcap" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 3,
		left = 0,
		width = f35_local1,
		height = 16
	} )
	f35_local6:animateToState( "default" )
	f35_local3:addElement( f35_local6 )
	local f35_local7 = LUI.UIElement.new()
	f35_local7.id = "healthBarContainer"
	f35_local7:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 7,
		left = 64,
		right = 0,
		height = 12
	} )
	f35_local7:animateToState( "default" )
	local f35_local8 = LUI.UIElement.new()
	f35_local8.id = "healthBarTicks"
	f35_local8:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 4,
		left = 0,
		right = 0,
		height = 12
	} )
	f35_local8:animateToState( "default" )
	local doubletank = 1
	if ( Engine.GetPlayerDataEx( Engine.GetFirstActiveController(), CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 ) == "perk_health" and get_custom_upgrade( Engine.GetFirstActiveController(), 5) == 2 ) then
		doubletank = 2
	end
	for f35_local9 = 0, f35_local0 - 1, 1 do
		local f35_local12 = LUI.UIImage.new()
		f35_local12.id = "tick_" .. f35_local9
		f35_local12:registerAnimationState( "default", {
			material = RegisterMaterial( "alien_health_bg_tic" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 0,
			left = 204 * (1 + (doubletank * f35_local9) / 5.85) - 14,
			width = 12,
			height = 12,
			alpha = 0
		} )
		f35_local12:registerAnimationState( "visible", {
			alpha = 1
		} )
		f35_local12:animateToState( "default" )
		f35_local8:addElement( f35_local12 )
		f35_local8["tick_" .. f35_local9] = f35_local12
	end
	local f35_local9 = LUI.UIImage.new()
	f35_local9.id = "healthIcon"
	f35_local9:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_health_plus_icon" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 2,
		left = 42,
		width = 13,
		height = 13,
		red = 0.55,
		green = 0.78,
		blue = 0.25
	} )
	f35_local9:animateToState( "default" )
	local f38_local0 = LUI.mp_hud.AlienHudTechTree.UtilitiesFactory( nil, 200)
	local f18_local4 = GetMenuScopedDataByMenuNameL( "alien_tech_tree" )
	local leftondpad = f38_local0.fieldGetter( f38_local0.currentLevelRefGetter( 0 ), f38_local0.fieldColumns.Icon )
	local f35_local10 = LUI.UIImage.new()
	f35_local10.id = "riotshield"
	f35_local10:registerAnimationState( "hidden", {
		material = RegisterMaterial( leftondpad ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -37,
		left = 27,
		width = 32,
		height = 32,
		alpha = 0
	} )
	f35_local10:registerAnimationState( "equipped", {
		material = RegisterMaterial( leftondpad ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -35,
		left = 27,
		width = 32,
		height = 32,
		alpha = 1
	} )
	f35_local10:animateToState( "hidden" )
	f35_local10:registerOmnvarHandler( "ui_alien_riotshield_equipped", function ( f36_arg0, f36_arg1 )
		if f36_arg1.value > 0 then
			f36_arg0:animateToState( "equipped" )
		else
			f36_arg0:animateToState( "hidden" )
		end
	end )
	local f35_local11 = LUI.UIText.new()
	f35_local11.id = "counter"
	f35_local11:setTextStyle( CoD.TextStyle.Outlined )
	f35_local11:registerAnimationState( "default", {
		font = CoD.TextSettings.HudEuroMedTinyFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 55,
		right = 0,
		top = -5 - CoD.TextSettings.HudEuroMedTinyFont.Height / 2,
		bottom = -5 + CoD.TextSettings.HudEuroMedTinyFont.Height / 2,
		alpha = 1
	} )
	f35_local11:animateToState( "default" )
	f35_local11:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f35_local11:registerOmnvarHandler( "ui_alien_riotshield_equipped", function ( f37_arg0, f37_arg1 )
		if f37_arg1.value > 1 then
			f35_local11:animateToState( "default", 250 )
		else
			f35_local11:animateToState( "hidden", 250 )
		end
	end )
	f35_local11:registerOmnvarHandler( "ui_alien_stowed_riotshield_ammo", function ( f38_arg0, f38_arg1 )
		if f38_arg1.value == 100 then
			f35_local11:setText( Game.GetOmnvar( "ui_alien_turret_ammo" ) )
		else
			f35_local11:setText( f38_arg1.value )
		end
	end )
	local f35_local13 = nil
	local f35_local12 = LUI.UIElement.new()
	f35_local12:setupUIIntWatch( "PlayerHealth" )
	f35_local12.id = "health_watch"
	local f35_local14 = function ( f39_arg0, f39_arg1 )
		local f39_local0 = 25
		if f35_local13 then
			if f39_arg1.newValue <= f39_local0 then
				f35_local13.colorize( {
					r = 0.94,
					g = 0.25,
					b = 0
				} )
			elseif f39_local0 < f39_arg1.newValue then
				f35_local13.colorize( {
					r = 0.55,
					g = 0.78,
					b = 0.25
				} )
			end
		end
	end
	
	f35_local12:registerEventHandler( "int_watch_alert", f35_local14 )
	local f35_local15 = LUI.UIElement.new()
	f35_local15:setupUIIntWatch( "PlayerMaxHealth" )
	f35_local15.id = "maxHealthWatch"
	f35_local15:registerEventHandler( "int_watch_alert", function ( element, event )
		if event.newValue > 0 then
			if not f35_local13 then
				f35_local13 = LUI.mp_hud.AlienHud.gradient_bar_factory( "health", "PlayerHealth", 0, 12, event.newValue, true, false, false, 12 )
				f35_local7:addElement( f35_local13 )
				f35_local14( element, {
					name = "int_watch_alert",
					newValue = Game.GetPlayerHealth()
				} )
			end
			local f40_local0 = 140 * event.newValue / 100
			self:registerAnimationState( "current", {
				topAnchor = false,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				top = -48,
				left = 0,
				right = f40_local0 + 64,
				height = 16
			} )
			f35_local13.setMax( event.newValue, f40_local0 )
			f35_local5:registerAnimationState( "current", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = 5,
				left = 0,
				right = f40_local0 - f35_local1,
				height = 11
			} )
			self:animateToState( "current" )
			f35_local5:animateToState( "current" )
			for f40_local1 = 0, f35_local0 - 1, 1 do
				if 100 + f40_local1 * doubletank * 25 <= event.newValue then
					f35_local8["tick_" .. f40_local1]:animateToState( "visible" )
				else
					f35_local8["tick_" .. f40_local1]:animateToState( "default" )
				end
			end
		end
	end )
	self:addElement( f35_local3 )
	self:addElement( f35_local9 )
	self:addElement( f35_local7 )
	self:addElement( f35_local8 )
	self:addElement( f35_local12 )
	self:addElement( f35_local15 )
	self:addElement( f35_local10 )
	self:addElement( f35_local11 )
	return self
end

LUI.mp_hud.AlienHud.shield_only = function()
	local f41_local0 = 8
	local f41_local1 = 140 * 1.25
	local self = LUI.UIElement.new()
	self.id = "shield"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -31,
		left = 0,
		right = f41_local1 + 64,
		height = 16
	} )
	self:animateToState( "default" )
	local f41_local3 = LUI.UIHorizontalList.new()
	f41_local3.id = "shieldBarBG"
	f41_local3:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alignment = LUI.Alignment.Left,
		alpha = 0.5
	} )
	f41_local3:animateToState( "default" )
	local f41_local4 = LUI.UIImage.new()
	f41_local4.id = "shieldBarBGLeftCap"
	f41_local4:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_ltcap" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 12,
		left = 0,
		width = 64,
		bottom = 0
	} )
	f41_local4:animateToState( "default" )
	f41_local3:addElement( f41_local4 )
	local f41_local5 = LUI.UIImage.new()
	f41_local5.id = "shieldBarBGFill"
	f41_local5:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		right = f41_local1 - f41_local0,
		height = 8,
		red = 0,
		green = 0,
		blue = 0
	} )
	f41_local5:animateToState( "default" )
	f41_local3:addElement( f41_local5 )
	local f41_local6 = LUI.UIImage.new()
	f41_local6.id = "shieldBarBGRightCap"
	f41_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_rtcap" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 9.5,
		left = 0,
		width = f41_local0,
		height = -12
	} )
	f41_local6:animateToState( "default" )
	f41_local3:addElement( f41_local6 )
	local f41_local7 = LUI.UIImage.new()
	f41_local7.id = "shieldBarTick"
	f41_local7:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_tic" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 9,
		left = 65 + f41_local1 - 10,
		width = 7.3,
		bottom = -1.5
	} )
	f41_local7:animateToState( "default" )
	local f41_local8 = LUI.UIElement.new()
	f41_local8.id = "shieldBarContainer"
	f41_local8:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -1,
		left = 64,
		right = 0,
		height = 8
	} )
	f41_local8:animateToState( "default" )
	local f41_local9 = LUI.UIImage.new()
	f41_local9.id = "shieldIcon"
	f41_local9:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_health_shield_icon" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0.5,
		left = 42,
		width = 12,
		height = 11,
		red = 0,
		green = 0.68,
		blue = 0.94
	} )
	f41_local9:animateToState( "default" )
	local f41_local10 = LUI.mp_hud.AlienHud.gradient_bar_factory( "shield", "PlayerArmor", 140, 7, 100, true, true, false, 8 )
	f41_local10.colorize( {
		r = 0,
		g = 0.68,
		b = 0.94
	} )
	f41_local8:addElement( f41_local10 )
	self:addElement( f41_local3 )
	self:addElement( f41_local9 )
	self:addElement( f41_local8 )
	self:addElement( f41_local7 )
	return self
end

function health_meter()
	return LUI.mp_hud.AlienHud.health_meter()
end

function blindness()
	local self = LUI.UIElement.new()
	self.id = "blindness"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f42_local1 = LUI.UIImage.new()
	f42_local1.id = "background"
	f42_local1:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_shadow" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 4320,
		left = 0,
		right = 7680,
		alpha = 1
	} )
	f42_local1:animateToState( "default" )
	self:addElement( f42_local1 )
	return self
end

function laststand_timer()
	local self = LUI.UIElement.new()
	self.id = "laststand_timer"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f44_local1 = LUI.UIElement.new()
	if LUI.mp_menus.Aliens.IsChaosMode() and Engine.UsingSplitscreenUpscaling() then
		f44_local1:registerAnimationState( "default", {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			bottom = -13,
			left = 60,
			width = 32,
			height = 40,
			alpha = 0
		} )
	else
		f44_local1:registerAnimationState( "default", {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = false,
			rightAnchor = false,
			bottom = -14,
			left = -16,
			right = 16,
			height = 32,
			alpha = 0
		} )
	end
	f44_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f44_local1:animateToState( "default" )
	local f44_local2 = LUI.UIImage.new()
	f44_local2.id = "laststand_icon"
	f44_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_icon_laststand" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 32
	} )
	f44_local2:animateToState( "default" )
	f44_local1:addElement( f44_local2 )
	local f44_local3 = LUI.UICountdown.new( {} )
	f44_local3.id = "laststand_countdown"
	f44_local3:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottom = 20,
		left = 0,
		right = 0,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f44_local3:animateToState( "default" )
	f44_local1:addElement( f44_local3 )
	local f44_local4 = function ( f45_arg0, f45_arg1 )
		if f45_arg1.value > 0 then
			f44_local3:setEndTime( f45_arg1.value )
			if f45_arg0.current_state ~= "visible" then
				f45_arg0:animateToState( "visible", 250 )
				f45_arg0.current_state = "visible"
			end
		elseif f45_arg0.current_state ~= "default" then
			f45_arg0:animateToState( "default", 250 )
			f45_arg0.current_state = "default"
		end
	end
	
	f44_local1:registerOmnvarHandler( "ui_laststand_end_milliseconds", f44_local4 )
	local f44_local5 = Game.GetOmnvar( "ui_laststand_end_milliseconds" )
	if f44_local5 and f44_local5 > 0 then
		f44_local4( f44_local1, {
			value = f44_local5
		} )
	end
	self:addElement( f44_local1 )
	return self
end

function nuke_countdown_timer()
	local self = LUI.UIElement.new()
	self.id = "nuke_timer"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f46_local1 = Engine.UsingSplitscreenUpscaling() and 10 or 0
	local f46_local2 = LUI.UIElement.new()
	local f46_local3 = Engine.GetDvarString( "ui_mapname" ) == "mp_alien_dlc3"
	local f46_local4 = Engine.GetDvarString( "ui_mapname" ) == "mp_alien_last"
	local f46_local5 = 0
	if f46_local3 then
		f46_local5 = 48
	end
	f46_local2:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 31 + f46_local1,
		left = 0 + f46_local5,
		width = 74,
		height = 32,
		alpha = 0
	} )
	f46_local2:registerAnimationState( "visible", {
		alpha = 1
	} )
	f46_local2:animateToState( "default" )
	local f46_local6 = "alien_icon_nuke"
	if f46_local3 or f46_local4 then
		f46_local6 = "alien_chaos_waypoint_time"
	end
	local f46_local7 = LUI.UIImage.new()
	f46_local7.id = "nuke_icon"
	f46_local7:registerAnimationState( "default", {
		material = RegisterMaterial( f46_local6 ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = -24 + f46_local5,
		top = -15,
		height = 48,
		width = 48
	} )
	f46_local7:animateToState( "default" )
	f46_local2:addElement( f46_local7 )
	local f46_local8 = LUI.UICountdown.new( {} )
	f46_local8.id = "nuke_countdown"
	f46_local8:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 30,
		left = 0,
		right = f46_local5 * 2,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f46_local8:animateToState( "default" )
	f46_local2:addElement( f46_local8 )
	f46_local2:registerOmnvarHandler( "ui_alien_nuke_timer", function ( f47_arg0, f47_arg1 )
		if f47_arg1.value > 0 then
			f46_local8:setEndTime( f47_arg1.value )
			if f47_arg0.current_state ~= "visible" then
				f47_arg0:animateToState( "visible", 250 )
				f47_arg0.current_state = "visible"
			end
		elseif f47_arg0.current_state ~= "default" then
			f47_arg0:animateToState( "default", 250 )
			f47_arg0.current_state = "default"
		end
	end )
	self:addElement( f46_local2 )
	return self
end

function self_revives()
	return LUI.mp_hud.AlienHud.self_revives()
end

function craftSlotCornerElems( f53_arg0, f53_arg1, f53_arg2 )
	local f53_local0 = function ( f54_arg0, f54_arg1 )
		if f54_arg1.value < 1 then
			f54_arg0:animateToState( "default", 100 )
		else
			f54_arg0:animateToState( "visible", 100 )
		end
	end
	
	local f53_local1 = function ( f55_arg0, f55_arg1 )
		if f55_arg1.value >= 0 then
			f55_arg0:animateToState( "recipe_complete", 100 )
		end
	end
	
	local f53_local2 = function ( f56_arg0, f56_arg1 )
		if f56_arg1.value <= 0 then
			f56_arg0:animateToState( "default", 100 )
		else
			local f56_local0 = MBh.AnimateSequence( {
				{
					"bigger",
					250
				},
				{
					"bright",
					250
				}
			} )
			f56_local0( f56_arg0 )
			Engine.PlaySound( "ui_craft_pickup_part" )
		end
	end
	
	local f53_local3 = RegisterMaterial( "alien_crafting_glow1" )
	local f53_local4 = -8
	local f53_local5 = -12
	local f53_local6 = 48
	local f53_local7 = 28
	local self = LUI.UIImage.new( {
		material = f53_local3,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		left = f53_arg1 + f53_local5,
		top = f53_arg2 + f53_local4,
		width = f53_local6,
		height = f53_local6,
		alpha = 0
	} )
	self.id = "crafting_slot_glow_" .. tostring( f53_arg0 )
	self:registerAnimationState( "visible", {
		alpha = 0.5
	} )
	self:registerAnimationState( "recipe_complete", {
		alpha = 0.25
	} )
	self:registerOmnvarHandler( "ui_alien_craft_slot_" .. tostring( f53_arg0 ), f53_local0 )
	self:registerOmnvarHandler( "ui_alien_hudcraftinginfo", f53_local1 )
	local f53_local9 = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		left = f53_arg1,
		top = f53_arg2,
		width = f53_local7,
		height = f53_local7,
		red = 0.65,
		green = 0.65,
		blue = 0.65,
		alpha = 1
	} )
	f53_local9.id = "crafting_slot_icon_" .. tostring( f53_arg0 )
	f53_local9:registerAnimationState( "bigger", {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		left = f53_arg1 - 3,
		top = f53_arg2 - 3,
		width = f53_local7 + 6,
		height = f53_local7 + 6,
		red = 0.65,
		green = 0.65,
		blue = 0.65,
		alpha = 1
	} )
	f53_local9:registerAnimationState( "bright", {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		left = f53_arg1,
		top = f53_arg2,
		width = f53_local7,
		height = f53_local7,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	f53_local9:registerAnimationState( "recipe_complete", {
		alpha = 0.5
	} )
	f53_local9:registerOmnvarHandler( "ui_alien_craft_slot_" .. tostring( f53_arg0 ), f53_local2 )
	f53_local9:registerOmnvarHandler( "ui_alien_hudcraftinginfo", f53_local1 )
	f53_local9:registerEventHandler( "refresh_crafting_ingredients", function ( element, event )
		local f57_local0 = "slot" .. tostring( f53_arg0 ) .. "Material"
		if event[f57_local0] and event[f57_local0] ~= "" then
			element:setImage( RegisterMaterial( event[f57_local0] ) )
		else
			element:animateToState( "default" )
		end
	end )
	f53_local0( self, {
		value = Game.GetOmnvar( "ui_alien_craft_slot_" .. tostring( f53_arg0 ) )
	} )
	f53_local1( self, {
		value = Game.GetOmnvar( "ui_alien_hudcraftinginfo" )
	} )
	f53_local2( f53_local9, {
		value = Game.GetOmnvar( "ui_alien_craft_slot_" .. tostring( f53_arg0 ) )
	} )
	f53_local1( f53_local9, {
		value = Game.GetOmnvar( "ui_alien_hudcraftinginfo" )
	} )
	return f53_local9, self
end

function craftSlotCenterElems( f58_arg0, f58_arg1, f58_arg2 )
	local f58_local0 = function ( f59_arg0, f59_arg1 )
		if f59_arg1.value < 0 then
			f59_arg0:animateToState( "default", 100 )
		else
			local f59_local0 = MBh.AnimateLoop( {
				{
					"default",
					0
				},
				{
					"visible",
					750
				},
				{
					"default",
					750
				}
			} )
			f59_local0( f59_arg0 )
		end
	end
	
	local f58_local1 = function ( f60_arg0, f60_arg1 )
		if f60_arg1.value < 0 then
			f60_arg0:animateToState( "default", 100 )
		else
			local f60_local0 = MBh.AnimateLoop( {
				{
					"bigger",
					350
				},
				{
					"visible",
					350
				},
				{
					"visible",
					5000
				}
			} )
			f60_local0( f60_arg0 )
		end
	end
	
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_crafting_glow2" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f58_arg2 - 26,
		left = f58_arg1 - 18,
		height = 128,
		width = 100,
		alpha = 0
	} )
	self.id = "crafting_slot_glow_" .. tostring( f58_arg0 )
	self:registerAnimationState( "visible", {
		alpha = 0.6
	} )
	self:registerOmnvarHandler( "ui_alien_hudcraftinginfo", f58_local0 )
	self:registerEventHandler( "reset", MBh.AnimateToState( "default" ) )
	local f58_local3 = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f58_arg2,
		left = f58_arg1,
		height = 64,
		width = 64,
		alpha = 0.35
	} )
	f58_local3.id = "crafting_slot_icon" .. tostring( f58_arg0 )
	f58_local3:registerAnimationState( "visible", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f58_arg2,
		left = f58_arg1,
		height = 64,
		width = 64,
		alpha = 1
	} )
	f58_local3:registerAnimationState( "bigger", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f58_arg2 - 6,
		left = f58_arg1 - 6,
		height = 70,
		width = 70,
		alpha = 1
	} )
	f58_local3:registerOmnvarHandler( "ui_alien_hudcraftinginfo", f58_local1 )
	f58_local3:registerEventHandler( "refresh_crafting_ingredients", function ( element, event )
		local f61_local0 = "slot" .. tostring( f58_arg0 ) .. "Material"
		if event[f61_local0] and event[f61_local0] ~= "" then
			element:setImage( RegisterMaterial( event[f61_local0] ) )
		else
			element:animateToState( "default" )
		end
	end )
	f58_local0( self, {
		value = Game.GetOmnvar( "ui_alien_hudcraftinginfo" )
	} )
	f58_local1( f58_local3, {
		value = Game.GetOmnvar( "ui_alien_hudcraftinginfo" )
	} )
	return f58_local3, self
end

function crafting_items( f62_arg0 )
	local f62_local0 = function ( f63_arg0, f63_arg1 )
		local f63_local0 = LUI.mp_menus.Aliens
		f63_arg0:processEvent( {
			name = "refresh_crafting_ingredients",
			slot1Material = Engine.TableLookup( f63_local0.AlienCraftingRecipes.File, f63_local0.AlienCraftingRecipes.Cols.Idx, f63_arg1.value, f63_local0.AlienCraftingRecipes.Cols.Slot1Material ),
			slot2Material = Engine.TableLookup( f63_local0.AlienCraftingRecipes.File, f63_local0.AlienCraftingRecipes.Cols.Idx, f63_arg1.value, f63_local0.AlienCraftingRecipes.Cols.Slot2Material ),
			slot3Material = Engine.TableLookup( f63_local0.AlienCraftingRecipes.File, f63_local0.AlienCraftingRecipes.Cols.Idx, f63_arg1.value, f63_local0.AlienCraftingRecipes.Cols.Slot3Material ),
			slot4Material = Engine.TableLookup( f63_local0.AlienCraftingRecipes.File, f63_local0.AlienCraftingRecipes.Cols.Idx, f63_arg1.value, f63_local0.AlienCraftingRecipes.Cols.Slot4Material )
		} )
	end
	
	local f62_local1 = 128
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_icon_craft_widget" ),
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		left = 240,
		bottom = 16,
		height = f62_local1,
		width = f62_local1,
		alpha = 0
	} )
	self.id = "crafting_container"
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "invisible", {
		alpha = 0
	} )
	self:registerAnimationState( "tank1", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		bottom = 16,
		left = 240,
		height = f62_local1,
		width = f62_local1
	} )
	self:registerAnimationState( "tank2", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		bottom = 16,
		left = 270,
		height = f62_local1,
		width = f62_local1
	} )
	self:registerAnimationState( "tank3", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		bottom = 16,
		left = 300,
		height = f62_local1,
		width = f62_local1
	} )
	self:registerAnimationState( "tank4", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		bottom = 16,
		left = 330,
		height = f62_local1,
		width = f62_local1
	} )
	self:setupUIIntWatch( "PlayerMaxHealth" )
	self:registerEventHandler( "int_watch_alert", function ( element, event )
		if event.newValue == 125 then
			element:animateToState( "tank1", 250 )
		elseif event.newValue == 150 then
			element:animateToState( "tank2", 250 )
		elseif event.newValue == 175 then
			element:animateToState( "tank3", 250 )
		elseif event.newValue == 200 then
			element:animateToState( "tank4", 250 )
		end
	end )
	local f62_local3, f62_local4 = craftSlotCornerElems( 1, 10, 84 )
	local f62_local5, f62_local6 = craftSlotCornerElems( 2, 90, 84 )
	local f62_local7, f62_local8 = craftSlotCornerElems( 3, 50, 14 )
	local f62_local9, f62_local10 = craftSlotCenterElems( 4, 32, 44 )
	self:addElement( f62_local4 )
	self:addElement( f62_local3 )
	self:addElement( f62_local6 )
	self:addElement( f62_local5 )
	self:addElement( f62_local8 )
	self:addElement( f62_local7 )
	self:addElement( f62_local10 )
	self:addElement( f62_local9 )
	local f62_local11 = Game.GetOmnvar( "ui_alien_craft_recipe" )
	f62_local0( self, {
		value = f62_local11
	} )
	if f62_local11 ~= 200 and f62_local11 > 0 then
		self:animateToState( "visible" )
	end
	local f62_local12 = Engine.UsingSplitscreenUpscaling() and -50 or 0
	local f62_local13 = 1.75
	local f62_local14 = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_icon_craft_widget" ),
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = -f62_local1 / 2,
		right = f62_local1 / 2,
		top = -f62_local1 / 2 + f62_local12,
		bottom = f62_local1 / 2 + f62_local12,
		alpha = 1
	} )
	f62_local14:registerAnimationState( "enlarged", {
		left = -f62_local1 / 2 * f62_local13,
		right = f62_local1 / 2 * f62_local13,
		top = -f62_local1 / 2 * f62_local13 + f62_local12,
		bottom = f62_local1 / 2 * f62_local13 + f62_local12
	} )
	f62_local14:registerAnimationState( "standard", {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = -f62_local1 / 2,
		right = f62_local1 / 2,
		top = -f62_local1 / 2 + f62_local12,
		bottom = f62_local1 / 2 + f62_local12,
		alpha = 1
	} )
	f62_local14:registerAnimationState( "wait", {} )
	f62_local14:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f62_local14.id = "test_fly_over"
	f62_local14:animateToState( "hidden" )
	f62_arg0:addElement( f62_local14 )
	f62_local14:registerOmnvarHandler( "ui_alien_craft_recipe", function ( f65_arg0, f65_arg1 )
		self:animateToState( "invisible" )
		if f65_arg1.value ~= 200 and f65_arg1.value > 0 then
			f65_arg0:closeChildren()
			self:processEvent( {
				name = "reset"
			} )
			f62_local14:registerAnimationState( "flyover", LUI.MakeFlyOverAnimationState( f65_arg0, self ) )
			local f65_local0 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"enlarged",
					75
				},
				{
					"standard",
					75
				}
			} )
			f65_local0( f65_arg0, f65_arg1 )
			Engine.PlaySound( "ui_craft_pickup_schematic" )
		end
	end )
	f62_local14:registerEventHandler( LUI.FormatAnimStateFinishEvent( "standard" ), function ( element, event )
		local f66_local0 = craftSlotCornerElems( 1, 10, 84 )
		local f66_local1 = craftSlotCornerElems( 2, 90, 84 )
		local f66_local2 = craftSlotCornerElems( 3, 50, 14 )
		local f66_local3 = craftSlotCenterElems( 4, 32, 44 )
		f62_local14:addElement( f66_local0 )
		f62_local14:addElement( f66_local1 )
		f62_local14:addElement( f66_local2 )
		f62_local14:addElement( f66_local3 )
		f62_local0( element, {
			value = Game.GetOmnvar( "ui_alien_craft_recipe" )
		} )
		local f66_local4 = MBh.AnimateSequence( {
			{
				"wait",
				2250
			},
			{
				"flyover",
				200
			},
			{
				"hidden",
				0
			}
		} )
		f66_local4( element, event )
	end )
	f62_local14:registerEventHandler( LUI.FormatAnimStateFinishEvent( "hidden" ), function ( element, event )
		self:animateToState( "visible" )
		f62_local0( self, {
			value = Game.GetOmnvar( "ui_alien_craft_recipe" )
		} )
	end )
	return self
end

LUI.mp_hud.AlienHud.locker_key = function()
	local self = LUI.UIElement.new()
	self.id = "locker_key"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 0,
		top = 0,
		right = 0
	} )
	self:animateToState( "default" )
	local f68_local1 = LUI.UIElement.new()
	f68_local1:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = 18,
		left = 70,
		width = 32,
		height = 0,
		alpha = 0
	} )
	f68_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f68_local1:animateToState( "default" )
	local f68_local2 = LUI.UIImage.new()
	f68_local2.id = "locker_key_icon"
	f68_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_icon_locker_key" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 32
	} )
	f68_local2:animateToState( "default" )
	f68_local1:addElement( f68_local2 )
	local f68_local3 = function ( f69_arg0, f69_arg1 )
		if 0 < f69_arg1 then
			f68_local1:animateToState( "visible", 250 )
		else
			f68_local1:animateToState( "default", 250 )
		end
	end
	
	f68_local1:registerOmnvarHandler( "ui_alien_locker_key", function ( f70_arg0, f70_arg1 )
		f68_local3( f70_arg0, f70_arg1.value )
	end )
	f68_local3( f68_local1, Game.GetOmnvar( "ui_alien_locker_key" ) )
	self:addElement( f68_local1 )
	return self
end

 function strike_pack()
	local self = LUI.UIElement.new()
	self.id = "strike_package"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 0,
		top = 0,
		right = 0
	} )
	self:animateToState( "default" )
	local f68_local1 = LUI.UIElement.new()
	f68_local1:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = -35,
		left = 80,
		width = 32,
		height = 0,
		alpha = 0
	} )
	f68_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f68_local1:animateToState( "default" )
	local f68_local2 = LUI.UIImage.new()
	f68_local2.id = "strike_package_icon"
	f68_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_icon_locker_key" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 32
	} )
	f68_local2:animateToState( "default" )
	f68_local1:addElement( f68_local2 )
	local f68_local3 = function ( f69_arg0, f69_arg1 )
		if 0 < f69_arg1 then
			f68_local1:animateToState( "visible", 250 )
		else
			f68_local1:animateToState( "default", 250 )
		end
	end
	
	f68_local1:registerOmnvarHandler( "ui_alien_locker_key", function ( f70_arg0, f70_arg1 )
		f68_local3( f70_arg0, f70_arg1.value )
	end )
	f68_local3( f68_local1, Game.GetOmnvar( "ui_alien_locker_key" ) )
	self:addElement( f68_local1 )
	return self
end

function GetFieldForPerk2( f10_arg0 )
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

function quick_shop_class_skill( f71_arg0 )
	local f71_local0 = 26
	local f71_local1 = 10
	local f71_local2 = 20
	local f71_local3 = 4
	local f71_local4 = 20
	local f71_local5 = 0
	local f71_local6 = 21
	local f71_local7 = {
		"alien_icon_weapon_specialist",
		"alien_icon_tank",
		"alien_icon_engineer",
		"alien_icon_medic"
	}
	local f71_local8 = function ( f72_arg0 )
		local f72_local0
		if 0 >= f72_arg0 or f72_arg0 > #f71_local7 then
			f72_local0 = false
		else
			f72_local0 = true
		end
		return f72_local0
	end
	
	f71_arg0.alpha = 0
	local self = LUI.UIElement.new( f71_arg0 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.id = "quick_shop_class_skill"
	local f71_local10 = function ( f73_arg0 )
		local f73_local0 = Game.GetOmnvar( "ui_alien_class_skill_active" )
		local f73_local1 = math.floor(Game.GetOmnvar( "ui_alien_class_skill_timer" )/1000)*1000 > 0
		local f73_local2 = Game.GetOmnvar( "ui_alien_class_skill_blocked" )
		local f73_local3
		if not f73_local0 and not f73_local1 then
			f73_local3 = not f73_local2
		else
			f73_local3 = false
		end
		local f73_local4 = f73_arg0
		local f73_local5 = f73_arg0.animateToState
		local f73_local6
		if f73_local2 then
			f73_local6 = "dimmed"
		else
			f73_local6 = "default"
		end
		f73_local5( f73_local4, f73_local6, 250 )
	end
	
	local f71_local11 = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_dpad_arrow_up" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		height = f71_local1,
		bottom = 0,
		left = -f71_local2 / 2,
		width = f71_local2,
		alpha = 0.6
	} )
	f71_local11:registerAnimationState( "dimmed", {
		alpha = 0.2
	} )
	f71_local11:registerOmnvarHandler( "ui_alien_class_skill_active", f71_local10 )
	f71_local11:registerOmnvarHandler( "ui_alien_class_skill_timer", f71_local10 )
	f71_local11:registerOmnvarHandler( "ui_alien_class_skill_blocked", f71_local10 )
	f71_local10( f71_local11 )
	f71_local11.id = "arrow"
	self:addElement( f71_local11 )
	local f71_local12 = function ( f74_arg0, f74_arg1 )
		if f71_local8( f74_arg1 ) then
			f74_arg0:setImage( RegisterMaterial( f71_local7[f74_arg1] ) )
		end
	end
	
	local f71_local13 = function ( f75_arg0 )
		local f75_local0 = Game.GetOmnvar( "ui_alien_class_skill_active" )
		local f75_local1 = math.floor(Game.GetOmnvar( "ui_alien_class_skill_timer" )/1000)*1000 > 0
		if Game.GetOmnvar( "ui_alien_class_skill_blocked" ) then
			f75_arg0:animateToState( "dimmed", 200 )
		elseif f75_local0 then
			local f75_local2 = MBh.AnimateLoop( {
				{
					"active",
					150
				},
				{
					"default",
					400
				}
			} )
			f75_local2( f75_arg0, {} )
		else
			local f75_local2 = f75_arg0
			local f75_local3 = f75_arg0.animateToState
			local f75_local4
			if f75_local1 or Game.GetOmnvar( "ui_alien_class_skill_blocked" ) then
				f75_local4 = "dimmed"
			else
				f75_local4 = "default"
			end
			f75_local3( f75_local2, f75_local4, 500 )
		end
	end
	
	local f71_local14 = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = -f71_local1 - f71_local3,
		width = f71_local0,
		left = -f71_local0 / 2,
		height = f71_local0,
		alpha = 0.8,
		scale = 0
	} )
	f71_local14:registerAnimationState( "dimmed", {
		alpha = 0.2,
		scale = 0
	} )
	f71_local14:registerAnimationState( "active", {
		alpha = 1,
		scale = 0.2
	} )
	f71_local14:registerOmnvarHandler( "ui_alien_class_skill_active", f71_local13 )
	f71_local14:registerOmnvarHandler( "ui_alien_class_skill_timer", f71_local13 )
	f71_local14:registerOmnvarHandler( "ui_alien_class_skill_blocked", f71_local13 )
	f71_local14:registerOmnvarHandler( "ui_alien_class_skill", function ( f76_arg0, f76_arg1 )
		f71_local12( f76_arg0, 1 + GetFieldForPerk2( Engine.GetPlayerDataEx( 0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 ) )/5 )
	end )
	f71_local12( f71_local14, 1 + GetFieldForPerk2( Engine.GetPlayerDataEx( 0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 ) )/5 )
	f71_local13( f71_local14 )
	f71_local14.id = "icon"
	self:addElement( f71_local14 )
	local f71_local15 = function ( f77_arg0 )
		local f77_local0 = math.floor(Game.GetOmnvar( "ui_alien_class_skill_timer" )/1000)*1000 > 0
		local f77_local1 = f77_arg0
		local f77_local2 = f77_arg0.animateToState
		local f77_local3
		if f77_local0 then
			f77_local3 = "visible"
			if not f77_local3 then
			
			else
				f77_local2( f77_local1, f77_local3 )
			end
		end
		f77_local3 = "default"
	end
	
	local f71_local16 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = -f71_local1 - f71_local3 + f71_local5,
		height = f71_local6,
		left = f71_local4,
		width = 2,
		alpha = 0
	} )
	f71_local16:registerAnimationState( "visible", {
		alpha = 0.6
	} )
	f71_local16:registerOmnvarHandler( "ui_alien_class_skill_timer", f71_local15 )
	f71_local15( f71_local16 )
	f71_local16.id = "cooldown"
	self:addElement( f71_local16 )
	local f71_local17 = LUI.UIImage.new( CoD.ColorizeState( Colors.black, {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} ) )
	f71_local17.id = "cooldownBG"
	f71_local16:addElement( f71_local17 )
	local f71_local18 = function ( f78_arg0, f78_arg1 )
		if not coolingprimary then
			if 0 < f78_arg1 then
				f78_arg0:animateToState( "full", f78_arg1 )
				coolingprimary = true
			else
				f78_arg0:animateToState( "default" )
			end
		end
	end
	
	local f71_local19 = function ( f79_arg0, f79_arg1 )
		if f79_arg1.value then
			f79_arg0:cancelAnimateToState()
		else
			coolingprimary = false
		end
	end
	
	local f71_local20 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f71_local20:registerAnimationState( "full", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f71_local20:registerOmnvarHandler( "ui_alien_class_skill_timer", function ( f80_arg0, f80_arg1 )
		local valuefixed = math.floor(f80_arg1.value/1000)*1000
		f71_local18( f80_arg0, valuefixed )
		if valuefixed < 1 then
			coolingprimary = false
			f71_local20:animateToState( "default" )
			f71_local16:animateToState( "default" )
			f71_local14:animateToState( "default" )
		end
	end )
	f71_local20:registerOmnvarHandler( "ui_alien_class_skill_blocked", f71_local19 )
	f71_local18( f71_local20, math.floor(Game.GetOmnvar( "ui_alien_class_skill_timer" )/1000)*1000 )
	f71_local20.id = "cooldownFG"
	f71_local16:addElement( f71_local20 )
	local f71_local21 = function ( f81_arg0, f81_arg1 )
		f81_arg0:animateToState( f71_local8( f81_arg1 ) and "visible" or "default", 150 )
	end
	
	self:registerOmnvarHandler( "ui_alien_class_skill", function ( f82_arg0, f82_arg1 )
		f71_local21( f82_arg0, 1 + GetFieldForPerk2( Engine.GetPlayerDataEx( 0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 ) )/5 )
	end )
	f71_local21( self, 1 + GetFieldForPerk2( Engine.GetPlayerDataEx( 0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 ) )/5 )
	return self
end

function quick_shop_class_skill_secondary( f83_arg0 )
	local f83_local0 = 26
	local f83_local1 = 10
	local f83_local2 = 20
	local f83_local3 = 4
	local f83_local4 = 20
	local f83_local5 = -2
	local f83_local6 = 21
	local f83_local7 = {
		"alien_icon_weapon_specialist",
		"alien_icon_tank",
		"alien_icon_engineer",
		"alien_icon_medic"
	}
	local f83_local8 = function ( f84_arg0 )
		local f84_local0
		if 0 >= f84_arg0 or f84_arg0 > #f83_local7 then
			f84_local0 = false
		else
			f84_local0 = true
		end
		return f84_local0
	end
	
	f83_arg0.alpha = 0
	local self = LUI.UIElement.new( f83_arg0 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.id = "quick_shop_class_skill_secondary"
	local f83_local10 = function ( f85_arg0 )
		local f85_local0 = Game.GetOmnvar( "ui_alien_class_skill_active_secondary" )
		local f85_local1 = math.floor(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )/1000)*1000 > 0
		local f85_local2 = Game.GetOmnvar( "ui_alien_class_skill_blocked" )
		local f85_local3
		if not f85_local0 and not f85_local1 then
			f85_local3 = not f85_local2
		else
			f85_local3 = false
		end
		local f85_local4 = f85_arg0
		local f85_local5 = f85_arg0.animateToState
		local f85_local6
		if f85_local2 then
			f85_local6 = "dimmed"
		else
			f85_local6 = "default"
		end
		f85_local5( f85_local4, f85_local6, 250 )
	end
	
	local f83_local11 = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_dpad_arrow_up" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		height = f83_local1,
		bottom = 0,
		left = -f83_local2 / 2,
		width = f83_local2,
		alpha = 0.6,
		zRot = 90
	} )
	f83_local11:registerAnimationState( "dimmed", {
		alpha = 0.2
	} )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill_active_secondary", f83_local10 )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill_timer_secondary", f83_local10 )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local10 )
	f83_local10( f83_local11 )
	f83_local11.id = "arrow"
	self:addElement( f83_local11 )
	local f83_local12 = function ( f86_arg0, f86_arg1 )
		if f83_local8( f86_arg1 ) then
			f86_arg0:setImage( RegisterMaterial( f83_local7[f86_arg1] ) )
		end
	end
	
	local f83_local13 = function ( f87_arg0 )
		local f87_local0 = Game.GetOmnvar( "ui_alien_class_skill_active_secondary" )
		local f87_local1 = math.floor(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )/1000)*1000 > 0
		if Game.GetOmnvar( "ui_alien_class_skill_blocked" ) then
			f87_arg0:animateToState( "dimmed", 200 )
		elseif f87_local0 then
			local f87_local2 = MBh.AnimateLoop( {
				{
					"active",
					150
				},
				{
					"default",
					400
				}
			} )
			f87_local2( f87_arg0, {} )
		else
			local f87_local2 = f87_arg0
			local f87_local3 = f87_arg0.animateToState
			local f87_local4
			if f87_local1 or Game.GetOmnvar( "ui_alien_class_skill_blocked" ) then
				f87_local4 = "dimmed"
			else
				f87_local4 = "default"
			end
			f87_local3( f87_local2, f87_local4, 500 )
		end
	end
	
	local f83_local14 = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = 7,
		width = f83_local0,
		left = -35,
		height = f83_local0,
		alpha = 0.8,
		scale = 0
	} )
	f83_local14:registerAnimationState( "dimmed", {
		alpha = 0.2,
		scale = 0
	} )
	f83_local14:registerAnimationState( "active", {
		alpha = 1,
		scale = 0.2
	} )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_active_secondary", f83_local13 )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_timer_secondary", f83_local13 )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local13 )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_secondary", function ( f88_arg0, f88_arg1 )
		f83_local12( f88_arg0, math.floor(Engine.GetPlayerDataReservedInt( Engine.GetFirstActiveController(), CoD.StatsGroup.Coop, "secondary_class" )/5)+1 )
	end )
	f83_local12( f83_local14, math.floor(Engine.GetPlayerDataReservedInt( Engine.GetFirstActiveController(), CoD.StatsGroup.Coop, "secondary_class" )/5)+1 )
	f83_local13( f83_local14 )
	f83_local14.id = "icon"
	self:addElement( f83_local14 )
	local f83_local15 = function ( f89_arg0 )
		local f89_local0 = math.floor(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )/1000)*1000 > 0
		local f89_local1 = f89_arg0
		local f89_local2 = f89_arg0.animateToState
		local f89_local3
		if f89_local0 then
			f89_local3 = "visible"
			if not f89_local3 then
			
			else
				f89_local2( f89_local1, f89_local3 )
			end
		end
		f89_local3 = "default"
	end
	
	local f83_local16 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = 6 + f83_local5,
		height = f83_local6,
		left = -40,
		width = 2,
		alpha = 0
	} )
	f83_local16:registerAnimationState( "visible", {
		alpha = 0.6
	} )
	f83_local16:registerOmnvarHandler( "ui_alien_class_skill_timer_secondary", f83_local15 )
	f83_local15( f83_local16 )
	f83_local16.id = "cooldown"
	self:addElement( f83_local16 )
	local f83_local17 = LUI.UIImage.new( CoD.ColorizeState( Colors.black, {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} ) )
	f83_local17.id = "cooldownBG"
	f83_local16:addElement( f83_local17 )
	local f83_local18 = function ( f90_arg0, f90_arg1 )
		if not coolingsecond then
			if 0 < f90_arg1 then
				f90_arg0:animateToState( "full", f90_arg1 )
				coolingsecond = true
			else
				f90_arg0:animateToState( "default" )
			end
		end
	end
	
	local f83_local19 = function ( f91_arg0, f91_arg1 )
		if f91_arg1.value then
			f91_arg0:cancelAnimateToState()
		else
			coolingsecond = false
		end
	end
	
	local f83_local20 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f83_local20:registerAnimationState( "full", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f83_local20:registerOmnvarHandler( "ui_alien_class_skill_timer_secondary", function ( f92_arg0, f92_arg1 )
		local valuefixed = math.floor(f92_arg1.value/1000)*1000
		f83_local18( f92_arg0, valuefixed )
		if valuefixed < 1 then
			coolingsecond = false
			f83_local20:animateToState( "default" )
			f83_local16:animateToState( "default" )
			f83_local14:animateToState( "default" )
		end
	end )
	f83_local20:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local19 )
	f83_local18( f83_local20, math.floor(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )/1000)*1000 )
	f83_local20.id = "cooldownFG"
	f83_local16:addElement( f83_local20 )
	local f83_local21 = function ( f93_arg0, f93_arg1 )
		f93_arg0:animateToState( f83_local8( f93_arg1 ) and "visible" or "default", 150 )
	end
	
	self:registerOmnvarHandler( "ui_alien_class_skill_secondary", function ( f94_arg0, f94_arg1 )
		f83_local21( f94_arg0, math.floor(Engine.GetPlayerDataReservedInt( 0, CoD.StatsGroup.Coop, "secondary_class" )/5)+1 )
	end )
	f83_local21( self, math.floor(Engine.GetPlayerDataReservedInt( 0, CoD.StatsGroup.Coop, "secondary_class" )/5)+1 )
	return self
end

function quick_shop_class_skill_third( f83_arg0 )
	local f83_local0 = 26
	local f83_local1 = 10
	local f83_local2 = 20
	local f83_local3 = 4
	local f83_local4 = 20
	local f83_local5 = -2
	local f83_local6 = 21
	local f83_local7 = {
		"alien_icon_weapon_specialist",
		"alien_icon_tank",
		"alien_icon_engineer",
		"alien_icon_medic"
	}
	local f83_local8 = function ( f84_arg0 )
		local f84_local0
		if 0 >= f84_arg0 or f84_arg0 > #f83_local7 then
			f84_local0 = false
		else
			f84_local0 = true
		end
		return f84_local0
	end
	
	f83_arg0.alpha = 0
	local self = LUI.UIElement.new( f83_arg0 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.id = "quick_shop_class_skill_third"
	local f83_local10 = function ( f85_arg0 )
		local f85_local0 = Game.GetOmnvar( "ui_alien_class_skill_secondary" )
		local f85_local1 = 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )%1000) > 0
		local f85_local2 = Game.GetOmnvar( "ui_alien_class_skill_blocked" )
		local f85_local3
		if not f85_local0 and not f85_local1 then
			f85_local3 = not f85_local2
		else
			f85_local3 = false
		end
		local f85_local4 = f85_arg0
		local f85_local5 = f85_arg0.animateToState
		local f85_local6
		if f85_local2 then
			f85_local6 = "dimmed"
		else
			f85_local6 = "default"
		end
		f85_local5( f85_local4, f85_local6, 250 )
	end
	
	local f83_local11 = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_dpad_arrow_up" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		height = f83_local1,
		bottom = 0,
		left = -f83_local2 / 2,
		width = f83_local2,
		alpha = 0.6,
		zRot = 180
	} )
	f83_local11:registerAnimationState( "dimmed", {
		alpha = 0.2
	} )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill_secondary", f83_local10 )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill_timer_secondary", f83_local10 )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local10 )
	f83_local10( f83_local11 )
	f83_local11.id = "arrow"
	self:addElement( f83_local11 )
	local f83_local12 = function ( f86_arg0, f86_arg1 )
		if f83_local8( f86_arg1 ) then
			f86_arg0:setImage( RegisterMaterial( f83_local7[f86_arg1] ) )
		end
	end
	
	local f83_local13 = function ( f87_arg0 )
		local f87_local0 = Game.GetOmnvar( "ui_alien_class_skill_secondary" )
		local f87_local1 = 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )%1000) > 0
		if Game.GetOmnvar( "ui_alien_class_skill_blocked" ) then
			f87_arg0:animateToState( "dimmed", 200 )
		elseif f87_local0 == 1 then
			local f87_local2 = MBh.AnimateLoop( {
				{
					"active",
					150
				},
				{
					"default",
					400
				}
			} )
			f87_local2( f87_arg0, {} )
		else
			local f87_local2 = f87_arg0
			local f87_local3 = f87_arg0.animateToState
			local f87_local4
			if f87_local1 or Game.GetOmnvar( "ui_alien_class_skill_blocked" ) then
				f87_local4 = "dimmed"
			else
				f87_local4 = "default"
			end
			f87_local3( f87_local2, f87_local4, 500 )
		end
	end
	
	local f83_local14 = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = 30,
		width = f83_local0,
		left = -12,
		height = f83_local0,
		alpha = 0.8,
		scale = 0
	} )
	f83_local14:registerAnimationState( "dimmed", {
		alpha = 0.2,
		scale = 0
	} )
	f83_local14:registerAnimationState( "active", {
		alpha = 1,
		scale = 0.2
	} )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_secondary", f83_local13 )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_timer_secondary", f83_local13 )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local13 )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_third", function ( f88_arg0, f88_arg1 )
		f83_local12( f88_arg0, Engine.GetPlayerDataReservedInt( 0, CoD.StatsGroup.Coop, "secondary_class" )%5 )
	end )
	f83_local12( f83_local14, Engine.GetPlayerDataReservedInt( 0, CoD.StatsGroup.Coop, "secondary_class" )%5 )
	f83_local13( f83_local14 )
	f83_local14.id = "icon"
	self:addElement( f83_local14 )
	local f83_local15 = function ( f89_arg0 )
		local f89_local0 = 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )%1000) > 0
		local f89_local1 = f89_arg0
		local f89_local2 = f89_arg0.animateToState
		local f89_local3
		if f89_local0 then
			f89_local3 = "visible"
			if not f89_local3 then
			
			else
				f89_local2( f89_local1, f89_local3 )
			end
		end
		f89_local3 = "default"
	end
	
	local f83_local16 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = 28,
		height = f83_local6,
		left = f83_local4,
		width = 2,
		alpha = 0
	} )
	f83_local16:registerAnimationState( "visible", {
		alpha = 0.6
	} )
	f83_local16:registerOmnvarHandler( "ui_alien_class_skill_timer_secondary", f83_local15 )
	f83_local15( f83_local16 )
	f83_local16.id = "cooldown"
	self:addElement( f83_local16 )
	local f83_local17 = LUI.UIImage.new( CoD.ColorizeState( Colors.black, {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} ) )
	f83_local17.id = "cooldownBG"
	f83_local16:addElement( f83_local17 )
	local f83_local18 = function ( f90_arg0, f90_arg1 )
		if not coolingthird then
			if 0 < f90_arg1 then
				f90_arg0:animateToState( "full", f90_arg1 )
				coolingthird = true
			else
				f90_arg0:animateToState( "default" )
			end
		end
	end
	
	local f83_local19 = function ( f91_arg0, f91_arg1 )
		if f91_arg1.value then
			f91_arg0:cancelAnimateToState()
		else
			coolingthird = false
		end
	end
	
	local f83_local20 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f83_local20:registerAnimationState( "full", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f83_local20:registerOmnvarHandler( "ui_alien_class_skill_timer_secondary", function ( f92_arg0, f92_arg1 )
		local valuefixed = 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )%1000)
		f83_local18( f92_arg0, valuefixed )
		if valuefixed < 1 then
			coolingthird = false
			f83_local20:animateToState( "default" )
			f83_local16:animateToState( "default" )
			f83_local14:animateToState( "default" )
		end
	end )
	f83_local20:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local19 )
	f83_local18( f83_local20, 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer_secondary" )%1000) )
	f83_local20.id = "cooldownFG"
	f83_local16:addElement( f83_local20 )
	local f83_local21 = function ( f93_arg0, f93_arg1 )
		f93_arg0:animateToState( f83_local8( f93_arg1 ) and "visible" or "default", 150 )
	end
	
	self:registerOmnvarHandler( "ui_alien_class_skill_secondary", function ( f94_arg0, f94_arg1 )
		f83_local21( f94_arg0, Engine.GetPlayerDataReservedInt( 0, CoD.StatsGroup.Coop, "secondary_class" )%5 )
	end )
	f83_local21( self, Engine.GetPlayerDataReservedInt( 0, CoD.StatsGroup.Coop, "secondary_class" )%5 )
	return self
end

function get_fourth_class()
	local class = {}
	class[1] = GetFieldForPerk2( Engine.GetPlayerDataEx( 0, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 ))/5
	class[2] = math.floor(Engine.GetPlayerDataReservedInt( 0, CoD.StatsGroup.Coop, "secondary_class" )/5)
	class[3] = (Engine.GetPlayerDataReservedInt( 0, CoD.StatsGroup.Coop, "secondary_class" )%5)-1
	local classes = 2^class[1] + 2^class[2] + 2^class[3]
	if class[3] == -1 then
		return 0
	else
		return (math.log(15-classes)/math.log(2))+1
	end
end

function quick_shop_class_skill_fourth( f83_arg0 )
	local f83_local0 = 26
	local f83_local1 = 10
	local f83_local2 = 20
	local f83_local3 = 4
	local f83_local4 = 20
	local f83_local5 = -2
	local f83_local6 = 21
	local f83_local7 = {
		"alien_icon_weapon_specialist",
		"alien_icon_tank",
		"alien_icon_engineer",
		"alien_icon_medic"
	}
	local f83_local8 = function ( f84_arg0 )
		local f84_local0
		if 0 >= f84_arg0 or f84_arg0 > #f83_local7 then
			f84_local0 = false
		else
			f84_local0 = true
		end
		return f84_local0
	end
	
	f83_arg0.alpha = 0
	local self = LUI.UIElement.new( f83_arg0 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.id = "quick_shop_class_skill_fourth"
	local f83_local10 = function ( f85_arg0 )
		local f85_local0 = Game.GetOmnvar( "ui_alien_class_skill" )
		local f85_local1 = 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer" )%1000) > 0
		local f85_local2 = Game.GetOmnvar( "ui_alien_class_skill_blocked" )
		local f85_local3
		if not f85_local0 and not f85_local1 then
			f85_local3 = not f85_local2
		else
			f85_local3 = false
		end
		local f85_local4 = f85_arg0
		local f85_local5 = f85_arg0.animateToState
		local f85_local6
		if f85_local2 then
			f85_local6 = "dimmed"
		else
			f85_local6 = "default"
		end
		f85_local5( f85_local4, f85_local6, 250 )
	end
	
	local f83_local11 = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_dpad_arrow_up" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		height = f83_local1,
		bottom = 0,
		left = -f83_local2 / 2,
		width = f83_local2,
		alpha = 0.6,
		zRot = 270
	} )
	f83_local11:registerAnimationState( "dimmed", {
		alpha = 0.2
	} )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill", f83_local10 )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill_timer", f83_local10 )
	f83_local11:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local10 )
	f83_local10( f83_local11 )
	f83_local11.id = "arrow"
	self:addElement( f83_local11 )
	local f83_local12 = function ( f86_arg0, f86_arg1 )
		if f83_local8( f86_arg1 ) then
			f86_arg0:setImage( RegisterMaterial( f83_local7[f86_arg1] ) )
		end
	end
	
	local f83_local13 = function ( f87_arg0 )
		local f87_local0 = Game.GetOmnvar( "ui_alien_class_skill" )
		local f87_local1 = 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer" )%1000) > 0
		if Game.GetOmnvar( "ui_alien_class_skill_blocked" ) then
			f87_arg0:animateToState( "dimmed", 200 )
		elseif f87_local0 == 1 then
			local f87_local2 = MBh.AnimateLoop( {
				{
					"active",
					150
				},
				{
					"default",
					400
				}
			} )
			f87_local2( f87_arg0, {} )
		else
			local f87_local2 = f87_arg0
			local f87_local3 = f87_arg0.animateToState
			local f87_local4
			if f87_local1 or Game.GetOmnvar( "ui_alien_class_skill_blocked" ) then
				f87_local4 = "dimmed"
			else
				f87_local4 = "default"
			end
			f87_local3( f87_local2, f87_local4, 500 )
		end
	end
	
	local f83_local14 = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = 7,
		width = f83_local0,
		left = 10,
		height = f83_local0,
		alpha = 0.8,
		scale = 0
	} )
	f83_local14:registerAnimationState( "dimmed", {
		alpha = 0.2,
		scale = 0
	} )
	f83_local14:registerAnimationState( "active", {
		alpha = 1,
		scale = 0.2
	} )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill", f83_local13 )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_timer", f83_local13 )
	f83_local14:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local13 )
	f83_local12( f83_local14, get_fourth_class() )
	f83_local13( f83_local14 )
	f83_local14.id = "icon"
	self:addElement( f83_local14 )
	local f83_local15 = function ( f89_arg0 )
		local f89_local0 = 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer" )%1000) > 0
		local f89_local1 = f89_arg0
		local f89_local2 = f89_arg0.animateToState
		local f89_local3
		if f89_local0 then
			f89_local3 = "visible"
			if not f89_local3 then
			
			else
				f89_local2( f89_local1, f89_local3 )
			end
		end
		f89_local3 = "default"
	end
	
	local f83_local16 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = 4,
		height = f83_local6,
		left = 41,
		width = 2,
		alpha = 0
	} )
	f83_local16:registerAnimationState( "visible", {
		alpha = 0.6
	} )
	f83_local16:registerOmnvarHandler( "ui_alien_class_skill_timer", f83_local15 )
	f83_local15( f83_local16 )
	f83_local16.id = "cooldown"
	self:addElement( f83_local16 )
	local f83_local17 = LUI.UIImage.new( CoD.ColorizeState( Colors.black, {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} ) )
	f83_local17.id = "cooldownBG"
	f83_local16:addElement( f83_local17 )
	local f83_local18 = function ( f90_arg0, f90_arg1 )
		if not coolingfourth then
			if 0 < f90_arg1 then
				f90_arg0:animateToState( "full", f90_arg1 )
				coolingfourth = true
			else
				f90_arg0:animateToState( "default" )
			end
		end
	end
	
	local f83_local19 = function ( f91_arg0, f91_arg1 )
		if f91_arg1.value then
			f91_arg0:cancelAnimateToState()
		else
			coolingfourth = false
		end
	end
	
	local f83_local20 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f83_local20:registerAnimationState( "full", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f83_local20:registerOmnvarHandler( "ui_alien_class_skill_timer", function ( f92_arg0, f92_arg1 )
		local valuefixed = 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer" )%1000)
		f83_local18( f92_arg0, valuefixed )
		if valuefixed < 1 then
			coolingfourth = false
			f83_local20:animateToState( "default" )
			f83_local16:animateToState( "default" )
			f83_local14:animateToState( "default" )
		end
	end )
	f83_local20:registerOmnvarHandler( "ui_alien_class_skill_blocked", f83_local19 )
	f83_local18( f83_local20, 1000*(Game.GetOmnvar( "ui_alien_class_skill_timer" )%1000))
	f83_local20.id = "cooldownFG"
	f83_local16:addElement( f83_local20 )
	local f83_local21 = function ( f93_arg0, f93_arg1 )
		f93_arg0:animateToState( f83_local8( f93_arg1 ) and "visible" or "default", 150 )
	end
	
	self:registerOmnvarHandler( "ui_alien_class_skill", function ( f94_arg0, f94_arg1 )
		f83_local21( f94_arg0, get_fourth_class() )
	end )
	f83_local21( self, get_fourth_class() )
	return self
end

function quick_shop_item( f95_arg0, f95_arg1, f95_arg2 )
	local f95_local0 = 40
	local f95_local1 = 8
	local f95_local2 = -3
	local f95_local3 = 100
	local f95_local4 = 20
	local f95_local5 = CoD.TextSettings.HudEuroMedTinyFont
	local f95_local6 = f95_arg2()
	local self = LUI.UIElement.new()
	self.id = f95_local6 .. "_" .. f95_arg0
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
	local f95_local8 = LUI.UIImage.new()
	f95_local8.id = "icon"
	local f95_local9 = f95_arg0 == LUI.Alignment.Top
	local f95_local10 = f95_arg0 == LUI.Alignment.Bottom
	local f95_local11 = f95_arg0 == LUI.Alignment.Left
	local f95_local12 = f95_arg0 == LUI.Alignment.Right
	local f95_local13 = -f95_local0 / 2
	if f95_local9 then
		f95_local13 = -f95_local0 + f95_local1
		if f95_arg1 then
			f95_local13 = f95_local13 - f95_local5.Height
		else
			f95_local13 = f95_local13 - 4
		end
	elseif f95_local10 then
		f95_local13 = 0 - f95_local1
	end
	local f95_local14 = -f95_local0 / 2
	if f95_local11 then
		f95_local14 = -f95_local0 + f95_local1
	elseif f95_local12 then
		f95_local14 = 0 - f95_local1
	end
	f95_local8:registerAnimationState( "default", {
		topAnchor = f95_local9,
		bottomAnchor = f95_local10,
		leftAnchor = f95_local11,
		rightAnchor = f95_local12,
		top = f95_local13,
		bottom = f95_local13 + f95_local0,
		left = f95_local14,
		right = f95_local14 + f95_local0,
		alpha = 0.2
	} )
	f95_local8:registerAnimationState( "enabled", {
		alpha = 0.8
	} )
	f95_local8:animateToState( "default" )
	self:addElement( f95_local8 )
	local f95_local15 = LUI.Alignment.Center
	local f95_local16 = 0
	if f95_local11 then
		f95_local16 = f95_local1 + -f95_local0 / 2
	elseif f95_local12 then
		f95_local16 = -f95_local1 + f95_local0 / 2
	end
	local f95_local17 = nil
	if f95_arg1 then
		f95_local17 = LUI.UIText.new()
		f95_local17.id = "priceTag"
		f95_local17:setText( tostring( f95_arg1() ) )
		f95_local17:setTextStyle( CoD.TextStyle.Outlined )
		f95_local17:registerAnimationState( "default", {
			font = f95_local5.Font,
			alignment = f95_local15,
			topAnchor = f95_local9,
			bottomAnchor = f95_local10,
			leftAnchor = f95_local11,
			rightAnchor = f95_local12,
			top = f95_local13 + f95_local0 + f95_local2,
			bottom = f95_local13 + f95_local0 + f95_local2 + f95_local5.Height,
			left = f95_local16 - 40,
			right = f95_local16 + 40,
			red = Colors.cac_ability_text.r,
			green = Colors.cac_ability_text.g,
			blue = Colors.cac_ability_text.b,
			alpha = 0.4
		} )
		f95_local17:registerAnimationState( "enabled", {
			red = Colors.cac_ability_text.r,
			green = Colors.cac_ability_text.g,
			blue = Colors.cac_ability_text.b,
			alpha = 0.7
		} )
		f95_local17:animateToState( "default" )
		self:addElement( f95_local17 )
	end
	local f95_local18
	if f95_local9 then
		f95_local18 = 6
		if not f95_local18 then
			if f95_local10 then
				f95_local18 = -6 - f95_local4 / 2
				if not f95_local18 then
				
				else
					local f95_local19
					if f95_local11 then
						f95_local19 = 6
						if not f95_local19 then
							if f95_local12 then
								f95_local19 = -6 - f95_local4 / 2
								if not f95_local19 then
								
								else
									local f95_local20
									if f95_local11 or f95_local12 then
										f95_local20 = f95_local4 / 2
										if not f95_local20 then
										
										else
											f95_local20 = f95_local19 + f95_local20
											local f95_local21
											if f95_local9 or f95_local10 then
												f95_local21 = f95_local4 / 2
												if not f95_local21 then
												
												else
													f95_local21 = f95_local18 + f95_local21
													local f95_local22 = ""
													if f95_local11 then
														f95_local22 = "alien_dpad_arrow_left"
													elseif f95_local12 then
														f95_local22 = "alien_dpad_arrow_right"
													elseif f95_local9 then
														f95_local22 = "alien_dpad_arrow_up"
													elseif f95_local10 then
														f95_local22 = "alien_dpad_arrow_down"
													end
													local f95_local23 = LUI.UIImage.new()
													f95_local23.id = "arrow"
													f95_local23:registerAnimationState( "default", {
														material = RegisterMaterial( f95_local22 ),
														topAnchor = f95_local9,
														bottomAnchor = f95_local10,
														leftAnchor = f95_local11,
														rightAnchor = f95_local12,
														top = f95_local18,
														bottom = f95_local21,
														left = f95_local19,
														right = f95_local20,
														red = 0.5,
														green = 0.5,
														blue = 0.5,
														alpha = 0.2
													} )
													f95_local23:registerAnimationState( "enabled", CoD.ColorizeState( Colors.white, {
														alpha = 0.8
													} ) )
													f95_local23:animateToState( "default" )
													self:addElement( f95_local23 )
													local f95_local24 = function ( f96_arg0 )
														if f96_arg0.cachedCash then
															if not f95_arg1 or f95_arg1() <= f96_arg0.cachedCash then
																f95_local8:animateToState( "enabled" )
																f95_local23:animateToState( "enabled" )
																if f95_local17 then
																	f95_local17:animateToState( "enabled" )
																end
															else
																f95_local8:animateToState( "default" )
																f95_local23:animateToState( "default" )
																if f95_local17 then
																	f95_local17:animateToState( "default" )
																end
															end
														end
													end
													
													self:registerEventHandler( "cash_change", function ( element, event )
														element.cachedCash = event.newValue
														f95_local24( element )
													end )
													self:registerEventHandler( "ability_levels_change", function ( element, event )
														if f95_local17 and f95_arg1 then
															f95_local17:setText( tostring( f95_arg1() ) )
														end
														f95_local8:setImage( RegisterMaterial( f95_arg2() ) )
														f95_local24( element )
													end )
													return self
												end
											end
											f95_local21 = f95_local4
										end
									end
									f95_local20 = f95_local4
								end
							end
							f95_local19 = -f95_local4 / 2
						end
					else
						if f95_local12 then
							f95_local19 = -6 - f95_local4 / 2
							if not f95_local19 then
							
							else
								local f95_local20
								if f95_local11 or f95_local12 then
									f95_local20 = f95_local4 / 2
									if not f95_local20 then
									
									else
										f95_local20 = f95_local19 + f95_local20
										local f95_local21
										if f95_local9 or f95_local10 then
											f95_local21 = f95_local4 / 2
											if not f95_local21 then
											
											else
												f95_local21 = f95_local18 + f95_local21
												local f95_local22 = ""
												if f95_local11 then
													f95_local22 = "alien_dpad_arrow_left"
												elseif f95_local12 then
													f95_local22 = "alien_dpad_arrow_right"
												elseif f95_local9 then
													f95_local22 = "alien_dpad_arrow_up"
												elseif f95_local10 then
													f95_local22 = "alien_dpad_arrow_down"
												end
												local f95_local23 = LUI.UIImage.new()
												f95_local23.id = "arrow"
												f95_local23:registerAnimationState( "default", {
													material = RegisterMaterial( f95_local22 ),
													topAnchor = f95_local9,
													bottomAnchor = f95_local10,
													leftAnchor = f95_local11,
													rightAnchor = f95_local12,
													top = f95_local18,
													bottom = f95_local21,
													left = f95_local19,
													right = f95_local20,
													red = 0.5,
													green = 0.5,
													blue = 0.5,
													alpha = 0.2
												} )
												f95_local23:registerAnimationState( "enabled", CoD.ColorizeState( Colors.white, {
													alpha = 0.8
												} ) )
												f95_local23:animateToState( "default" )
												self:addElement( f95_local23 )
												local f95_local24 = function ( f96_arg0 )
													if f96_arg0.cachedCash then
														if not f95_arg1 or f95_arg1() <= f96_arg0.cachedCash then
															f95_local8:animateToState( "enabled" )
															f95_local23:animateToState( "enabled" )
															if f95_local17 then
																f95_local17:animateToState( "enabled" )
															end
														else
															f95_local8:animateToState( "default" )
															f95_local23:animateToState( "default" )
															if f95_local17 then
																f95_local17:animateToState( "default" )
															end
														end
													end
												end
												
												self:registerEventHandler( "cash_change", function ( element, event )
													element.cachedCash = event.newValue
													f95_local24( element )
												end )
												self:registerEventHandler( "ability_levels_change", function ( element, event )
													if f95_local17 and f95_arg1 then
														f95_local17:setText( tostring( f95_arg1() ) )
													end
													f95_local8:setImage( RegisterMaterial( f95_arg2() ) )
													f95_local24( element )
												end )
												return self
											end
										end
										f95_local21 = f95_local4
									end
								end
								f95_local20 = f95_local4
							end
						end
						f95_local19 = -f95_local4 / 2
					end
					local f95_local20
					if f95_local11 or f95_local12 then
						f95_local20 = f95_local4 / 2
						if not f95_local20 then
						
						else
							f95_local20 = f95_local19 + f95_local20
							local f95_local21
							if f95_local9 or f95_local10 then
								f95_local21 = f95_local4 / 2
								if not f95_local21 then
								
								else
									f95_local21 = f95_local18 + f95_local21
									local f95_local22 = ""
									if f95_local11 then
										f95_local22 = "alien_dpad_arrow_left"
									elseif f95_local12 then
										f95_local22 = "alien_dpad_arrow_right"
									elseif f95_local9 then
										f95_local22 = "alien_dpad_arrow_up"
									elseif f95_local10 then
										f95_local22 = "alien_dpad_arrow_down"
									end
									local f95_local23 = LUI.UIImage.new()
									f95_local23.id = "arrow"
									f95_local23:registerAnimationState( "default", {
										material = RegisterMaterial( f95_local22 ),
										topAnchor = f95_local9,
										bottomAnchor = f95_local10,
										leftAnchor = f95_local11,
										rightAnchor = f95_local12,
										top = f95_local18,
										bottom = f95_local21,
										left = f95_local19,
										right = f95_local20,
										red = 0.5,
										green = 0.5,
										blue = 0.5,
										alpha = 0.2
									} )
									f95_local23:registerAnimationState( "enabled", CoD.ColorizeState( Colors.white, {
										alpha = 0.8
									} ) )
									f95_local23:animateToState( "default" )
									self:addElement( f95_local23 )
									local f95_local24 = function ( f96_arg0 )
										if f96_arg0.cachedCash then
											if not f95_arg1 or f95_arg1() <= f96_arg0.cachedCash then
												f95_local8:animateToState( "enabled" )
												f95_local23:animateToState( "enabled" )
												if f95_local17 then
													f95_local17:animateToState( "enabled" )
												end
											else
												f95_local8:animateToState( "default" )
												f95_local23:animateToState( "default" )
												if f95_local17 then
													f95_local17:animateToState( "default" )
												end
											end
										end
									end
									
									self:registerEventHandler( "cash_change", function ( element, event )
										element.cachedCash = event.newValue
										f95_local24( element )
									end )
									self:registerEventHandler( "ability_levels_change", function ( element, event )
										if f95_local17 and f95_arg1 then
											f95_local17:setText( tostring( f95_arg1() ) )
										end
										f95_local8:setImage( RegisterMaterial( f95_arg2() ) )
										f95_local24( element )
									end )
									return self
								end
							end
							f95_local21 = f95_local4
						end
					end
					f95_local20 = f95_local4
				end
			end
			f95_local18 = -f95_local4 / 2
		end
	else
		if f95_local10 then
			f95_local18 = -6 - f95_local4 / 2
			if not f95_local18 then
			
			else
				local f95_local19
				if f95_local11 then
					f95_local19 = 6
					if not f95_local19 then
						if f95_local12 then
							f95_local19 = -6 - f95_local4 / 2
							if not f95_local19 then
							
							else
								local f95_local20
								if f95_local11 or f95_local12 then
									f95_local20 = f95_local4 / 2
									if not f95_local20 then
									
									else
										f95_local20 = f95_local19 + f95_local20
										local f95_local21
										if f95_local9 or f95_local10 then
											f95_local21 = f95_local4 / 2
											if not f95_local21 then
											
											else
												f95_local21 = f95_local18 + f95_local21
												local f95_local22 = ""
												if f95_local11 then
													f95_local22 = "alien_dpad_arrow_left"
												elseif f95_local12 then
													f95_local22 = "alien_dpad_arrow_right"
												elseif f95_local9 then
													f95_local22 = "alien_dpad_arrow_up"
												elseif f95_local10 then
													f95_local22 = "alien_dpad_arrow_down"
												end
												local f95_local23 = LUI.UIImage.new()
												f95_local23.id = "arrow"
												f95_local23:registerAnimationState( "default", {
													material = RegisterMaterial( f95_local22 ),
													topAnchor = f95_local9,
													bottomAnchor = f95_local10,
													leftAnchor = f95_local11,
													rightAnchor = f95_local12,
													top = f95_local18,
													bottom = f95_local21,
													left = f95_local19,
													right = f95_local20,
													red = 0.5,
													green = 0.5,
													blue = 0.5,
													alpha = 0.2
												} )
												f95_local23:registerAnimationState( "enabled", CoD.ColorizeState( Colors.white, {
													alpha = 0.8
												} ) )
												f95_local23:animateToState( "default" )
												self:addElement( f95_local23 )
												local f95_local24 = function ( f96_arg0 )
													if f96_arg0.cachedCash then
														if not f95_arg1 or f95_arg1() <= f96_arg0.cachedCash then
															f95_local8:animateToState( "enabled" )
															f95_local23:animateToState( "enabled" )
															if f95_local17 then
																f95_local17:animateToState( "enabled" )
															end
														else
															f95_local8:animateToState( "default" )
															f95_local23:animateToState( "default" )
															if f95_local17 then
																f95_local17:animateToState( "default" )
															end
														end
													end
												end
												
												self:registerEventHandler( "cash_change", function ( element, event )
													element.cachedCash = event.newValue
													f95_local24( element )
												end )
												self:registerEventHandler( "ability_levels_change", function ( element, event )
													if f95_local17 and f95_arg1 then
														f95_local17:setText( tostring( f95_arg1() ) )
													end
													f95_local8:setImage( RegisterMaterial( f95_arg2() ) )
													f95_local24( element )
												end )
												return self
											end
										end
										f95_local21 = f95_local4
									end
								end
								f95_local20 = f95_local4
							end
						end
						f95_local19 = -f95_local4 / 2
					end
				else
					if f95_local12 then
						f95_local19 = -6 - f95_local4 / 2
						if not f95_local19 then
						
						else
							local f95_local20
							if f95_local11 or f95_local12 then
								f95_local20 = f95_local4 / 2
								if not f95_local20 then
								
								else
									f95_local20 = f95_local19 + f95_local20
									local f95_local21
									if f95_local9 or f95_local10 then
										f95_local21 = f95_local4 / 2
										if not f95_local21 then
										
										else
											f95_local21 = f95_local18 + f95_local21
											local f95_local22 = ""
											if f95_local11 then
												f95_local22 = "alien_dpad_arrow_left"
											elseif f95_local12 then
												f95_local22 = "alien_dpad_arrow_right"
											elseif f95_local9 then
												f95_local22 = "alien_dpad_arrow_up"
											elseif f95_local10 then
												f95_local22 = "alien_dpad_arrow_down"
											end
											local f95_local23 = LUI.UIImage.new()
											f95_local23.id = "arrow"
											f95_local23:registerAnimationState( "default", {
												material = RegisterMaterial( f95_local22 ),
												topAnchor = f95_local9,
												bottomAnchor = f95_local10,
												leftAnchor = f95_local11,
												rightAnchor = f95_local12,
												top = f95_local18,
												bottom = f95_local21,
												left = f95_local19,
												right = f95_local20,
												red = 0.5,
												green = 0.5,
												blue = 0.5,
												alpha = 0.2
											} )
											f95_local23:registerAnimationState( "enabled", CoD.ColorizeState( Colors.white, {
												alpha = 0.8
											} ) )
											f95_local23:animateToState( "default" )
											self:addElement( f95_local23 )
											local f95_local24 = function ( f96_arg0 )
												if f96_arg0.cachedCash then
													if not f95_arg1 or f95_arg1() <= f96_arg0.cachedCash then
														f95_local8:animateToState( "enabled" )
														f95_local23:animateToState( "enabled" )
														if f95_local17 then
															f95_local17:animateToState( "enabled" )
														end
													else
														f95_local8:animateToState( "default" )
														f95_local23:animateToState( "default" )
														if f95_local17 then
															f95_local17:animateToState( "default" )
														end
													end
												end
											end
											
											self:registerEventHandler( "cash_change", function ( element, event )
												element.cachedCash = event.newValue
												f95_local24( element )
											end )
											self:registerEventHandler( "ability_levels_change", function ( element, event )
												if f95_local17 and f95_arg1 then
													f95_local17:setText( tostring( f95_arg1() ) )
												end
												f95_local8:setImage( RegisterMaterial( f95_arg2() ) )
												f95_local24( element )
											end )
											return self
										end
									end
									f95_local21 = f95_local4
								end
							end
							f95_local20 = f95_local4
						end
					end
					f95_local19 = -f95_local4 / 2
				end
				-- ERROR: Infinite loop detected
			end
		end
		f95_local18 = -f95_local4 / 2
	end
	local f95_local19
	if f95_local11 then
		f95_local19 = 6
		if not f95_local19 then
			if f95_local12 then
				f95_local19 = -6 - f95_local4 / 2
				if not f95_local19 then
				
				else
					-- ERROR: Infinite loop detected
				end
			end
			f95_local19 = -f95_local4 / 2
		end
	else
		-- ERROR: Infinite loop detected
	end
	-- ERROR: Infinite loop detected
end

function quick_shop()
	local f99_local0 = Engine.GetLuiRoot()
	local f99_local1 = f99_local0.m_controllerIndex
	local f99_localtop = -54
	local f99_localbottom = 14
	local f99_localleft = -54
	local f99_localright = 44
	local f99_local1vert = 18
	local f99_local1hori = -5
	local f99_local2vert = 126
	local f99_local2hori = -95
	if check_for_abilities(Engine.GetPlayerDataReservedInt( f99_local1, CoD.StatsGroup.Coop, "secondary_class" )%5) then
		f99_localtop = -85
		f99_localbottom = -21
		f99_local1vert = -15
		f99_local2vert = 82
	end
	if check_for_abilities(get_fourth_class()) and get_custom_upgrade(f99_local1, 4) == 2 then
		f99_localleft = -95
		f99_localright = 3
		f99_local1hori = -46
		f99_local2hori = -136
	end
	local f99_local2 = function ( f100_arg0 )
		return function ()
			local f101_local0 = LUI.mp_menus.Aliens
			return f101_local0.GetFieldForAbility( f101_local0.GetAlienSessionAbility( -1, f100_arg0 ), f101_local0.AlienAbilities.Cols.DpadIcon )
		end
		
	end
	
	local f99_local3 = function ( f102_arg0 )
		return function ()
			local f103_local0 = LUI.mp_menus.Aliens
			if ( f103_local0.GetFieldForAbility( f103_local0.GetAlienSessionAbility( -1, f102_arg0 ), f103_local0.AlienAbilities.Cols.Name ) ) == "ALIENS_GLSENTRY" then
				return 2000
			else
				return tonumber( f103_local0.GetFieldForAbility( f103_local0.GetAlienSessionAbility( -1, f102_arg0 ), f103_local0.AlienAbilities.Cols.CurrencyCost ) )
			end
		end
		
	end
	
	local self = LUI.UIElement.new()
	self.id = "dpad"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = f99_localtop,
		bottom = f99_localbottom,
		left = f99_localleft,
		right = f99_localright
	} )
	self:animateToState( "default" )
	local f99_local5 = 180
	local f99_local6 = 180
	local f99_local7 = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_dpad_darken" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		height = f99_local6,
		bottom = f99_local6 / 2,
		width = f99_local5,
		right = f99_local5 / 2,
		alpha = 0.4
	} )
	f99_local7.id = "circle"
	self:addElement( f99_local7 )
	local f99_local8 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -13,
		bottom = 13,
		left = -32,
		right = 32
	} )
	f99_local8.id = "frame"
	local f99_local9 = LUI.UIImage.new( {
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
		alpha = 0.1
	} )
	f99_local9.id = "frameImage"
	local f99_local10 = LUI.MenuBuilder.BuildRegisteredType( "generic_border", {
		border_red = 0,
		border_green = 0,
		border_blue = 0,
		border_alpha = 0.2
	} )
	f99_local8:addElement( f99_local9 )
	f99_local8:addElement( f99_local10 )
	self:addElement( f99_local8 )
	local f99_local11 = LUI.mp_hud.AlienHud.quick_shop_item( LUI.Alignment.Right, f99_local3( "offense" ), f99_local2( "offense" ) )
	local f99_local12 = LUI.mp_hud.AlienHud.quick_shop_item( LUI.Alignment.Left, f99_local3( "defense" ), f99_local2( "defense" ) )
	if LUI.mp_menus.Aliens.IsChaosMode() then
		self:addElement( LUI.MenuBuilder.BuildRegisteredType( "quick_shop_freeze_item" ) )
	elseif not Engine.AliensCheckIsRelicEnabled( f99_local1, "nerf_no_deployables" ) then
		local f99_local13 = LUI.mp_hud.AlienHud.quick_shop_item( LUI.Alignment.Top, f99_local3( "munition" ), f99_local2( "munition" ) )
		local f99_local14 = LUI.mp_hud.AlienHud.quick_shop_item( LUI.Alignment.Bottom, f99_local3( "support" ), f99_local2( "support" ) )
		f99_local13:registerAnimationState( "default", {
			top = -38
		} )
		f99_local13:animateToState( "default" )
		f99_local14:registerAnimationState( "default", {
			bottom = 38
		} )
		f99_local14:animateToState( "default" )
		self:addElement( f99_local13 )
		self:addElement( f99_local14 )
		if get_custom_upgrade(f99_local1, 9) == 2 then
			local secondId = (GetIdOfSupport(get_extra_loadout(f99_local1, 0)) .. "_" .. LUI.mp_menus.Aliens.GetAlienAbilityLevel( -1, "support" ))
			local secondCost = LUI.mp_menus.Aliens.GetFieldForAbility( secondId, LUI.mp_menus.Aliens.AlienAbilities.Cols.CurrencyCost )
			local getidfunc = function ( f100_arg0 )
				return function ()
					return LUI.mp_menus.Aliens.GetFieldForAbility( GetIdOfSupport(get_extra_loadout(f99_local1, 0)) .. "_" .. LUI.mp_menus.Aliens.GetAlienAbilityLevel( -1, "support" ), LUI.mp_menus.Aliens.AlienAbilities.Cols.DpadIcon )
				end
			end
			local getcostfunc = function ( f102_arg0 )
				return function ()
					return tonumber( secondCost )
				end
			end
			local f99_local19 = LUI.mp_hud.AlienHud.quick_shop_item( LUI.Alignment.Right, getcostfunc( "support" ), getidfunc( "support" ) )
			f99_local19:registerAnimationState( "default", {
				right = 49,
				bottom = 100
			} )
			f99_local19:animateToState( "default" )
			self:addElement( f99_local19 )
		end
	end
	if LUI.mp_menus.Aliens.IsChaosMode() or not Engine.AliensCheckIsRelicEnabled( f99_local1, "nerf_no_abilities" ) then
		self:addElement( f99_local11 )
		self:addElement( f99_local12 )
	end
	local f99_local13 = LUI.UIText.new()
	f99_local13.id = "value"
	f99_local13:setupUIBindText( "AlienCash", Engine.Localize( "@ALIENS_DOLLARS" ) )
	f99_local13:registerAnimationState( "default", {
		font = CoD.TextSettings.HudIW6SmallFont.Font,
		alignment = LUI.Alignment.Center,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = -CoD.TextSettings.HudIW6SmallFont.Height / 2,
		bottom = CoD.TextSettings.HudIW6SmallFont.Height / 2,
		red = Colors.frontend_hilite.r,
		green = Colors.frontend_hilite.g,
		blue = Colors.frontend_hilite.b
	} )
	f99_local13:registerAnimationState( "pulse_orange", {
		font = CoD.TextSettings.HudIW6SmallFont.Font,
		alignment = LUI.Alignment.Center,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = -1.5 * CoD.TextSettings.HudIW6SmallFont.Height / 2,
		bottom = 1.5 * CoD.TextSettings.HudIW6SmallFont.Height / 2,
		red = Colors.orange.r,
		green = Colors.orange.g,
		blue = Colors.orange.b
	} )
	f99_local13:registerAnimationState( "pulse_cyan", {
		font = CoD.TextSettings.HudIW6SmallFont.Font,
		alignment = LUI.Alignment.Center,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = -1.5 * CoD.TextSettings.HudIW6SmallFont.Height / 2,
		bottom = 1.5 * CoD.TextSettings.HudIW6SmallFont.Height / 2,
		red = Colors.cyan.r,
		green = Colors.cyan.g,
		blue = Colors.cyan.b
	} )
	f99_local13:registerEventHandler( "cash_change", function ( element, event )
		local f104_local0 = 1
		local f104_local1 = "pulse_orange"
		local f104_local2 = Colors.orange
		local f104_local3 = ""
		if event.oldValue < event.newValue then
			f104_local0 = -1
			f104_local1 = "pulse_cyan"
			f104_local2 = Colors.cyan
			f104_local3 = "+"
		end
		local self = MBh.AnimateSequence( {
			{
				f104_local1,
				150
			},
			{
				"default",
				150
			}
		} )
		self( element, {} )
		self = LUI.UIText.new()
		self:setTextStyle( CoD.TextStyle.Shadowed )
		self:setText( f104_local3 .. event.newValue - event.oldValue )
		self:registerAnimationState( "default", {
			font = CoD.TextSettings.HudIW6SmallFont.Font,
			alignment = LUI.Alignment.Center,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = false,
			left = 0,
			right = 0,
			top = -CoD.TextSettings.HudIW6SmallFont.Height / 2,
			bottom = CoD.TextSettings.HudIW6SmallFont.Height / 2,
			red = f104_local2.r,
			green = f104_local2.g,
			blue = f104_local2.b,
			alpha = 0.8
		} )
		local f104_local5 = math.random( -40, 40 )
		self:registerAnimationState( "drift", {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = false,
			left = f104_local5,
			right = f104_local5,
			top = f104_local0 * 50 - CoD.TextSettings.HudIW6SmallFont.Height / 2,
			bottom = f104_local0 * 50 + CoD.TextSettings.HudIW6SmallFont.Height / 2
		} )
		self:animateToState( "default" )
		self:animateToState( "drift", 500 )
		self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "drift" ), function ( element, event )
			element:close()
		end )
		element:addElement( self )
	end )
	f99_local13:animateToState( "default" )
	self:addElement( f99_local13 )
	local f99_local14 = quick_shop_class_skill( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = f99_local1vert,
		bottom = f99_local1vert,
		left = f99_local1hori,
		right = f99_local1hori
	} )
	local f99_local15 = quick_shop_class_skill_secondary( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = f99_local2vert,
		bottom = f99_local2vert,
		left = f99_local2hori,
		right = f99_local2hori
	} )
	local f99_local15third = quick_shop_class_skill_third( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 165,
		bottom = 165,
		left = f99_local1hori,
		right = f99_local1hori
	} )
	local f99_local15fourth = quick_shop_class_skill_fourth( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 82,
		bottom = 82,
		left = 44,
		right = 44
	} )
	local f99_local16 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f99_local16.id = "quick_shop_root"
	local f99_local17 = function ( f106_arg0, f106_arg1 )
		if f106_arg1.value then
			f106_arg0:animateToState( "lowAlpha", 0 )
		else
			f106_arg0:animateToState( "default", 0 )
		end
	end
	
	local f99_local18 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		top = -130 + (Engine.UsingSplitscreenUpscaling() and 6 or 0) - 128,
		height = 256,
		left = -203,
		right = 53,
		alpha = 1
	} )
	f99_local18:registerAnimationState( "lowAlpha", {
		alpha = 0.3
	} )
	f99_local18.id = "quick_shop"
	f99_local18:registerOmnvarHandler( "ui_alien_quick_shop_disabled", f99_local17 )
	f99_local17( f99_local18, {
		value = Game.GetOmnvar( "ui_alien_quick_shop_disabled" )
	} )
	f99_local16:addElement( f99_local18 )
	f99_local18:addElement( self )
	if check_for_abilities( 1 + GetFieldForPerk2( Engine.GetPlayerDataEx( f99_local1, CoD.StatsGroup.Coop, "alienPlayerLoadout", "perks", 0 ) )/5 ) then
		f99_local18:addElement( f99_local14 )
	end
	if Engine.AliensCheckIsUpgradeEnabled( Engine.GetFirstActiveController(), "multi_class" ) and check_for_abilities(math.floor(Engine.GetPlayerDataReservedInt( f99_local1, CoD.StatsGroup.Coop, "secondary_class" )/5)+1) then
		f99_local18:addElement( f99_local15 )
	end
	if check_for_abilities(Engine.GetPlayerDataReservedInt( f99_local1, CoD.StatsGroup.Coop, "secondary_class" )%5) then
		f99_local18:addElement( f99_local15third )
	end
	if check_for_abilities(get_fourth_class()) and get_custom_upgrade(f99_local1, 4) == 2 then
		f99_local18:addElement( f99_local15fourth )
	end
	return f99_local16
end

function check_for_abilities( f119_arg0 )
	local abilities = {}
	if Engine.AliensCheckIsUpgradeEnabled( 0, "weapon_specialist_upgrade" ) then
		abilities[1] = true
	end
	if Engine.AliensCheckIsUpgradeEnabled( 0, "tank_upgrade" ) then
		abilities[2] = true
	end
	if Engine.AliensCheckIsUpgradeEnabled( 0, "engineer_upgrade" ) then
		abilities[3] = true
	end
	if Engine.AliensCheckIsUpgradeEnabled( 0, "medic_upgrade" ) then
		abilities[4] = true
	end
	return abilities[f119_arg0]
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

function get_extra_loadout(controller, index)
	n = Engine.GetPlayerDataReservedInt( controller, CoD.StatsGroup.Coop, "eggstra_award_flags" )
	return (math.floor(n / (5 ^ index))) % 5
end

function cash_notification( f107_arg0, f107_arg1 )
	assert( f107_arg1 )
	local f107_local0 = 600
	local f107_local1 = 8
	local f107_local2 = 0.75
	local f107_local3 = 80
	local f107_local4 = -140
	local f107_local5 = 50
	local f107_local6 = CoD.TextSettings.HudIW6BigFont
	local self = LUI.UIText.new( CoD.ColorizeState( Colors.frontend_hilite, {
		alignment = LUI.Alignment.Center,
		font = f107_local6.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = f107_local4 - f107_local3 / 2,
		top = f107_local5,
		width = f107_local3,
		height = f107_local6.Height
	} ) )
	self.id = "cash_get_" .. f107_arg0
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:setText( Engine.Localize( "ALIEN_SPLASHES_MONEY", f107_arg1 ) )
	local f107_local8 = nil
	local f107_local9 = f107_local0 / f107_local1 / 1000
	local f107_local10 = 0
	local f107_local11 = 0
	local f107_local12 = -250 - 150 * math.random()
	local f107_local13 = -100 + 200 * math.random()
	local f107_local14 = 800
	local f107_local15 = {}
	local f107_local16 = nil
	local f107_local17 = f107_local2 * f107_local1
	for f107_local18 = 1, f107_local1, 1 do
		f107_local12 = f107_local12 + f107_local14 * f107_local9
		f107_local10 = f107_local10 + f107_local13 * f107_local9
		f107_local11 = f107_local11 + f107_local12 * f107_local9
		f107_local16 = 1
		if f107_local17 <= f107_local18 then
			f107_local16 = 1 - (f107_local18 - f107_local17) / (f107_local1 - f107_local2 * f107_local1)
		end
		f107_local8 = "anim_" .. f107_local18
		self:registerAnimationState( f107_local8, {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			left = f107_local4 - f107_local10 - f107_local3 / 2,
			top = f107_local5 + f107_local11,
			width = f107_local3,
			height = f107_local6.Height,
			alpha = f107_local16
		} )
		table.insert( f107_local15, {
			f107_local8,
			f107_local9 * 1000
		} )
	end
	local f107_local18 = MBh.AnimateSequence( f107_local15 )
	f107_local18( self, {} )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( f107_local8 ), function ( element, event )
		element:close()
	end )
	return self
end

function cash_widget()
	local f109_local0 = 0
	local f109_local1 = 8
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "cash_notifications"
	local f109_local3 = function ( f110_arg0, f110_arg1 )
		if f109_local1 <= f110_arg0:getNumChildren() then
			return 
		else
			f109_local0 = f109_local0 + 1
			f110_arg0:addElement( cash_notification( f109_local0, f110_arg1 ) )
		end
	end
	
	self:registerEventHandler( "cash_change", function ( element, event )
		local f111_local0 = event.newValue - event.oldValue
		if f111_local0 <= 0 then
			return 
		else
			f109_local3( element, f111_local0 )
		end
	end )
	self:registerOmnvarHandler( "ui_alien_cash_overflow", function ( f112_arg0, f112_arg1 )
		f109_local3( f112_arg0, 0 )
	end )
	return self
end

function DrillStateUpdateHandler( f113_arg0, f113_arg1 )
	if f113_arg1.value == 0 then
		f113_arg0:animateToState( "default", 200 )
		f113_arg0.progression.started = false
		f113_arg0.progression:animateToState( "default" )
	else
		f113_arg0:animateToState( "visible", 200 )
	end
	if f113_arg1.value ~= 1 and f113_arg0.progression.started then
		f113_arg0.countdown:freeze()
		f113_arg0.progression:cancelAnimateToState()
	end
end

function DrillTimerUpdateHandler( f114_arg0, f114_arg1 )
	f114_arg0.countdown:setEndTime( f114_arg1.value )
	if f114_arg1.value > 0 then
		f114_arg0.progression.started = true
		f114_arg0.progression.endTime = f114_arg1.value
		f114_arg0.countdown:unfreeze()
		local f114_local0 = (Game.GetTime() - Game.GetOmnvar( "ui_alien_drill_start_milliseconds" )) / (f114_arg1.value - Game.GetOmnvar( "ui_alien_drill_start_milliseconds" ))
		if f114_arg0.isGenerator then
			f114_arg0.progression:registerAnimationState( "current", {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = false,
				rightAnchor = false,
				top = 172 - 166 * f114_local0,
				left = -4,
				width = 6,
				bottom = -12
			} )
		else
			f114_arg0.progression:registerAnimationState( "current", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				top = 6,
				left = -4,
				width = 6,
				height = 166 * f114_local0
			} )
		end
		f114_arg0.progression:animateToState( "current", 0 )
		f114_arg0.progression:animateToState( "full", math.max( 0, f114_arg1.value - Game.GetTime() ), false, false )
	else
		f114_arg0.progression.endTime = nil
	end
end

function DrillHealthTextUpdateHandler( f115_arg0, f115_arg1 )
	f115_arg0.health:setText( Engine.Localize( f115_arg0.isGenerator and "@ALIENS_GENERATOR_HEALTH" or "@ALIENS_DRILL_HEALTH", f115_arg1.value ) )
end

function DrillHealthUpdateHandler( f116_arg0, f116_arg1 )
	if f116_arg0.progression.endTime and f116_arg0.progression.started then
		f116_arg0.progression:cancelAnimateToState()
	end
	local f116_local0 = CoD.GradientMap( {
		{
			threshold = 0,
			color = {
				r = 0.9,
				g = 0.6,
				b = 0
			}
		},
		{
			threshold = 0.33,
			color = {
				r = 0.9,
				g = 0.78,
				b = 0.1
			}
		},
		{
			threshold = 0.67,
			color = {
				r = 0.35,
				g = 0.7,
				b = 0.9
			}
		},
		{
			threshold = 1,
			color = {
				r = 0.35,
				g = 0.7,
				b = 0.9
			}
		}
	}, LUI.clamp( f116_arg1.value, 0, 150 ) / 150 )
	f116_arg0.health:registerAnimationState( "current", CoD.ColorizeState( f116_local0 ) )
	f116_arg0.health:animateToState( "current" )
	f116_arg0.icon:registerAnimationState( "current", CoD.ColorizeState( f116_local0 ) )
	f116_arg0.icon:animateToState( "current" )
	f116_arg0.progression:registerAnimationState( "current", CoD.ColorizeState( f116_local0, {
		alpha = 0.75
	} ) )
	f116_arg0.progression:animateToState( "current" )
	if f116_arg0.progression.endTime and f116_arg0.progression.started then
		f116_arg0.progression:animateToState( "full", math.max( 0, f116_arg0.progression.endTime - Game.GetTime() ), false, false )
	end
end

function DrillMarkersUpdateHandler( f117_arg0, f117_arg1 )
	f117_arg0.gradations:closeChildren()
	f117_arg0.gradations.ticks = {}
	local f117_local0 = string.format( "([^%s]+)", " " )
	local f117_local1 = Engine.TableLookup( "mp/alien/default_cycle_spawn.csv", 0, f117_arg1.value, 2 )
	local f117_local2 = {}
	f117_local1:gsub( f117_local0, function ( f118_arg0 )
		f117_local2[#f117_local2 + 1] = f118_arg0
	end )
	if #f117_local2 == 0 then
		return 
	end
	local f117_local3 = tonumber( table.remove( f117_local2, #f117_local2 ) )
	for f117_local7, f117_local8 in ipairs( f117_local2 ) do
		local f117_local9 = tonumber( f117_local8 )
		local self = LUI.UIImage.new()
		self.id = "marker_" .. f117_local9
		self:registerAnimationState( "default", {
			material = RegisterMaterial( "alien_meter_mark" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 160 * f117_local9 / f117_local3 - 4,
			left = 0,
			width = 14,
			height = 8
		} )
		self:animateToState( "default" )
		f117_arg0.gradations:addElement( self )
		local f117_local11 = LUI.UIImage.new()
		f117_local11.id = "markerHL"
		f117_local11:registerAnimationState( "default", {
			material = RegisterMaterial( "white" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 3,
			left = 2,
			width = 5,
			height = 1,
			red = 0.9,
			green = 0.6,
			blue = 0
		} )
		f117_local11:animateToState( "default" )
		self:addElement( f117_local11 )
		local f117_local12 = LUI.UIImage.new()
		f117_local12.id = "markerTick"
		f117_local12:registerAnimationState( "default", {
			material = RegisterMaterial( "alien_meter_fill_tic" ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			top = -28,
			left = -2,
			width = 0,
			height = 0,
			alpha = 0
		} )
		f117_local12:registerAnimationState( "ticked", {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			top = -8,
			left = -10,
			width = 16,
			height = 16,
			alpha = 1
		} )
		f117_local12:animateToState( "default" )
		f117_local12:registerEventHandler( "tick_layer", function ( element, event )
			if event.layer == f117_local7 then
				element:animateToState( "ticked", 400 )
			end
		end )
		self:addElement( f117_local12 )
	end
end

function DrillLayersUpdateHandler( f120_arg0, f120_arg1 )
	f120_arg0:processEvent( {
		name = "tick_layer",
		layer = f120_arg1.value
	} )
end

function drill_meter( f121_arg0 )
	local self = LUI.UIElement.new()
	self.id = "drill_meter"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f121_local1 = Engine.UsingSplitscreenUpscaling() and 10 or 0
	local f121_local2 = LUI.UIElement.new()
	f121_local2:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 25 + f121_local1,
		left = 15,
		width = 256,
		height = 256,
		alpha = 0
	} )
	f121_local2.isGenerator = f121_arg0
	f121_local2:registerAnimationState( "visible", {
		alpha = 1
	} )
	f121_local2:animateToState( "default" )
	local f121_local3 = LUI.UIImage.new()
	f121_local3.id = "background"
	f121_local3:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_drill_meter_bg" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	f121_local3:animateToState( "default" )
	f121_local2:addElement( f121_local3 )
	local f121_local4 = f121_local2.isGenerator and 24 or 20
	local f121_local5 = LUI.UIText.new()
	f121_local5.id = "title"
	f121_local5:setText( Engine.Localize( f121_local2.isGenerator and "@ALIENS_GENERATOR_PROGRESS" or "@ALIENS_DRILL_PROGRESS" ) )
	f121_local5:setTextStyle( CoD.TextStyle.OutlinedMore )
	f121_local5:registerAnimationState( "default", {
		font = CoD.TextSettings.BigFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = f121_local4,
		top = 0,
		right = 0,
		height = CoD.TextSettings.BigFont.Height
	} )
	f121_local5:animateToState( "default" )
	f121_local2:addElement( f121_local5 )
	local f121_local6 = LUI.UIImage.new()
	f121_local6.id = "fillBG"
	f121_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_meter_fill_bg" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 20,
		left = -5,
		width = 16,
		height = 178
	} )
	f121_local6:animateToState( "default" )
	f121_local2:addElement( f121_local6 )
	local f121_local7 = 20
	local f121_local8 = 850
	for f121_local9 = 0, 7, 1 do
		local f121_local12 = LUI.UIImage.new()
		f121_local12.id = "arrow_" .. f121_local9
		local f121_local13 = 16.67 * f121_local7 / f121_local8
		local f121_local14 = f121_local2.isGenerator and -5 or 5
		local f121_local15 = f121_local2.isGenerator and f121_local7 * (f121_local9 + 1) - f121_local13 or f121_local9 * f121_local7
		local f121_local16 = f121_local2.isGenerator and f121_local9 * f121_local7 or f121_local7 * (f121_local9 + 1) - f121_local13
		f121_local12:registerAnimationState( "default", {
			material = RegisterMaterial( "alien_drill_meter_arrow_anim" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = 3,
			width = 9,
			height = f121_local14,
			top = f121_local15
		} )
		f121_local12:registerAnimationState( "next", {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = 3,
			width = 9,
			height = f121_local14,
			top = f121_local16
		} )
		f121_local12:animateToState( "default" )
		local f121_local17 = MBh.AnimateLoop( {
			{
				"default",
				0
			},
			{
				"next",
				f121_local8
			}
		} )
		f121_local17( f121_local12, nil )
		f121_local6:addElement( f121_local12 )
	end
	f121_local2.progression = LUI.UIImage.new()
	f121_local2.progression.id = "progression"
	f121_local2.progression:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 6,
		left = -4,
		width = 6,
		height = 0,
		alpha = 0.75
	} )
	f121_local2.progression:registerAnimationState( "full", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = 6,
		left = -4,
		width = 6,
		bottom = -12
	} )
	f121_local2.progression:animateToState( "default" )
	f121_local6:addElement( f121_local2.progression )
	f121_local2.gradations = LUI.UIElement.new()
	f121_local2.gradations.id = "gradations"
	f121_local2.gradations:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = 6,
		bottom = -12,
		left = -5,
		width = 6
	} )
	f121_local2.gradations:animateToState( "default" )
	f121_local6:addElement( f121_local2.gradations )
	local f121_local9 = LUI.UIImage.new()
	f121_local9.id = "endCap"
	f121_local9:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_meter_mark_end" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = -3,
		left = -7,
		width = 32,
		height = 16
	} )
	f121_local9:animateToState( "default" )
	local f121_local10 = LUI.UIImage.new()
	f121_local10.id = "endCapHL"
	f121_local10:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_meter_mark_end_highlight" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -3.5,
		left = -5.5,
		width = 8,
		height = 8,
		red = 0.75,
		green = 0.22,
		blue = 0.16
	} )
	f121_local10:animateToState( "default" )
	f121_local9:addElement( f121_local10 )
	f121_local6:addElement( f121_local9 )
	local f121_local11 = LUI.UIElement.new()
	f121_local11.id = "countdownContainer"
	f121_local11:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 20,
		left = 0,
		width = 160,
		height = 30
	} )
	f121_local11:animateToState( "default" )
	local f121_local18 = LUI.UIImage.new()
	f121_local18.id = "countdownBG"
	f121_local18:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.25
	} )
	f121_local18:animateToState( "default" )
	f121_local2.countdown = LUI.UICountdown.new( {} )
	f121_local2.countdown.id = "countdown"
	f121_local2.countdown:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.ExtraBigFont.Font,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -CoD.TextSettings.ExtraBigFont.Height / 2,
		height = CoD.TextSettings.ExtraBigFont.Height,
		left = 0,
		right = 0,
		alpha = 0
	} )
	f121_local2.countdown:animateToState( "default" )
	local f121_local12 = f121_local2.isGenerator and 24 or 20
	f121_local2.health = LUI.UIText.new( {} )
	f121_local2.health.id = "health"
	f121_local2.health:setTextStyle( CoD.TextStyle.OutlinedMore )
	f121_local2.health:registerAnimationState( "default", {
		alignment = LUI.Alignment.Left,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -5,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		left = f121_local12,
		right = 120
	} )
	f121_local2.health:animateToState( "default" )
	f121_local11:addElement( f121_local2.health )
	f121_local2:addElement( f121_local11 )
	local f121_local13 = f121_local2.isGenerator and "alien_icon_conduit" or "alien_drill_icon"
	local f121_local14 = f121_local2.isGenerator and 44 or 32
	f121_local2.icon = LUI.UIImage.new()
	f121_local2.icon.id = "drill_icon"
	f121_local2.icon:registerAnimationState( "default", {
		material = RegisterMaterial( f121_local13 ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -17,
		left = -20,
		width = f121_local14,
		height = 64
	} )
	f121_local2.icon:animateToState( "default" )
	f121_local2:addElement( f121_local2.icon )
	f121_local2:registerOmnvarHandler( "ui_alien_drill_state", DrillStateUpdateHandler )
	f121_local2:registerOmnvarHandler( "ui_alien_drill_end_milliseconds", DrillTimerUpdateHandler )
	f121_local2:registerOmnvarHandler( "ui_alien_drill_layers_table_line", DrillMarkersUpdateHandler )
	f121_local2:registerOmnvarHandler( "ui_alien_drill_layer_completed", DrillLayersUpdateHandler )
	f121_local2:registerOmnvarHandler( "ui_alien_drill_health_text", function ( f122_arg0, f122_arg1 )
		DrillHealthUpdateHandler( f122_arg0, f122_arg1 )
		DrillHealthTextUpdateHandler( f122_arg0, f122_arg1 )
	end )
	if 0 < Game.GetOmnvar( "ui_alien_drill_state" ) then
		DrillStateUpdateHandler( f121_local2, {
			value = Game.GetOmnvar( "ui_alien_drill_state" )
		} )
		DrillMarkersUpdateHandler( f121_local2, {
			value = Game.GetOmnvar( "ui_alien_drill_layers_table_line" )
		} )
		DrillLayersUpdateHandler( f121_local2, {
			value = Game.GetOmnvar( "ui_alien_drill_layer_completed" )
		} )
		DrillHealthUpdateHandler( f121_local2, {
			value = Game.GetOmnvar( "ui_alien_drill_health_text" )
		} )
		DrillHealthTextUpdateHandler( f121_local2, {
			value = Game.GetOmnvar( "ui_alien_drill_health_text" )
		} )
		DrillTimerUpdateHandler( f121_local2, {
			value = Game.GetOmnvar( "ui_alien_drill_end_milliseconds" )
		} )
	end
	self:addElement( f121_local2 )
	return self
end

function attack_chopper()
	local f123_local0 = {
		AWAY = 0,
		EVADING = 1,
		ATTACKING = 2,
		INCOMING = 3
	}
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self.id = "attack_chopper"
	local f123_local2 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 14,
		left = 50,
		width = 64,
		height = 90,
		alpha = 0
	} )
	f123_local2:registerAnimationState( "visible", {
		alpha = 1
	} )
	f123_local2.id = "attack_chopper_elt"
	self:addElement( f123_local2 )
	local f123_local3 = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_icon_chopper" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		width = 64,
		height = 64,
		zRot = -25,
		alpha = 0.8
	} )
	f123_local3.id = "icon"
	f123_local2:addElement( f123_local3 )
	local f123_local4 = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 50,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		left = 0,
		right = 0
	} )
	f123_local4.id = "status"
	f123_local4:setTextStyle( CoD.TextStyle.OutlinedMore )
	f123_local2:addElement( f123_local4 )
	local f123_local5 = function ( f124_arg0, f124_arg1 )
		if f124_arg1.value == f123_local0.EVADING then
			f123_local4:setText( Engine.Localize( "@ALIENS_CHOPPER_STATE_EVADING" ) )
			f123_local2:animateToState( "visible", 200 )
		elseif f124_arg1.value == f123_local0.ATTACKING then
			f123_local4:setText( Engine.Localize( "@ALIENS_CHOPPER_STATE_ATTACKING" ) )
			f123_local2:animateToState( "visible", 200 )
		elseif f124_arg1.value == f123_local0.INCOMING then
			f123_local4:setText( Engine.Localize( "@ALIENS_CHOPPER_STATE_INCOMING" ) )
			f123_local2:animateToState( "visible", 200 )
		else
			f123_local2:animateToState( "default", 200 )
		end
	end
	
	f123_local2:registerOmnvarHandler( "ui_alien_chopper_state", f123_local5 )
	local f123_local6 = Game.GetOmnvar( "ui_alien_chopper_state" )
	if f123_local6 ~= f123_local0.AWAY then
		f123_local5( f123_local2, {
			value = f123_local6
		} )
	end
	return self
end

f0_local2 = {
	AWAY = 0,
	EARLY_ENCOUNTER = 1,
	FINAL_ENCOUNTER = 2
}
local f0_local3 = {
	HIVE = {
		id = 0,
		material = "alien_icon_blockerhive"
	},
	BREEDER = {
		id = 1,
		material = "alien_icon_breeder"
	},
	KRAKEN = {
		id = 2,
		material = "alien_icon_kraken"
	},
	BIOHAZARD = {
		id = 3,
		material = "alien_icon_biohazard"
	},
	ARK_CONSOLE = {
		id = 4,
		material = "alien_icon_console"
	},
	CORTEX = {
		id = 5,
		material = "alien_icon_cortex"
	}
}
function GetCurrentBossIcon()
	local f125_local0 = Engine.GetDvarString( "ui_mapname" ) == "mp_alien_town"
	local f125_local1 = Engine.GetDvarString( "ui_mapname" ) == "mp_alien_armory"
	if f125_local0 then
		return f0_local3.HIVE.id
	elseif f125_local1 then
		return f0_local3.BREEDER.id
	else
		return Game.GetOmnvar( "ui_alien_boss_icon" )
	end
end

function GetBossIconMaterial( f126_arg0 )
	local f126_local0 = "white"
	for f126_local4, f126_local5 in pairs( f0_local3 ) do
		if f126_arg0 == f126_local5.id then
			f126_local0 = f126_local5.material
			break
		end
	end
	return RegisterMaterial( f126_local0 )
end

function BossStatusUpdateHandler( f127_arg0, f127_arg1 )
	if f127_arg1.value == f0_local2.EARLY_ENCOUNTER then
		f127_arg0:animateToState( "visible", 200 )
		f127_arg0.extraHealth:animateToState( "visible", 0 )
	elseif f127_arg1.value == f0_local2.FINAL_ENCOUNTER then
		f127_arg0:animateToState( "visible", 200 )
		f127_arg0.extraHealth:animateToState( "default", 0 )
	else
		f127_arg0:animateToState( "default", 200 )
	end
end

function BossProgressionUpdateHandler( f128_arg0, f128_arg1 )
	local f128_local0 = 160
	f128_arg0.progression:registerAnimationState( "updated", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = -10,
		left = -3,
		width = 4,
		height = f128_local0 - f128_local0 * f128_arg1.value / 100
	} )
	f128_arg0.progression:animateToState( "updated", 100 )
	if not f128_arg0.bossIcon.pulsating then
		f128_arg0.bossIcon.pulsating = true
		local f128_local1 = MBh.AnimateSequence( {
			{
				"pulse",
				150
			},
			{
				"default",
				150
			}
		} )
		f128_local1( f128_arg0.bossIcon, {} )
		f128_arg0.bossIcon:registerEventHandler( LUI.FormatAnimStateFinishEvent( "default" ), function ( element, event )
			element.pulsating = false
		end )
	end
end

function boss_meter()
	local f130_local0 = Engine.GetDvarString( "ui_mapname" ) == "mp_alien_armory"
	local self = LUI.UIElement.new()
	self.id = "boss_meter"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f130_local2 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 48 + (Engine.UsingSplitscreenUpscaling() and 10 or 0),
		left = 10,
		width = 256,
		height = 256,
		alpha = 0
	} )
	f130_local2:registerAnimationState( "visible", {
		alpha = 1
	} )
	f130_local2:animateToState( "default" )
	if Engine.GetDvarString( "ui_mapname" ) == "mp_alien_last" then
		f130_local2.bossIconBG = LUI.UIImage.new( {
			material = RegisterMaterial( "white" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = -25,
			left = -16,
			width = 42,
			height = 42,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 0.75,
			zRot = 45
		} )
		f130_local2.bossIconBG.id = "bossIconBG"
		f130_local2:addElement( f130_local2.bossIconBG )
	end
	local f130_local3 = function ( f131_arg0, f131_arg1 )
		f131_arg0:setImage( GetBossIconMaterial( f131_arg1 ) )
	end
	
	f130_local2.bossIcon = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -25,
		left = -16,
		width = 42,
		height = 42,
		alpha = 0.8
	} )
	f130_local2.bossIcon:registerAnimationState( "pulse", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -31,
		left = -19,
		width = 48,
		height = 48
	} )
	f130_local2.bossIcon.id = "boss_icon"
	f130_local3( f130_local2.bossIcon, GetCurrentBossIcon() )
	f130_local2.bossIcon:registerOmnvarHandler( "ui_alien_boss_icon", function ( f132_arg0, f132_arg1 )
		f130_local3( f132_arg0, f132_arg1.value )
	end )
	f130_local2:addElement( f130_local2.bossIcon )
	f130_local2.fillBG = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_meter_fill_bg" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 15,
		left = -2,
		width = 16,
		height = 178
	} )
	f130_local2.fillBG.id = "fillBG"
	f130_local2:addElement( f130_local2.fillBG )
	if Engine.GetDvarString( "ui_mapname" ) == "mp_alien_last" then
		f130_local2.quarter_tic_100 = LUI.UIImage.new( {
			material = RegisterMaterial( "alien_meter_mark" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 20,
			left = 2,
			width = 12,
			height = 8
		} )
		f130_local2.quarter_tic_100.id = "quarter_tic_100"
		f130_local2:addElement( f130_local2.quarter_tic_100 )
		f130_local2.quarter_tic_75 = LUI.UIImage.new( {
			material = RegisterMaterial( "alien_meter_mark" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 60,
			left = 2,
			width = 12,
			height = 8
		} )
		f130_local2.quarter_tic_75.id = "quarter_tic_75"
		f130_local2:addElement( f130_local2.quarter_tic_75 )
		f130_local2.quarter_tic_50 = LUI.UIImage.new( {
			material = RegisterMaterial( "alien_meter_mark" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 100,
			left = 2,
			width = 12,
			height = 8
		} )
		f130_local2.quarter_tic_50.id = "quarter_tic_50"
		f130_local2:addElement( f130_local2.quarter_tic_50 )
		f130_local2.quarter_tic_25 = LUI.UIImage.new( {
			material = RegisterMaterial( "alien_meter_mark" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 140,
			left = 2,
			width = 12,
			height = 8
		} )
		f130_local2.quarter_tic_25.id = "quarter_tic_25"
		f130_local2:addElement( f130_local2.quarter_tic_25 )
	end
	f130_local2.extraHealth = LUI.UIImage.new( CoD.ColorizeState( Colors.blue, {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = -10,
		left = -3,
		width = 4,
		height = 158,
		alpha = 0
	} ) )
	f130_local2.extraHealth.id = "extraHealth"
	f130_local2.extraHealth:registerAnimationState( "visible", {
		alpha = 1
	} )
	f130_local2.fillBG:addElement( f130_local2.extraHealth )
	f130_local2.progression = LUI.UIImage.new( CoD.ColorizeState( Colors.orange, {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = -10,
		left = -3,
		width = 4,
		height = 0,
		alpha = 0.75
	} ) )
	f130_local2.progression.id = "progression"
	f130_local2.fillBG:addElement( f130_local2.progression )
	local f130_local4 = LUI.UIImage.new( {
		material = RegisterMaterial( "alien_meter_mark_end" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = -3,
		left = -7,
		width = 32,
		height = 16
	} )
	f130_local4.id = "endCap"
	f130_local2.fillBG:addElement( f130_local4 )
	local f130_local5 = LUI.UIImage.new( CoD.ColorizeState( Colors.orange, {
		material = RegisterMaterial( "alien_meter_mark_end_highlight" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -3.5,
		left = -5.5,
		width = 8,
		height = 8
	} ) )
	f130_local5.id = "endCapHL"
	f130_local4:addElement( f130_local5 )
	f130_local2:registerOmnvarHandler( "ui_alien_boss_progression", BossProgressionUpdateHandler )
	f130_local2:registerOmnvarHandler( "ui_alien_boss_status", BossStatusUpdateHandler )
	if f0_local2.AWAY ~= Game.GetOmnvar( "ui_alien_boss_status" ) then
		BossProgressionUpdateHandler( f130_local2, {
			value = Game.GetOmnvar( "ui_alien_boss_progression" )
		} )
		BossStatusUpdateHandler( f130_local2, {
			value = Game.GetOmnvar( "ui_alien_boss_status" )
		} )
	end
	self:addElement( f130_local2 )
	return self
end

function juiced_timer()
	local self = LUI.UIElement.new()
	self.id = "juiced_timer"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f133_local1 = LUI.UIElement.new()
	f133_local1:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = -14,
		left = -64,
		right = -32,
		height = 32,
		alpha = 0
	} )
	f133_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f133_local1:animateToState( "default" )
	local f133_local2 = LUI.UIImage.new()
	f133_local2.id = "icon"
	f133_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "specialty_juiced" ),

		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 32
	} )
	f133_local2:animateToState( "default" )
	f133_local1:addElement( f133_local2 )
	local f133_local3 = LUI.UICountdown.new( {} )
	f133_local3.id = "countdown"
	f133_local3:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottom = 20,
		left = 0,
		right = 0,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f133_local3:animateToState( "default" )
	f133_local1:addElement( f133_local3 )
	f133_local1:registerDvarHandler( "ui_juiced_end_milliseconds", function ( f134_arg0, f134_arg1 )
		if f134_arg1.value > 0 then
			f133_local3:setEndTime( f134_arg1.value )
			if f134_arg0.current_state ~= "visible" then
				f134_arg0:animateToState( "visible", 250 )
				f134_arg0.current_state = "visible"
			end
		elseif f134_arg0.current_state ~= "default" then
			f134_arg0:animateToState( "default", 250 )
			f134_arg0.current_state = "default"
		end
	end )
	self:addElement( f133_local1 )
	return self
end
-- TODO: make the timers only move to the side if both are active
function feral_timer()
	local self = LUI.UIElement.new()
	self.id = "feral_timer"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f133_local1 = LUI.UIElement.new()
	f133_local1:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = -14,
		left = 32,
		right = 64,
		height = 32,
		alpha = 0
	} )
	f133_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f133_local1:animateToState( "default" )
	local f133_local02 = LUI.UIImage.new()
	f133_local02.id = "icon"
	f133_local02:registerAnimationState( "default", {
		material = RegisterMaterial( "hudstopwatch" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 32
	} )
	f133_local02:animateToState( "default" )
	f133_local1:addElement( f133_local02 )
	local f133_local03 = LUI.UIImage.new()
	f133_local03.id = "icon3"
	f133_local03:registerAnimationState( "default", {
		material = RegisterMaterial( "hudstopwatch" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 32
	} )
	f133_local03:animateToState( "default" )
	f133_local1:addElement( f133_local03 )
	local f133_local04 = LUI.UIImage.new()
	f133_local04.id = "icon4"
	f133_local04:registerAnimationState( "default", {
		material = RegisterMaterial( "hudstopwatch" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 32
	} )
	f133_local04:animateToState( "default" )
	f133_local1:addElement( f133_local04 )
	local f133_local2 = LUI.UIImage.new()
	f133_local2.id = "icon2"
	f133_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_icon_feral_instincts" ),
		red = 0,
		green = 0,
		blue = 0,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -1,
		bottom = 0.5,
		width = 28,
		height = 28
	} )
	f133_local2:animateToState( "default" )
	f133_local1:addElement( f133_local2 )
	local f133_local21 = LUI.UIImage.new()
	f133_local21.id = "icon5"
	f133_local21:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_icon_feral_instincts" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -2,
		bottom = -0.5,
		width = 28,
		height = 28
	} )
	f133_local21:animateToState( "default" )
	local f133_local22 = LUI.UIImage.new()
	f133_local22.id = "icon6"
	f133_local22:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_icon_feral_instincts" ),
		red = 0,
		green = 0,
		blue = 0,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -3,
		bottom = 0.5,
		width = 28,
		height = 28
	} )
	f133_local22:animateToState( "default" )
	f133_local1:addElement( f133_local22 )
	f133_local1:addElement( f133_local21 )
	local f133_local3 = LUI.UICountdown.new( {} )
	f133_local3.id = "countdown"
	f133_local3:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottom = 20,
		left = 0,
		right = 0,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f133_local3:animateToState( "default" )
	f133_local1:addElement( f133_local3 )
	f133_local1:registerDvarHandler( "ui_eyes_on_end_milliseconds", function ( f134_arg0, f134_arg1 )
		if f134_arg1.value > 0 then
			f133_local3:setEndTime( f134_arg1.value )
			if f134_arg0.current_state ~= "visible" then
				f134_arg0:animateToState( "visible", 250 )
				f134_arg0.current_state = "visible"
			end
		elseif f134_arg0.current_state ~= "default" then
			f134_arg0:animateToState( "default", 250 )
			f134_arg0.current_state = "default"
		end
	end )
	-- f133_local1:registerOmnvarHandler( "ui_horde_round_number", function ( f134_arg0, f134_arg1 )
		-- print(f134_arg1.value)
		-- local f134_local0 = Engine.GetDvarString( "cg_objectiveText" )
		-- print(f134_local0)
		-- print("meow")
		-- print(string.sub(f134_arg1.value, 1, 3))
		-- if string.sub(f134_arg1.value, 1, 3) == "iw6" then 
			-- print("running");
		-- end
		-- Engine.ExecNow( "give iw6_alienbren_mp_acog_rof_xmags_alienmuzzlebrake_grip" )
	-- end )
	self:addElement( f133_local1 )
	return self
end

LUI.mp_hud.AlienHud.ChallengeUpdate = function( f135_arg0, f135_arg1, f135_arg2 )
	local f135_local0 = {
		File = "mp/alien/" .. Engine.GetDvarString( "ui_mapname" ) .. "_challenges.csv",
		Index = 0,
		Ref = 1,
		Cycle = 2,
		StrActivate = 3,
		StrComplete = 4,
		StrFail = 5,
		preChallengeText = 7
	}
	if Game.GetOmnvar( "ui_aliens_hardcore" ) then
		f135_local0.File = "mp/alien/" .. Engine.GetDvarString( "ui_mapname" ) .. "_hardcore_challenges.csv"
	end
	f135_arg0.activeIntel = f135_arg0.activeIntel or -1
	local f135_local1 = Game.GetOmnvar( "ui_intel_challenge_scalar" )
	local f135_local2 = Game.GetOmnvar( "ui_intel_target_player" )
	local f135_local3, f135_local4, f135_local5 = nil
	if f135_local2 ~= -1 then
		f135_local3 = Game.GetPlayerName( f135_local2 )
	end
	if f135_arg0.activeIntel >= 0 then
		f135_local5 = Engine.TableLookup( f135_local0.File, f135_local0.Index, f135_arg0.activeIntel, f135_local0.preChallengeText )
	end
	if Engine.TableLookup( f135_local0.File, f135_local0.Index, f135_arg0.activeIntel, f135_local0.StrActivate ) == "ALIEN_DLC_CHALLENGES_KILL_EGGS" then
		f135_local4 = "Dont let any eggs hatch until the breeder is defeated."
	elseif Engine.TableLookup( f135_local0.File, f135_local0.Index, f135_arg0.activeIntel, f135_local0.StrActivate ) == "ALIEN_DLC_CHALLENGES_KILL_MARKED" then
		f135_local4 = ("Kill the " .. f135_local1 .. " marked aliens in 30 seconds.")
	elseif Engine.TableLookup( f135_local0.File, f135_local0.Index, f135_arg0.activeIntel, f135_local0.StrActivate ) == "ALIEN_COLLECTIBLES_CHALLENGE_SPEND_MONEY" then
		f135_local4 = ("Don't spend more than $" .. f135_local1 .. "000 for the duration of the hive.")
	elseif f135_arg0.activeIntel >= 0 and f135_arg0.preChallenge and f135_local5 ~= "" then
		f135_local4 = Engine.Localize( "@" .. f135_local5 )
	elseif f135_arg0.activeIntel >= 0 and f135_local2 ~= -1 then
		f135_local4 = Engine.Localize( "@" .. Engine.TableLookup( f135_local0.File, f135_local0.Index, f135_arg0.activeIntel, f135_local0.StrActivate ), f135_local3 )
	elseif f135_arg0.activeIntel >= 0 and f135_local1 ~= -1 then
		f135_local4 = Engine.Localize( "@" .. Engine.TableLookup( f135_local0.File, f135_local0.Index, f135_arg0.activeIntel, f135_local0.StrActivate ), f135_local1 )
	elseif f135_arg0.activeIntel >= 0 then
		f135_local4 = Engine.Localize( "@" .. Engine.TableLookup( f135_local0.File, f135_local0.Index, f135_arg0.activeIntel, f135_local0.StrActivate ) )
	else
		f135_local4 = nil
		f135_arg0:processEvent( {
			name = "message_off"
		} )
	end
	if f135_local4 then
		f135_arg2:setText( f135_local4 )
		f135_arg0:processEvent( {
			name = "message_on"
		} )
	end
end

function challenges()
	local f136_local0 = 300
	local self = LUI.UIElement.new()
	self.id = "intelInfoHudId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f136_local2 = Engine.UsingSplitscreenUpscaling() and 45 or 0
	local f136_local3 = LUI.UIElement.new()
	f136_local3:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -236,
		left = -7 + f136_local2,
		width = 0,
		height = 128,
		alpha = 0
	} )
	f136_local3:registerAnimationState( "active", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -236,
		left = -7 + f136_local2,
		width = 512,
		height = 128,
		alpha = 1
	} )
	f136_local3:registerAnimationState( "opening", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -236,
		left = -7 + f136_local2,
		width = 592,
		height = 128,
		alpha = 1
	} )
	f136_local3:registerAnimationState( "closing", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -236,
		left = -7 + f136_local2,
		width = 552,
		height = 128,
		alpha = 1
	} )
	f136_local3:animateToState( "default" )
	f136_local3:registerEventHandler( "message_on", MBh.AnimateSequence( {
		{
			"default",
			0
		},
		{
			"opening",
			f136_local0 / 2,
			false,
			true
		},
		{
			"active",
			f136_local0 / 2,
			true,
			true
		}
	} ) )
	f136_local3:registerEventHandler( "message_off", MBh.AnimateSequence( {
		{
			"active",
			0
		},
		{
			"closing",
			f136_local0 / 2,
			true,
			true
		},
		{
			"default",
			f136_local0 / 2,
			true,
			false
		}
	} ) )
	local f136_local4 = LUI.UIImage.new()
	f136_local4.id = "background"
	f136_local4:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_message_bg" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	f136_local4:animateToState( "default" )
	f136_local3:addElement( f136_local4 )
	local f136_local5 = LUI.UIImage.new()
	f136_local5.id = "challenge_icon"
	f136_local5:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_icon_pl_extinction" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 28,
		left = 0,
		width = 72,
		height = 72,
		alpha = 0.7
	} )
	f136_local5:animateToState( "default" )
	f136_local3:addElement( f136_local5 )
	local f136_local6 = function ( f137_arg0, f137_arg1 )
		local f137_local0 = f137_arg1.value
		if not f137_local0 or f137_local0 < 0 then
			f137_arg0:setText( Engine.Localize( "@ALIENS_CHALLENGE_CAPS" ) )
		elseif f137_local0 == 1 then
			f137_arg0:setText( Engine.Localize( "@ALIEN_COLLECTIBLES_CHALLENGE_NEW" ) )
		elseif f137_local0 == 2 then
			f137_arg0:setText( Engine.Localize( "@ALIEN_COLLECTIBLES_CHALLENGE_BARRIER_HIVE_TITLE" ) )
		end
	end
	
	local f136_local7 = LUI.UIText.new()
	f136_local7.id = "header"
	f136_local7:setTextStyle( CoD.TextStyle.Shadowed )
	f136_local7:registerAnimationState( "default", CoD.ColorizeState( Colors.cyan, {
		alignment = LUI.Alignment.Left,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 25,
		left = 20,
		width = 280,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height
	} ) )
	f136_local7:animateToState( "default" )
	f136_local7:registerOmnvarHandler( "ui_intel_title", f136_local6 )
	f136_local3:addElement( f136_local7 )
	local f136_local8 = LUI.UIText.new()
	f136_local8.id = "text"
	f136_local8:setTextStyle( CoD.TextStyle.Shadowed )
	f136_local8:registerAnimationState( "default", {
		alignment = LUI.Alignment.Left,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 45,
		left = 72,
		width = 305,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height
	} )
	f136_local8:animateToState( "default" )
	f136_local3:addElement( f136_local8 )
	local f136_local9 = LUI.UIText.new()
	f136_local9.id = "progress"
	f136_local9:setTextStyle( CoD.TextStyle.Shadowed )
	f136_local9:registerAnimationState( "default", {
		alignment = LUI.Alignment.Right,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 25,
		right = 250,
		left = 0,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		alpha = 0
	} )
	f136_local9:registerAnimationState( "visible", {
		alpha = 1
	} )
	f136_local9:animateToState( "default" )
	f136_local3:addElement( f136_local9 )
	local f136_local10 = function ( f138_arg0, f138_arg1 )
		local f138_local0 = Game.GetOmnvar( "ui_intel_progress_current" )
		local f138_local1 = Game.GetOmnvar( "ui_intel_progress_max" )
		if not f138_local0 or not f138_local1 or f138_local0 < 0 or f138_local1 < 0 then
			f136_local9:animateToState( "default" )
		else
			f136_local9:setText( f138_local0 .. "/" .. f138_local1 )
			f136_local9:animateToState( "visible" )
		end
	end
	
	local f136_local11 = function ( f139_arg0, f139_arg1 )
		local f139_local0 = Game.GetOmnvar( "ui_intel_percent" )
		if not f139_local0 or f139_local0 < 0 then
			f136_local9:animateToState( "default" )
		else
			f136_local9:setText( string.format( "%05.2f", f139_local0 / 100 .. "" ) .. "%" )
			f136_local9:animateToState( "visible" )
		end
	end
	
	local f136_local12 = LUI.UICountdown.new( {} )
	f136_local12.id = "countdown"
	f136_local12:registerAnimationState( "default", {
		alignment = LUI.Alignment.Right,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 25,
		right = 330,
		left = 0,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		alpha = 0
	} )
	f136_local12:registerAnimationState( "visible", {
		alpha = 1
	} )
	f136_local12:animateToState( "default" )
	local f136_local13 = function ( f140_arg0, f140_arg1 )
		if f140_arg1.value > 0 then
			f136_local12:setEndTime( f140_arg1.value )
			if f140_arg0.current_state ~= "visible" then
				f140_arg0:animateToState( "visible", 0 )
				f140_arg0.current_state = "visible"
			end
		elseif f140_arg0.current_state ~= "default" then
			f140_arg0:animateToState( "default", 0 )
			f140_arg0.current_state = "default"
		end
	end
	
	f136_local12:registerOmnvarHandler( "ui_intel_timer", f136_local13 )
	f136_local3:addElement( f136_local12 )
	f136_local3:registerOmnvarHandler( "ui_intel_active_index", function ( f141_arg0, f141_arg1 )
		f141_arg0.activeIntel = f141_arg1.value
		ChallengeUpdate( f141_arg0, f141_arg1, f136_local8 )
	end )
	f136_local3:registerOmnvarHandler( "ui_intel_progress_current", f136_local10 )
	f136_local3:registerOmnvarHandler( "ui_intel_progress_max", f136_local10 )
	f136_local3:registerOmnvarHandler( "ui_intel_percent", f136_local11 )
	f136_local3:registerOmnvarHandler( "ui_intel_prechallenge", function ( f142_arg0, f142_arg1 )
		f142_arg0.preChallenge = f142_arg1.value == 1
		ChallengeUpdate( f142_arg0, f142_arg1, f136_local8 )
	end )
	if 0 <= Game.GetOmnvar( "ui_intel_active_index" ) then
		f136_local3.activeIntel = Game.GetOmnvar( "ui_intel_active_index" )
		f136_local3.preChallenge = 1 == Game.GetOmnvar( "ui_intel_prechallenge" )
		f136_local6( f136_local7, {
			value = Game.GetOmnvar( "ui_intel_title" )
		} )
		f136_local13( f136_local12, {
			value = Game.GetOmnvar( "ui_intel_timer" )
		} )
		f136_local11( f136_local3, {} )
		f136_local10( f136_local3, {} )
		ChallengeUpdate( f136_local3, {}, f136_local8 )
	end
	self:addElement( f136_local3 )
	return self
end

function skill_points_reminder()
	local self = LUI.UIElement.new()
	self.id = "reminder"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f143_local1 = function ()
		return Engine.Localize( "@ALIENS_SPEND_POINTS_REMINDER", Engine.MarkLocalized( "[{togglescores}]" ) )
	end
	
	local f143_local2 = LUI.UIText.new()
	f143_local2:setText( f143_local1() )
	f143_local2:setTextStyle( CoD.TextStyle.Shadowed )
	f143_local2:registerAnimationState( "default", {
		font = CoD.TextSettings.HudIW6SmallFont.Font,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		height = CoD.TextSettings.SmallFont.Height,
		alpha = 1
	} )
	f143_local2:registerAnimationState( "hidden", {
		font = CoD.TextSettings.HudIW6SmallFont.Font,
		alignment = LUI.Alignment.Left,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		bottom = 0,
		height = CoD.TextSettings.SmallFont.Height,
		alpha = 0
	} )
	f143_local2:animateToState( "hidden" )
	f143_local2:registerEventHandler( "empty_menu_stack", function ( element, event )
		element:setText( f143_local1() )
	end )
	f143_local2:registerEventHandler( "show_reminder", MBh.AnimateSequence( {
		{
			"hidden",
			0,
			true,
			true
		},
		{
			"default",
			150,
			true,
			true
		}
	} ) )
	f143_local2:registerEventHandler( "hide_reminder", MBh.AnimateToState( "hidden", 150 ) )
	f143_local2:registerEventHandler( "ability_points_change", function ( element, event )
		element.storedValue = event.newValue
		if not Game.GetOmnvar( "ui_alien_player_in_laststand" ) and event.oldValue < event.newValue and event.oldValue == 0 then
			element:processEvent( {
				name = "show_reminder"
			} )
		elseif event.newValue == 0 then
			element:processEvent( {
				name = "hide_reminder"
			} )
		end
	end )
	f143_local2:registerOmnvarHandler( "ui_alien_player_in_laststand", function ( f147_arg0, f147_arg1 )
		if f147_arg1.value then
			f147_arg0:processEvent( {
				name = "hide_reminder"
			} )
		elseif f147_arg0.storedValue and f147_arg0.storedValue >= 1 then
			f147_arg0:processEvent( {
				name = "show_reminder"
			} )
		end
	end )
	self:addElement( f143_local2 )
	return self
end

function flash_message()
	local self = LUI.UIElement.new()
	self.id = "flash_message"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = -256,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f148_local1 = 110
	local f148_local2 = -32
	local f148_local3 = LUI.UIElement.new()
	f148_local3.id = "splashId"
	f148_local3.properties = {
		busy = false,
		queue = {}
	}
	f148_local3:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = f148_local1,
		left = f148_local2 - 500,
		height = 64,
		right = -468,
		alpha = 0,
		scale = -0.15
	} )
	f148_local3:registerAnimationState( "opening", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = f148_local1,
		left = f148_local2 + 20,
		height = 64,
		right = 52,
		alpha = 1
	} )
	f148_local3:registerAnimationState( "active", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = f148_local1,
		left = f148_local2,
		height = 64,
		right = 32,
		alpha = 1
	} )
	f148_local3:registerAnimationState( "leave", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = f148_local1,
		left = f148_local2 + 500,
		height = 64,
		right = 532,
		alpha = 0
	} )
	f148_local3:animateToState( "default" )
	self:addElement( f148_local3 )
	local f148_local4 = LUI.UIImage.new()
	f148_local4.id = "splashBackingImageId"
	f148_local4:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = f148_local2,
		height = 128,
		width = 512,
		material = RegisterMaterial( "box_alien_intel_hud" )
	} )
	f148_local4:animateToState( "default" )
	local f148_local5 = LUI.UIImage.new()
	f148_local5.id = "splashImageId"
	f148_local5:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = -44,
		left = -86 + f148_local2,
		height = 176,
		width = 176,
		material = RegisterMaterial( "hud_icon_pl_extinction" )
	} )
	f148_local5:registerAnimationState( "nightfall", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = -4,
		left = -64 + f148_local2,
		height = 128,
		width = 128,
		material = RegisterMaterial( "alien_icon_intel_hud_nightfall" )
	} )
	f148_local5:registerAnimationState( "intercept", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = -4,
		left = -64 + f148_local2,
		height = 128,
		width = 128,
		material = RegisterMaterial( "alien_icon_intel_hud_intercept" )
	} )
	f148_local5:animateToState( "default" )
	local f148_local6 = LUI.UIImage.new()
	f148_local6.id = "overlayImageId"
	f148_local6:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = -64,
		left = 256,
		height = 256,
		width = 256,
		alpha = 0,
		material = RegisterMaterial( "box_alien_intel_hud_overlay" )
	} )
	f148_local6:registerAnimationState( "active", {
		alpha = 1
	} )
	f148_local6:registerAnimationState( "glow_high", {
		alpha = 1
	} )
	f148_local6:registerAnimationState( "glow_low", {
		alpha = 0.1
	} )
	f148_local6:animateToState( "default" )
	local f148_local7 = LUI.UIText.new()
	f148_local7.id = "splashNameId"
	f148_local7:setTextStyle( CoD.TextStyle.OutlinedMore )
	f148_local7:registerAnimationState( "default", CoD.ColorizeState( Colors.alien_frontend_hilite, {
		alignment = LUI.Alignment.Left,
		font = CoD.TextSettings.BoldFont.Font,
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 20,
		height = CoD.TextSettings.BoldFont.Height,
		left = 32,
		width = 432
	} ) )
	f148_local7:animateToState( "default" )
	local f148_local8 = LUI.UIText.new()
	f148_local8.id = "splashDescId"
	f148_local8:setTextStyle( CoD.TextStyle.OutlinedMore )
	f148_local8:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		alignment = LUI.Alignment.Left,
		font = CoD.TextSettings.NormalFont.Font,
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 24 + CoD.TextSettings.BoldFont.Height,
		height = CoD.TextSettings.NormalFont.Height,
		left = 32,
		width = 432
	} ) )
	f148_local8:animateToState( "default", 0 )
	local f148_local9 = LUI.UIText.new()
	f148_local9.id = "splashCollectedTextId"
	f148_local9:setTextStyle( CoD.TextStyle.OutlinedMore )
	f148_local9:registerAnimationState( "default", CoD.ColorizeState( Colors.primary_text_color, {
		alignment = LUI.Alignment.Left,
		font = CoD.TextSettings.NormalFont.Font,
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 35 + CoD.TextSettings.BoldFont.Height + CoD.TextSettings.NormalFont.Height,
		height = CoD.TextSettings.NormalFont.Height,
		left = 32,
		width = 432
	} ) )
	f148_local9:animateToState( "default", 0 )
	f148_local3:addElement( f148_local4 )
	f148_local3:addElement( f148_local5 )
	f148_local3:addElement( f148_local6 )
	f148_local3:addElement( f148_local7 )
	f148_local3:addElement( f148_local8 )
	f148_local3:addElement( f148_local9 )
	local f148_local10 = function ( f149_arg0, f149_arg1, f149_arg2, f149_arg3 )
		if f148_local3.properties.busy == true then
			table.insert( f148_local3.properties.queue, {
				title = f149_arg0,
				description = f149_arg1,
				state = f149_arg2,
				collected_text = f149_arg3
			} )
		else
			f148_local3.properties.busy = true
			f148_local7:setText( f149_arg0 )
			f148_local8:setText( f149_arg1 )
			f148_local5:animateToState( f149_arg2 )
			f148_local9:setText( f149_arg3 )
			local f149_local0 = MBh.AnimateSequence( {
				{
					"default",
					150
				},
				{
					"active",
					50
				},
				{
					"glow_high",
					60
				},
				{
					"glow_low",
					1000
				},
				{
					"glow_high",
					50
				},
				{
					"glow_high",
					150
				},
				{
					"glow_low",
					850
				},
				{
					"glow_high",
					50
				},
				{
					"glow_high",
					150
				},
				{
					"glow_low",
					850
				},
				{
					"glow_high",
					50
				},
				{
					"glow_high",
					150
				},
				{
					"glow_low",
					850
				}
			} )
			f149_local0( f148_local6 )
			f149_local0 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"opening",
					150
				},
				{
					"active",
					150
				},
				{
					"active",
					4000
				},
				{
					"leave",
					150
				}
			} )
			f149_local0( f148_local3 )
		end
	end
	
	f148_local3:registerEventHandler( "transition_complete_leave", function ( element, event )
		element.properties.busy = false
		if #element.properties.queue > 0 then
			local f150_local0 = table.remove( element.properties.queue, 1 )
			f148_local10( f150_local0.title, f150_local0.description, f150_local0.state, f150_local0.collected_text )
		end
	end )
	f148_local3:registerOmnvarHandler( "ui_alien_rankup", function ( f151_arg0, f151_arg1 )
		f148_local10( Engine.Localize( "@ALIENS_PATCH_RANKED_UP" ), Engine.Localize( "@ALIENS_PATCH_RANKED_UP_DESC" ), "default", Engine.Localize( "@ALIENS_PATCH_NEW_RANK", f151_arg1.value ) )
		Engine.PlaySound( "mp_level_up" )
	end )
	f148_local3:registerOmnvarHandler( "ui_alien_award_token", function ( f152_arg0, f152_arg1 )
		if f152_arg1.value > 1 then
			f148_local10( Engine.Localize( "@ALIENS_FOUND_TOKENS", f152_arg1.value ), Engine.Localize( "@ALIENS_TOKEN_DESC" ), "default", "" )
		else
			f148_local10( Engine.Localize( "@ALIENS_FOUND_TOKEN" ), Engine.Localize( "@ALIENS_TOKEN_DESC" ), "default", "" )
		end
		Engine.PlaySound( "mp_level_up" )
	end )
	f148_local3:registerOmnvarHandler( "ui_alien_eggstra_xp", function ( f153_arg0, f153_arg1 )
		if Engine.GetDvarString( "ui_mapname" ) == "mp_alien_armory" then
			f148_local10( Engine.Localize( "@ALIEN_PICKUPS_ARMORY_EGGSTRA_XP" ), Engine.Localize( "@ALIEN_PICKUPS_ARMORY_EGGSTRA_XP_DESC" ), "default", "" )
		elseif Engine.GetDvarString( "ui_mapname" ) == "mp_alien_dlc3" then
			f148_local10( Engine.Localize( "@ALIEN_PICKUPS_DESCENT_EGGSTRA_XP" ), Engine.Localize( "@ALIEN_PICKUPS_DESCENT_EGGSTRA_XP_DESC" ), "default", "" )
		elseif Engine.GetDvarString( "ui_mapname" ) == "mp_alien_last" then
			f148_local10( Engine.Localize( "@MP_ALIEN_LAST_EGGSTRA_XP" ), Engine.Localize( "@MP_ALIEN_LAST_EGGSTRA_XP_DESC" ), "default", "" )
		else
			f148_local10( Engine.Localize( "@ALIEN_PICKUPS_BEACON_EGGSTRA_XP" ), Engine.Localize( "@ALIEN_PICKUPS_BEACON_EGGSTRA_XP_DESC" ), "default", "" )
		end
		Engine.PlaySound( "mp_level_up" )
	end )
	if Engine.GetDvarString( "ui_mapname" ) ~= "mp_alien_town" then
		local f148_local11 = {
			File = "mp/alien/alien_armory_intel.csv",
			Index = 0,
			Title_string_index = 16
		}
		local f148_local12 = Engine.Localize( "@ALIEN_PILLAGE_INTEL_INTERCEPT_FILE_FOUND" )
		local f148_local13 = Engine.Localize( "@ALIEN_PILLAGE_INTEL_NIGHTFALL_FILE_FOUND" )
		if Engine.GetDvarString( "ui_mapname" ) == "mp_alien_beacon" then
			f148_local11.File = "mp/alien/alien_beacon_intel.csv"
			f148_local12 = Engine.Localize( "@ALIEN_PILLAGE_INTEL_MEDUSA_FILE_FOUND" )
			f148_local13 = Engine.Localize( "@ALIEN_PILLAGE_INTEL_ARCHER_LOG_FOUND" )
		elseif Engine.GetDvarString( "ui_mapname" ) == "mp_alien_dlc3" then
			f148_local11.File = "mp/alien/alien_dlc3_intel.csv"
			f148_local12 = Engine.Localize( "@ALIEN_PILLAGE_INTEL_ANCESTOR_INTEL_FOUND" )
			f148_local13 = Engine.Localize( "@ALIEN_PILLAGE_INTEL_ARCHER_LOG_FOUND" )
		elseif Engine.GetDvarString( "ui_mapname" ) == "mp_alien_last" then
			f148_local11.File = "mp/alien/alien_last_intel.csv"
			f148_local12 = Engine.Localize( "@ALIEN_PILLAGE_INTEL_EXODUS_FILE_FOUND" )
			f148_local13 = Engine.Localize( "@ALIEN_PILLAGE_INTEL_EXODUS_FILE_FOUND" )
		end
		f148_local3:registerOmnvarHandler( "ui_alien_intercept_pickup", function ( f154_arg0, f154_arg1 )
			f148_local10( f148_local12, Engine.Localize( "@" .. Engine.TableLookup( f148_local11.File, f148_local11.Index, f154_arg1.value, f148_local11.Title_string_index ) ), "intercept", Engine.Localize( "@ALIEN_PILLAGE_INTEL_EXTINCTION_INTEL_COLLECTED", Game.GetOmnvar( "ui_alien_intel_num_collected" ), LUI.mp_menus.Aliens.GetNumIntelsForCurrentMap() ) )
		end )
		f148_local3:registerOmnvarHandler( "ui_alien_nightfall_pickup", function ( f155_arg0, f155_arg1 )
			f148_local10( f148_local13, Engine.Localize( "@" .. Engine.TableLookup( f148_local11.File, f148_local11.Index, f155_arg1.value, f148_local11.Title_string_index ) ), "nightfall", Engine.Localize( "@ALIEN_PILLAGE_INTEL_EXTINCTION_INTEL_COLLECTED", Game.GetOmnvar( "ui_alien_intel_num_collected" ), LUI.mp_menus.Aliens.GetNumIntelsForCurrentMap() ) )
		end )
	end
	return self
end

function splashes()
	local f156_local0 = {
		File = "mp/alien/splashTable.csv",
		Ref = 0,
		Name = 1,
		Desc = 2,
		Duration = 4
	}
	local self = LUI.UIElement.new()
	self.id = "splashes"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f156_local2 = LUI.UIElement.new()
	f156_local2.id = "content"
	f156_local2:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 23,
		left = 0,
		width = 280,
		height = 80
	} )
	f156_local2:animateToState( "default" )
	local f156_local3 = LUI.UIImage.new()
	f156_local3.id = "background"
	f156_local3:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_message_bg" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f156_local3:animateToState( "default" )
	local f156_local4 = LUI.UIImage.new()
	f156_local4.id = "splashImageId"
	f156_local4:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 18,
		left = 12,
		height = 64,
		width = 64,
		material = RegisterMaterial( "hud_icon_pl_extinction" )
	} )
	f156_local4:animateToState( "default" )
	local f156_local5 = LUI.UIText.new()
	f156_local5.id = "title"
	f156_local5:registerAnimationState( "default", CoD.ColorizeState( Colors.yellow, {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 85,
		width = 447,
		top = -3,
		height = CoD.TextSettings.SmallFont.Height
	} ) )
	f156_local5:animateToState( "default" )
	f156_local2:addElement( f156_local5 )
	local f156_local6 = LUI.UIText.new()
	f156_local6.id = "desc"
	f156_local6:registerAnimationState( "default", {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 85,
		width = 447,
		top = 35,
		height = CoD.TextSettings.SmallFont.Height
	} )
	f156_local6:animateToState( "default" )
	f156_local2:addElement( f156_local6 )
	local f156_local7 = LUI.UIElement.new()
	f156_local7.id = "splashes"
	f156_local7:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -13,
		left = -200,
		width = 512,
		height = 110,
		alpha = 1
	} )
	f156_local7:registerAnimationState( "hidden", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -128,
		left = -200,
		width = 512,
		height = 110,
		alpha = 0
	} )
	f156_local7:animateToState( "hidden" )
	local f156_local8 = function ( f157_arg0, f157_arg1, f157_arg2, f157_arg3, f157_arg4, f157_arg5 )
		local f157_local0 = f157_arg1.value
		if not f157_local0 or f157_local0 == -1 then
			f157_arg0:animateToState( "hidden", 0 )
			return 
		else
			local f157_local1 = Engine.Localize( Engine.TableLookupByRow( f156_local0.File, f157_local0, f156_local0.Desc ), f157_arg3, f157_arg4 )
			if not f157_local1 then
				DebugPrint( "WARNING: Missing splash description for row " .. f157_local0 .. " in " .. f156_local0.File )
				return 
			else
				local f157_local2 = tonumber( Engine.TableLookupByRow( f156_local0.File, f157_local0, f156_local0.Duration ) ) * 1000
				f156_local5:setText( f157_arg2 )
				f156_local6:setText( f157_local1 )
				f156_local4:setImage( RegisterMaterial( f157_arg5 ) )
				local f157_local3 = MBh.AnimateSequence( {
					{
						"hidden",
						0,
						true,
						true
					},
					{
						"default",
						200,
						false,
						true
					},
					{
						"default",
						f157_local2,
						true,
						true
					},
					{
						"hidden",
						200,
						true,
						false
					}
				} )
				f157_local3( f157_arg0, {} )
			end
		end
	end
	
	f156_local7:registerOmnvarHandler( "ui_splash_idx", function ( f158_arg0, f158_arg1 )
		local f158_local0 = f158_arg1.value
		local f158_local1 = Game.GetOmnvar( "ui_splash_optional_number" )
		f156_local8( f158_arg0, f158_arg1, Engine.Localize( Engine.TableLookupByRow( f156_local0.File, f158_local0, f156_local0.Name ), f158_local1 ), f158_local1 )
	end )
	f156_local7:registerOmnvarHandler( "ui_splash_playercard_idx", function ( f159_arg0, f159_arg1 )
		local f159_local0 = Game.GetOmnvar( "ui_splash_playercard_optional_number" )
		local f159_local1 = Game.GetOmnvar( "ui_splash_playercard_clientnum" )
		local f159_local2 = Game.GetPlayerName( f159_local1 )
		local f159_local3 = Game.GetPlayerCard( f159_local1 )
		f156_local8( f159_arg0, f159_arg1, f159_local2, f159_local0, f159_local2, Engine.TableLookup( PatchesTable.File, PatchesTable.Cols.Ref, f159_local3.patch, PatchesTable.Cols.CardImage ) )
	end )
	f156_local7:addElement( f156_local3 )
	f156_local7:addElement( f156_local2 )
	f156_local7:addElement( f156_local4 )
	self:addElement( f156_local7 )
	return self
end

function game_messages()
	local self = LUI.UIElement.new()
	self.id = "gameMessagesID"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 200,
		bottom = 32,
		left = -32,
		right = 32
	} )
	self:animateToState( "default" )
	local f160_local1 = LUI.UIText.new()
	f160_local1.id = "text"
	f160_local1:setTextStyle( CoD.TextStyle.Shadowed )
	f160_local1:registerAnimationState( "default", {
		font = CoD.TextSettings.HudEuroNormalFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	f160_local1:registerAnimationState( "opening", {
		font = CoD.TextSettings.HudEuroNormalFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 80 + CoD.TextSettings.HudEuroNormalFont.Height,
		left = -256,
		right = 256,
		alpha = 1
	} )
	f160_local1:registerAnimationState( "active", {
		font = CoD.TextSettings.HudEuroNormalFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = CoD.TextSettings.HudEuroNormalFont.Height,
		left = -256,
		right = 256,
		alpha = 1
	} )
	f160_local1:animateToState( "default" )
	f160_local1:registerEventHandler( "game_message", function ( element, event )
		if event then
			element:setText( event.message )
			local f161_local0 = MBh.AnimateSequence( {
				{
					"opening",
					0
				},
				{
					"active",
					100
				},
				{
					"active",
					2500
				},
				{
					"default",
					100
				}
			} )
			f161_local0( element, event )
		end
	end )
	self:addElement( f160_local1 )
	return self
end

function talker_hud()
	return LUI.MenuBuilder.buildItems( {
		type = "talkerHudDef",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = false,
				bottomAnchor = false,
				rightAnchor = true,
				top = Engine.UsingSplitscreenUpscaling() and 0 or 200,
				right = -20,
				height = 0,
				width = 0
			}
		}
	} )
end

function cursor_hints()
	local self = LUI.UIElement.new()
	self.id = "cursorHints"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f163_local1 = LUI.mp_hud.Hints.cursorHintDef()
	f163_local1:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -93,
		left = -32,
		right = 32,
		height = 64
	} )
	f163_local1:animateToState( "default" )
	self:addElement( f163_local1 )
	return self
end

function hybrid_scope_hints()
	local self = LUI.UIElement.new()
	self.id = "hybridScopeHints"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 40,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	self:addElement( LUI.mp_hud.Hints.toggleHybridHintDef() )
	return self
end

function mantle_hints()
	local self = LUI.UIElement.new()
	self.id = "mantleHints"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f165_local1 = LUI.mp_hud.Hints.mantleHintDef()
	f165_local1:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -20,
		left = -32,
		right = 32,
		height = 64
	} )
	f165_local1:animateToState( "default" )
	self:addElement( f165_local1 )
	return self
end

function match_countdown()
	local self = LUI.UIElement.new()
	self.id = "match_countdown"
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
	self:addElement( LUI.mp_hud.MatchStartHud.matchStartHudDef() )
	return self
end

hitmark_local0 = function ( f1_arg0, f1_arg1 )
	Engine.NotifyServer( "gambler_anim_complete", 1 )
end

local hitmark_local4 = function ( f5_arg0, f5_arg1 )
	if f5_arg1.value ~= -1 then
		local f5_local0 = f5_arg0:getChildById( "gamblerIconId" )
		local f5_local1 = f5_arg0:getChildById( "gamblerTextId" )
		local f5_local2 = Engine.TableLookupByRow( PerkTable.File, f5_arg1.value, PerkTable.Cols.Image )
		local f5_local3 = Engine.TableLookupByRow( PerkTable.File, f5_arg1.value, PerkTable.Cols.Name )
		local f5_local4 = RegisterMaterial( f5_local2 )
		f5_local1:setText( Engine.Localize( f5_local3 ) )
		CoD.SetMaterial( f5_local0, f5_local4 )
		local f5_local5 = MBh.AnimateSequence( {
			{
				"active",
				0
			},
			{
				"inactive",
				2500
			}
		} )
		f5_local5( f5_arg0 )
	end
end

local hitmark_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.value
	if f4_local0 ~= nil then
		if Game.IsCinematicCameraActive() then
			return 
		end
		local f4_local1 = f4_arg0:getChildById( "deadeyeBaseContainer" )
		local f4_local2 = f4_arg0:getChildById( "deadeyePulseContainer" )
		if f4_local0 == "hitcritical" or f4_local0 == "hitdeadeyekill" then
			local f4_local3 = MBh.AnimateSequence( {
				{
					"default",
					100
				},
				{
					"active",
					20
				},
				{
					"close",
					50
				}
			} )
			f4_local3( f4_local1 )
			f4_local3 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"active",
					50
				},
				{
					"close",
					90
				}
			} )
			f4_local3( f4_local2 )
		end
	end
end

local hitmark_local5 = function ()
	local self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		bottom = 16,
		left = -16,
		right = 16,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:registerOmnvarHandler( "damage_feedback", hitmark_local3 )
	local f6_local1 = LUI.UIElement.new()
	f6_local1.id = "deadeyeBaseContainer"
	f6_local1:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		left = -16,
		right = 16,
		height = 64,
		alpha = 0
	} )
	f6_local1:registerAnimationState( "active", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -20,
		left = -20,
		right = 20,
		height = 70,
		alpha = 0.5
	} )
	f6_local1:registerAnimationState( "close", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -22,
		left = -22,
		right = 22,
		height = 72,
		alpha = 0
	} )
	f6_local1:animateToState( "default" )
	local f6_local2 = LUI.UIImage.new()
	f6_local2.id = "deadeyeBaseImage"
	f6_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "damage_feedback_deadeye" ),
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 1
	} )
	f6_local2:animateToState( "default" )
	f6_local1:addElement( f6_local2 )
	local f6_local3 = LUI.UIElement.new()
	f6_local3.id = "deadeyePulseContainer"
	f6_local3:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		left = -16,
		right = 16,
		height = 64,
		alpha = 0
	} )
	f6_local3:registerAnimationState( "active", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -32,
		left = -32,
		right = 32,
		height = 128,
		alpha = 1
	} )
	f6_local3:registerAnimationState( "close", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -64,
		left = -64,
		right = 64,
		height = 256,
		alpha = 0
	} )
	f6_local3:animateToState( "default" )
	local f6_local4 = LUI.UIImage.new()
	f6_local4.id = "deadeyePulseImage"
	f6_local4:registerAnimationState( "default", {
		material = RegisterMaterial( "damage_feedback_deadeye" ),
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 1
	} )
	f6_local4:animateToState( "default" )
	f6_local3:addElement( f6_local4 )
	self:addElement( f6_local1 )
	self:addElement( f6_local3 )
	return self
end

local hitmark_local6 = function ()
	local self = LUI.UIElement.new()
	self.id = "gamblerHudId"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		bottom = 16,
		left = -16,
		right = 16,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:animateToState( "default" )
	self:registerOmnvarHandler( "ui_gambler_show", hitmark_local4 )
	self:registerEventHandler( "transition_complete_inactive", hitmark_local0 )
	local f7_local1 = LUI.UIImage.new()
	f7_local1.id = "gamblerIconId"
	f7_local1:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 95,
		left = -20,
		right = 20,
		height = 40
	} )
	f7_local1:animateToState( "default" )
	local f7_local2 = LUI.UIText.new()
	f7_local2.id = "gamblerTextId"
	f7_local2:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		bottom = 160,
		left = -100,
		right = 100,
		height = CoD.TextSettings.SmallFont.Height,
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Center,
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		alpha = 1
	} )
	f7_local2:animateToState( "default" )
	f7_local2:setText( "Enter Ability Name Here" )
	f7_local2:setTextStyle( CoD.TextStyle.Shadowed )
	self:addElement( f7_local1 )
	self:addElement( f7_local2 )
	return self
end

hitmark_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.value
	if f3_local0 ~= nil then
		if Game.IsCinematicCameraActive() then
			return 
		end
		local f3_local1 = 500
		local f3_local2 = f3_arg0:getChildById( "damageFeedbackImageId" )
		if f3_local0 == "hitblastshield" then
			f3_local2:animateToState( "blastshield", 0 )
		elseif f3_local0 == "thermobaric_debuff" then
			f3_local2:animateToState( "thermoDebuff", 0 )
			f3_local1 = 1000
		elseif f3_local0 == "hitlightarmor" then
			f3_local2:animateToState( "light_armor", 0 )
		elseif f3_local0 == "hitmorehealth" then
			f3_local2:animateToState( "more_health", 0 )
		elseif f3_local0 == "hitmotionsensor" then
			f3_local2:animateToState( "motion_sensor", 0 )
			f3_local1 = 2500
		elseif f3_local0 == "hitalienarmor" then
			f3_local2:animateToState( "alienarmor", 0 )
		elseif f3_local0 == "hitaliensoft" then
			f3_local2:animateToState( "aliensoft", 0 )
		elseif f3_local0 == "hitjuggernaut" then
			f3_local2:animateToState( "juggernaut", 0 )
		elseif f3_local0 == "hitkill" then
			f3_local2:animateToState( "hitkill", 0 )
		elseif f3_local0 == "hitkilljugg" then
			f3_local2:animateToState( "hitkilljugg", 0 )
		elseif f3_local0 == "hitdeadeyekill" then
			f3_local2:animateToState( "hitdeadeyekill", 0 )
		elseif f3_local0 == "hitkillblast" then
			f3_local2:animateToState( "hitkillblast", 0 )
		elseif f3_local0 == "thermodebuff_kill" then
			f3_local2:animateToState( "thermodebuff_kill", 0 )
		else
			f3_local2:animateToState( "default", 0 )
		end
		local f3_local3 = MBh.AnimateSequence( {
			{
				"active",
				0
			},
			{
				"default",
				f3_local1
			}
		} )
		f3_local3( f3_arg0 )
	end
end

LUI.mp_hud.DamageFeedbackHud.damageFeedbackHudDef = function()
	local f8_local0 = RegisterMaterial( "damage_feedback" )
	local self = LUI.UIElement.new()
	self.id = "damageFeedbackHud"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f8_local2 = LUI.UIElement.new()
	f8_local2:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		bottom = 16,
		left = -16,
		right = 16,
		zRot = 0,
		alpha = 0
	} )
	f8_local2:registerAnimationState( "active", {
		alpha = 1
	} )
	f8_local2:animateToState( "default" )
	f8_local2:registerOmnvarHandler( "damage_feedback", hitmark_local2 )
	local f8_local2second = LUI.UIElement.new()
	f8_local2second:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 16,
		left = -16,
		right = 16,
		zRot = 0,
		alpha = 0
	} )
	f8_local2second:registerAnimationState( "active", {
		alpha = 0
	} )
	f8_local2second:animateToState( "default" )
	f8_local2second:registerOmnvarHandler( "damage_feedback", hitmark_local2 )
	local f8_local3 = {
		{
			name = "default",
			material = f8_local0
		}
	}
	if not Engine.IsAliensMode() then
		local f8_local4 = Engine.UsingSplitscreenUpscaling() and 137 or 100
		local f8_local5 = RegisterMaterial( "damage_feedback_blastshield" )
		local f8_local6 = RegisterMaterial( "damage_feedback_thermodebuff" )
		local f8_local7 = RegisterMaterial( "damage_feedback_juggernaut" )
		LUI.ConcatenateToTable( f8_local3, {
			{
				name = "blastshield",
				material = f8_local5
			},
			{
				name = "thermoDebuff",
				material = f8_local6
			},
			{
				name = "juggernaut",
				material = f8_local7
			},
			{
				name = "light_armor",
				material = RegisterMaterial( "damage_feedback_lightarmor" )
			},
			{
				name = "more_health",
				material = RegisterMaterial( "damage_feedback_morehealth" )
			},
			{
				name = "motion_sensor",
				material = RegisterMaterial( "damage_feedback_motionsensor" )
			},
			{
				name = "hitkill",
				material = f8_local0,
				red = 0.9,
				green = 0.63,
				blue = 0
			},
			{
				name = "hitkilljugg",
				material = f8_local7,
				red = 0.9,
				green = 0.63,
				blue = 0
			},
			{
				name = "hitkillblast",
				material = f8_local5,
				red = 0.9,
				green = 0.63,
				blue = 0
			},
			{
				name = "hitdeadeyekill",
				material = f8_local0,
				red = 0.9,
				green = 0.63,
				blue = 0
			},
			{
				name = "thermodebuff_kill",
				material = f8_local6,
				red = 0.9,
				green = 0.63,
				blue = 0
			}
		} )
	else
		LUI.ConcatenateToTable( f8_local3, {
			{
				name = "alienarmor",
				material = RegisterMaterial( "damage_feedback_alienarmor" )
			},
			{
				name = "aliensoft",
				material = RegisterMaterial( "damage_feedback_aliensoft" )
			}
		} )
	end
	local f8_local4 = LUI.UIImage.new()
	f8_local4.id = "damageFeedbackImageId"
	for f8_local9, f8_local10 in ipairs( f8_local3 ) do
		local f8_local11 = f8_local4
		local f8_local12 = f8_local4.registerAnimationState
		local f8_local13 = f8_local10.name
		local f8_local14 = {
			material = f8_local10.material,
			topAnchor = true,
			bottomAnchor = false
		}
		local f8_local8
		if f8_local10.leftAnchor ~= nil then
			f8_local8 = f8_local10.leftAnchor
		else
			f8_local8 = true
		end
		f8_local14.leftAnchor = f8_local8
		if f8_local10.rightAnchor ~= nil then
			f8_local8 = f8_local10.rightAnchor
		else
			f8_local8 = true
		end
		f8_local14.rightAnchor = f8_local8
		f8_local14.top = f8_local10.top or 0
		f8_local14.height = f8_local10.height or 64
		f8_local14.left = f8_local10.left
		f8_local14.right = f8_local10.right
		f8_local14.red = f8_local10.red or 1
		f8_local14.blue = f8_local10.blue or 1
		f8_local14.green = f8_local10.green or 1
		f8_local12( f8_local11, f8_local13, f8_local14 )
	end
	local f8_local4second = LUI.UIImage.new()
	f8_local4second.id = "damageFeedbackImageId"
	for f8_local9, f8_local10 in ipairs( f8_local3 ) do
		local f8_local11 = f8_local4second
		local f8_local12 = f8_local4second.registerAnimationState
		local f8_local13 = f8_local10.name
		local f8_local14 = {
			material = f8_local10.material,
			topAnchor = true,
			bottomAnchor = false
		}
		local f8_local8
		if f8_local10.leftAnchor ~= nil then
			f8_local8 = f8_local10.leftAnchor
		else
			f8_local8 = true
		end
		f8_local14.leftAnchor = f8_local8
		if f8_local10.rightAnchor ~= nil then
			f8_local8 = f8_local10.rightAnchor
		else
			f8_local8 = true
		end
		f8_local14.rightAnchor = f8_local8
		f8_local14.top = f8_local10.top or 0
		f8_local14.height = f8_local10.height or 64
		f8_local14.left = f8_local10.left
		f8_local14.right = f8_local10.right
		f8_local14.red = f8_local10.red or 1
		f8_local14.blue = f8_local10.blue or 1
		f8_local14.green = f8_local10.green or 1
		f8_local12( f8_local11, f8_local13, f8_local14 )
	end
	f8_local4:animateToState( "default" )
	f8_local4second:animateToState( "default" )
	f8_local2:addElement( f8_local4 )
	f8_local2second:addElement( f8_local4second )
	self:addElement( f8_local2 )
	self:addElement( f8_local2second )
	self:addElement( hitmark_local5() )
	self:addElement( hitmark_local6() )
	return self
end

function UpdateHUDVisibility( f167_arg0 )
	local f167_local0 = Game.GetOmnvar( "ui_predator_missile" ) > 0
	local f167_local1
	if Engine.GetDvarString( "ui_mapname" ) ~= "mp_alien_dlc3" or Game.GetOmnvar( "ui_vanguard" ) <= 0 then
		f167_local1 = false
	else
		f167_local1 = true
	end
	local f167_local2 = f167_arg0.is_paused
	local f167_local3 = f167_arg0.is_tech_tree_open
	local f167_local4 = Game.GetOmnvar( "ui_session_state" ) == "spectator"
	local f167_local5 = {}
	local f167_local6 = nil
	if f167_local2 or f167_local3 then
		f167_local6 = true
	elseif f167_local0 then
		f167_local6 = true
		f167_local5 = {
			f167_arg0.spectating,
			f167_arg0.predator
		}
	elseif f167_local1 then
		f167_local6 = true
		f167_local5 = {
			f167_arg0.spectating,
			f167_arg0.vanguardHUD,
			f167_arg0.damageFeedback,
			f167_arg0.cashWidget
		}
	elseif f167_local4 then
		f167_local6 = true
		f167_local5 = {
			f167_arg0.spectating
		}
	else
		f167_local6 = false
		f167_local5 = {
			f167_arg0.predator,
			f167_arg0.vanguardHUD
		}
	end
	local f167_local7 = {}
	for f167_local11, f167_local12 in pairs( f167_local5 ) do
		assert( f167_local12.id )
		f167_local7[f167_local12.id] = true
	end
	for f167_local11, f167_local12 in pairs( f167_arg0.allWidgets ) do
		assert( f167_local12.id )
		local f167_local13 = not f167_local6
		if f167_local7[f167_local12.id] then
			f167_local13 = f167_local6
		end
		local f167_local14
		if f167_local13 then
			f167_local14 = "hud_on"
			if not f167_local14 then
			
			elseif f167_local12.current_state ~= f167_local14 then
				f167_local12:processEvent( {
					name = f167_local14
				} )
				f167_local12:animateToState( f167_local14, 100 )
				f167_local12.current_state = f167_local14
			end
		end
		f167_local14 = "hud_off"
	end
end

function addWidget( f168_arg0, f168_arg1, f168_arg2 )
	if f168_arg2 then
		if ( Engine.GetDvarFloat( "r_aspectRatioCustom" ) == 32/9 ) then
			splitScale = 0.55
		else
			splitScale = 0
		end
		f168_arg2:registerAnimationState( "hud_on", {
			alpha = 1,
			scale = splitScale
		} )
		f168_arg2:registerAnimationState( "hud_off", {
			alpha = 0,
			scale = 20
		} )
		if f168_arg1 then
			f168_arg0.fullscreen:addElement( f168_arg2 )
		else
			f168_arg0.scalable:addElement( f168_arg2 )
		end
		table.insert( f168_arg0.allWidgets, f168_arg2 )
		return f168_arg2
	end
end

function alien_nohud()
	local self = LUI.UIElement.new()
	self.id = "alien_hud"
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
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default" )
	self.allWidgets = {}
	self.scalable = LUI.UIElement.new()
	self.scalable.id = "scalable"
	self:addElement( self.scalable )
	self:registerEventHandler( "toggle_pause", PauseAction )
	self:registerEventHandler( "toggle_pause_off", UnpauseAction )
	if not LUI.mp_menus.Aliens.IsChaosMode() then
		self:registerEventHandler( "push_tech_tree", PushTechTreeAction )
		self:registerEventHandler( "pop_tech_tree", PopTechTreeAction )
		self:registerEventHandler( "keybind", function ( element, event )
			if event.command == "+scores" or event.command == "togglescores" then
				ToggleTechTree( element, event )
			end
		end )
	end
	return self
end

function alien_hud()
    Engine.ExecNow( "r_globalGenericMaterialScale 6" )
    Engine.ExecNow( "r_hudOutlinePostMode 2" )
    Engine.ExecNow( "r_hudOutlineHaloLumScale 2.1" )
    Engine.ExecNow( "r_hudOutlineHaloDarkenScale 2" )
    Engine.ExecNow( "r_hudOutlineHaloBlurRadius 1.5" )
    Engine.ExecNow( "set fs_game mods/m" )
	local self = LUI.UIElement.new()
	self.id = "alien_hud"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default" )
	self.allWidgets = {}
	self.scalable = LUI.UIElement.new()
	self.scalable.id = "scalable"
	self:addElement( self.scalable )
	local f169_local1 = function ()
		if ( Engine.GetDvarFloat( "r_aspectRatioCustom" ) == 32/9 ) then
			horizScale = 32
			vertScale = 9
		else
			horizScale = 1
			vertScale = 1
		end
		local f170_local0, f170_local1, f170_local2, f170_local3 = GameX.GetAdjustedSafeZoneSize()
		local f170_local4 = Engine.UsingSplitscreenUpscaling() and 5 or 15
		self.scalable:registerAnimationState( "current", {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			left = f170_local0 + f170_local4*horizScale,
			top = f170_local1 + f170_local4*vertScale,
			right = f170_local2 - f170_local4*horizScale,
			bottom = f170_local3 - f170_local4*vertScale
		} )
		self.scalable:animateToState( "current" )
	end
	
	self:registerEventHandler( "update_hud_margins", f169_local1 )
	f169_local1()
	self.fullscreen = LUI.UIElement.new()
	self.fullscreen.id = "fullscreen"
	self.fullscreen:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.fullscreen:animateToState( "default" )
	self:addElement( self.fullscreen )
	self.addWidget = addWidget
	local f169_local2 = false
	local f169_local3 = Engine.GetDvarString( "ui_mapname" )
	if f169_local3 == "mp_alien_dlc3" then
		self.vanguardHUD = self:addWidget( true, LUI.mp_hud.AlienVanguardOverlayHud.alienVanguardOverlayDef() )
	elseif f169_local3 == "mp_alien_last" then
		f169_local2 = true
		self.nx1CustomReticle = self:addWidget( false, LUI.mp_hud.AlienHud.nx1_custom_reticle() )
	end
	self.weaponInfoWidget = self:addWidget( false, LUI.mp_hud.AlienHud.weapon_info() )
	self.challenges = self:addWidget( false, LUI.mp_hud.AlienHud.challenges() )
	self.cursorHint = self:addWidget( false, LUI.mp_hud.AlienHud.cursor_hints() )
	self.hybridScopeHints = self:addWidget( false, LUI.mp_hud.AlienHud.hybrid_scope_hints() )
	self.damageFeedback = self:addWidget( true, LUI.mp_hud.DamageFeedbackHud.damageFeedbackHudDef() )
	self.gameMessages = self:addWidget( false, LUI.mp_hud.AlienHud.game_messages() )
	self.healthMeter = self:addWidget( false, health_meter() )
	self.juicedTimer = self:addWidget( false, juiced_timer() )
	self.feralTimer = self:addWidget( false, feral_timer() )
	self.mantleHint = self:addWidget( false, LUI.mp_hud.AlienHud.mantle_hints() )
	self.predator = self:addWidget( true, LUI.mp_hud.PredatorMissileOverlayHud.predatorMissileOverlayDef() )
	self.quickShopWidget = self:addWidget( false, quick_shop() )
	self.lastStandTimer = self:addWidget( false, LUI.mp_hud.AlienHud.laststand_timer() )
	self.attackChopper = self:addWidget( false, LUI.mp_hud.AlienHud.attack_chopper() )
	self.capturingHud = self:addWidget( false, LUI.mp_hud.AlienCapturingHud.captureHudDef() )
	self.selfRevives = self:addWidget( false, self_revives() )
--	self.lockerKey = self:addWidget( false, LUI.mp_hud.AlienHud.locker_key() )
	self.strikepack = self:addWidget( false, strike_pack() )
	self.cashWidget = self:addWidget( false, LUI.mp_hud.AlienHud.cash_widget() )
	if LUI.mp_menus.Aliens.IsChaosMode() then
		self.chaosMainScore = self:addWidget( false, LUI.MenuBuilder.BuildRegisteredType( "chaos_main_score" ) )
		self.chaosComboMeter = self:addWidget( false, LUI.MenuBuilder.BuildRegisteredType( "chaos_combo_meter" ) )
		self.chaosClock = self:addWidget( false, LUI.MenuBuilder.BuildRegisteredType( "chaos_clock" ) )
		self.chaosPerks = self:addWidget( false, LUI.MenuBuilder.BuildRegisteredType( "chaos_perks" ) )
		self.chaosPerkUnlock = self:addWidget( false, LUI.MenuBuilder.BuildRegisteredType( "chaos_perk_unlock", {
			perksWidget = self.chaosPerks
		} ) )
		self.chaosEventLog = self:addWidget( false, LUI.MenuBuilder.BuildRegisteredType( "chaos_event_log" ) )
		self.chaosSkillIcon = self:addWidget( false, LUI.MenuBuilder.BuildRegisteredType( "chaos_class_skill_item" ) )
	else
		self.splashes = self:addWidget( false, LUI.mp_hud.AlienHud.splashes() )
		self.drillMeterWidget = self:addWidget( false, LUI.mp_hud.AlienHud.drill_meter( f169_local2 ) )
		self.skillPointsReminder = self:addWidget( false, LUI.mp_hud.AlienHud.skill_points_reminder() )
		self.hiveBattle = self:addWidget( false, LUI.mp_hud.AlienHud.boss_meter() )
	end
	self.weaponAttachments = self:addWidget( false, LUI.MenuBuilder.buildItems( {
		type = "weaponAttachmentProcessing"
	}, {} ) )
	self.blurUpdate = self:addWidget( false, LUI.MenuBuilder.buildItems( {
		type = "blurProcessing"
	}, {} ) )
	self.spectating = self:addWidget( false, LUI.mp_hud.AlienHud.spectating() )
	self.flashMessage = self:addWidget( false, LUI.mp_hud.AlienHud.flash_message() )
	self.talkerHud = self:addWidget( false, LUI.mp_hud.AlienHud.talker_hud() )
	self.nukeTimer = self:addWidget( false, LUI.mp_hud.AlienHud.nuke_countdown_timer() )
	self.hiveBonus = self:addWidget( false, LUI.mp_hud.AlienScoreboards.hive_bonus_scoreboard() )
	self.matchCountdown = self:addWidget( false, LUI.mp_hud.AlienHud.match_countdown() )
	self:registerEventHandler( "toggle_pause", PauseAction )
	self:registerEventHandler( "toggle_pause_off", UnpauseAction )
	if not LUI.mp_menus.Aliens.IsChaosMode() then
		self:registerEventHandler( "push_tech_tree", PushTechTreeAction )
		self:registerEventHandler( "pop_tech_tree", PopTechTreeAction )
		self:registerEventHandler( "keybind", function ( element, event )
			if event.command == "+scores" or event.command == "togglescores" then
				ToggleTechTree( element, event )
			end
		end )
	end
	self:registerOmnvarHandler( "ui_alien_show_eog_score", function ( f172_arg0, f172_arg1 )
		self:animateToState( "hidden", 600 )
		f172_arg0:dispatchEventToRoot( {
			name = "round_end_show"
		} )
	end )
	local f169_local4 = function ()
		UpdateHUDVisibility( self )
	end
	
	self:registerOmnvarHandler( "ui_predator_missile", f169_local4 )
	self:registerOmnvarHandler( "ui_session_state", f169_local4 )
	if Engine.GetDvarString( "ui_mapname" ) == "mp_alien_dlc3" then
		self:registerOmnvarHandler( "ui_vanguard", f169_local4 )
	end
	f169_local4()
	local f169_local5 = LUI.UIElement.new()
	f169_local5:setupUIIntWatch( "AlienCash" )
	f169_local5.id = "cashWatch"
	f169_local5:registerEventHandler( "int_watch_alert", function ( element, event )
		event.name = "cash_change"
		self.quickShopWidget:processEvent( event )
		self.cashWidget:processEvent( event )
	end )
	local f169_local6 = LUI.UIElement.new()
	f169_local6:setupUIIntWatch( "AlienSkillPoints" )
	f169_local6.id = "points_watch"
	f169_local6:registerEventHandler( "int_watch_alert", function ( element, event )
		event.name = "ability_points_change"
		if self.skillPointsReminder then
			self.skillPointsReminder:processEvent( event )
		end
		self.quickShopWidget:processEvent( event )
	end )
	local f169_local7 = LUI.UIElement.new()
	f169_local7:setupUIIntWatch( "AlienCumulatedSkillsLevel" )
	f169_local7.id = "levels_watch"
	f169_local7:registerEventHandler( "int_watch_alert", function ( element, event )
		event.name = "ability_levels_change"
		self.quickShopWidget:processEvent( event )
	end )
	self:addElement( f169_local5 )
	if not LUI.mp_menus.Aliens.IsChaosMode() then
		self:addElement( f169_local6 )
	end
	self:addElement( f169_local7 )
	return self
end

LUI.MenuBuilder.m_types[ "alien_hud" ] = alien_hud
LUI.HudManager.registerHud( "alien_hud" )
