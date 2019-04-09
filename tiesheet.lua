--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2fde428625fbd54490bb99a2786bc090:e84a5a53257d524d24b4352b595158de:f31d9c6ad8a9076e30129d1f10abb819$
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
            -- Tie1
            x=1,
            y=1,
            width=64,
            height=64,

        },
        {
            -- Tie2
            x=67,
            y=1,
            width=64,
            height=64,

        },
        {
            -- Tie3
            x=323,
            y=1,
            width=55,
            height=64,

        },
        {
            -- Tie4
            x=199,
            y=1,
            width=60,
            height=62,

        },
        {
            -- Tie5
            x=380,
            y=1,
            width=55,
            height=64,

        },
        {
            -- Tie6
            x=133,
            y=1,
            width=64,
            height=64,

        },
        {
            -- Tie7
            x=261,
            y=1,
            width=60,
            height=62,

        },
    },
    
    sheetContentWidth = 436,
    sheetContentHeight = 66
}

SheetInfo.frameIndex =
{
    ["Tie1"] = 1,
    ["Tie2"] = 2,
    ["Tie3"] = 3,
    ["Tie4"] = 4,
    ["Tie5"] = 5,
    ["Tie6"] = 6,
    ["Tie7"] = 7,
}

local sequenceData = 
{
    {name = "idle", start = 4, count = 1 },
    {name = "shoot", start = 4,count = 3, frames = 3, 6, 7, time = 250 }
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

local tieImageSheet = graphics.newImageSheet( "assets/tieEnemey.png", SheetInfo:getSheet() )

local tie0 = display.newSprite( tieImageSheet, sequenceData )
local tie1 = display.newSprite( tieImageSheet, sequenceData )
local tie2 = display.newSprite( tieImageSheet, sequenceData )
local tie3 = display.newSprite( tieImageSheet, sequenceData )
local tie4 = display.newSprite( tieImageSheet, sequenceData )
local tie5 = display.newSprite( tieImageSheet, sequenceData )
local tie6 = display.newSprite( tieImageSheet, sequenceData )
local tie7 = display.newSprite( tieImageSheet, sequenceData )
-- tieHealth = 20 
-- local tie.isVisable = false

local function showTie(tieSprite ,group, x, y)
    -- if tie ~= nil then 
    -- group:insert(tieSprite)
    tieSprite:toFront( )
    tieSprite.xScale = 1.5 
    tieSprite.yScale = 1.5 
    tieSprite.x = x 
    tieSprite.y = y 
    tieSprite.health = 10
    physics.addBody(tieSprite, "static", {radius= 65 })
    tieSprite.type = "tieFighter"
    -- elseif tie == nil then 
    --     print ("IM NIL")
    -- end 
end

-- tblTmp.tieHealth = tieHealth
tblTmp.tie0 = tie0
tblTmp.tie1 = tie1
tblTmp.tie2 = tie2
tblTmp.tie3 = tie3
tblTmp.tie4 = tie4 
tblTmp.tie5 = tie5
tblTmp.tie6 = tie6
tblTmp.showTie = showTie 

return tblTmp
