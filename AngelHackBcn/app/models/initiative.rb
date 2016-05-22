class Initiative < ActiveRecord::Base
  has_attached_file :image
  belongs_to :topic
  belongs_to :region
  belongs_to :priority_assignment
  has_many :initiative_comments
  has_many :initiative_statuses

  def actual_topic
    self.topic ?  self.topic.description : " "
  end

  def actual_region
    self.region ?  self.region.ambit : " "
  end

  def has_image?
    image.url != "/images/original/missing.png"
  end
end
