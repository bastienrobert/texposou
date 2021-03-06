class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:


    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard
      can :manage, :all               # allow access to dashboar
    else
      #For the moment, user manage all except rails_admin
      can :manage, [
        ArtTag,
        Exhibition,
        ExhibitionsPart,
        ImagePlace,
        ImageUser,
        Participation,
        Place,
        User,
        UsersTagPart,
        Visit
      ]

    end



    # can :access, :rails_admin       # only allow admin users to access Rails Admin
    # can :dashboard
    # can :manage, :all

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
