class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.references :trip, index: true, foreign_key: true
      t.references :station, index: true, foreign_key: true
    end
  end
end
