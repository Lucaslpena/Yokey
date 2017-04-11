class MapController < ApplicationController

  def home
    # Review.gimmeFake
    # reviews = Review.all
    # geojson = Array.new
    #
    # reviews.each { |rvw|
    #   geojson << {
    #     type: 'Feature',
    #     geometry: {
    #         type: 'Point',
    #         coordinates: [rvw.lng, rvw.lat]
    #     },
    #     properties: {
    #         name: rvw.emoji,
    #         address: rvw.source,
    #         :'marker-color' => '#0[7,0607d',
    #         :'marker-symbol' => 'circle',
    #         :'marker-size' => 'medium'
    #     }
    #   }
    # }
    #
    # @formatter = {"type": "FeatureCollection","features": geojson}
    # Review.destroy_all
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @formatter }  # respond with the created JSON object
    # end

  end
end