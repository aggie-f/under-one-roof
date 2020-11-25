class Experience < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :host, class_name: "User"
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :instances, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :customers, through: :bookings
  has_many :experience_categories
  has_many :categories, through: :experience_categories

  validates :name, length: {minimum: 2}, presence: true
  validates :description, length: {minimum: 10}, presence: true
  validates :price, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :duration, presence: true
  validates :max_guests, presence: true
  validates :language, presence: true



  # def average_rating
  #   reviews.pluck(:rating) / reviews.count.to_f
  # end
end
