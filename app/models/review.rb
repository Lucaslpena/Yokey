# == Schema Information
#
# Table name: reviews
#
#  id                :uuid             not null, primary key
#  user_id           :uuid
#  emoji             :string           not null
#  kind              :integer          default(0), not null
#  source            :string           not null
#  lonlat            :geography({:srid not null, point, 4326
#  loc_name          :string
#  thumbnail         :string           not null
#  facebook_place_id :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Review < ActiveRecord::Base
  include Constants
  enum kind: REVIEW_KIND

  validates :source, uniqueness: true

  belongs_to :user


  def self.gimmeFake
    r = Review.new(emoji: 'U+1F605', source: 'https://www.google.com/')
    r.setPoints(2.157183,41.402831)
    #41.403294, 2.189369
    r.save!
  end

  def something
    puts "free"
  end

  def setPoints(lon,lat)
    self.lonlat = RGeo::Cartesian.factory.point(lon,lat)
    self
  end

  def self.withPoints(lon,lat)
    Review.where(lonlat: RGeo::Cartesian.factory.point(lon,lat))
  end

  def self.getRangeByCurrent(range, currentlon, currentlat)
    Review.where("ST_Distance(lonlat, 'POINT(#{currentlon} #{currentlat})') < #{range}")
  end


end
