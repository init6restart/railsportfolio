ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :title, :body, :image

  show do |t|
    attributes_table do
      row :title
      row :body
      row :image do
        if post.image.attached? 
          image_tag post.image.variant(resize: "350x252")
        else
          render body: 'No Image Available'
        end
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :image, as: :file 
    end
    f.actions
  end

end
