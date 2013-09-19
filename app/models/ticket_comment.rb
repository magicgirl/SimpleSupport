class TicketComment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user

  validates :user, presence: true
  validates :ticket, presence: true
  validates :message, presence: true, length: {minimum: 1}

  def short_created_at
    created_at.strftime("%e/%b %k:%M")
  end
end
