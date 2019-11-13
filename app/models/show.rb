class Show < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  belongs_to :user
end
