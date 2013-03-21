class Task < ActiveRecord::Base
  attr_accessible :checked, :date, :description, :name
  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
end
