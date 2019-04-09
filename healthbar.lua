local SheetInfo = {}

--sets options for the health bar
local options = {
   width = 1020/5,
   height = 30,
   sheetWidth = 1020,
   sheetHeight = 30,
   numFrames = 5
}
local healthSheet = graphics.newImageSheet( "assets/healthbar.png", options )


local sequenceData = {
   { name = "health5", start=1, count=1, time=0,   loopCount=1, frames = 1},
   { name = "health4", start=2, count=1, time=100, loopCount=1, frames = 2},
   { name = "health3", start=3, count=1, time=200, loopCount=1, frames = 3},
   { name = "health2", start=4, count=1, time=300, loopCount=1, frames = 4},
   { name = "health1", start=5, count=1, time=400, loopCount=1, frames = 5}
}

	local healthSprite = display.newSprite( healthSheet, sequenceData )
	healthSprite.x = 100
	healthSprite.y = 25

return healthSprite