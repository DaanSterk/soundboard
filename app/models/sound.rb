class Sound < ActiveRecord::Base
  belongs_to :board

  has_attached_file :sound
  validates_attachment :sound, content_type: { content_type: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ] }
end
