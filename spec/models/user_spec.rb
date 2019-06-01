require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:location) }

    it { should belong_to(:photo) }

    it { should have_many(:followers2) }

    it { should have_many(:followers) }

    it { should have_many(:comments) }

    it { should have_many(:buckets) }

    it { should have_many(:locations) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
