class PriorityAssignation < ActiveRecord::Base
  def self.set_priority initiative_id
    priorities_by_level = PriorityAssignation.where(initiative_id: initiative_id).group(:priority_id).count
    
    priority = get_biggest_priority priorities_by_level
  end

  def self.get_biggest_priority priorities_by_level
    priorities_by_level.max_by{|key,value| value}.first
  end
end
