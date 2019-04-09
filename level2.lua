local physics = require("physics")
physics.start( )
local tieShootNoise = audio.loadSound( "assets/tieShoot.wav" )
local boss3shootNoise = audio.loadSound("assets/boss3shoot.mp3")
tblTmp = {}
local level1 = require("level1")
local groupLevel2 = display.newGroup( )

local function showLevel2(  )
	local starDestroyer = require("starboss3" )-- load the requirements for this level
	local tiesheet = require("tiesheet")
	local enemeyShoot = require("enemeyShoot")
	local function showLevel3( )
		if starDestroyer.starDestroyer.health == 0  and tiesheet.tie3.health == 0 and tiesheet.tie4.health == 0 then -- if everythings health is 0 then the next level will be shown
			local level3 = require("level3" )
			level3.showLevel3() 
			else 
			print ("waiting for things to die")
		end
	end 
	local function bossShoot(  ) -- makes the boss shoot on this level
		if starDestroyer.starDestroyer.health == 0 then -- shows level 3 when the bosses health is 0 
		showLevel3()
		elseif starDestroyer.starDestroyer.health  >  0  then 
		local shootboss = audio.play( boss3shootNoise, {channel = 5, duration = 1500} )
		enemeyShoot.enemeyShoot(groupLevel2, starDestroyer.starDestroyer.x + 100, starDestroyer.starDestroyer.y + 150)
		enemeyShoot.enemeyShoot(groupLevel2, starDestroyer.starDestroyer.x, starDestroyer.starDestroyer.y + 150)
		enemeyShoot.enemeyShoot(groupLevel2, starDestroyer.starDestroyer.x - 100 , starDestroyer.starDestroyer.y + 150)
		timer.performWithDelay( 1800, bossShoot )
		end
	end 
	local function tie3Shoot( ) -- enemeys shoot recursivly 
		if tiesheet.tie3.health == 0 then -- calls show level 3 when health is 0 
		showLevel3()
		else 
		audio.play( tieShootNoise,{channel = 6, duration = 1000})
		enemeyShoot.enemeyShoot(groupLevel2, tiesheet.tie3.x, tiesheet.tie3.y )
		timer.performWithDelay( 1000,  tie3Shoot )
		end
	end 
	local function tie4Shoot( )
		if tiesheet.tie4.health == 0 then
		showLevel3()
		else 
		audio.play( tieShootNoise,{channel = 7, duration = 1000})
		enemeyShoot.enemeyShoot(groupLevel2, tiesheet.tie4.x, tiesheet.tie4.y )
		timer.performWithDelay( 1000,  tie4Shoot )
		end
	end 
	tiesheet.showTie(tiesheet.tie3, groupLevel2, W/4, H/2)
	timer.performWithDelay( 1000, tie3Shoot )
	tiesheet.showTie(tiesheet.tie4, groupLevel2, W*3/4, H/2)
	timer.performWithDelay( 1200, tie4Shoot )
	bossShoot()
end

tblTmp.showLevel2 = showLevel2
return tblTmp