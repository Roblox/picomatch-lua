#!/bin/bash

set -x

echo "Remove .robloxrc from dev dependencies"
find Packages/Dev -name "*.robloxrc" | xargs rm -f
find Packages/_Index -name "*.robloxrc" | xargs rm -f

echo "Run static analysis"
selene src
roblox-cli analyze tests.project.json
stylua -c src

echo "Run tests"
roblox-cli run --load.model tests.project.json --run bin/spec.lua --testService.errorExitCode=1 --fastFlags.allOnLuau --fastFlags.overrides EnableLoadModule=true

# run the following command to update new snapshots
# roblox-cli run --load.model tests.project.json --run bin/spec.lua --lua.globals=__DEV__=true --fastFlags.allOnLuau --fastFlags.overrides "UseDateTimeType3=true" "EnableLoadModule=true" "EnableDelayedTaskMethods=true" --load.asRobloxScript --fs.readwrite="$(pwd)" --lua.globals=UPDATESNAPSHOT="new"
