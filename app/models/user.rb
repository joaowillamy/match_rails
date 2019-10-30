class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :request

  belongs_to :lawyer, optional: true

  scope :without_lawyer, lambda { |state_id|
    joins(:request).where(brazilian_state_id: state_id, lawyer_id: nil)
  }

  class << self
    def update_status(user, status)
      user.request.status = status
      user.request.save
    end
  end
end
