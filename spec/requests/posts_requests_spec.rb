# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    let!(:posts) { Array.new(10) { FactoryBot.create(:post) } }
    let(:action) { get '/api/v1/posts' }

    it 'returns all posts' do
      sign_in user

      action

      expect(response).to have_http_status(:success)

      posts_data = JSON.parse(response.body)
      expect(posts_data.count).to eq(posts.count)
    end
  end

  describe 'POST /create', type: :request do
    context 'with valid paramters' do
      let!(:valid_post) { create(:post) }
      let(:action) do
        post '/api/v1/posts/', params: {
          post: {
            title: valid_post.title,
            content: valid_post.content
          }
        }
      end

      it 'returns created post data' do
        sign_in user
        action

        post_data = JSON.parse(response.body)

        expect(response).to have_http_status(:created)
        expect(post_data['title']).to eq(valid_post.title)
        expect(post_data['content']).to eq(valid_post.content)
      end
    end

    context 'with empty title' do
      let(:invalid_post) { build(:post, title: '') }
      let(:action) do
        post '/api/v1/posts/', params: {
          post: {
            title: invalid_post.title,
            content: invalid_post.content
          }
        }
      end

      it 'returns an unprocessable_entity status' do
        sign_in user
        action

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with empty content' do
      let(:invalid_post) { build(:post, content: '') }
      let(:action) do
        post '/api/v1/posts/', params: {
          post: {
            title: invalid_post.title,
            content: invalid_post.content
          }
        }
      end

      it 'returns an unprocessable_entity status' do
        sign_in user
        action

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:post) { create(:post) }
    let(:action) do
      delete "/api/v1/posts/#{post.id}"
    end

    it 'returns status code 204' do
      sign_in user
      action

      expect(response).to have_http_status(204)
    end
  end
end
