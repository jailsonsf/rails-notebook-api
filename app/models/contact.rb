class Contact < ApplicationRecord
  belongs_to :kind

  # def author
  #   'Jailson Soares'
  # end

  # def kind_description
  #   kind.description
  # end

  # def as_json(options={})
  #   super(
  #     methods: %i[kind_description author]
  #   )
  # end
end
