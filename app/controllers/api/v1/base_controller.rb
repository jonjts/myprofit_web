module Api::V1
  class  BaseController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
    before_filter :parse_request, :except => [:index]
    before_filter :authenticate_user, :except => [:login, :create]

    def parse_request
      @json = JSON.parse(request.body.read)
    end

    def unauthorize
      head status: :unauthorized
      return false
    end

    def bad_request
      head status: :bad_request
      return false
    end

    private
    def authenticate_user
      user_token = request.headers['X-USER-TOKEN']
      if user_token
        @user = User.where(uid: user_token).take
        if @user.nil?
          return unauthorize
        end
      else
        return unauthorize
      end
    end

  end
end
