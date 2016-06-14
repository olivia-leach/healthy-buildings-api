class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day
      t.date :date
      t.float :enhanced_iaq
      t.float :tc
      t.float :iaq_perf
      t.float :low_emit_air
      t.float :iaq_assess
      t.float :acoustic
      t.float :low_emit_dirt
      t.float :green_clean
      t.float :ipm
      t.float :int_lighting
      t.float :daylight
      t.float :views
      t.float :mold
      t.float :ets
      t.float :surveys
      t.float :baseline
      t.float :aer_score
      t.float :tc_score
      t.float :humidity_score
      t.float :noise_score
      t.float :rt_score
      t.float :overall_score
      t.float :co2
      t.float :aer
      t.float :temp
      t.float :rh
      t.float :sh
      t.float :noise
      t.float :pmv
      t.float :ppd

      t.references :building, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
