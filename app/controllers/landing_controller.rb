class LandingController < ApplicationController
  before_action :authenticate_user!, :only => :health

  def index
  end

  def health
    redirect_to :landing
  end



end