local background = display.newImage("img/background.png")
background.x = display.contentCenterX
background.y = display.contentCenterY

local star = display.newImage("img/star.png")
star.x = display.contentCenterX
star.y = display.contentCenterY
star:scale(0.5, 0.5)

local position = display.newText("X: "..tostring(star.x).." Y: "..tostring(star.y),0,-275)
position.anchorX = 0
position.anchory = 0

local starRotation = function()
    star.rotation = star.rotation + 1
end

Runtime:addEventListener( "enterFrame", starRotation )

local function onTouch( event )
    if "began" == event.phase then
        star.isFocus = true
        star.x0 = event.x - star.x
        star.y0 = event.y - star.y
    elseif star.isFocus then
        if "moved" == event.phase then
            star.x = event.x - star.x0
            star.y = event.y - star.y0
        elseif "ended" == phase or "cancelled" == phase then
            star.isFocus = false
        end
    end
    position.text = "X: "..tostring(star.x).." Y: "..tostring(star.y)
    return true
end

-- Only the background receives touches. 
background:addEventListener( "touch", onTouch)