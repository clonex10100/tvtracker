class User < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  validates_presence_of :name
  has_secure_password
  has_many :shows
  has_many :tags
  has_many :catagories
end
