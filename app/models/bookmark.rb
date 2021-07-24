class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # validates :comment, length: { mimimum: 6 }

end
