-- script.lua
function functionOne(arg1, arg2)
    a = "hej: " .. tostring(arg1) ..arg2
    return a
--    return "Function One response with " .. arg1 .. " and " .. arg2
end

-- Define some functions
function functionOne2()
    print("Function One called")
end

function functionTwo2()
    print("Function Two called")
end

-- Table mapping function names to functions
local functions = {
    functionOne2 = functionOne2,
    functionTwo2 = functionTwo2
}

-- Function to call another function by its name
function callFunctionByName(functionName)
    local func = functions[functionName]
    if func then
        func()
    else
        print("Function not found: " .. functionName)
    end
end
