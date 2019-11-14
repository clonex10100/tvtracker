class Catagory < ActiveRecord::Base
  has_many :shows
  belongs_to :user
end
