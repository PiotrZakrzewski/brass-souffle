board.dot:
	python3 viz-network.py facts.db board.dot

board.png: board.dot
	dot -Tpng board.dot -o board.png

clean:
	rm -f board.dot board.png
