local ProcessService = game:GetService("ProcessService")
local Packages = script.Parent.PicomatchTestModel.Packages

local JestGlobals = require(Packages.Dev.JestGlobals)

local TestEZ = JestGlobals.TestEZ

-- Run all tests, collect results, and report to stdout.
local result = TestEZ.TestBootstrap:run(
	{ Packages.Picomatch },
	TestEZ.Reporters.TextReporterQuiet
)

if result.failureCount == 0 and #result.errors == 0 then
	ProcessService:ExitAsync(0)
else
	ProcessService:ExitAsync(1)
end
