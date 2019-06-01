require 'rails_helper'

RSpec.describe Photo, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:users) }

    it { should have_many(:buckets) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
