class OrganizationController < ApplicationController

  def show
    #show single organization

    token = request.headers['Authorization']

    token = token.split(' ').last

    if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]

      admin = Admin.where({:id => admin_token['admin_id']})

      if admin
        admin_org = admin.Organization.all

        return render json: {res: "found", data: admin_org}
      end
    end
  end

  def create
     token = request.headers['Authorization']

     token = token.split(' ').last
     if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]

      admin = Admin.where({:id => admin_token['admin_id']})

      if admin
       new_admin_org = admin.Organization.new({
          :organization_name => params[:organization_name]
        })
        if new_admin_org.save
          return render json: {res: "created"}, status: :ok
        end
      end
    end
  end

  def update
     token = request.headers['Authorization']

     token = token.split(' ').last

     if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]

      admin = Admin.find(decoded_token["admin_id"])
      if admin
        admin_org = admin.Organization.first

        if admin_org.update(params[:organization_name])

          return render json: {res: "updated"}
        end
      end
    end

  end

  def destroy
     token = request.headers['Authorization']

     token = token.split(' ').last

     if token
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
      admin_token = decoded_token[0]

      admin = Admin.find(decoded_token["admin_id"])

      if admin
        admin_org = admin.Organization.first

        admin_org.destroy

        return render json: {res: "deleted"}
      end
    end
  end
end
