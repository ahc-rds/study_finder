class AddLastchangedDateAndFirstrecievedDateToStudyFinderTrials < ActiveRecord::Migration
  def change
    add_column :study_finder_trials, :lastchanged_date, :string
    add_column :study_finder_trials, :firstreceived_date, :string
  end
end
