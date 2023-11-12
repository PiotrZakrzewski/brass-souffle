# Find Legal Moves in Brass Birmingham with Logic Programming

This short experiment shows how easy it is to express boardgame rules with [logic programming](https://en.wikipedia.org/wiki/Logic_programming).
This repo is a supplemnt to my [blog post](https://hashnode.com/preview/655a4aa4ba98790010ccfe60), please read it for more context.

## Install Souffle

I use Souffle, a dialect of Datalog for this project. Visit the [Souffle docs](https://souffle-lang.github.io/install) for installation instructions. For mac os you can just do

```shell
brew install souffle
```

## Run Example

In order to run the basic toy example do

```shell
souffle brass.dl
```

you should get the following output

```shell
---------------
player_network
===============
1	a
1	b
1	d
===============
---------------
can_place_boat
===============
1	a	d
1	b	c
1	d	e
===============
---------------
can_place_factory
===============
1	a	coal	1
```

If you want to learn more about Souffle head to their [tutorial](https://souffle-lang.github.io/tutorial).
