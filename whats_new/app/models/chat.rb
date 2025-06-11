class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :messages
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validate :sender_and_receiver_cannot_be_same

  
  scope :involving, ->(user) {
    where("sender_id = :id OR receiver_id = :id", id: user.id)
  }

  def other_participant(current_user)
    sender == current_user ? receiver : sender
  end

  private

  def sender_and_receiver_cannot_be_same
    if sender_id == receiver_id
      errors.add(:receiver_id, "must be different from sender")
    end
  end
end
