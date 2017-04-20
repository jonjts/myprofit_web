class CurrencyInput < SimpleForm::Inputs::Base

  def input(wrapper_options)
    @money = price(object[attribute_name])
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    "$ #{@builder.text_field(attribute_name, merged_input_options)}".html_safe
    template.content_tag(:div, class: 'input-group') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat template.content_tag(:span, template.content_tag(:span, "", :class => "glyphicon glyphicon-usd") ,:class => "input-group-addon")
    end
  end

  def input_html_options
    super.merge({value: @money})
  end

  def price value
    if value.blank? || value == 0
      value = 0
    end
    "%.2f" % value
  end

end
