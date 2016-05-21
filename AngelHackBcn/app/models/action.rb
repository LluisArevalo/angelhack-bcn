class Action < ActiveRecord::Base
  has_attached_file :image
  has_many :topics
  has_many :regions
  belongs_to :priority_assignment
  has_many :action_comments
  has_many :action_statuses
end
