class AddReferenceToResources < ActiveRecord::Migration[6.0]
  def change
    add_reference :resources, :article
  end
end
