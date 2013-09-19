class TicketsController < ApplicationController

  def index
    @tickets = current_user.tickets
  end

  def show

  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params.require(:ticket).permit(:title, :message).merge(user: current_user))
    if @ticket.save
      flash[:notice] = 'Ticket created!'
      redirect_to root_path
    else
      render action: 'new'
    end
  end

end
