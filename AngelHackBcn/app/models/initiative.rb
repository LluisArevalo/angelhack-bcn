class Initiative < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
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

  def get_citizens_priority
    priority_id = PriorityAssignation.set_priority params[:initiative_id]
    @priority = Priority.find priority_id
  end
end
