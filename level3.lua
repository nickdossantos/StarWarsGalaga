--level 3.lua
local physics = require("physics")
physics.start( )

--loads the sounds for the level 
local tieShootNoise = audio.loadSound( "assets/tieShoot.wav" )
local boss3shootNoise = audio.loadSound("assets/boss3shoot.mp3")
local deathstarShootNoise = audio.loadSound( "assets/deathstarNoise.wav" )
local gameWonMusic = audio.loadSound( "assets/winMusic.mp3" )
-- load the sounds for the level 

local groupLevel3 = display.newGroup( )
local gameWonGroup = display.newGroup( )
tblTmp = {}

local function showLevel3(  )
	local enemeyShoot = require("enemeyShoot")
	local tiesheet = require("tiesheet")
	local deathstar = require("lastBoss" )	

	local function gameWon(  )
		if deathstar.deathstar.health == 0 and tiesheet.tie5.health == 0 and tiesheet.tie6.health == 0  then -- the game won screen will be shown when everything is destroyed 
		wonText = display.newText( gameWonGroup, "YOU WON", W/2, H/2 , "SF Distant Galaxy", 40 ) --displays text to the screen 
		wonText1 = display.newText( gameWonGroup, "thanks for playing!", W/2, H/2 +100 , "SF Distant Galaxy", 30 )
		wonText:toFront( )
		gameWonbg = display.newRect( gameWonGroup, W/2, H/2, W, H )-- makes a rect that covers the level 3 level then plays the won sound track 
		gameWonbg:setFillColor( 0,0,0 )
		gameWonbg:toBack( )
		audio.play( gameWonMusic, {channel = 30} )
		audio.setVolume( 0, {channel = 21} )
		else 
		print("waiting for things to die")
		end 
	end
	local function deathstarShoot(  )-- makes the death star shoot 3 times and calls the game won function 
		if deathstar.deathstar.health == 0 then 
		gameWon()
		elseif deathstar.deathstar.health > 0 then 
		audio.play( deathstarShootNoise,{channel = 5})	
		enemeyShoot.enemeyShoot(groupLevel3, deathstar.deathstar.x ,deathstar.deathstar.y + 150)
		enemeyShoot.enemeyShoot(groupLevel3,deathstar.deathstar.x + 100 ,deathstar.deathstar.y + 100)
		enemeyShoot.enemeyShoot(groupLevel3,deathstar.deathstar.x - 100 ,deathstar.deathstar.y + 100)
		timer.performWithDelay( 1200,  deathstarShoot )
		end
	end 
	local function tie5Shoot( ) -- makes tie shoot stops if health is 0 
		if tiesheet.tie5.health == 0 then 
		gameWon()
		else 
		audio.play( tieShootNoise,{channel = 6, duration = 1000})	
		enemeyShoot.enemeyShoot(groupLevel3, tiesheet.tie5.x, tiesheet.tie5.y )
		timer.performWithDelay( 1000, tie5Shoot )
		end
	end 
	local function tie6Shoot( )
		if tiesheet.tie6.health == 0 then 
		gameWon()
		else 
		audio.play( tieShootNoise,{channel = 6, duration = 1000})	
		enemeyShoot.enemeyShoot(groupLevel3, tiesheet.tie6.x, tiesheet.tie6.y )
		timer.performWithDelay( 1000, tie6Shoot )
		end
	end 
	-- places the ties and delays teh shoot time off the start 
	tiesheet.showTie(tiesheet.tie5, groupLevel3, W/4, H *2/5)
	tiesheet.showTie(tiesheet.tie6, groupLevel3, W*3/4, H *2/5)
	timer.performWithDelay( 1000, tie5Shoot )
	timer.performWithDelay( 1000, tie6Shoot )
	timer.performWithDelay( 1200,  deathstarShoot )
end 
showLevel3()
tblTmp.showLevel3 = showLevel3
return tblTmp