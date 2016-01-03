class Message < ActiveRecord::Base
  validates :name, :sender, :body, presence: true
end
