function AABB(rect1, rect2)
    local r1 = {
        left = rect1.x,
        right = rect1.x + rect1.width,
        top = rect1.y,
        bottom = rect1.y + rect1.height
    }

    local r2 = {
        left = rect2.x,
        right = rect2.x + rect2.width,
        top = rect2.y,
        bottom = rect2.y + rect2.height
    }

    if r1.right > r2.left and r1.left < r2.left and r1.top < r2.bottom and r1.bottom > r2.top then
        return true
    else
        return false
    end
end
