class Model < ActiveRecord::Base
  belongs_to :make
  validates :name, uniqueness: true
  validates :name, :make_id, presence: true
  validate :make_exists?

  private
    def make_exists?
      errors.add(:base, 'must have a valid Maker') if Make.where(id: make_id).none?
    end
end
