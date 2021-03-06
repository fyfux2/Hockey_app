class Score < ApplicationRecord
  belongs_to :home_team , class_name: 'Team'
  belongs_to :guest_team, class_name: 'Team'

  validate :check_teams
  validates :home_goals, presence:true
  validates :guest_goals, presence:true
  validate :check_goals

  def points_for_winner_team
    if extra_time
      1
    else
      2
    end
  end

  def check_teams
    errors.add(:base, 'Pats ar sevi nevar spēlēt') if home_team_id == guest_team_id
  end

  def check_goals
    errors.add(:base, 'Spēle nevar beigties ar neizšķirtu') if home_goals == guest_goals
  end
end
