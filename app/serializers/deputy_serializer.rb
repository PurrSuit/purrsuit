class DeputySerializer < ActiveModel::Serializer
  attributes :id, :name,:deputy_name,:email,:age,:gender,:uf_id,:party_id,:registration,:legislation_situation,:image_path
end
