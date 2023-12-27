class Project < ApplicationRecord
  belongs_to :created_user, class_name: 'User'
  has_many :invitations
  has_and_belongs_to_many :users
  has_many :tasks, dependent: :destroy
end
