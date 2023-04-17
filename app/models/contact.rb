class Contact < ApplicationRecord
  belongs_to(:kind)
  has_many(:phones, dependent: :delete_all)
  has_one(:address, dependent: :delete)

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def kind_description
  #   kind.description
  # end

  # def as_json(options={})
  #   super(
  #     methods: %i[kind_description author]
  #   )
  # end
end
