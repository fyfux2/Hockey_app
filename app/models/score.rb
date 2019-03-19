class Score < ApplicationRecord
    belongs_to :home_team , class_name: 'Team'
    belongs_to :guest_team, class_name: 'Team'
end
