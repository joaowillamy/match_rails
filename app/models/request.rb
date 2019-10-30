class Request < ApplicationRecord
  belongs_to :user

  enum status: [ :open, :pending, :finished ]
end
