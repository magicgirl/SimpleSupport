class TicketCommentsController < ApplicationController
  load_and_authorize_resource except: [:create]

  def create
    ticket = Ticket.find(params[:ticket_comment][:ticket_id])
    authorize! :read, ticket
    ticket_comment = TicketComment.new(
      user: current_user,
      ticket: ticket,
      message: params[:ticket_comment][:message]
    )
    if ticket_comment.save
      render json: {comment: render_to_string(partial: 'tickets/comment', locals: {ticket_comment: ticket_comment})}
    else
      render nothing: true
    end
  end

end
