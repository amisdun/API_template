class TemplateController < ApplicationController
  def index
    token = request.headers['Authorization']
    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      user_token = decoded_token[0]

      users = User.find(user_token['user_id'])

      if users
        users_template = users.Template.all

        return render json: {res: "found", data: users_template}, status: :ok
      end
    end

  end

  def show
    token = request.headers['Authorization']
    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      user_token = decoded_token[0]
      users = User.find(user_token["user_id"])

      if users

        users_template = users.Template.find(params[:id])

        if users_template

          return render json: {res: "found", data: users_template}, status: :ok
        end
      end
    end
  end

  def create
    token = request.headers['Authorization']

    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      user_token = decoded_token[0]
      users = User.find(user_token["user_id"])

      if users
        users_template = users.build_template({
          :title => params[:title],
          :form => params[:form]
        })

        if users_template.save
          return render json: {res: "created", data: users_template}, status: :created
        end
      end
    end
  end

  def update
    token = request.headers['Authorization']

    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      user_token = decoded_token[0]

      users = User.find(user_token["user_id"])

      if users
        users_template = users.Template.find(params[:id])

        if users_template.update({
          :title => params[:title],
          :form => params[:form]
          })

        return render json: {res: "updated"}, status: :ok
      end
    end
  end

  end

  def destroy
    token = request.headers['Authorization']

    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      user_token = decoded_token[0]

      users = User.find(user_token["user_id"])

      if users
        users_template = users.Template.find(params[:id])

        users_template.destroy

        return render json: {res: "deleted"}, status: :ok

      end
    end
  end

    def admin_index
    token = request.headers['Authorization']
    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]

      admin = User.find(admin_token['user_id'])

      if users
        users_template = users.Template.all

        return render json: {res: "found", data: users_template}, status: :ok
      end
    end

  end

    def admin_show
    token = request.headers['Authorization']

    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]
      admins = Admin.find(admin_token["user_id"])

      if admins

        admin_template = admins.Template.find(params[:id])

        if admin_template

          return render json: {res: "found", data: admin_template}, status: :ok
        end
      end
    end
  end

  def admin_create
    token = request.headers['Authorization']
    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]
      admin = User.find(admin_token["user_id"])

      if admin
        admin_template = admin.build_template({
          :title => params[:title],
          :form => params[:form]
        })

        if admin_template.save
          return render json: {res: "created", data: admin_template}, status: :created
        end
      end
    end
  end

  def admin_update
    token = request.headers['Authorization']

    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]

      admin = User.find(admin_token["user_id"])

      if admin
        admin_template = admin.Template.find(params[:id])

        if admin_template.update({
          :title => params[:title],
          :form => params[:form]
        })

        return render json: {res: "updated"}, status: :ok
      end
    end
  end

  end

  def admin_destroy
    token = request.headers['Authorization']

    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]

      admin = User.find(admin_token["user_id"])

      if admin
        admin_template = admin.Template.find(params[:id])

        admin_template.destroy

        return render json: {res: "deleted"}, status: :ok

      end
    end
  end
end
