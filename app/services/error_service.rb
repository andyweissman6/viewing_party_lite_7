class ErrorService
  READABLE_ERRORS = {
      "Email has already been taken" => "Email already exists.",
      "Password confirmation doesn't match Password" => "Passwords do not match.",
  }

  attr_reader :error
  def initialize(error)
    @error = error
  end

  def error_messages
    errors = error.record.errors.map(&:full_message)
      each_error = errors.map do |error_message|
        READABLE_ERRORS[error_message]
      end
      each_error.push("Please try again.").join(" ")
  end
end