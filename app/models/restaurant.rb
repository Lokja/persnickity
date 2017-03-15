class Restaurant < ApplicationRecord
  has_many :restaurant_violations
  has_many :violations, through: :restaurant_violations
  belongs_to :neighborhood
  validates :zip_code, presence: true

  #TODO
  # after_create :assign_neighborhood_id_from_zip
  #
  # def assign_neighborhood_id_from_zip
  #
  # end

  def self.ACTIVE_GRADES
    ['A', 'B', 'C']
  end

  def next_id
    return 1 if self.id == Restaurant.all.count
    self.id + 1
  end

  def previous_id
    return Restaurant.all.count if self.id == 1
    self.id - 1
  end
end
