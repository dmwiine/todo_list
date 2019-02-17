require 'rails helper'

RSpec.describe 'Authentication', type: :request do
    describe 'POST /auth/login' do
        let(:user) { create(:user) }
        let(:headers) { valid_headers.except('Authorization') }
        let(:valid_credentials) do
            {
              email: user.email,
              password: user.password
            }.to_json
        end
        let(:invalid_credentials) do
            {
                email: Faker::Internet.email,
                password: Faker::Internet.password
            }.to_json
        end
        
        context 'request with valid credentials' do
            before { post '/auth/login', params: valid_credentials, headers: headers }
    
            it 'returns authentication token' do
                expect(json['auth_token']).not_to be_nil
            end
        end
    
        context 'request with invalid credentials' do
            before { post '/auth/login', params: invalid_credentials, headers: headers }
    
            it 'returns a failure message' do
                expect(json['message']).to match(/Invalid credentials/)
            end
        end
    end
end  