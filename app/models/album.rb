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

class Album < ActiveRecord::Base
  validates_presence_of :art
end
