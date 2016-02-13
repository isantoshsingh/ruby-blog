class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 20}
  validates :user_id, presence: true
end
