class Invitation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :project
  scope :pending, -> { where(status: 'pending') }
   # Add this line to define a virtual attribute

  validates :receiver_email, presence: true, format: { with: Devise.email_regexp }

  before_validation :find_user_by_email, on: :create

  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  # Your other validations and methods...

  private

  def find_user_by_email
    self.receiver = User.find_by_email(receiver_email)
  end

  
end
