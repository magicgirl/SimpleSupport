class DashboardController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to tickets_path
  end

end
