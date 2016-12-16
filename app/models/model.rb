class Model < ActiveRecord::Base
  belongs_to :make
  validates :name, uniqueness: true
  validates :make_id, presence: true
end
