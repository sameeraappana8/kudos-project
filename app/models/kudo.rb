class Kudo < ApplicationRecord
    validates :message, presence: true, length: { maximum: 500 }
    belongs_to :sender, class_name: "User", foreign_key: :sender_id
    belongs_to :recipient, class_name: "User", foreign_key: :recipient_id
    validates :sender_id, presence: true
    validates :recipient_id, presence: true
    validate :user_quota, :on => :create

private 
  def user_quota
    if sender.sent_kudos.this_week.count >= 3
      errors.add(:base, "Exceeds weekly limit of Kudos")
    end
  end
end
