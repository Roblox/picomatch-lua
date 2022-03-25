local Packages = script.Parent.Parent
local JestGlobals = require(Packages.Dev.JestGlobals)
local jestExpect = JestGlobals.expect

return function()
	describe("test", function()
		it("should work", function()
			jestExpect(true).toEqual(true)
		end)
	end)
end
