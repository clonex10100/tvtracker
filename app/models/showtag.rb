class ShowTag < ActiveRecord::Base
  belongs_to :show
  belongs_to :tag
end
