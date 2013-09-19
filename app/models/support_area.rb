class SupportArea < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :tickets

  def recent_tickets
    tickets.order('created_at DESC')
  end
end
