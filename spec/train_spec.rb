describe Train do
  before(:all) { Station.prepare_network }
  let(:train)  { Train.new('A', 'F') }

  context 'when train is created' do
    it 'has a valid origin' do
      stations = ('A'..'Z')

      expect(stations).to include train.origin
    end

    it 'has a valid destination' do
      stations = ('A'..'Z')

      expect(stations).to include train.destination
    end

    it 'has different origin and destination' do
      expect(train.origin).not_to eql(train.destination)
    end
  end

  context 'when train routes are defined' do
    it 'has at least one route' do
      expect(train.routes).to have_key 0
    end

    it 'has origin on shortest_path' do
      expect(train.shortest_path).to include train.origin
    end

    it 'has destination on shortest_path' do
      expect(train.shortest_path).to include train.destination
    end
  end
end
