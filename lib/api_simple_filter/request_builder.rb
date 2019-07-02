module ApiSimpleFilter
  class RequestBuilder
    def call(name:, operator:, value:, type:)
      if value.nil? || value.to_s.casecmp("null").zero?
        return "#{name} IS NULL"
      end

      if type.to_s == "integer"
        return "#{name}::integer <> #{value.to_i}" if operator.to_s == "neq"
        return "#{name}::integer > #{value.to_i}" if operator.to_s == "gt"
        return "#{name}::integer >= #{value.to_i}" if operator.to_s == "gte"
        return "#{name}::integer < #{value.to_i}" if operator.to_s == "lt"
        return "#{name}::integer <= #{value.to_i}" if operator.to_s == "lte"
        return "#{name}::integer = #{value.to_i}"
      end

      if type.to_s == "string"
        return "LOWER(#{name}) LIKE '%#{value.downcase}%'" if operator.to_s == "contains"
        return "#{name} <> '#{value.downcase}'" if operator.to_s == "neq"
        return "#{name} = '#{value.downcase}'"
      end
    end
  end
end
