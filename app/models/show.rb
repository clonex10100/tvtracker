class Show < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  belongs_to :user
  has_many :show_tags
  has_many :tags, through: :show_tags
end
