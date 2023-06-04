class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :comments, dependent: :destroy
  has_many :gossips, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :sent_messages, class_name: "PrivateMessage", foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: "PrivateMessage", foreign_key: "recipient_id", dependent: :destroy
end
