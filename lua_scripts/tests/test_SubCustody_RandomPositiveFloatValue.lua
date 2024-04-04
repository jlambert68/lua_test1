
local assert = require "luassert"
local mymodule = require('src/SubCustody_RandomPositiveFloatValue')

local tests = {}

-- OK - {"SubCustody_RandomPositiveFloatValue", {},{2, 3}, 0}
function tests.array__parameters_2_3_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {},{2, 3}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "84.394"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- OK - {"SubCustody_RandomPositiveFloatValue", {1},{2, 3}, 0}
function tests.array_1_parameters_2_3_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {1},{2, 3}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "84.394"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- OK - {"SubCustody_RandomPositiveFloatValue", {},{1, 2}, 0}
function tests.array__parameters_1_2_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {},{1, 2}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "8.39"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- OK - {"SubCustody_RandomPositiveFloatValue", {2},{1, 2}, 0}
function tests.array_2_parameters_1_2_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {2},{1, 2}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "7.80"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end


-- OK - {"SubCustody_RandomPositiveFloatValue", {},{1, 1}, 0}
function tests.array__parameters_1_1_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {},{1, 1}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "8.3"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- OK - {"SubCustody_RandomPositiveFloatValue", {},{1, 1}, 1}
function tests.array__parameters_1_1_random_1()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {},{1, 1}, 1}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "7.8"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- OK - {"SubCustody_RandomPositiveFloatValue", {1},{1, 0}, 0}
function tests.array_1_parameters_1_0_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {1},{1, 0}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "8"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- OK - {"SubCustody_RandomPositiveFloatValue", {1},{0, 0}, 0}
function tests.array_1_parameters_0_0_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {1},{0, 0}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "0"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- OK - {"SubCustody_RandomPositiveFloatValue", {0},{6, 6}, 0}
function tests.array__parameters_6_6_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {0},{6, 6}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "840187.394382"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- OK - {"SubCustody_RandomPositiveFloatValue", {0},{6, 10}, 0}
function tests.array__parameters_6_10_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {0},{6, 10}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = "840187.3943829300"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(true, response.success)
    assert.is_equal("", response.errorMessage)

end

-- ERROR - {"SubCustody_RandomPositiveFloatValue", {1},{0}, 0}
function tests.array_1_parameters_1__random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {1},{1}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = ""
    local expectedErrorMessage = "Error - there must be exact 2 function parameter. '[1]'"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(false, response.success)
    assert.is_equal(expectedErrorMessage, response.errorMessage)

end

-- ERROR - {"SubCustody_RandomPositiveFloatValue", {1},{}, 0}
function tests.array_1_parameters___random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {1},{}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = ""
    local expectedErrorMessage = "Error - there must be exact 2 function parameter but it is empty."

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(false, response.success)
    assert.is_equal(expectedErrorMessage, response.errorMessage)

end

-- ERROR - {"SubCustody_RandomPositiveFloatValue", {1},{1, 2, 3}, 0}
function tests.array_1_parameters_1_2_3_random_0()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {1},{1, 2, 3}, 0}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = ""
    local expectedErrorMessage = "Error - there must be exact 2 function parameter. '[1,2,3]'"

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(false, response.success)
    assert.is_equal(expectedErrorMessage, response.errorMessage)

end


-- ERROR - {"SubCustody_RandomPositiveFloatValue", {1},{2, 3}}
function tests.array_1_parameters_2_3_random_()


    local inputArray =  {"SubCustody_RandomPositiveFloatValue", {1},{2, 3}}
    local response = SubCustody_RandomPositiveFloatValue(inputArray)
    local expectedDateResponse = ""
    local expectedErrorMessage = "Error - there should be exactly four rows in InputTable."

    assert.is_equal(expectedDateResponse, response.value)
    assert.is_equal(false, response.success)
    assert.is_equal(expectedErrorMessage, response.errorMessage)

end

return tests

--[[



local inputArray = {"SubCustody_RandomPositiveFloatValue", {1},{2, 3}}
local response = SubCustody_RandomPositiveFloatValue(inputArray)
print("{'SubCustody_RandomPositiveFloatValue', {1},{2, 3}}")
print("SubCustody_RandomPositiveFloatValue Date: " .. response.errorMessage .. " :: Expected Error - there should be exactly four rows in InputTable.")
print("")
--]]