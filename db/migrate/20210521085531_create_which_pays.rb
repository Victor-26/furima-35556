class CreateWhichPays < ActiveRecord::Migration[6.0]
  def change
    create_table :which_pays do |t|

      t.timestamps
    end
  end
end
