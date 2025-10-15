require "rails_helper"

RSpec.describe BinariosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/binarios").to route_to("binarios#index")
    end

    it "routes to #new" do
      expect(get: "/binarios/new").to route_to("binarios#new")
    end

    it "routes to #show" do
      expect(get: "/binarios/1").to route_to("binarios#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/binarios/1/edit").to route_to("binarios#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/binarios").to route_to("binarios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/binarios/1").to route_to("binarios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/binarios/1").to route_to("binarios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/binarios/1").to route_to("binarios#destroy", id: "1")
    end
  end
end
