# frozen_string_literal: true

# Class to register tokens that that should no longer grant access
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end
