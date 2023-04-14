class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is? :admin
      can :manage, :all
    else
      can :read, :all
      can %i[create destroy], Post, author_id: user.id
      can %i[create destroy], Comment, user_id: user.id
    end
  end
end
