class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assigned_user, class_name: 'User', foreign_key: 'user_id', optional: true
end
