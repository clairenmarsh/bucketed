require 'rails_helper'

RSpec.describe Bucket, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:photo) }

    it { should have_many(:favorites) }

    it { should have_many(:activities) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
