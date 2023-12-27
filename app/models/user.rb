class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :sent_invitations, class_name: 'Invitation', foreign_key: 'sender_id'
  has_many :received_invitations, class_name: 'Invitation', foreign_key: 'receiver_id'

  has_many :projects, foreign_key: 'created_user_id'
  has_and_belongs_to_many :joined_projects, class_name: 'Project', join_table: 'projects_users'
  

  def invitations
    sent_invitations + received_invitations
  end
end
