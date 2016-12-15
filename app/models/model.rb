class Model < ActiveRecord::Base
  belongs_to :make
  validates :name, uniqueness: true
end
