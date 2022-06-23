module Api
  module V1
    include JsonWebToken
    class UsersController < ApiController
      before_action :authorize_request, except: :login
      def index
        users = User.all
        render json: { status: 'SUCCESS', message: 'Loaded users successfully', data: users }, status: :ok
      end

      def login
        @user = User.find_by_email(params[:email])
        if @user
          token = jwt_encode(user_id: @user.id)
          time = Time.now + 7.days.to_i
          render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                         Name: @user.name }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      private

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end