require "rails_helper"

RSpec.describe InstalacaosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/instalacaos").to route_to("instalacaos#index")
    end

    it "routes to #new" do
      expect(get: "/instalacaos/new").to route_to("instalacaos#new")
    end

    it "routes to #show" do
      expect(get: "/instalacaos/1").to route_to("instalacaos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/instalacaos/1/edit").to route_to("instalacaos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/instalacaos").to route_to("instalacaos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/instalacaos/1").to route_to("instalacaos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/instalacaos/1").to route_to("instalacaos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/instalacaos/1").to route_to("instalacaos#destroy", id: "1")
    end
  end
end
