class Post < ActiveRecord::Base
  belongs_to :hub
  attr_accessible :content, :name, :title

  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
