class Ticket < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5}
  validates :message, presence: true, length: {minimum: 5}
  validates :user, presence: true

end
