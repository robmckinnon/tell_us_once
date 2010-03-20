# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def span_error_message_on obj, field
    error_message_on(obj, field).sub('div>','span>').sub('<div','<span')
  end
  
  def input_and_error_message field, model=:death_notification, &block
    error = span_error_message_on(model, field)
    if error.blank?
      if model.is_a?(Symbol)
        yield field
      else
        input = yield field
        if value = model.send(field)
          if !input[/value/]
            input.sub!('<input ',"<input value='#{value}' ")
            input.sub!('></textarea>',">#{value}</textarea>")
          end
        end
        input
      end
    else
      input = yield(field)
      if input.include?('<div class="fieldWithErrors"><input')
        input.sub!('<div class="fieldWithErrors"><input','<input class="fieldWithErrors"')
        input.sub!('></div>','>')
      elsif input[/<input/]
        input.sub!('<input','<input class="fieldWithErrors"')
      elsif input[/<textarea/]
        input.sub!('<textarea','<textarea class="fieldWithErrors"')
      end
      "#{input} #{error}"
    end
  end
end
