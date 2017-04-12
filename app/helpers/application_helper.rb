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
    case session[:language]
    when 'en'
      date.strftime("%d/%m/%Y %I:%m%P")
    when 'pt-BR'
      date.strftime("%d/%m/%Y %H:%M")
    else
      date.strftime("%d/%m/%Y %H:%M")
    end

  end
end
