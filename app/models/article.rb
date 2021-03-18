class Article < ApplicationRecord
  
  has_many :comments, dependent: :destroy #Relacion uno a muchos con la tabla comments = model Comment, dependent: :destroy

  validates :title, presence: true,
                    length: { minimum: 5 } # todos los artículos tengan un título de al menos cinco caracteres
end
