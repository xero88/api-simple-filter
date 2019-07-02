# frozen_string_literal: true

require "_helpers/spec_helper"
require "_helpers/initialize_database"

RSpec.describe ApiSimpleFilter::FieldExists, type: :model do
  subject { ApiSimpleFilter::FieldExists.new }

  # remark: here we take user for exemple
  describe "return true if the field exist" do
    it "field exists" do
      result = subject.call(entity: User, field: "login")

      expect(result).to eq(true)
    end

    it "field do not exists" do
      result = subject.call(entity: User, field: "foo")

      expect(result).to eq(false)
    end
  end
end
