--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e54b18d2f6d93e0c262481d6f47026e1:c987bb1ce1c7c8b20055b9f440281a7f:a80fcaf0addfc44e40e2c296d326d58d$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

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
            x=1,
            y=67,
            width=64,
            height=64,

        },
        {
            -- Tie3
            x=67,
            y=65,
            width=55,
            height=64,

        },
        {
            -- Tie4
            x=67,
            y=1,
            width=60,
            height=62,

        },
        {
            -- Tie6
            x=1,
            y=133,
            width=64,
            height=64,

        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 198
}

SheetInfo.frameIndex =
{

    ["Tie1"] = 1,
    ["Tie2"] = 2,
    ["Tie3"] = 3,
    ["Tie4"] = 4,
    ["Tie6"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
