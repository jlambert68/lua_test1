local date = require('date')

-- Function to shift the current date by a given number of days
function SubCustodyTodayShiftDay(inputArray)
    local d = date()


    if #inputArray ~= 4 then
        return "Error - there should be exactly four parameters in InputArray."

    end

    -- Extract ArraysIndexArray
    local arraysIndexArray = inputArray[2]

   -- Secure that no ArraysIndexArray is emtpty
   if (#arraysIndexArray > 0) then
       local error_message = "Error - array index is not supported. 'arraysIndexArray: " .. arraysIndexArray .. "'"

       return error_message
   end

   -- Extract FunctionArgumentsArray
   local functionArgumentsArray = inputArray[3]


   -- Handle different number of function arguments
    local shift_days = 0
   if (#functionArgumentsArray == 0) then
       shift_days = 0

   elseif (#functionArgumentsArray == 1) then
        shift_days = functionArgumentsArray[1]


    else 
       local error_message = "Error - more than 1 parameter argument. 'functionArgumentsArray: " .. functionArgumentsArray .. "'"

       return error_message

    end


    -- Current date and time
    local now = date()

    -- Add days
    local futureDate = now:adddays(shift_days)
    return  futureDate:fmt("%Y-%m-%d")

end


function TengoScriptStartingPoint(inputArray)
    print("Entering...")
    if #inputArray ~= 4 then
        return "Error - there should be exactly four parameters in InputArray."

    end

    local functionName = inputArray[1]
    local functionArguments = inputArray[3]

    if functionName == "SubCustody_TodayShiftDay" then
        return SubCustodyTodayShiftDay(inputArray)

    else
        return "ERROR - Unknown function '" .. functionName .. "'"

    end
end

-- Example invocation
local result = TengoScriptStartingPoint{"SubCustody_TodayShiftDay", {}, {0}, 0}
print(result)

