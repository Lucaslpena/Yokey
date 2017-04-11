class ChatController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    if params['hub.verify_token'] == "mytoken"
      render text: params['hub.challenge'] and return
    else
      render text: 'error' and return
    end
  end

  def listening
    puts params.inspect
    rdr = Reader.get_or_create(params['from'])
    rdr.save!
    txt = params['reply'].downcase
    txt = txt.gsub!('find%20','')
    txt = txt.gsub!('%u','\u')
    puts txt
    #txt = "\ud83c\udf66"
    puts txt.bytes
    puts EmojiService.convert?(txt)
    res = {link: Review.first.source, image: Review.first.thumbnail}
    render status: 200, json: res.to_json
  end


end