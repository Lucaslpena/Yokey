class InstagramService
  class << self

    def with_emoji( emoji )
      response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
      puts response.body, response.code, response.message, response.headers.inspect
    end

    def crawler_prep(user) #assumed just insta identitiy is present
      iden = user.identities.first
      crawler("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{iden.accesstoken}&count=1", user)
    end

    def crawler(runString, user) ##TEST ME!!
      res = HTTParty.get(runString)
      res['data'].each{ |img|

        emoji_name = EmojiService.hasNoms?(img['tags'].join(' ')) if img['tags'].join(' ').include?("\u{1F435}") #this just checks to make sure a monkey emoji is somewhere in here....
        #TODO - FIX THIS ^^^^!
        if img['location'].present? && emoji_name.present?

          r = Review.new(
              emoji:    emoji_name, #fake -> would set get
              source:   img['link'],
              loc_name: img['location']['name'],
              facebook_place_id:   img['location']['id'],
              thumbnail:img['images']['thumbnail']['url']
          )
          r.setPoints(img['location']['longitude'], img['location']['latitude'])

          r.user = user

          begin
            r.save!
          rescue ActiveRecord::RecordInvalid
            # do not save... just skip that shit
          end
        end
      }
      crawler(res['pagination']['next_url'], user) if res['pagination']['next_url'].present?
    end

  end
end