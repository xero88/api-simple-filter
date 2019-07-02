module ApiSimpleFilter
  class FieldExists
    def call(entity:, field:)
      entity.attribute_names.include?(field)
    end
  end
end
