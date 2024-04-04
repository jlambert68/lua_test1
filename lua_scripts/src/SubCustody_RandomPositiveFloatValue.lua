

local function tableToString(tbl, sep)

    -- More then one parameter in table
    if #tbl > 1 then
        sep = sep or ", "
        local result = "["
        for _, v in ipairs(tbl) do
            result = result .. tostring(v) .. sep
        end

        result = result:sub(1, -#sep - 1)

        result = result .. "]"

        return result
    end

    -- Only one parameter in table
    local result = tostring(tbl)

    return result
end

-- ***********************************************************************************
-- round
--
-- Function to round a float to a specific number of decimal places

local function round(x, places)

    local shift = 10 ^ places

    return math.floor(x * shift + 0.5) / shift
end

-- ***********************************************************************************



-- ***********************************************************************************
-- formatFloat
--
-- Function to format a float with a specific number of decimals
local function formatFloat(number, numberOfDecimals)

    -- Convert the number to a string
    local str = tostring(number)

    -- Find the position of the decimal point
    local dotIndex = nil
    for i = 1, #str do
        if str:sub(i, i) == '.' then
            dotIndex = i
            break
        end
    end


    -- Add a decimal point if it doesn't exist
    if numberOfDecimals > 0 and dotIndex == nil then
        dotIndex = #str + 1
        str = str .. "."
    end

        -- Handle case when there should be decimals 
    if numberOfDecimals > 0 then

        -- Calculate the number of decimal places currently in the string
        local currentDecimals = dotIndex and #str - dotIndex or 0

        -- Add zeros to reach the desired number of decimal places
        while currentDecimals < numberOfDecimals do
            str = str .. "0"
            currentDecimals = currentDecimals + 1
        end

        return str
    end

    -- No decimals so remove decimal point and any following zero, i.e. 13.0
    local integerWithOutDecimals = string.sub(str, 1, dotIndex -1)

    return integerWithOutDecimals

end

-- ***********************************************************************************


-- ***********************************************************************************
-- randomize

-- Function to generate random numbers


local function randomize(index, maxIntegerPartSize, numberOfDecimals, testCaseUuidRandomizer)
   
    math.randomseed(testCaseUuidRandomizer + index)

    -- Generate Integer part of random number
    local randomIntegerPart = math.random()
    local integerPart = math.floor(10 ^ maxIntegerPartSize * randomIntegerPart)

    -- Generate Decimal part of random number
    local randomDecimalPart = math.random()
    local decimalPart = 0

    if numberOfDecimals > 0 then
        decimalPart = math.floor(10 ^ numberOfDecimals * randomDecimalPart)
    end

    -- Combine Integer and decimal part into one random number
    local randomNumber = integerPart + 10 ^ (-1 * numberOfDecimals) * decimalPart

    randomNumber = round(randomNumber, numberOfDecimals)

    return randomNumber
end


-- ***********************************************************************************




 -- ***********************************************************************************
-- SubCustody_RandomFloatValue_ArrayValue // SubCustody.RandomFloatValue[n](maxIntegerPartSize, numberOfDecimals)
--
-- Function to generate random value with a specif max number of integer and speciic number of decimals
-- inputArray := [arrayPosition, maxIntegerPartSize, numberOfDecimals, testCaseUuidRandomizer]


local function SubCustody_RandomFloatValue_ArrayValue(inputArray)
    local arrayPosition = inputArray[1][1]
    local maxIntegerPartSize = inputArray[2][1]
    local numberOfDecimals = inputArray[2][2]
    local testCaseUuidRandomizer = inputArray[3]

    if arrayPosition < 1 then
        arrayPosition = 1
    end

    local tempValueAsFloat = randomize(arrayPosition, maxIntegerPartSize, numberOfDecimals, testCaseUuidRandomizer)

    return formatFloat(tempValueAsFloat, numberOfDecimals)
end

-- ***********************************************************************************



-- ***********************************************************************************
-- SubCustody_RandomPositiveFloatValue
--
-- Function to generate random value with a specif max number of integer and speciic number of decimals
-- Always use array value 1, first array position from user perspective
--
-- inputArray := [[arrayindex], [maxIntegerPartSize, numberOfDecimals], testCaseUuidRandomizer]

function SubCustody_RandomPositiveFloatValue(inputTable)

    local responseTable = {
        success = true,
        value = "",
        errorMessage = ""
    }

    -- There must be 4 rows in the InputTable
    if #inputTable ~= 4 then

        local error_message = "Error - there should be exactly four rows in InputTable."

        responseTable.success = false
        responseTable.errorMessage = error_message

        return responseTable

    end


    -- Extract ArraysIndexArray
    local arraysIndexTable = inputTable[2]

    -- Secure that ArraysIndexArray is not emtpty or only have one value
    if #arraysIndexTable > 1 then
        -- Have more then 1 value

        -- Convert array to string
        local tableAsString = tableToString (arraysIndexTable, ",")
        local error_message = "Error - array index array can only have a maximum of one value. '" .. tableAsString .. "'"

        responseTable.success = false
        responseTable.errorMessage = error_message

        return responseTable

    elseif  #arraysIndexTable == 0 then
        -- zero array index, so use first index position

        arraysIndexTable = {1}

    end


    -- Extract FunctionArgumentsArray
    local functionArgumentsTable = inputTable[3]

    -- Handle if function arguments is not 2 arguments
    if #functionArgumentsTable ~=  2 then

        -- More then 2 arguments
        if #functionArgumentsTable > 2 then

            local tableAsString = tableToString(functionArgumentsTable, ",")
            local error_message = "Error - there must be exact 2 function parameter. '" .. tableAsString .. "'"

            responseTable.success = false
            responseTable.errorMessage = error_message

            return responseTable

            -- Exact one argument
        elseif #functionArgumentsTable == 1 then

                local result = "[" .. tostring(functionArgumentsTable[1]) .. "]"

                local error_message = "Error - there must be exact 2 function parameter. '" .. result .. "'"

                responseTable.success = false
                responseTable.errorMessage = error_message

                return responseTable

            -- Zero values    
        else
                local error_message = "Error - there must be exact 2 function parameter but it is empty."

                responseTable.success = false
                responseTable.errorMessage = error_message

                return responseTable

        end
    end

    -- verify that each function parameter is a number
    for _, v in ipairs(functionArgumentsTable) do

        -- Must be an integer 
        if type(v) ~=  "number" then
            local tableAsString = tableToString (functionArgumentsTable, ",")
            local error_message = "Error - functions parameters must be of type Integer. '" .. tableAsString .. "'"

            responseTable.success = false
            responseTable.errorMessage = error_message


        end
    end

    -- Extract randomnizer
    local testcaseExecutionUuidRandomizer =  inputTable[4]

    -- Must be an integer 
    if type(testcaseExecutionUuidRandomizer) ~=  "number" then


            -- Verify if it is a Table
            if type(testcaseExecutionUuidRandomizer) == "table" then

                -- Convert array to string
                local tableAsString = tableToString (functionArgumentsTable, ",")

                local error_message = "Error - TestcaseExecutionUuidRandomizer is of type Table, must be type integer. '" .. tableAsString .. "'"

                responseTable.success = false
                responseTable.errorMessage = error_message

            return responseTable

            end

            -- Verify if it is a string
            if type(testcaseExecutionUuidRandomizer) == "string" then

                local error_message = "Error - TestcaseExecutionUuidRandomizer is of type String, must be type integer. '" .. testcaseExecutionUuidRandomizer .. "'"

                responseTable.success = false
                responseTable.errorMessage = error_message
            end
    end

    -- Make new Array to be send to the function that does stuff
    local inputTableForProcessingen = {arraysIndexTable, functionArgumentsTable, testcaseExecutionUuidRandomizer}

    -- Call and process Random Float Value
    local respons = SubCustody_RandomFloatValue_ArrayValue(inputTableForProcessingen)

    return respons
 
end


--[[

local inputArray = {"SubCustody_RandomPositiveFloatValue", {},{2, 3}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {},{2, 3}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '81.986'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{2, 3}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1},{2, 3}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '81.986'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {},{1, 2}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {},{1, 2}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '8.98'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {2},{1, 2}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {2},{1, 2}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '6.48'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {},{1, 1}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {},{1, 1}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '8.9'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{1, 1}, 1}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1},{1, 1}, 1}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '6.4'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {},{0, 1}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {},{0, 1}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '0.9'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{1, 0}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)

print("{'SubCustody_RandomPositiveFloatValue', {1},{1, 0}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '8'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{0, 0}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1},{0, 0}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '0'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {},{6, 6}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {},{6, 6}, 0}")
print("SubCustody_RandomPositiveFloatValue: " .. response .. " :: Expected OK - i.e. '815587.986577'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {},{6, 10}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {},{6, 10}, 0}")
print("SubCustody_RandomPositiveFloatValue Date: " .. response .. " :: Expected OK - i.e. '815587.9865775100'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{0}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1},{0}, 0}")
print("SubCustody_RandomPositiveFloatValue Date: " .. response.errorMessage .. " :: Expected ERROR - there must be exact 2 function parameter. '[0]'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1},{}, 0}")
print("SubCustody_RandomPositiveFloatValue Date: " .. response.errorMessage .. " :: Expected Error - there must be exact 2 function parameter but it is empty.")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{1, 2, 3}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1},{1, 2, 3}, 0}")
print("SubCustody_RandomPositiveFloatValue Date: " .. response.errorMessage .. " :: Expected Error - there must be exact 2 function parameter. '[1,2,3]'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1, 2},{2, 3}, 0}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1, 2},{2, 3}, 0}")
print("SubCustody_RandomPositiveFloatValue Date: " .. response.errorMessage .. " :: Expected Error - array index array can only have a maximum of one value. '[1,2]'")
print("")

local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{2, 3}}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1},{2, 3}}")
print("SubCustody_RandomPositiveFloatValue Date: " .. response.errorMessage .. " :: Expected Error - there should be exactly four rows in InputTable.")
print("")





-- ***********************************************************************************
--]]