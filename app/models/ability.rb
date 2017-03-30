class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # if (user.admin == true)
    #   can :manage, :all
    # end

    can :manage, :all

    # if user.has_status?("artist")
    #   can :create, Participation
    # end

    # if (user.has_status?("individual") || user.has_status?("professional"))
    #   can :create, Place
    #   can [:update, :destroy], Place, {user_id: user.id}
    #   can [:update, :destroy], Exhibition, {user_id: user.id}
    #   can [:update, :destroy], Participation, {user_id: user.id}
    # end

    # Everybody else
    # can :read, Exhibition
    # can :read, Place

  end
end
