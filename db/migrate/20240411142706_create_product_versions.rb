# db/migrate/20230806120211_create_product_versions.rb
class CreateProductVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_versions do |t|
      # Stores the model name, for model-specific version tables,
      # will always be the same value per table, eg: "Product"
      t.string   :item_type, null: false
      # The primary key of the model record being audited,
      # for this case, will be a value from products.id
      t.bigint   :item_id,   null: false
      # The type of change happening to this model, eg:
      # create, update, delete
      t.string   :event,     null: false
      # Optionally record who made the change
      t.string   :whodunnit
      # JSON representation of the model BEFORE the change
      t.json     :object
      # JSON representation of the changes made to the model attributes.
      # Stores information about the attribute, its old value, and new value.
      t.json     :object_changes
      # Timestamp when the audit record was created
      t.datetime :created_at
    end
    # Create compound index for efficient querying
    add_index :product_versions, %i[item_type item_id]
  end
end