class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        admin_abilities(user)
      else
        basic_abilities(user)
      end
    end
  end

  def basic_abilities(user)
    can :read, Ticket do |ticket|
      ticket.user == user or user.support_areas.include? ticket.support_area
    end
    can :create, Ticket
    can :read, SupportArea do |support_area|
        user.support_areas.include? support_area
    end
  end

  def admin_abilities(user)
    can :access, :rails_admin
    can :dashboard
    can :manage, :all
  end

end
