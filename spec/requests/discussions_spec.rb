require 'rails_helper'

RSpec.describe 'Discussions API', type: :request do
  # initialize test data
  let!(:topic) { create(:topic) }
  let!(:discussions) { create_list(:discussion, 20, topic_id: topic.id) }
  let(:topic_id) { topic.id }
  let(:id) { discussions.first.id }

  # Test suite for GET /topics/:topic_id/discussions
  describe 'GET /topics/:topic_id/discussions' do
    before { get "/topics/#{topic_id}/discussions" }

    context 'when topic exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all topic discussions' do
        expect(json.size).to eq(20)
      end
    end

    context 'when topic does not exist' do
      let(:topic_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Topic/)
      end
    end
  end

  # Test suite for GET /topics/:topic_id/discussions/:id
  describe 'GET /topics/:topic_id/discussions/:id' do
    before { get "/topics/#{topic_id}/discussions/#{id}" }

    context 'when topic discussion exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the discussion' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when topic discussion does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Discussion/)
      end
    end
  end

  # Test suite for POST /topics/:topic_id/discussions
  describe 'POST /topics/:topic_id/discussions' do
    let(:valid_attributes) {
      { author: 'Pepe',
        title: 'My life',
        message: 'tfwnogf'
      }
    }

    context 'when request attributes are valid' do
      before { post "/topics/#{topic_id}/discussions", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/topics/#{topic_id}/discussions", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for DELETE /topics/:topic_id/discussions/:id
  describe 'DELETE /topics/:topic_id/discussions/:id' do
    before { delete "/topics/#{topic_id}/discussions/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
