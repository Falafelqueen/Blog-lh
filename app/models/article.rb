class Article < ApplicationRecord
  belongs_to :user
  has_many :resources
  accepts_nested_attributes_for :resources
end
