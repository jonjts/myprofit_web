class LanguageController < ApplicationController

  def set_pt
    session[:language] = "pt-BR"
    redirect_to root_path locale: "pt-BR"
  end

  def set_en
    session[:language] = "en"
    redirect_to root_path locale: "en"
  end
end
