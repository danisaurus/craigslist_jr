def display_error(object, field)
  if object.errors[field].any?
    "error"
  end
end