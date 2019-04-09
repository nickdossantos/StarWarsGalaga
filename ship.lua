--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c5f651fa4e769949632b5e2773685694:404197610f41a50072cd6bfceacc226d:3e134714b0c9868467363d26cda1d966$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local physics = require( "physics")
physics.start( )
tblTmp = {}
local SheetInfo = {}



SheetInfo.sheet =
{
    frames = {
    
        {
            -- Win1
            x=1,
            y=1,
            width=400,
            height=428,

        },
        {
            -- Win4
            x=403,
            y=1,
            width=458,
            height=468,

        },
        {
            -- Win6
            x=1,
            y=471,
            width=524,
            height=552,

        },
        {
            -- Win7
            x=527,
            y=471,
            width=291,
            height=229,

        },
    },
    
    sheetContentWidth = 862,
    sheetContentHeight = 1024
}
SheetInfo.frameIndex =
{

    ["Win1"] = 1,
    ["Win4"] = 2,
    ["Win6"] = 3,
    ["Win7"] = 4,
}

local sequenceData =
{
    {name = "idle", start = 1, count = 1},
    {name = "explode", start= 2, count = 3, time = 250, loopCount = 1}
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

local bossImageSheet = graphics.newImageSheet( "assets/explodeShip.png", SheetInfo:getSheet() )

local boss2 = display.newSprite( bossImageSheet, sequenceData )

local bossHealth = 25 

local function showBoss( group, x, y)
group:insert(boss2)
boss2:toFront()
boss2.x = x 
boss2.y = y
physics.addBody(boss2, "static",{radius = 200})
boss2.type = "bossShip"
end
tblTmp.boss2 = boss2
tblTmp.bossHealth = bossHealth
tblTmp.showBoss = showBoss

return tblTmp
