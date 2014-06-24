FactoryGirl.define do
  sequence :title do |n|
    "This is my #{n} trip report, so..."
  end

  factory :experience do
    pseudonym 'svankmajer'
    title
    body 'some text body'
    is_approved false
  end
end
