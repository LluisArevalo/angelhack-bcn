class InitiativeStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :initiative
end
