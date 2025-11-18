set shell := ["nu","-c"]

env:
	nu ./env.nu

format path=".":
	stylua {{path}}

lint:
	stylua -c .
