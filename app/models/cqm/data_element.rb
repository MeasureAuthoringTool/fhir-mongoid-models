module CQM
  class DataElement
    include Mongoid::Document
    embedded_in :patient, class_name: "CQM::Patient"
    embedded_in :measure, class_name: "CQM::Measure"

    # ValueSet oid of the specific type.
    field :codeListId, type: String       # OID of this element
    field :valueSetTitle, type: String    # display label for this resource
    field :description, type: String      # Optional description. This is class_name: valueSetTitle
    embeds_one :fhir_resource, class_name: "FHIR::DomainResource"

    def as_json(*args)
      result = Hash.new
      unless self.codeListId.nil?
        result['codeListId'] = self.codeListId
      end
      unless self.valueSetTitle.nil?
        result['valueSetTitle'] = self.valueSetTitle
      end
      unless self.description.nil?
        result['description'] = self.description
      end
      unless self.fhir_resource.nil?
        result['fhir_resource'] = self.fhir_resource.as_json(args)
      end

      result
    end

    def self.transform_json(json_hash, target = DataElement.new)
      result = target
      result['codeListId'] = json_hash['codeListId'] unless json_hash['codeListId'].nil?
      result['valueSetTitle'] = json_hash['valueSetTitle'] unless json_hash['valueSetTitle'].nil?
      result['description'] = json_hash['description'] unless json_hash['description'].nil?
      result['fhir_resource'] = FHIR::Resource.transform_json(json_hash['fhir_resource']) unless json_hash['fhir_resource'].nil?

      result
    end
  end
end
