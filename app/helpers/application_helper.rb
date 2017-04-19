module ApplicationHelper

  def language_name
    case session[:language]
    when 'en'
      t("infos.ingles")
    when 'pt-BR'
      t("infos.portuges")
    else
      ' '
    end
  end

  def format_date date
    # date.strftime("%d/%m/%Y")
    date
  end
end
