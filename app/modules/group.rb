class Groups
  attr_reader :data

  def initialize
    group_codes = %w[A B C D E F G H]
    @data = []
    teams = Tournament.where(code: 'WC22').first.teams.all
    group_codes.each do |code|
      group_teams = []
      teams.each do |team|
        group_teams << team if team.group == code
      end
      data << Group.new(code, group_teams).data
    end
    data
  end
end

class Group
  attr_reader :code
  attr_reader :teams

  def initialize(code, teams)
    @code = code
    @teams = teams
  end

  def data
    OpenStruct.new(generate_data)
  end

  private

  def generate_data
    {
      code: code,
      teams: process_teams(teams)
    }
  end

  def process_teams(teams)
    processed_teams = []
    teams.each do |team|
      processed_teams << OpenStruct.new(team_data(team))
    end

    processed_teams.sort_by { |team| [-team.points, -team.goal_difference, -team.goal_in_favor] }
  end

  def team_data(team)
    team_stats = OpenStruct.new(process_team(team))
    {
      name: team.name,
      flag: team.flag,
      matches_played: team_stats.matches_played,
      win: team_stats.win,
      draw: team_stats.draw,
      lost: team_stats.lost,
      goal_in_favor: team_stats.goal_in_favor,
      goal_against: team_stats.goal_against,
      goal_difference: team_stats.goal_difference,
      points: team_stats.points

    }
  end

  def process_team(team)
    phases = Phase.where(level: 1).pluck(:id)
    home_games = Match.where(team1: team.id, phase_id: phases)
    visit_games = Match.where(team2: team.id, phase_id: phases)
    matches_played = goal_in_favor = goal_against = points = win = draw = lost = 0
    home_games.each do |home|
      next unless home.closed?
      next unless home.valid_scores?
      matches_played += 1
      goal_in_favor += home.team1_score
      goal_against += home.team2_score
      if home.tie?
        points += 1
        draw += 1
      elsif home.team1_win?
        points += 3
        win += 1
      else
        lost += 1
      end
    end
    visit_games.each do |visit|
      next unless visit.closed?
      matches_played += 1
      next unless visit.valid_scores?
      goal_against += visit.team1_score
      goal_in_favor += visit.team2_score
      if visit.tie?
        points += 1
        draw += 1
      elsif visit.team2_win?
        points += 3
        win += 1
      else
        lost += 1
      end
    end
    {
      matches_played: matches_played,
      goal_in_favor: goal_in_favor,
      goal_against: goal_against,
      goal_difference: goal_in_favor - goal_against,
      points: points,
      win: win,
      draw: draw,
      lost: lost
    }
  end
end
