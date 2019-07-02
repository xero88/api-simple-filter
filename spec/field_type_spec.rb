# frozen_string_literal: true

require "_helpers/spec_helper"
require "_helpers/initialize_database"

RSpec.describe ApiSimpleFilter::FieldType, type: :model do
  subject { ApiSimpleFilter::FieldType.new }

  # remark: here we take user for exemple
  describe "return the field type" do
    it "string" do
      result = subject.call(entity: User, field: "login")

      expect(result).to eq(:string)
    end

    it "integer" do
      result = subject.call(entity: User, field: "id")

      expect(result).to eq(:integer)
    end

    it "datetime" do
      result = subject.call(entity: User, field: "created_at")

      expect(result).to eq(:datetime)
    end

    context "when field not existing" do
      it "return nil" do
        result = subject.call(entity: User, field: "foo")

        expect(result).to eq(nil)
      end
    end
  end
end
