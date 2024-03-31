local date = require('date')

-- Function to shift the current date by a given number of days
function subCustodyTodayShiftDay(inputArray)
    local d = date()

    -- Extract ArraysIndexArray
    local arraysIndexArray = inputArray[0]

   -- Secure that no ArraysIndexArray is emtpty
   if (#arraysIndexArray > 0) then
       local error_message = "Error - array index is not supported. 'arraysIndexArray: " .. arraysIndexArray .. "'"

       return error_message
   end

   -- Extract FunctionArgumentsArray
   local functionArgumentsArray = inputArray[1]

   -- Handle different number of function arguments
    local shift_days = 0
   if (#functionArgumentsArray == 0) then
       shift_days = 0

   elseif (#functionArgumentsArray == 1) then
        shift_days = functionArgumentsArray[0]


    else 
       local error_message = "Error - more than 1 parameter argument. 'functionArgumentsArray: " .. functionArgumentsArray .. "'"

       return error_message

    end


    -- Current date and time
    local now = date()

    -- Add days
    local futureDate = now:adddays(shiftDays)
    return  futureDate:fmt("%Y-%m-%d")

end

    -- Example usage with shiftDays = 5
    local shiftedDate = subCustodyTodayShiftDay(-5)
    print(shiftedDate)


function tengoScriptStartingPoint(inputArray)
    if #inputArray ~= 4 then
        return "Error - there should be exactly four parameters in InputArray."

    end

    local functionName = inputArray[1]
    local functionArguments = inputArray[2]

    if functionName == "SubCustody_TodayShiftDay" then
        local shiftDays = functionArguments[1]
        return subCustodyTodayShiftDay(shiftDays)

    else
        return "ERROR - Unknown function '" .. functionName .. "'"

    end
end

-- Example invocation
local result = tengoScriptStartingPoint{"SubCustody_TodayShiftDay", {5}, {}, 0}
print(result)

