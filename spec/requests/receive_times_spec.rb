require 'rails_helper'

RSpec.describe "ReceiveTimes", type: :request do
  describe "GET /receive_times" do
    it "works! (now write some real specs)" do
      get receive_times_path
      expect(response).to have_http_status(200)
    end
  end
end
