require("vis")

local plug = (function() if not pcall(require, "plugins/vis-plug") then
 	os.execute("git clone --quiet https://github.com/erf/vis-plug " ..
	 	(os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config")
	 	.. "/vis/plugins/vis-plug")
end return require("plugins/vis-plug") end)()

local plugins = {
	{ "codeberg.org/muhq/vis-lspc", alias = "lspc" },
	{ "codeberg.org/muhq/vis-build", alias = "build" },
	{ "codeberg.org/muhq/vis-lockfiles" },

--	{ "codeberg.org/wf/vis-colors", theme = true, file = "wryan" },

	{ "milhnl/vis-format" },

	{ "Nomarian/vis-commentary", alias = "commentary" },

	{ "erf/vis-cursors" },
	{ "erf/vis-highlight" },

	{ "e-zk/vis-shebang" },
}

plug.init(plugins, true)

plug.plugins.commentary()

require("statusline")
require("autocomplete")
vis:command("set theme oxocarbon")
shebangs = {
	["#!/bin/bash"] = "bash",
	["#!/bin/sh"] = "bash",
	["#!/usr/bin/env bash"] = "bash"
}
