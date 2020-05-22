require "rails_helper"

require 'rails_helper'

RSpec.describe MovieActors, type: :model do
  describe "relationships" do
    it {should belong_to :movie}
    it {should belong_to :actor}
  end
end
