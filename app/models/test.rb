class Test < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  def parse_youtube
    url = self.video_url
    regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
    self.video_url = url.match(regex)[1]
    self.save()
  end
end
