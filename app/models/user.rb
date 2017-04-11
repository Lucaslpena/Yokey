# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  state                  :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  fb_id                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauth_providers => [:instagram]

  has_many :identities
  has_many :reviews

  def self.nuke_all!
    User.all.each{ |x| x.identities.first.destroy; x.delete }
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end
  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def instagram
    identities.where( :provider => "instagram" ).first
  end
  def instagram_client
    @instagram_client ||= Instagram.client( access_token: instagram.accesstoken )
  end

end
