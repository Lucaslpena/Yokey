# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  friend_one :uuid             not null
#  friend_two :uuid             not null
#  method     :integer          not null
#  created_at :datetime
#

class Relationship < ActiveRecord::Base
end
