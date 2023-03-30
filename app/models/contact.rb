class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def as_json(options={})
    h = super(options)
    h[:birthdate] = I18n.l(birthdate) unless birthdate.blank?
    h
  end
  # def to_br
  #   {
  #     name: name,
  #     email: email,
  #     birthdate: (I18n.l(birthdate) unless birthdate.blank?)
  #   }
  # end

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
