class Movie < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, :description, :movie_length, :rating, :director, presence: :true, length: {minimum: 5}
end
