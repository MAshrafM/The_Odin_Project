module FlickrHelper
  def uphotos(uid)
    photos_stream = []
    FlickRaw.api_key = Figaro.env.flickr_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret
    
    flickr = FlickRaw::Flickr.new
    flickr.photos.search(:user_id => uid, :extras => "url_q").each { |photo| photos_stream << photo }
  end
  
  def render_flickr_widget(user_id)
      photos = uphotos(user_id).take(9)
      render :partial => '/flickr/flick_widget', :locals => { :photos => photos }
  end
end
