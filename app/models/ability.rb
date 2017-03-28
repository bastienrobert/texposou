class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new
    #
    # can [:read], Place


    # if user.admin?     ## Any admin role ?
    #   can :manage, :all
    # end

  end
end
