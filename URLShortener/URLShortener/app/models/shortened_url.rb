class ShortenedUrl < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :user_id, presence: true, uniqueness: true

  
  def self.random_code
    random_code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(random_code)
      random_code = SecureRandom.urlsafe_base64
    end
    random_code
  end
  
  def self.factory(user, long_url)
    short_url = self.random_code
    ShortenedUrl.create(user_id: user.id, long_url: long_url, short_url: short_url)
  end
end