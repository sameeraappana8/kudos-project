class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :received_kudos, class_name: "Kudo", foreign_key: :recipient_id, dependent: :destroy
  has_many :sent_kudos, class_name: "Kudo", dependent: :destroy, foreign_key: :sender_id do
    def this_week
      where(:created_at => (Time.zone.now.beginning_of_week..Time.zone.now))
    end
  end
end
