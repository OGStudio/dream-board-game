
-- Define an instance of a background color toggler.
local colorToggler = {
    -- Reference system camera instance.
    camera = main.application.camera,

    -- Background colors to toggle between.
    colors = {
        {0, 1, 0},
        {1, 0, 0},
    },
    -- Track toggled state.
    isToggled = true,
    -- Function to reset color.
    reset = function(self)
        self.camera.clearColor = self.colors[1]
    end,
    -- Function to toggle color.
    toggle = function(self)
        -- Toggle.
        self.isToggled = not self.isToggled
        -- Apply.
        if self.isToggled
        then
            self.camera.clearColor = self.colors[1]
        else
            self.camera.clearColor = self.colors[2]
        end
    end,
}

-- Reset color.
colorToggler:reset()

local mouse = main.application.mouse
-- Toggle color upon mouse click.
mouse.pressedButtonsChanged:addCallback(
    function()
        -- Detect click.
        if (#mouse.pressedButtons > 0)
        then
            colorToggler:toggle()
        end
    end
)
