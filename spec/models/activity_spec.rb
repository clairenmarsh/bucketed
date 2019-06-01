require 'rails_helper'

RSpec.describe Activity, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:bucket) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:activity_type).in_array([ 'Eat', 'Drink', 'Play' ]) }

    it { should validate_inclusion_of(:status).in_array([ 'Want to do', 'Done', 'Deleted' ]) }
      
    end
end
