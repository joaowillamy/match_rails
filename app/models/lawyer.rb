class Lawyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users

  class << self

    # This method allow to insert single user and a collection of users
    def append_users(lawyer, users)
      lawyer.users << users
      lawyer.save
    end
  end
end
