class Kudo < ApplicationRecord
    validates :message, presence: true, length: { maximum: 500 }
    belongs_to :sender, class_name: "User", foreign_key: :sender_id
    belongs_to :recipient, class_name: "User", foreign_key: :recipient_id
    belongs_to :user
    validates :sender_id, presence: true
    validates :recipient_id, presence: true
end
