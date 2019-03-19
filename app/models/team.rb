class Team < ApplicationRecord
    has_many :home_teams_scores, :class_name => 'Score', :foreign_key => 'home_team_id'
    has_many :guest_teams_scores, :class_name => 'Score', :foreign_key => 'guest_team_id'
    
    has_many :players

    validates :title, presence:true
    validates :code, presence:true, length: {in: 3..3}
end
