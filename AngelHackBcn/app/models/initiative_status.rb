class InitiativeStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :initiative

  def self.check_solved initiative_id
    votes = where(initiative_id: initiative_id).group(:solved).count
    decision = get_solved_votes(votes)
    if decision == []
      []
    else
      !decision.include?(false)
    end
  end

  def self.get_solved_votes all_votes
    max = all_votes.values.max
    Hash[all_votes.select { |k, v| v == max}].keys
  end
end
