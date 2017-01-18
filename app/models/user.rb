class User < ApplicationRecord
  belongs_to :state
  has_secure_password
  has_many :results

  validates :contact_name, :email, :company_address, :city, :zipcode, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  after_initialize :init
  def init
    self.admin = false if self.admin.nil?
  end
end
