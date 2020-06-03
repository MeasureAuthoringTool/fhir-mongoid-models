module FHIR
  class MolecularSequenceRepository < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceRepository'
    embeds_one :type, class_name: 'RepositoryType'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :datasetId, type:  # primitive
    embeds_one :_datasetId, class_name: 'Extension'
    field :variantsetId, type:  # primitive
    embeds_one :_variantsetId, class_name: 'Extension'
    field :readsetId, type:  # primitive
    embeds_one :_readsetId, class_name: 'Extension'
  end
end
