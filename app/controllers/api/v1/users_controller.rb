module Api::V1
  class UsersController < BaseController

    before_filter only: :login do
      unless @json.has_key?('user') &&
          @json['user']['email'] &&
          @json['user']['uid'] &&
          @json['user']['name'] &&
          @json['user']['image']
        render json: "Dados para o cadastro não validos.", status: :bad_request
      end
    end

    def index
      render json: User.take
    end

    def login
      @user = User.where(email: @json['user']["email"]).take
      if @user.blank?
        @user = User.new
        @user.from_json(@json['user'].to_json)
        @user.password = Devise.friendly_token[0,20]
        unless @user.save
          render json: @user.errors.full_messages.to_sentence, status: :bad_request
          return true
        end
      end
      successes_login
    end


    private

    def successes_login
      render json: @user, status: :success
      return true
    end

  end
end
