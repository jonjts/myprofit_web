class LanguageController < ActionController::Base


  def set_pt
    session[:language] = "pt-BR"
    redirect
  end

  def set_en
    session[:language] = "en"
    redirect
  end
end

private

def redirect
  if current_user.present?
    redirect_to root_path
  else
    redirect_to new_session_path :user
  end
end
