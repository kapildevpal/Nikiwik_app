# app/admin/products.rb
ActiveAdmin.register Product do
  permit_params :name, :price, :product_images

  controller do 
    include ActiveStorage::Blob::Analyzable

  end
  index do
    selectable_column
    id_column
    column :name
    column :price
    column "Product Images" do |product|
      if product.product_images.attached?        
        product.product_images.each do |image|
          span image_tag(image.variant(resize_to_limit: [100, 100]))
        end
      else
        "No images attached"
      end
    end
    actions
  end


  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :price
      f.input :product_images, as: :file, input_html: { multiple: true }, label: "Product Images"
    end
    f.actions
  end



  show do
    attributes_table do
      row :id
      row :name
      row :price
      row "Product Images" do |product|
        if product.product_images.attached?
          product.product_images.each do |image|
            span image_tag(image.variant(resize_to_limit: [300, 300]))
          end
        else
          "No images attached"
        end
      end
    end
  end

end
