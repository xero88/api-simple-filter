# frozen_string_literal: true

require "_helpers/spec_helper"

RSpec.describe ApiSimpleFilter::RequestBuilder, type: :model do
  subject { ApiSimpleFilter::RequestBuilder.new }

  describe "return string request" do
    context "with string" do
      it "contains (search)" do
        result = subject.call(name: "foo", value: "bar", operator: "contains", type: "string")

        expect(result).to eq("LOWER(foo) LIKE '%bar%'")
      end

      it "equals" do
        result = subject.call(name: "foo", value: "bar", operator: "eq", type: "string")

        expect(result).to eq("foo = 'bar'")
      end

      it "not equals" do
        result = subject.call(name: "foo", value: "bar", operator: "neq", type: "string")

        expect(result).to eq("foo <> 'bar'")
      end
    end

    context "with integer" do
      it "equals" do
        result = subject.call(name: "foo", value: "1000", operator: "eq", type: "integer")

        expect(result).to eq("foo::integer = 1000")
      end

      it "not equals" do
        result = subject.call(name: "foo", value: "1000", operator: "neq", type: "integer")

        expect(result).to eq("foo::integer <> 1000")
      end

      it "gt" do
        result = subject.call(name: "foo", value: "1000", operator: "gt", type: "integer")

        expect(result).to eq("foo::integer > 1000")
      end

      it "gte" do
        result = subject.call(name: "foo", value: "1000", operator: "gte", type: "integer")

        expect(result).to eq("foo::integer >= 1000")
      end

      it "lt" do
        result = subject.call(name: "foo", value: "1000", operator: "lt", type: "integer")

        expect(result).to eq("foo::integer < 1000")
      end

      it "lte" do
        result = subject.call(name: "foo", value: "1000", operator: "lte", type: "integer")

        expect(result).to eq("foo::integer <= 1000")
      end
    end

    it "with null" do
      result = subject.call(name: "foo", value: nil, operator: "eq", type: "integer")

      expect(result).to eq("foo IS NULL")
    end
  end
end
