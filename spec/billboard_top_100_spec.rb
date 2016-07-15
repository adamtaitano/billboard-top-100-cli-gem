require 'spec_helper'

describe BillboardTop100 do
  it 'has a version number' do
    expect(BillboardTop100::VERSION).not_to be nil
  end
end

describe BillboardTop100::Song do
  context 'Class Methods' do
    describe '.hello' do
      it 'returns the string "Hello"' do
        song = BillboardTop100::Song.new
        expect(BillboardTop100::Song.hello).to eql("Hello")
      end
    end
  end
end
