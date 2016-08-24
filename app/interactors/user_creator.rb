class UserCreator < ActiveInteraction::Base
  integer  :first_name
  integer  :last_name
  object   :user, default: nil

  def execute
    model.tap do |model|
      model.update!(user_input)
    end
  end

  def model
    @model ||= user || User.new
  end

  private
  def user_input
    inputs.except(:user)
  end
end
