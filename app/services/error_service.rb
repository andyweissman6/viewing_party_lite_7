class ErrorService
  ERRORS_TO_HUMAN_READABLE = {
      "Email has already been taken" => "Email already exists.",
      "Password confirmation doesn't match Password" => "Passwords do not match.",
  }
  
  attr_reader :error
  def initialize(error)
    @error = error
  end

  def error_messages
    errors = error.record.errors.map(&:full_message)
      human_readable_error_messages = errors.map do |error_message|
        ERRORS_TO_HUMAN_READABLE[error_message]
      end
      human_readable_error_messages.push("Please try again.").join(" ")
  end
end