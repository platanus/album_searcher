require 'rails_helper'

RSpec.describe Finder, type: :model do

  subject(:finder) { Finder.new }
  
  context 'a new finder' do
   
    it 'has valid credentials' do
      expect(finder.credentials[:key]).not_to eq(nil)
      expect(finder.credentials[:secret]).not_to eq(nil)
    end
  end

  context 'when the external services fail' do

    it 'raises an exception when the API returns an error' do
      finder.credentials[:key] = 'invalid'
      expect { finder.search('invalid') }.to raise_error(RuntimeError)
    end
  end

  context 'when searching with an invalid query' do

    it 'returns no results when called with an empty string' do
      expect(finder.search('').length).to eq(0)
      expect(finder.search(' ').length).to eq(0)
    end

    it 'returns no results when called with a space separated param' do
      expect(finder.search('orphan songs').length).to eq(0)
    end
  end

  context 'when searching with a valid query' do

    it 'returns at least one album for the keyword orphan+songs' do
      expect(finder.search('orphan+songs').length).to be > 0  
    end
  end

end
