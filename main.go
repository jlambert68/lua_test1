package main

import (
	"fmt"
	"github.com/yuin/gopher-lua"
	"log"
)

func main() {
	L := lua.NewState()
	defer L.Close()

	// Load the Lua script
	if err := L.DoFile("lua_scripts/simpe_scritpt_called_from_go.lua"); err != nil {
		log.Fatal(err)
	}

	err := L.CallByParam(lua.P{
		Fn:      L.GetGlobal("functionOne"),
		NRet:    1,
		Protect: true,
	},
		lua.LNumber(10),
		lua.LString("apa"))

	if err != nil {
		panic(err)
	}
	ret := L.Get(-1) // returned value
	L.Pop(1)         // remove received value

	fmt.Println(ret)

	err = L.CallByParam(lua.P{
		Fn:      L.GetGlobal("callFunctionByName"),
		NRet:    0,
		Protect: true,
	},
		lua.LString("functionTwo2"))

	if err != nil {
		panic(err)
	}
	ret = L.Get(-1) // returned value
	//	L.Pop(1)        // remove received value

	fmt.Println(ret)
	/*
		// Your Go map with mixed types
		myMap := map[string]interface{}{
			"FunctionName":        "functionTwo2",
			"ArrayIndexes":        []int{1, 3},
			"FunctionParameters":  []int{1, 33, 14},
			"ExecutionRandomness": 3,
		}

		// Create a new Lua table
		luaTable := L.NewTable()

		// Populate the Lua table with the Go map's contents
		for key, value := range myMap {
			switch v := value.(type) {
			case string:
				L.SetField(luaTable, key, lua.LString(v))
			case []int:
				arrayTable := L.CreateTable(len(v), 0)
				for i, val := range v {
					arrayTable.RawSetInt(i+1, lua.LNumber(val))
				}
				L.SetField(luaTable, key, arrayTable)
			case int:
				L.SetField(luaTable, key, lua.LNumber(v))
				// Add more cases for other types as needed
			}
		}

		// Push the Lua table onto the stack
		L.Push(luaTable)

		// Push the function onto the stack
		L.GetGlobal("functionOne")

		// Push arguments
		L.Push(lua.LString("first argument"))
		L.Push(lua.LString("second argument"))

		// Call the function with 2 arguments and 1 expected result
		if err := L.PCall(2, 1, nil); err != nil {
			log.Fatal(err)
		}

		// Retrieve the result
		result := L.Get(-1) // -1 refers to the top of the stack
		L.Pop(1)            // Remove received result from the stack

		// Assert the result type if necessary and use it
		if str, ok := result.(lua.LString); ok {
			log.Println("Received from Lua:", string(str))
		} else {
			log.Println("Unexpected type of result")
		}
	*/
	// Shared function
	L2 := lua.NewState()
	defer L2.Close()

	// Execute the first script (defines sharedFunction)
	if err := L2.DoFile("lua_scripts/script1.lua"); err != nil {
		log.Fatal(err)
	}

	// Execute the second script (defines specificFunction)
	if err := L2.DoFile("lua_scripts/script2.lua"); err != nil {
		log.Fatal(err)
	}

	// Call specificFunction from script2.lua
	if err := L2.CallByParam(lua.P{
		Fn:      L2.GetGlobal("specificFunction"),
		NRet:    0,
		Protect: true,
	}); err != nil {
		log.Fatal(err)
	}
}
