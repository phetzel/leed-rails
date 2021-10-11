class Employee < ApplicationRecord
    validates :name, :title, :description, presence: true
    has_one_attached :image
end
