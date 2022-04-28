class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :manage, Recipe, user_id: user.id
      can :manage, Food, user_id: user.id
      can :manage, Recipe do |recipe|
        recipe.user == user || recipe.public == true || !recipe.user_id?
      end
    end
  end
end
