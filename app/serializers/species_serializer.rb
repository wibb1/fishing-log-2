class SpeciesSerializer < ActiveModel::Serializer
  attributes :id, :common_name, :scientific_name, :shallow_depth, :deep_depth
end
