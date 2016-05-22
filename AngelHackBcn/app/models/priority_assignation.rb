class PriorityAssignation < ActiveRecord::Base
  def self.set_priority initiative_id
    priorities_by_level = PriorityAssignation.where(initiative_id: initiative_id).group(:priority_id).count
    
    get_biggest_priority priorities_by_level
  end

  def self.get_biggest_priority priorities_by_level
    max = priorities_by_level.values.max
    Hash[priorities_by_level.select { |k, v| v == max}].keys
  end
end
