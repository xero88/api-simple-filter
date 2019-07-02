module ApiSimpleFilter
  class FieldType
    def call(entity:, field:)
      entity.columns_hash[field]&.type
    end
  end
end
