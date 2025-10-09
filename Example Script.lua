local my_root = menu.my_root()

-- Variable example_list is required to add things to it
local example_list = menu.list(my_root, "Example List", "Open this for more options")

-- Variable example_action_1 is optional
local example_action_1 = menu.action(example_list, "Log Something", "Writes Hello, World! to the log", function()
    notification.log("Hello, World!", true)
end)

-- Variable example_action_2 is optional
local example_action_2 = menu.action(my_root, "Set your coords to 100, 100, 100", "Teleports you to 100, 100, 100", function()
    ENTITY.SET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), 100, 100, 100, false, false, false, false)
end)

-- Variable example_toggle is optional
local example_toggle = menu.toggle(my_root, "Draw a rectangle", "Draws a 2D rectangle on your screen", false, true, function(state)
    -- Set the last param to true for things that need to run every frame, because setting it to true runs the code in this toggle every frame
    GRAPHICS.DRAW_RECT(0, 0, 0.5, 0.5, 255, 255, 255, 255) -- Last param is the alpha (AKA Transparency) setting it to 255 makes it completely opaque, setting it to 0 makes it completely transparent
end)

-- Variable example_slider is optional
local example_slider = menu.slider(my_root, "Set wanted level", "Change your wanted level from 0 - 5", 0, 5, 1, 0, true, function(value)
	 PLAYER.SET_PLAYER_WANTED_LEVEL(PLAYER.PLAYER_ID(), value, 0)
     PLAYER.SET_PLAYER_WANTED_LEVEL_NOW(PLAYER.PLAYER_ID(), 0)
end)

-- Variable example_slider_float is optional
local example_slider_float = menu.slider_float(my_root, "Choose a decimal option", "Pick a option from 1.01 - 2.64", 1.01, 2.64, 0.01, 1.01, false, function(value)
	notification.log("User picked " .. value, true)
end)

local example_text_slider_options = {
    "Option 1",
    "Option 2",
    "Option 3"
}

-- Variable example_text_slider is optional
local example_text_slider = menu.text_slider(my_root, "Choose an option", "Shows what you picked", 0, example_text_slider_options, function(index)
    if index == 0 then
        notification.send("You picked Option 1")
    else if index == 1 then
        notification.send("You picked Option 2")
    else if index == 2 then
        notification.send("You picked Option 3")
    end
    end
    end
end)

-- Variable example_text_input is optional
local example_text_input = menu.text_input(my_root, "Enter something", "Shows you what you inputted", function(text)
    notification.send(text)
end)

-- Variable example_hyper_link is optional
local example_hyper_link = menu.hyper_link(my_root, "Open youtube", "Opens youtube.com", "https://www.youtube.com/")

-- Variable example_place_holder is optional
local example_place_holder = menu.place_holder(my_root, " -- This is a place holder -- ")

-- Variable example_action_3 is optional
local example_action_3 = menu.action(my_root, "Show vehicle handles", "Shows a notification for all vehicle handles, this will send a lot of notifications", function()
    local vehicles = entity.get_all_vehicles(true) -- true means it will get the players vehicle
    local size = #vehicles

    for i = 1, size do
        local vehicleHandle = vehicles[i]
        notification.send(tostring(vehicleHandle)) -- Sends a notification of the vehicles handle ID
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicleHandle, 1000) -- Do something to the vehicle handle
    end
end)
