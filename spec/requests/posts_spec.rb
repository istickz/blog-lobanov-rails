require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    subject { get '/posts' }

    context 'with zero posts' do
      it 'returns 0 posts', :lobanov do
        get '/posts'
        expect(json.size).to eq(0)
      end
    end

    context 'with posts' do
      before do
        create_list :post, 2
      end

      it 'returns all posts', :lobanov do
        subject
        expect(json.size).to eq(2)
      end
    end
  end
end
