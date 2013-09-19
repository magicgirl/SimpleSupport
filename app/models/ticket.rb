class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :support_area

  validates :title, presence: true, length: {minimum: 5}
  validates :message, presence: true, length: {minimum: 5}
  validates :user, presence: true

  def created_date
    created_at
  end

  def updated_date
    updated_at
  end

end
