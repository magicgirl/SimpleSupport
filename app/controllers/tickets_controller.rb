class TicketsController < ApplicationController

  def index
    @tickets = current_user.recent_tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    ticket_params = params.require(:ticket).permit(:title, :message).merge(user: current_user)
    ticket_params.merge! support_area_id: params[:ticket][:support_area_id] if params[:ticket][:support_area_id].present?

    @ticket = Ticket.new ticket_params
    if @ticket.save
      flash[:notice] = 'Ticket created!'
      redirect_to root_path
    else
      render action: 'new'
    end
  end

end
