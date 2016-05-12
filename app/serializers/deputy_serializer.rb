class DeputySerializer < ActiveModel::Serializer
  attributes :id, :name,:deputy_name,:age,:gender,:uf_id,:party_id,:registration,:legislation_situation
end
