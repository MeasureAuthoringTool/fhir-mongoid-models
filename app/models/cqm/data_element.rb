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
  end
end
