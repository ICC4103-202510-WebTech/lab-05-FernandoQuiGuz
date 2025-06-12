class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.admin?
      can :manage, :all  
    else
      can :update, User, id: user.id
      can :read, User, id: user.id  
      
      can :read, Chat, sender_id: user.id
      can :read, Chat, receiver_id: user.id
      can :create, Chat

      can :read, Message, chat: { sender_id: user.id }
      can :read, Message, chat: { receiver_id: user.id }
      can :create, Message
    end
  end
end
