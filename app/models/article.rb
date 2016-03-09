class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 20}
  validates :user_id, presence: true

  def to_param
    "#{id} #{title}".parameterize
  end

  searchable do
    text :title, boost: 5
    text :body, :publish_month
    string :publish_month
    time :created_at
  end

  def publish_month
    created_at.strftime("%B %Y")
  end
end
