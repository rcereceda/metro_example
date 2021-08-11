class Station
  class << self; attr_accessor :all end
  attr_accessor :id, :name, :color, :parents, :childrens

  @all = []

  def initialize(id, name, color, parents, childrens)
    @id        = id
    @name      = name
    @color     = color
    @parents   = parents
    @childrens = childrens

    self.class.all << self
  end

  def self.find(id)
    @all.find { |station| station.id == id }
  end

  def self.prepare_network
    NODES.each do |station|
      Station.new(
        station[:id],
        station[:name],
        station[:color],
        station[:parents],
        station[:childrens]
      )
    end
  end
end
