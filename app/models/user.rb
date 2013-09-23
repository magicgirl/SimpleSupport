class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[user admin]

  before_validation :ensure_role
  validates :role, presence: true, inclusion: ROLES

  #rails_admin do
  #  edit do
  #    group :default do
  #      field :email
  #      field :password
  #      field :password_confirmation
  #      field :tickets
  #      field :support_areas
  #    end
  #  end
  #end

  def is?(role)
    self.role == role.to_s
  end

  def admin?
    is? :admin
  end

  has_many :tickets
  has_and_belongs_to_many :support_areas

  def recent_tickets
    tickets.order('created_at DESC')
  end

  private
  def ensure_role
    self.role = 'user' unless self.role.present?
  end

end
