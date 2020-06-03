class User < ApplicationRecord
  validates :password, length: { in: 6..20 }, :if => :password
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_many :tweets
  belongs_to :organization

  has_secure_password

  # Check if user is admin
  def is_admin?
    is_admin
  end

  def can_perform_action? tweet
    is_admin || is_tweet_owner(tweet)
  end

  def is_tweet_owner tweet
    self == tweet.user
  end

  def get_colleagues
    User.where(organization_id: organization_id)
  end

  # For generating reset password token
  def generate_password_token
    # update_attributes(reset_password_token: generate_token, reset_password_sent_at: Time.now.utc)
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  # check reset password token is valid or not
  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
end
