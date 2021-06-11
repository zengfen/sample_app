module SampleApp
  class User < ApplicationRecord
    has_many :microposts

    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # 􏰏􏲯􏲰 不允许email中出现连续点号的正则表达式
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false} # case_sensitive: false 不区分大小写
    # validates :password, length: { minimum: 6 }
    #
    # before_save { self.email = email.downcase}
    # # 或者 before_save { email.downcase! }
    # has_secure_password #

    def self.by_letter(letter)
      where("name LIKE ?", "#{letter}%").order(:name)
    end

    def self.test
      puts "123"
    end
  end
end
