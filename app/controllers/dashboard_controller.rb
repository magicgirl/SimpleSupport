class DashboardController < ApplicationController

  def index
    redirect_to tickets_path
  end

end
