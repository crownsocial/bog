class User < ActiveRecord::Base

  has_secure_password
  has_many :creatures
  has_many :vote2s, as: :votable
  has_many :ratings, class_name: 'Vote2'
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates_format_of :email, :with => /@/

  validates :password,
    presence: true,
    :on => [:create, :update]

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end