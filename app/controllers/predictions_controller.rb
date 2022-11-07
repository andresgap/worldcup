class PredictionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_active_page, only: [:index]
  before_action :check_update_acess, only: [:update]

  def index
    @prediction_set =
      PredictionSet
        .where(user: current_user, tournament: gc19)
        .includes(predictions: { match: [:team1, :team2, :phase] })
        .first
    @stats = Stats.new.list
  end

  def show
    @prediction_set = PredictionSet.find(params[:id])
  rescue
    redirect_to predictions_path
  end

  def update
    if prediction_set.update(prediction_set_params)
      flash[:notice] = I18n.t('form.sucess')
    else
      flash[:error] = prediction_set.errors.full_messages.first
    end
    redirect_to predictions_path
  end

  private

  def set_active_page
    @active_page = 'predictions'
  end

  def check_update_acess
    redirect_to root_path unless current_user == prediction_set.user
  end

  def prediction_set
    @prediction_set ||= PredictionSet.where(id: params[:id]).first
  end

  def prediction_set_params
    params.require(:prediction_set).permit(:id, predictions_attributes: [:id, :score1, :score2])
  end

end
