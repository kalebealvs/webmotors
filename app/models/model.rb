class Model < ActiveRecord::Base
  belongs_to :make
  validates :name, uniqueness: true
  validates :name, :make_id, presence: true
  validate :make_exists?
end
