class Task < ActiveRecord::Base
  attr_accessible :checked, :date, :description, :name
end
