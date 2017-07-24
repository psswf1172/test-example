require 'rails_helper'

RSpec.describe IceCreamsController, type: :controller do
  render_views

  describe "GET #index" do
    it "generates a csv report" do
      get :index, format: :csv
      expect(response.headers["Content-Disposition"]).to eq "attachment"
      expect(response.body).to eq "name,servings\n"
    end
  end
end