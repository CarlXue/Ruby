class Post < ActiveRecord::Base
  # Relationship
  belongs_to :user
  has_many :comments
  # Posts can have tags
  acts_as_taggable

  def can_edit? other
    user ? user==other : true
  end

end
