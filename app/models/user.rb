class User < ApplicationRecord
  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_one :enterprise, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
