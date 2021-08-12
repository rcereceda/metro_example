# Simple Metro Example

Simple metro example written in Ruby.

This program allows you to calculate the route with the fewest number of stations between two stations in a metro network. In the metro network, some stations may have an associated color (red or green) that indicates that a green express train will only pass through stations without color or green, and a red express train will pass only through stations without color or red.

**Note**: At the moment, this example only allows you to find the shortest path in a single direction of the graph, from left to right or right to left.

## Usage

```
load 'main.rb'
```

The description of the graph that represents the metro network can be found in:

```
lib/data/network.rb
```

If you want to change the network, you can update the NODES constant replacing the nodes using the following structure:

```
NODES = [
  {
    id: 'a',
    name: 'A',
    color: nil,
    parents: [],
    childrens: ['b']
  },
  {
    id: 'b',
    name: 'B',
    color: nil,
    parents: ['a'],
    childrens: ['c']
  },
  ...
].freeze
```

If you want to get the shortest route between two stations, it's necessary to have an instance of the Train class indicating the origin and destination station (the color is optional):

```
train = Train.new('A', 'F', 'green')

```

In order to get the shortest path, you can test with the **shortest_path** method:

```
train.shortest_path
```

In order to get the complete routes to destination, you can test with the **complete_routes** method:

```
train.complete_routes
```
