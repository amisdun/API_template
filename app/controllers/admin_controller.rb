class AdminController < ApplicationController
  def create
    admin = Admin.where({:username => params[:username]}).first

    if admin
      return render json: {res: "exist", msg: "username already exist"}
    else
      password_hash = BCrypt::Password.create(params[:password])

      new_admin = Admin.new({
        :username => params[:username],
        :password => password_hash
      })

      if new_admin.save
        return render json: {res: "created"}, status: :created
      end
    end
  end

  def signin
    admin = Admin.where({:username => params[:username]}).first

    if admin
      hashed_password = BCrypt::Password.new(admin.password)

      if hashed_password == params[:password]
        exp = Time.now.to_i + 4 * 3600

        exp_payload = { admin_id: admin.id, exp: exp}

        token = JWT.encode exp_payload, Rails.application.secrets.secret_key_base, "HS256"

        return render json: {res: "success", token: token}, status: :ok
      else
       return render json: {res: "failed"}
      end
       return render json: {res: "failed"}
    end
  end
end
