Rails.application.routes.draw do get 'template/index'

  get 'template/show'

  post 'template/create'

  put 'template/update'

  delete 'template/destroy'

  get 'template/admin_index'

  get 'template/admin_show'

  post 'template/admin_create'

  put 'template/admin_update'

  delete 'template/admin_destroy'

  get 'organization/show'

  post 'organization/create'

  put 'organization/update'

  delete 'organization/destroy'

  post 'user/create'

  post 'user/signin'

  post 'admin/create'

  post 'admin/signin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
