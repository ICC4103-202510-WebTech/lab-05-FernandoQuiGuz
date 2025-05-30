class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can [:read, :update], User, id: user.id

    can :read, Chat, sender_id: user.id
    can :read, Chat, receiver_id: user.id

    can :create, Message do |message|
      message.chat.users.include?(user)
    end

    can :read, Message do |message|
      message.chat.users.include?(user)
    end
  end
end
