class TicketCommentsController < ApplicationController

  def create
    ticket_comment_params = params.require(:ticket_comment).permit(:ticket_id, :message).merge(user: current_user)
    ticket_comment = TicketComment.new ticket_comment_params
    if ticket_comment.save
      render json: {comment: render_to_string(partial: 'tickets/comment', locals: {ticket_comment: ticket_comment})}
    else
      render nothing: true
    end
  end

end
