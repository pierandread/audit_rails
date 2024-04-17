class Product < ApplicationRecord
  has_paper_trail versions: {
    class_name: "ProductVersion"
  }
end
