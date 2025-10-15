require "rails_helper"

RSpec.describe BancosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/bancos").to route_to("bancos#index")
    end

    it "routes to #new" do
      expect(get: "/bancos/new").to route_to("bancos#new")
    end

    it "routes to #show" do
      expect(get: "/bancos/1").to route_to("bancos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/bancos/1/edit").to route_to("bancos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/bancos").to route_to("bancos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/bancos/1").to route_to("bancos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/bancos/1").to route_to("bancos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/bancos/1").to route_to("bancos#destroy", id: "1")
    end
  end
end
