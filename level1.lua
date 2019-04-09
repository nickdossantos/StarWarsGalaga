-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Nicholas Dos Santos 
-- Star Wars GALAGA
--Level1
-----------------------------------------------------------------------------------------

-- not level1 comment all back 
local physics = require( "physics")
physics.start( )
local enemeyShoot = require("enemeyShoot") 
local tieShoot1 = audio.loadSound("assets/tieShoot.wav")
local tieShootNoise = audio.loadSound( "assets/tieShoot.wav" )
local level1Group = display.newGroup( )
local boss3shootNoise = audio.loadSound("assets/boss3shoot.mp3")
level1Group.isVisible = false 
level1Complete = false 
H = display.contentHeight
W = display.contentWidth
tblTmp = {}

gameoverLevel1 = false 

local function startLevel1(  )--start game will initiate the next level an
	local tiesheet = require("tiesheet")
	local enemeyShoot = require("enemeyShoot")
	level1Group.isVisible = true 
	timer.performWithDelay( 2000,  showBosslevel1 )

	local function gameoverLevel1(  )--removes sprites when the level is over
		boss:removeSelf( )
		tiesheet.tie0:removeSelf( )
		tiesheet.tie1:removeSelf( )
		tiesheet.tie2:removeSelf( )
	end

	local function showBosslevel1(  )--shows the boss for level 1 when the health of the ties is 0
	if tiesheet.tie0.health == 0 and tiesheet.tie1.health == 0 and tiesheet.tie2.health == 0 then 
		local boss = require("ship" )

		if boss.bossHealth == 0 then  -- if bosses health = 0 then end teh level and call the next 
		local level2 = require("level2")
		level2.showLevel2()
		level1Complete = true
		else 
		local shootboss = audio.play( boss3shootNoise, {channel = 5, duration = 1500} ) -- if the level is not over then make the boss continue to shoot
		boss.showBoss(level1Group, W/2, H/4)
		enemeyShoot.enemeyShoot(level1Group, boss.boss2.x, boss.boss2.y)
		enemeyShoot.enemeyShoot(level1Group, boss.boss2.x +50, boss.boss2.y +50)
		enemeyShoot.enemeyShoot(level1Group, boss.boss2.x -50, boss.boss2.y +50)
		timer.performWithDelay( 1500, showBosslevel1 )
			end 
		end
	end
	local function tie0Shoot(  )-- makes the tie shoot
		if tiesheet.tie0.health == 0 then 
		showBosslevel1()
		else 
		--tie shooet noise was at 1000	
		audio.play( tieShootNoise,{channel = 6, duration = 1000}) -- plays audio before the shot
		enemeyShoot.enemeyShoot(level1Group, tiesheet.tie0.x, tiesheet.tie0.y ) --gets the given ties x and y and shoots from there 
		timer.performWithDelay( 2000,  tie0Shoot )
		end	
	end 	
	local function tie1Shoot(  )
		if tiesheet.tie1.health == 0 then 
		showBosslevel1()
		else 
		audio.play( tieShootNoise,{channel = 7, duration = 1500})
		enemeyShoot.enemeyShoot(level1Group, tiesheet.tie1.x, tiesheet.tie1.y )
		timer.performWithDelay( 1500,  tie1Shoot )
		end
	end
	local function tie2Shoot(  )
		if tiesheet.tie2.health == 0 then
		showBosslevel1()
		else 
		audio.play( tieShootNoise,{channel = 8, duration = 1500})
		enemeyShoot.enemeyShoot(level1Group, tiesheet.tie2.x, tiesheet.tie2.y )
		timer.performWithDelay( 1500,  tie2Shoot )
		end
	end 
	tiesheet.showTie(tiesheet.tie0, level1Group, W/2, H/4)-- loads a tie from the tie sheet 3 times for the level 
	tiesheet.showTie(tiesheet.tie1, level1Group, W/3, H*2/5)
	tiesheet.showTie(tiesheet.tie2, level1Group, W*2/3, H*2/5)
	timer.performWithDelay( 1500, tie0Shoot ) -- waits to make the ties shoot
	timer.performWithDelay( 1000,  tie1Shoot )
	timer.performWithDelay( 1000,  tie2Shoot )
end

tblTmp.gameoverLevel1 = gameoverLevel1
tblTmp.level1Complete = level1Complete
tblTmp.level1Group = level1Group
tblTmp.startLevel1 = startLevel1
tblTmp.tieDead = tieDead
return tblTmp
