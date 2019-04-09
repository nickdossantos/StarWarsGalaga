--deathstar module 
tblTmp = {}

local groupLevel3 = display.newGroup( )

local deathstar = display.newImage( groupLevel3, "assets/deathstar.png" , W/2, H/4 )
deathstar.xScale = 1.5
deathstar.yScale = 1.5 
deathstar.health = 25
physics.addBody( deathstar, "static", {radius = 140})
deathstar.type = "deathstar"

tblTmp.deathstar = deathstar
return tblTmp