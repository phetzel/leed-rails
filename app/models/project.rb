class Project < ApplicationRecord
    validates :name, :location, :services, :description, presence: true
    has_one_attached :image
end
