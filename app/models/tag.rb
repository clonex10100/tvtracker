class Tag < ActiveRecord::Base
  has_many :show_tags
  has_many :shows, through: :show_tags
end
