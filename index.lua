-- Shortcuts to system instances.
local camera = main.application.camera
local mouse = main.application.mouse

-- Background colors to toggle between.
local bgColor0 = {0, 1, 0}
local bgColor1 = {1, 0, 0}

-- Set initial color.
camera.clearColor = bgColor0
-- Track color state.
local isBGColor0 = true

-- Function to toggle color.
local function toggleBGColor()
    isBGColor0 = not isBGColor0
    -- Apply.
    if isBGColor0
    then
        camera.clearColor = bgColor0
    else
        camera.clearColor = bgColor1
    end
end

-- Toggle color upon mouse click.
mouse.pressedButtonsChanged:addCallback(
    function()
        -- Detect click.
        if (#mouse.pressedButtons > 0)
        then
            toggleBGColor()
        end
    end
)
