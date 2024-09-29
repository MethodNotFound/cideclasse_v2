class CreateKlasses < ActiveRecord::Migration[7.2]
  def change
    create_table :klasses do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
