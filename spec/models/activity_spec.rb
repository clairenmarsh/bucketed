require 'rails_helper'

RSpec.describe Activity, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:location) }

    it { should belong_to(:photo) }

    it { should have_many(:comments) }

    it { should have_many(:favorites) }

    it { should belong_to(:bucket) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:activity_type).in_array([ 'Eat', 'Drink', 'Play' ]) }

    it { should validate_inclusion_of(:priority).in_array([ 'High', 'Medium', 'Low' ]) }

    it { should validate_inclusion_of(:status).in_array([ 'Want to do', 'Done', 'Deleted' ]) }
      
    end
end
