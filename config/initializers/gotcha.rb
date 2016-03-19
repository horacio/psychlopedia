Gotcha.unregister_all_types
Gotcha.register_type PsychlopediaBackwardGotcha

if Rails.env.development? || Rails.env.test?
  Gotcha.skip_validation = true
end
