H = display.contentHeight + 100 
W = display.contentWidth


tblTmp = {}

local function enemeyShoot(group, x,y )
	local x = x 
	local y = y 
	local green_bullett = display.newImage( group, "assets/bolt.png",x, y)--displays the new image 
	local function moveGreenBullett(  ) --function will be recursive and move the bullet from the enemey 
		green_bullett.y = green_bullett.y + 30 
		if(green_bullett.y >= H )then  -- removes the bullet if it is greater or equal to the height
			green_bullett:removeSelf( )
			else 
				timer.performWithDelay( 33, moveGreenBullett) -- calls the function again making the bullet move
		end 
	end
	physics.addBody( green_bullett, "dynamic" ) --adds physcics and sets the types
	green_bullett.type = "green_bullett"
	green_bullett.isSensor = true 
	green_bullett.gravityScale = 0 
	if(green_bullett ~= nil)then 
		timer.performWithDelay( 33, moveGreenBullett)
	end 
end

tblTmp.enemeyShoot = enemeyShoot -- returns the function to be used in other moduels
return tblTmp