class DashboardController < ApplicationController

  def index
    @tickets = current_user.tickets
  end

end
