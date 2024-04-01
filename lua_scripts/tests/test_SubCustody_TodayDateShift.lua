
local assert = require "luassert"
local mymodule = require('src/SubCusotdy_TodayDateShift')
local date = require('date')

local tests = {}

-- Check that Todays date is produced
function tests.is_today()
    local today = date()
    local expectedDateResponse = today:fmt("%Y-%m-%d")
    local inputArray = {"SubCustody_TodayShiftDay", {}, {0}, 0}
    local response = TengoScriptStartingPoint(inputArray)

    assert.is_equal(expectedDateResponse, response)

end

-- Check that Yesterdays date is produced
function tests.is_yesterday()
    local today = date()
    local shoftedDate = today:adddays(-1)
    local expectedDateResponse = today:fmt("%Y-%m-%d")
    local inputArray = {"SubCustody_TodayShiftDay", {}, {-1}, 0}
    local response = TengoScriptStartingPoint(inputArray)

    assert.is_equal(expectedDateResponse, response)

end

-- Check that Tomorrows date is produced
function tests.is_tomorrow()
    local today = date()
    local shoftedDate = today:adddays(1)
    local expectedDateResponse = today:fmt("%Y-%m-%d")
    local inputArray = {"SubCustody_TodayShiftDay", {}, {1}, 0}
    local response = TengoScriptStartingPoint(inputArray)

    assert.is_equal(expectedDateResponse, response)

end

--tests.test_my_func()

return tests





