# frozen_string_literal: true

require "_helpers/spec_helper"
require "_helpers/initialize_database"

RSpec.describe ApiSimpleFilter::Reduce, type: :model do
  before(:all) do
    User.delete_all
    User.create(id: 1, login: "bill")
    User.create(id: 2, login: "steve")
  end

  subject { ApiSimpleFilter::Reduce.new }

  describe "get entity that match filters" do
    it "only users with matching filters" do
      result = subject.call(User.all, { "login_eq": "bill" })

      expect(result.count).to eq(1)
      expect(result[0].login).to eq("bill")
    end

    context " with multiple filters" do
      it "only users with matching filters" do
        result = subject.call(User.all, { "login_eq": "bill", "id_neq": 1 })

        expect(result.count).to eq(0)
      end
    end

    context "with not existing fields" do
      it "raise error" do
        expect do
          subject.call(User.all, { "foo_eq": "bill" })
        end.to raise_error ApiSimpleFilter::FieldNotFoundError
      end
    end
  end
end
