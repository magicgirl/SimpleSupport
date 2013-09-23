class TicketsController < ApplicationController
  load_and_authorize_resource except: 'create'

  def index
    if params[:support_area_id].present?
      @support_area = SupportArea.find(params[:support_area_id])
      authorize! :read, @support_area
      @tickets = @support_area.recent_tickets
    else
      @tickets = current_user.recent_tickets
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @new_ticket_comment = TicketComment.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    ticket_params = params.require(:ticket).permit(:title, :message).merge(user: current_user)

    @ticket = Ticket.new ticket_params
    if params[:ticket][:support_area_id].present?
      support_area = SupportArea.find(params[:ticket][:support_area_id])
      authorize! :read, support_area
      @ticket.support_area = support_area
    end

    if @ticket.save
      flash[:notice] = 'Ticket created!'
      redirect_to root_path
    else
      render action: 'new'
    end
  end
end
