class UserController < ApplicationController
  def signin
    user = User.where({:username => params[:username]}).first

    if user
      hashed_password = BCrypt::Password.new(user.password)

      if hashed_password == params[:password]
        exp = Time.now.to_i + 4 * 3600

        exp_payload = { user_id: user.id, exp: exp}

        token = JWT.encode exp_payload, Rails.application.secrets.secret_key_base, "HS256"

        return render json: {res: "success", token: token}, status: :ok

      else
        return render json: {res: "failed"}
      end
      return render json: {res: "failed"}
    end
  end

  def create
    token = request.headers['Authorization']
    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }

      if decoded_token
        user = User.where({:username => params[:username]}).first
        puts user
        if user

          return render json: {res: "exist"}

        else
          password_hash = BCrypt::Password.create(params[:password])
          new_user = User.new({
            :username => params[:username],
            :password => password_hash,
            :organization_name => params[:organization_name]
          })

          if new_user.save

            return render json: {res: "created"}, status: :created
          end
        end
      end
    end
  end
end
