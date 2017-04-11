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
end
