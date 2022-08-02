require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user, password: password) }
  let(:password) { 'swordfish123' }

  context 'with invalid email' do
    let(:email) { 'invalid_email' }

    let(:user) { build(:user, email: email) }

    it 'does not create user' do
      expect(user.valid?).to be_falsy
    end

  end

end
