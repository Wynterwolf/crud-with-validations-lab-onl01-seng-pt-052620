class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: %w(True False) }
    validates :artist_name, presence: true
    
end
