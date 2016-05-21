class Initiative < ActiveRecord::Base
  has_attached_file :image
  belongs_to :topic
  belongs_to :region
  belongs_to :priority_assignment
  has_many :initiative_comments
  has_many :initiative_statuses
end
