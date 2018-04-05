require 'rails_helper'

RSpec.describe "LoadTimes", type: :request do
  describe "GET /load_times" do
    it "works! (now write some real specs)" do
      get load_times_path
      expect(response).to have_http_status(200)
    end
  end
end
