module ApiSimpleFilter
  class Reduce
    def call(records, params_hash)
      entity = records.klass # Like Product

      requests = ApiSimpleFilter::ExtractParams.new.call(params_hash).map do |param|
        raise ApiSimpleFilter::FieldNotFoundError, param[:name] unless ApiSimpleFilter::FieldExists.new.call(entity: entity, field: param[:name])

        type = ApiSimpleFilter::FieldType.new.call(entity: entity, field: param[:name])
        request = ApiSimpleFilter::RequestBuilder.new.call(name: param[:name], value: param[:value], operator: param[:operator], type: type)
        request
      end

      records.where(requests.join(" AND "))
    end
  end
end
