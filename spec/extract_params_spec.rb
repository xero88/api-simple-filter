# frozen_string_literal: true

require "_helpers/spec_helper"

RSpec.describe ApiSimpleFilter::ExtractParams, type: :model do
  subject { ApiSimpleFilter::ExtractParams.new }

  describe "return name, operator and value of params" do
    it "eq" do
      result = subject.call({ "foo_eq": "bar" })

      expect(result).to eq([{ name: "foo", operator: "eq", value: "bar" }])
    end

    it "neq" do
      result = subject.call({ "foo_neq": "bar" })

      expect(result).to eq([{ name: "foo", operator: "neq", value: "bar" }])
    end

    it "gt" do
      result = subject.call({ "foo_gt": "bar" })

      expect(result).to eq([{ name: "foo", operator: "gt", value: "bar" }])
    end

    it "gte" do
      result = subject.call({ "foo_gte": "bar" })

      expect(result).to eq([{ name: "foo", operator: "gte", value: "bar" }])
    end

    it "lt" do
      result = subject.call({ "foo_lt": "bar" })

      expect(result).to eq([{ name: "foo", operator: "lt", value: "bar" }])
    end

    it "lte" do
      result = subject.call({ "foo_lte": "bar" })

      expect(result).to eq([{ name: "foo", operator: "lte", value: "bar" }])
    end

    it "in" do
      result = subject.call({ "foo_in": "bar" })

      expect(result).to eq([{ name: "foo", operator: "in", value: "bar" }])
    end

    it "contains" do
      result = subject.call({ "foo_contains": "bar" })

      expect(result).to eq([{ name: "foo", operator: "contains", value: "bar" }])
    end

    context "without an operator" do
      it "return eq" do
        result = subject.call({ "foo": "bar" })

        expect(result).to eq([{ name: "foo", operator: "eq", value: "bar" }])
      end
    end

    context "with multiple params" do
      it "return multiple hash" do
        result = subject.call({ "foo_in": "bar", "test_eq": "2", "other_gte": "2000" })

        expect(result).to eq([{ name: "foo", operator: "in", value: "bar" }, { name: "test", operator: "eq", value: "2" }, { name: "other", operator: "gte", value: "2000" }])
      end
    end
  end
end
