class Project < ApplicationRecord
  belongs_to :created_user, class_name: 'User'
end
