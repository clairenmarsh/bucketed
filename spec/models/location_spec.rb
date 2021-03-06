require 'rails_helper'

RSpec.describe Location, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:activities) }

    it { should have_many(:users) }

    it { should have_many(:lists) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
