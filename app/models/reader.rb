# == Schema Information
#
# Table name: readers
#
#  id          :uuid             not null, primary key
#  from_id     :string           not null
#  preferences :json
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Reader < ActiveRecord::Base
  def self.get_or_create(from)
    r = Reader.where(from_id: from)
    r = Reader.new(from_id: from) || r
    r
  end
end

#todo make transaction history of all messages...eventually