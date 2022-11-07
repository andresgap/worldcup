class PositionBoard
  attr_reader :leaderboard

  def initialize(leaderboard = nil)
    @leaderboard = leaderboard
  end

  def members
    @members ||= positions.sort_by { |position| [position.index, position.name.downcase] }
  end

  def title
    @title ||= leaderboard ? leaderboard.name : 'general'
  end

  private

  def positions
    @positions ||=
      prediction_sets.map { |prediction_set| OpenStruct.new(position_row(prediction_set)) }
  end

  def prediction_sets
    active_users = leaderboard ? leaderboard.users.active.map(&:id) : User.where(active: true).map(&:id)
    @prediction_sets ||=
      PredictionSet.where(tournament: wc22, user_id: active_users).includes(:user)
                   .select { |set| valid_predictions?(set) }
  end

  def position_row(prediction_set)
    {
      name: prediction_set.user.name,
      picture: prediction_set.user.picture,
      points: prediction_set.points,
      index: order_points.index(prediction_set.points) + 1,
      prediction_set: prediction_set
    }
  end

  def valid_predictions?(set)
    valid_predictions = set.predictions.select(&:valid_scores?)
    valid_predictions.any?
  end

  def order_points
    @order_points ||= prediction_sets.map(&:points).sort.reverse.uniq
  end

  def wc22
    @wc22 ||= Tournament.where(code: 'WC22').first
  end
end
