module ApiSimpleFilter
  class ExtractParams
    # Equals, notEquals, GreatThan, GreaterThanEquals, LowerThan, LowerThanEquals, In
    OPERATORS = ["eq", "neq", "gt", "gte", "lt", "lte", "in", "contains"]

    def call(params)
      params.keys.map do |param_name|
        if no_operator?(param_name)
          next {
                 name: param_name.to_s,
                 operator: "eq",
                 value: params[param_name],
               }
        end

        OPERATORS.map do |operator|
          next unless have_operator?(param_name, operator)

          {
            name: param_name.to_s.remove("_#{operator}"),
            operator: operator,
            value: params[param_name],
          }
        end.compact
      end.flatten.compact
    end

    private

    def no_operator?(param_name)
      !param_name.to_s.include?("_")
    end

    def have_operator?(param_name, operator)
      param_name.to_s.end_with?("_#{operator}")
    end
  end
end
