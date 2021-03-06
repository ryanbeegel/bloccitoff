class Todo < ActiveRecord::Base
  belongs_to :list

  default_scope { order('created_at ASC') }

  validates :body, length: { minimum: 5 }, presence: true
  validates :list, presence: true
end
