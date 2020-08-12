# Custom functionalty for fhir-mongoid-models/app/models/fhir/library.rb
module FHIR
  class Library < DomainResource

    def create_data_elements(fhir_value_sets)
      dataRequirement.map do |dataReq|
        type = dataReq.type.value
        oid = dataReq.codeFilter.first&.valueSet&.value&.match(/([0-2])((\.0)|(\.[1-9][0-9]*))*$/).to_s
        fhir_value_set = fhir_value_sets.find{|fvs| fvs.fhirId == oid}
        title = fhir_value_set&.name&.value
        description = "#{type}: #{title}"

        CQM::DataElement.new(
          codeListId: oid,
          valueSetTitle: title,
          description: description,
          fhir_resource: "FHIR::#{type}".constantize.create
        )
      end
    end

  end
end
