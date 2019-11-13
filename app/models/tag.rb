class Tag < ActiveRecord::Base
  has_many :show_tags
  belongs_to :user
  has_many :shows, through: :show_tags
end
