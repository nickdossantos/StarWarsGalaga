-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Nicholas Dos Santos 
-- Star Wars GALAGA
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar( display.HiddenStatusBar )

local physics = require( "physics")
physics.start( )
-- physics.setDrawMode( "hybrid" )

--H & W are display 
H = display.contentHeight 
W = display.contentWidth

--groups
local splashGroup = display.newGroup( )
local gSplash = display.newGroup()
local optionsMenu = display.newGroup( )
local staticGroup = display.newGroup( ) -- group for static images on the screen
local gamveOverGroup = display.newGroup( )
staticGroup:toBack( )
staticGroup.isVisible = false 
gameStarted = false
-- sets groups and makes some bools for game started to true 

--Sounds
local falconEngine = audio.loadSound( "assets/falcon.wav" )
local btnNoise = audio.loadSound( "assets/button.mp3" )
local btnBack = audio.loadSound("assets/buttonBack.mp3")
local falconShooting = audio.loadSound( "assets/falconShooting.wav")
local bossBlowup = audio.loadSound( "assets/bossExplosion.wav" )
local xwingNoise = audio.loadSound( "assets/xwingShot.mp3"  )
local theme = audio.loadStream( "assets/theme1.mp3" )
audio.play( theme, {channel= 1})
audio.setVolume( 0.5, { channel=1 } )
audio.setVolume( .5 )
local gameOverAudio = audio.loadStream( "assets/gameOverMusic.mp3" )
--Sounds and sets volume to half so it wont be to loud

--requires 
local dpad = require("dpad")
dpad.show(staticGroup, 160, H -125, 200)
local abutton = display.newImage(staticGroup,"assets/A.png", W-150, H -110  )

local healthbar = require("healthbar")-- gets the health bar sprite and sets it to the static group 
staticGroup:insert( healthbar )
healthbar:toFront( )
healthbar:play( )

local level1 = require("level1")
level1.level1Group.isVisible = false 
-- local tiesheet = require("tiesheet")
-- local level2 = require("level2")



--Static Object 
shipName = "xwing1"-- if I want to add a new sprite function 
local player = display.newImage(staticGroup,"assets/".. shipName ..".png", W/2, H*3/4 )
player.xScale = 2
player.yScale = 2 
player.speed = 25 -- px per second / 30 fps
player.score = 0
player.health = 5
physics.addBody( player,"static", {radius = 55})
player.type = "player"
local bg1 = display.newImageRect( staticGroup, "assets/bg1.jpg", W, H)
bg1.x  = W/2 
bg1.y = H/2 
bg1:toBack()
local bg2 = display.newImageRect( staticGroup, "assets/bg2.jpg",W, H)
bg2.x = W/2
bg2.y = -H/2  
bg2:toBack()
staticGroup.score = display.newText( staticGroup, "score: ", W*2/3, 30,"SF Distant Galaxy", 50 )
healthbar:setSequence( "health"..player.health )
--static objects


local function showLevel1(  )-- starts level 1 
	level1.startLevel1()
end

function tapHandler(event) --starts the game once the start button is clicked 
	gSplash.isVisible = false 
	staticGroup.isVisible = true --dpad, score, health, player(falcon)
	gameStarted = true 
	audio.play( falconEngine)
	level1.gameStarted = true 
	timer.performWithDelay( 2000, showLevel1 )
	
end

function showSplash( )-- shows the spalsh screen to start the game with a back button 
	gSplash.isVisible = true 
	optionsMenu.isVisible = false
	local btnBackChannel = audio.play( btnBack, {channel= 2, duration= 1000})
end

function showOptionsMenu( ) -- shows the options menu 
	showoptionsMenuSound = audio.play( btnNoise, {channel = 3, duration = 1000} )
	local function soundOffHandler( soundOff)-- turns the sound off w volume 
	audio.setVolume( 0.0 )
	end

	local function soundOnHandler( soundOn)-- turns the sound on 
	local soundOnNoise = audio.play( btnNoise, {channel= 2,duration = 1000})
	audio.setVolume( 1.0 )
	end

	-- all the text for the options menu 
	gSplash.isVisible = false 
	optionsMenu.isVisible = true 
	text0 = display.newText( optionsMenu, "How to Play ", W/2, H/2, 'SF Distant Galaxy', 50)
	text1 = display.newText( optionsMenu, "You can only get hit five times.", W/2, H/2 + 50, "SF Distant Galaxy", 30 )
	text2 = display.newText( optionsMenu, "Use the Dpad to move left and right.", W/2, H/2 + 100, "SF Distant Galaxy", 30 )
	text3 = display.newText( optionsMenu, "press a to shoot.", W/2, H/2 + 150, "SF Distant Galaxy", 30 )
	text4 = display.newText( optionsMenu, "Welcome to", W/2, H/6, "SF Distant Galaxy", 50 )
	text4:setFillColor(1,1,0)
	text6 = display.newText( optionsMenu, "Star wars galaga", W/2, H/6 + 200, "SF Distant Galaxy", 65 )
	text6:setFillColor(1,1,0)
	text5 = display.newText( optionsMenu, "Destroy all enemies to win.", W/2, H/2+200, "SF Distant Galaxy", 30 )
	text7 = display.newText( optionsMenu, "Made by: Nick Dos Santos, December 2016", W/2, H/2+300, "SF Distant Galaxy", 25 )
	local menuButtonBack = display.newImage( optionsMenu, "assets/closebtn.png" , 650, H - 60)
	menuButtonBack:addEventListener( "tap", showSplash )
	soundOff = display.newImage( optionsMenu, "assets/soundOff.png", 80, H - 60  )
	soundOff:addEventListener( "tap", soundOffHandler )
	soundOff.xScale = 1.5 
	soundOff.yScale = 1.5
	soundOn = display.newImage( optionsMenu, "assets/soundOn.png", 200, H - 60)
	soundOn:addEventListener( "tap", soundOnHandler )
	soundOn.yScale = 1.5 
	soundOn.xScale = 1.5
	-- text for the options menu with buttons for sound on and off 
end

--Splash stuff
local wallpaper = display.newImage( gSplash, "assets/splashwallpaper.jpg", W/2, H/2)
local starwars = display.newImage( gSplash,  "assets/starwarstxt.png", W/2, H/5)
local galagawallpaper = display.newImage( gSplash, "assets/galagatxt.png", W/2, H/2 - 75)
local menuButton = display.newImage( gSplash, "assets/menu.png" , 650, H -60 )
menuButton:addEventListener( "tap", showOptionsMenu )
wallpaper.xScale = 2
wallpaper.yScale = 2
menuButton.xScale = 1.5
menuButton.yScale = 1.5
galagawallpaper.xScale = 1
galagawallpaper.yScale = 1
starwars.xScale = .65
starwars.yScale = .65
local playButton = display.newImage(gSplash, "assets/playbtn.png", W/2, H*(3/4) )
playButton.xScale = 1.5
playButton.yScale = 1.5
playButton:addEventListener( "tap", tapHandler ) 
--Splash stuff 

local function updateScores(  )-- function that changes the score for the player 
	staticGroup.score.text = "score: ".. player.score
end
local function changeScore( amt )
	player.score = player.score + amt 
	updateScores()
end

changeScore(0) -- sets the inital score to 0 


function bgScroll( event )-- moves the backdrop 
bg1.y = bg1.y +10 
bg2.y = bg2.y +10 
	if(bg1.y >H + H/2 )then 
		bg1.y = -H/2
	elseif (bg2.y >= H + H/2)then
		bg2.y = -H/2 
	end
end 

function onRedraw(event) -- constantly checks for the player
	player.x = player.x + (dpad.x_touch * player.speed)
	--player.y = player.y + (dpad.y_touch * player.speed) -- if I wanted y movement
	if(player.x <= 60) then --sets the boundrys of for the player left and right
		player.x = 60
	elseif (player.x >= 690)then 
		player.x = 690
	end 

end

local function removeDeathstar(  )--removes the death star and plays noise 
	local deathstar = require("lastBoss" )
	function removebossDeathStar(  )
		deathstar.deathstar:removeSelf( )
	end
	physics.removeBody( deathstar.deathstar )
	timer.performWithDelay( 1,  removebossDeathStar )
	audio.play( bossBlowup, {channel= 5, duration= 1000})
end

function removeboss3body( ) -- removes the body of the boss 
	local starDestroyer = require("starboss3") 
	function removeBoss3( )
	starDestroyer.starDestroyer:removeSelf( )
	end
	physics.removeBody( starDestroyer.starDestroyer )
	timer.performWithDelay( 1,  removeBoss3 )
	audio.play( bossBlowup, {channel= 5, duration= 1000})
end
function removeBoss1Body( )--removes the body for the 1st boss
	local boss = require("ship") 
	function removeBoss( )
	boss.boss2:removeSelf( )
	end
	physics.removeBody( boss.boss2 )
	timer.performWithDelay( 255,  removeBoss )
end

function showRedBoltHit( event) -- displayes another image when the player hits something 
	local rbh = display.newImage( staticGroup, "assets/boltHit.png", event.target.x, event.target.y)
	function removeRedBoltHit( )
	rbh:removeSelf( )
	end
	timer.performWithDelay( 50,  removeRedBoltHit )
end
function greenBoltHit() -- displays teh green bolt hit when a bolt hits the player 
	local gbh = display.newImage( staticGroup, "assets/bolt2.png", player.x, player.y )
	function removeGreenBoltHit(  )
		gbh:removeSelf( )
	end
	timer.performWithDelay( 50,  removeGreenBoltHit )
end


function bulletColided( event ) -- remves the bullet on a collision 
	function removetie(  )
		event.other:removeSelf( )
	end

local function removeTieBody ( )
	physics.removeBody( tiesheet.tie)
	timer.performWithDelay( 1,  removetie )
	end

	function movetheBullet(  )
		event.target.y = -125 --moves target off the screen so it can be deleted 
	end
		if(event.other.type == "bossShip")then  -- if boss is 0 then remove it
		local boss = require("ship") 
		showRedBoltHit(event)
		timer.performWithDelay( 1,  movetheBullet )
		boss.bossHealth = boss.bossHealth -1 
		if(boss.bossHealth <= 0)then 	
		changeScore(50)
		boss.bossHealth = 0 
		boss.boss2:setSequence("explode")
		boss.boss2:play( )
		audio.play( bossBlowup, {channel= 32, duration= 500})
		timer.performWithDelay( 1, removeBoss1Body )
	end 
end 
	if event.other.type == "tieFighter"then -- if tie is 0 then remove it
		showRedBoltHit(event)
		timer.performWithDelay( 1,  movetheBullet )
		event.other.health = event.other.health - 1
		if event.other.health <= 0 then 
		changeScore(10)
		-- tiesheet.tieHealth = 0  was 1000 below
		audio.play( bossBlowup, {channel= 32, duration= 500})
		timer.performWithDelay( 1, removetie )
		end
	end
	if event.other.type == "starDestroyer"then -- if star destroyer is 0 then remove it 
		showRedBoltHit(event)
		timer.performWithDelay( 1,  movetheBullet )
		event.other.health = event.other.health - 1 
		if event.other.health == 0 then 
			changeScore(85)
			-- audio.play( bossBlowup, {channel= 5, duration= 1000})
			audio.play( bossBlowup, {channel= 32, duration= 500})
			timer.performWithDelay( 1,  removeboss3body )
		end 
	end 
	if event.other.type == "deathstar"then -- if death star is 0 then remove it 
		showRedBoltHit(event)
		timer.performWithDelay( 1,  movetheBullet )
		event.other.health = event.other.health -1 
		if event.other.health == 0 then 
			audio.play( bossBlowup, {channel= 32, duration= 500})
			changeScore(100)
			timer.performWithDelay( 1, removeDeathstar )
		end 
	end
end 
local function playerHit( event ) -- if the player is hit
	local function moveProjectile(  ) -- moves the projectile off screen so it can be deleted 
	event.other.y = H+3 
	event.other.x = H +3
	end
	local enemeyShoot = require("enemeyShoot" )
	if event.other.type == "green_bullett" and event.phase == "began" then
	greenBoltHit()
	player.health = player.health -1  
	healthbar:setSequence( "health"..player.health )
	healthbar:play( )
	timer.performWithDelay( 1,  moveProjectile )
	end 
	if player.health == 0 then -- if the players health is 0 
		gamveOverGroup:toFront( )
		backdropGameOver = display.newRect( gamveOverGroup, W/2, H/2, W, H )
		backdropGameOver:setFillColor( 0,0,0 )
		backdropGameOver:toFront( )
		gameoverTxt = display.newText( gamveOverGroup, "GAME OVER", W/2, H/2, "SF Distant Galaxy" , 55 )
		gameoverTxt1 = display.newText( gamveOverGroup, "Thanks for playing", W/2, H/2 + 100, "SF Distant Galaxy" , 40 )
		Runtime:removeEventListener("enterFrame",onRedraw)
		Runtime:removeEventListener( "enterFrame", bgScroll )
		audio.setVolume( 0,  {channel = 1}) -- sets channels to 0 
		audio.setVolume( 0, {channel = 32} )
		audio.setVolume( 0, {channel = 2} )
		audio.setVolume( 0, {channel = 3} )
		audio.setVolume( 0, {channel = 4} )
		audio.setVolume( 0, {channel = 5} )
		audio.setVolume( 0, {channel = 6} )
		audio.setVolume( 0, {channel = 7} )
		audio.setVolume( 0, {channel = 8} )
		audio.setVolume( 0, {channel = 9} )
		player:removeSelf( )
		staticGroup.isVisible = false 
		abutton.isVisible = false 
		level1.gameoverLevel1 = true 
		audio.play( gameOverAudio, {channel = 31})
	end 
 end

function blast(event ) -- shoot for the player
	if player ~= nil then 
	local xwingshooting = audio.play(xwingNoise, {channel = 21, duration = 300})
	local x = player.x
	local y = player.y -100

	local new_bullet = display.newImage( staticGroup, "assets/redbolt.png", x, y )	-- creates a new bullet for every shot 
	local function move_bullet(  )
	new_bullet.y = new_bullet.y -35
		if(new_bullet.y < -120)then -- if bullet off screen it gets removed 
			new_bullet:removeSelf( )
		else timer.performWithDelay( 33, move_bullet, 1 )
		end 
	end
	physics.addBody( new_bullet, "dynamic" )
	new_bullet.type = "bullet"
	new_bullet.isSensor = true 
	new_bullet.gravityScale = 0 
	new_bullet:addEventListener( "collision", bulletColided )
	if (new_bullet ~= nil)then 
	timer.performWithDelay( 33, move_bullet, 1 )
	end 
end 
end

function delayBlast(  )--Sets the FIRE RATE for the player..
	function addEventListenerBack( )
		abutton:addEventListener("tap", delayBlast)
	end
	timer.performWithDelay( 25,  blast )
	abutton:removeEventListener( "tap", delayBlast )
	timer.performWithDelay(	200, addEventListenerBack )--sets the wait time between shots
end

abutton:addEventListener( "tap", delayBlast ) --Shooting listener
player:addEventListener( "collision", playerHit )-- collision listener for player
Runtime:addEventListener( "enterFrame", onRedraw ) 
Runtime:addEventListener( "enterFrame", bgScroll ) -- scrolls the backgroud 






