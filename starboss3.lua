--Star Destroyer Module 

tblTmp = {}

local groupLevel2 = display.newGroup( )

local starDestroyer = display.newImage( groupLevel2, "assets/boss4.png", W/2, H/5 )
starDestroyer.health = 35 
starDestroyer.xScale = 3.5
starDestroyer.yScale = 3.5
physics.addBody( starDestroyer, "static",{radius = 250} )
starDestroyer.type = "starDestroyer"
tblTmp.starDestroyer = starDestroyer
return tblTmp