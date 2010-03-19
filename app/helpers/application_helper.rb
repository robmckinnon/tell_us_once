# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def span_error_message_on obj, field
    error_message_on(obj, field).sub('div>','span>').sub('<div','<span')
  end
  
  def input_and_error_message field, model=:death_notification, &block
    error = span_error_message_on(model, field)
    if error.blank?
      yield field
    else
      input = yield(field).sub('<div class="fieldWithErrors"><input','<input class="fieldWithErrors"').sub('></div>','>')
      "#{input} #{error}"
    end
  end
end
