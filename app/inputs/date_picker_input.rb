class DatePickerInput < SimpleForm::Inputs::Base

  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group date form_datetime') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat template.content_tag(:span, template.content_tag(:span, "",
                                                                       :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
    end

  end

  def input_html_options
    format_en = "YYYY/MM/DD HH:mm A"
    super.merge({class: 'form-control datetimepicker', :"data-date-format" => "DD/MM/YYYY",
                 :"data-provide" => 'datatimepicker', 'data-behaviour' => 'datetimepicker'})
  end

end
