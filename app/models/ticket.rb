class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :support_area
  has_many :ticket_comments

  validates :title, presence: true, length: {minimum: 5}
  validates :message, presence: true, length: {minimum: 5}
  validates :user, presence: true

  def recent_ticket_comments
    ticket_comments.order('created_at DESC')
  end

  def created_date
    created_at
  end

  def updated_date
    updated_at
  end

end
