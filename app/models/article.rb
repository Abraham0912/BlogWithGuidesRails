class Article < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 } # todos los artículos tengan un título de al menos cinco caracteres
end
