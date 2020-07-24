class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :received_kudos, class_name: "Kudo", foreign_key: :recipient_id
  has_many :sent_kudos, class_name: "Kudo", foreign_key: :sender_id
  has_many :kudos
end
