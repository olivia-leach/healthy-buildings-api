class DaySerializer < ActiveModel::Serializer
  attributes :id, :day, :date, :enhanced_iaq, :tc, :iaq_perf, :low_emit_air, :iaq_assess, :acoustic, :low_emit_dirt, :green_clean, :ipm, :int_lighting, :daylight, :views, :mold, :ets, :surveys, :baseline, :aer_score, :tc_score, :humidity_score, :noise_score, :rt_score, :overall_score, :co2, :aer, :temp, :rh, :sh, :noise, :pmv, :ppd, :steps_score, :sleep_score, :steps, :sleep, :num_sensors
end
