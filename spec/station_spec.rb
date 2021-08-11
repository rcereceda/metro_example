describe Station do
  before(:all)  { Station.prepare_network }

  context 'when station is created' do
    it 'has a valid id' do
      ids = ('a'..'z')

      Station.all.each do |station|
        expect(ids).to include station.id
      end
    end

    it 'has a valid name' do
      names = ('A'..'Z')

      Station.all.each do |station|
        expect(names).to include station.name
      end
    end

    it 'has a valid color' do
      colors = ['green', 'red', nil]

      Station.all.each do |station|
        expect(colors).to include(station.color)
      end
    end

    it 'has parents or childrens' do
      Station.all.each do |station|
        has_parents     = !station.parents.empty?
        has_childrens   = !station.childrens.empty?
        has_connections = has_parents || has_childrens

        expect(has_connections).to be_truthy
      end
    end
  end
end
