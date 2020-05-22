require 'rails_helper'

RSpec.describe Studio, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :location}
  end

  
end
