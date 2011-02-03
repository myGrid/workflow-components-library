class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
    elsif user.role? :member
      can :create, Component
      can [ :update, :destroy ], Component do |c|
        c.try(:submitter) == user
      end
      
      can :create, Port do |p|
        p.component.try(:submitter) == user
      end
      
      can :create, Answer
      can [ :update, :destroy ], Answer do |a|
        a.try(:user) == user
      end
    # elsif user.role? :writter
    #   can :manage, [Post, Asset]
    # elsif user.role? :memeber
    #   can :read, [MemberPost, Asset]
    #   # manage posts, assets user owns
    #   can :manage, Post do |p|
    #     p.try(:owner) == user
    #   end
    #   can :manage, Asset do |a|
    #     a.try(:owner) == user
    #   end
    else
      can :read, :all
    end
  end
end
