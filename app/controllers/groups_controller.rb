class GroupsController < ApplicationController
  before_action :set_active_page

  def set_active_page
    @active_page = 'groups'
  end

  def index
    @groups = Groups.new.data
  end
end
