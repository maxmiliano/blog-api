# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable,
         :jwt_authenticatable,
         :trackable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  validates :username,
            uniqueness: { case_sensitive: false },
            presence: true,
            allow_blank: false

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sentive: false },
            presence: true,
            allow_blank: false
end
