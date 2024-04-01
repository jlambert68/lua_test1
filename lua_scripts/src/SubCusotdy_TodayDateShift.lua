local date = require('date')

-- Function to shift the current date by a given number of days
function SubCustody_TodayShiftDay(inputTable)
    local d = date()
    
    --inputTable = {
    --    functionName = "SubCustody_TodayShiftDay",
    --    functionArrayPositions = {1, 3},
    --    functionValuesArray = {3, 8, 9},
    --    randomSeed = 4
    --}

    local responseTable = {
        success = true,
        value = "",
        errorMessage = ""
    }


    if #inputTable ~= 4 then

        local error_message = "Error - there should be exactly four rows in InputTable."

        responseTable.success = false
        responseTable.errorMessage = error_message

        return responseTable

    end

    -- Extract ArraysIndexArray
    local arraysIndexTable = inputTable[2]

   -- Secure that no ArraysIndexArray is emtpty
   if (#arraysIndexTable > 0) then

    -- Convert array to string
    local tableAsString = TableToString (arraysIndexTable, ",")

       local error_message = "Error - array index is not supported. 'arraysIndexArray: " .. tableAsString .. "'"

       responseTable.success = false
       responseTable.errorMessage = error_message

       return responseTable

   end

   -- Extract FunctionArgumentsArray
   local functionArgumentsArray = inputTable[3]


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


    responseTable.value = futureDate:fmt("%Y-%m-%d")

    return responseTable


end




function TableToString(tbl, sep)
    sep = sep or ", "
    local result = "["
    for _, v in ipairs(tbl) do
        result = result .. tostring(v) .. sep
    end

    result = result:sub(1, -#sep - 1)

    result = result .. "]"

    return result
end

-- Example invocation
--local result = TengoScriptStartingPoint{"SubCustody_TodayShiftDay", {}, {0}, 0}
--print(result)

