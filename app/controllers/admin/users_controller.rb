class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access?
  before_action :load_entity_object, only: %i[edit update]
  before_action :load_all_entity_objects, only: %i[index update]
  before_action :set_active_page, only: [:index]

  def update
    @user.update(entity_parameters)
  end

  private

  def set_active_page
    @active_page = 'admin'
  end

  def entity_parameters
    params.require(:user).permit(:admin, :active, :name)
  end

  def load_entity_object
    @user = User.find(params[:id])
  end

  def load_all_entity_objects
    @users = User.order(:name)
  end
end
