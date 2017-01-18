class Quote < MailForm::Base
  attribute :name, validate: true
  attribute :company
  attribute :phone, validate: true
  attribute :email, validate: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  attribute :description, validate: true

  def headers
    {
      subject: "Test for Albion",
      to: "albion@papelex.net",
      from: %("#{name}" <#{email}>)
    }
  end
end
