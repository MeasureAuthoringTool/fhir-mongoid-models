module FHIR
  class Address < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Address'
    embeds_one :use, class_name: 'AddressUse'
    embeds_one :type, class_name: 'AddressType'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    field :line, type: Array # primitive
    embeds_many :_line, class_name: 'Extension'
    field :city, type:  # primitive
    embeds_one :_city, class_name: 'Extension'
    field :district, type:  # primitive
    embeds_one :_district, class_name: 'Extension'
    field :state, type:  # primitive
    embeds_one :_state, class_name: 'Extension'
    field :postalCode, type:  # primitive
    embeds_one :_postalCode, class_name: 'Extension'
    field :country, type:  # primitive
    embeds_one :_country, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
  end
end
