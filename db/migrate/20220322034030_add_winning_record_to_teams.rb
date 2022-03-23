class AddWinningRecordToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :winning_record, :boolean
  end
end
