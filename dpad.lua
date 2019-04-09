-----------------------------------------------------------------------------------------
--
--dpad.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local gDpad = display.newGroup( )

local tblTmp = {}
tblTmp.x_touch = 0
tblTmp.y_touch = 0
tblTmp.button_pressed = false

local function touchHandler(event)--when touched dpad moves 
	if(event.phase == "ended") then
		tblTmp.x_touch = 0
		tblTmp.y_touch = 0
	else
		tblTmp.x_touch = (event.x - event.target.x) / (event.target.width/2) 
		tblTmp.y_touch = (event.y - event.target.y) / (event.target.height/2)
	end
	return true
end

local function keyHandler(event) -- sets keyboard usage
	if(event.keyName == "a") then
		if(event.phase == "down") then
			tblTmp.x_touch = -1
		else
			tblTmp.x_touch = 0
		end
	elseif(event.keyName == "d") then
		if(event.phase == "down") then
			tblTmp.x_touch = 1
		else
			tblTmp.x_touch = 0
		end
	elseif(event.keyName == "w") then
		if(event.phase == "down") then
			tblTmp.y_touch = -1
		else
			tblTmp.y_touch = 0
		end
	elseif(event.keyName == "s") then
		if(event.phase == "down") then
			tblTmp.y_touch = 1
		else
			tblTmp.y_touch = 0
		end
	end

	if(event.keyName == "spacebar") then
		if(event.phase == "down") then
			tblTmp.a_touched = true
			print( "A KEY was pressed" )
		else
			tblTmp.a_touched = false
		end
	end
	
	return false
end

local function show(group, x, y, width)--shows the rect for the dpad 
	local d = display.newImageRect(group, "assets/Movement.png", width, width)
	d.x = x  
	d.y = y  
	d:addEventListener( "touch", touchHandler )
	Runtime:addEventListener( "key", keyHandler )
end

tblTmp.show = show

return tblTmp







