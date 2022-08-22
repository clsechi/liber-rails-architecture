# frozen_string_literal: true

Response = Struct.new(:success?, :message, :data, keyword_init: true) do
  def error
    data
  end

  def error?
    !success?
  end
end
