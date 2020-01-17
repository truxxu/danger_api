require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  # initialize test data
  # let!(:topic) { create(:topic) }
  # let!(:discussions) { create_list(:discussion, 20, topic_id: topic.id) }
  # let(:topic_id) { topic.id }
  # let(:id) { discussions.first.id }

  let!(:topic) { create(:topic) }
  let!(:discussion) { create(:discussion, topic_id: topic.id) }
  let!(:posts) { create_list(:post, 20, discussion_id: discussion.id) }
  let(:topic_id) { topic.id }
  let(:discussion_id) { discussion.id }
  let(:id) { posts.first.id }

  # Test suite for GET /discussions/:discussion_id/posts
  describe 'GET /discussions/:discussion_id/posts' do
    before { get "/discussions/#{discussion_id}/posts" }

    context 'when discussion exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all discussion posts' do
        expect(json.size).to eq(20)
      end
    end

    context 'when discussion does not exist' do
      let(:discussion_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find discussion/)
      end
    end
  end

  # Test suite for POST /discussions/:discussion_id/posts
  describe 'POST /discussions/:discussion_id/posts' do
    let(:valid_attributes) {
      { author: 'Pepe', message: 'tfwnogf'}
    }

    context 'when request attributes are valid' do
      before { post "/discussions/#{discussion_id}/posts", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/discussions/#{discussion_id}/posts", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Message can't be blank/)
      end
    end
  end


end
