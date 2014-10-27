# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  artist     :string(255)
#  url        :string(255)
#  art        :string(255)
#  tags       :string(255)
#  mbid       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Album, :type => :model do
  context 'a new album' do
    subject(:album) { Album.new }

    it 'is invalid without album art' do
      expect(album.valid?).not_to eq(true)
    end

    it 'raises an error when saved without art' do
      expect { album.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
end
