ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :avatar

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :avatar
    column :sign_in_count
    column :created_at
    actions
  end
  
  
  show do
    attributes_table do
      row :email
      row :avatar do |admin_user|
        if admin_user.avatar.attached?
          image_tag url_for(admin_user.avatar), height: '100'
        else
          "No Avatar"
        end
      end
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar, as: :file

    end
    f.actions
  end

end
