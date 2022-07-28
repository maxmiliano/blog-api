require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let(:posts) { Array(10).new { FactoryBot.create(:post) } }
    let(:action) { get '/api/v1/posts' }

    it 'returns all posts' do
      action

      expect(response).to have_http_status(:success)

      posts_data = JSON.parse(response.body)
      expect(posts_data.count).to eq(10)

    end
  end

  describe 'POST /create', type: :request do
    context 'with valid paramters' do
      let(:valid_post) { FactoryBot.create(:post) }
      let(:action) {
        post '/api/v1/posts/', params: {
          post: {
            title: valid_post.title,
            content: valid_post.content,
          }
        }
      }

      it 'returns created post data' do
        action

        post_data = JSON.parse(response.body)

        expect(response).to have_http_status(:created)
        expect(post_data['title']).to eq(valid_post.title)
        expect(post_data['content']).to eq(valid_post.content)
      end

    end

    context 'with invalid parameters' do
      let(:invalid_post) { FactoryBot.create(:post, title: '', content: '') }
      let(:action) {
        post '/api/v1/posts/', params: {
          post: {
            title: invalid_post.title,
            content: invalid_post.content,
          }
        }
      }

      it 'returns an unprocessable_entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:post) { create(:post) }
    let(:action) {
      delete "/api/v1/posts/#{post.id}"
    }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

  end

end
