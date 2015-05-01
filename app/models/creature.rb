class Creature < ActiveRecord::Base
  belongs_to :users
  has_and_belongs_to_many :tags
has_many :vote2s, as: :votable
validates_presence_of :slug

  def to_param
    slug
  end

  #   def slug
  #   name.downcase.gsub(" ", "-")
  # end

  # def to_param
  #   "#{id}-#{slug}"
  # end
end
