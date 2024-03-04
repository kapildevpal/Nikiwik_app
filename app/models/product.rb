class Product < ApplicationRecord


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "price", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["product_images_attachments", "product_images_blobs"]
  end
  has_many_attached :product_images

end

