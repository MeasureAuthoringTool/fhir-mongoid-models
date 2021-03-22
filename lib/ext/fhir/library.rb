# Custom functionalty for fhir-mongoid-models/app/models/fhir/library.rb
module FHIR
  class Library < DomainResource

    def create_data_elements(value_sets)
      dataRequirement.map do |data_req|
        type = data_req.type.value
        oid, title =
          # for ValueSets
          if data_req.codeFilter&.first&.valueSet?
            oid = data_req.codeFilter.first&.valueSet&.value&.match(/([0-2])((\.0)|(\.[1-9][0-9]*))*$/).to_s
            value_set = value_sets.find{ |vs| vs.fhirId == oid }
            title = value_set&.name&.value
            [oid, title]
          # for DRCs
          elsif data_req.codeFilter&.first&.code?
            title = data_req.codeFilter.first.code.first.display.value
            value_set = value_sets.find{ |vs| vs.name.value == title }
            oid = value_set.fhirId
            [oid, title]
          end
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
