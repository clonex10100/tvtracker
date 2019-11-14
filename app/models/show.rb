class Show < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :show_tags
  has_many :tags, through: :show_tags
end
