class Category < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :classifieds
end
