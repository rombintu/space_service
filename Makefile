build:
	python -m zipfile -c game.love main.lua assets/ tools/ utils/ workspace/

run-linux:
	python -m zipfile -c game.love main.lua assets/ tools/ utils/ workspace/
	love game.love