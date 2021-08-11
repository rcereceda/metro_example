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
  {
    id: 'c',
    name: 'C',
    color: nil,
    parents: ['b'],
    childrens: ['d', 'g']
  },
  {
    id: 'd',
    name: 'D',
    color: nil,
    parents: ['c'],
    childrens: ['e']
  },
  {
    id: 'e',
    name: 'E',
    color: nil,
    parents: ['d'],
    childrens: ['f']
  },
  {
    id: 'f',
    name: 'F',
    color: nil,
    parents: ['e', 'i'],
    childrens: []
  },
  {
    id: 'g',
    name: 'G',
    color: 'green',
    parents: ['c'],
    childrens: ['h']
  },
  {
    id: 'h',
    name: 'H',
    color: 'red',
    parents: ['g'],
    childrens: ['i']
  },
  {
    id: 'i',
    name: 'I',
    color: 'green',
    parents: ['h'],
    childrens: ['f']
  }
].freeze
