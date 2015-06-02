class AddKindIdToWorkTimes < ActiveRecord::Migration
  def change
    add_reference :work_times, :kind
    add_index     :work_times, :kind_id
  end
end
