class Train
  attr_accessor :origin, :destination, :color, :routes

  def initialize(origin, destination, color = nil)
    @color  = color
    @origin = origin
    @destination = destination
    @routes = Hash.new { |hash, key| hash[key] = [] }

    paths(origin, destination)
  end

  def colors
    [color, nil]
  end

  def paths(origin, destination, result = [])
    return if origin.empty? || destination.empty? || origin == destination

    node = Station.find(destination.downcase)

    node.parents.each do |parent|
      previous  = result + [node.name]
      path      = path(parent, node.name, origin)
      route     = previous + path

      next if route.empty?

      @routes[last_index] = route
    end
  end

  def path(node, parent, root)
    path  = []
    nodes = [node]
    found = false
    skip  = 0

    until found
      nodes.each do |n|
        station = Station.find(n)
        nodes   = station.parents

        if nodes.length >= 2 && station.id != root.downcase
          previous = [parent] + path
          found    = true
          paths(root, station.id, previous)
        elsif colors.include?(station.color)
          path << station.name
          found = path.include?(root.upcase) || nodes.empty?
        elsif nodes.empty? || skip >= 2
          found = true
        else
          skip += 1
        end
      end
    end

    path
  end

  def shortest_path
    paths = complete_routes.map { |_k, v| v }

    return if paths.empty?

    paths.min { |x, y| x.size <=> y.size }.reverse
  end

  def complete_routes
    return if @routes.empty?

    @routes.select do |_k, v|
      v.include?(origin) && v.include?(destination)
    end
  end

  def last_index
    return 0 if @routes.empty?

    @routes.map { |k, _v| k }.max + 1
  end
end
