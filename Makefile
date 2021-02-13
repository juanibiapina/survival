.PHONY: run
run:
	minetest --go --worldname test --name test

.PHONY: reset
reset:
	rm -rf ~/.minetest/worlds/test
	cp -r ~/.minetest/worlds/backup ~/.minetest/worlds/test
