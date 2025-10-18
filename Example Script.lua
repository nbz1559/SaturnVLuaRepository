local my_root = menu.my_root()

local example_list = menu.list(my_root, "Example List", "Open this for more options")

menu.action(example_list, "Log Something", "Writes Hello, World! to the log", function()
    notification.log("Hello, World!", true)
end)

menu.action(my_root, "Set your coords to 100, 100, 100", "Teleports you to 100, 100, 100", function()
    ENTITY.SET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), 100, 100, 100, false, false, false, false)
end)

local example_toggle = menu.toggle(my_root, "Draw a rectangleeeee", "Draws a 2D rectangle on your screen", false, true, function(state)
    -- Set the last param to true for things that need to run every frame, because setting it to true runs the code in this toggle every frame
	if state then
    	GRAPHICS.DRAW_RECT(0, 0, 0.5, 0.5, 255, 255, 255, 255) -- Last param is the alpha (AKA Transparency) setting it to 255 makes it completely opaque, setting it to 0 makes it completely transparent
	end
end)

menu.slider(my_root, "Set wanted level", "Change your wanted level from 0 - 5", 0, 5, 1, 0, true, function(value)
	 PLAYER.SET_PLAYER_WANTED_LEVEL(PLAYER.PLAYER_ID(), value, 0)
     PLAYER.SET_PLAYER_WANTED_LEVEL_NOW(PLAYER.PLAYER_ID(), 0)
end)

menu.slider_float(my_root, "Choose a decimal option", "Pick a option from 1.01 - 2.64", 1.01, 2.64, 0.01, 1.01, false, function(value)
	notification.log("User picked " .. value, true)
end)

menu.text_slider(my_root, "Choose an option", "Shows what you picked", 0, { "Option 1", "Option 2", "Option 3"}, function(index)
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

menu.list_select(my_root, "View Options", "Pick some options", {"Car", "Boat", "Plane"}, function(index)
    if index == 0 then
        notification.send("You picked car")
    else if index == 1 then
        notification.send("You picked boat")
    else if index == 2 then
        notification.send("You picked plane")
        end
    end
end
end)

menu.text_input(my_root, "Enter something", "Shows you what you inputted", function(text)
    notification.send(text)
end)

menu.hyper_link(my_root, "Open youtube", "Opens youtube.com", "https://www.youtube.com/")

menu.read_only(my_root, "GTA 5", "Sets your clipboard text to GTA 5")

menu.place_holder(my_root, " -- This is a place holder -- ")

menu.action(my_root, "Show vehicle handles", "Shows a notification for all vehicle handles, this will send a lot of notifications", function()
    local vehicles = entity.get_all_vehicles(true) -- true means it will get the players vehicle
    local size = #vehicles

    for i = 1, size do
        local vehicleHandle = vehicles[i]
        notification.send(tostring(vehicleHandle)) -- Sends a notification of the vehicles handle ID
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicleHandle, 1000) -- Do something to the vehicle handle
    end
end)
