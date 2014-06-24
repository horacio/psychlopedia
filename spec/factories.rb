FactoryGirl.define do
  sequence :title do |n|
    "This is my #{n} trip report, so..."
  end

  SUBSTANCES = %w(LSD Sugar Cannabis Tobacco 25i-NBOMe 2C-P 2C-B PCP Ketamine)
  sequence :substance do
    SUBSTANCES.shuffle.first
  end

  PRESENTATIONS = %w(Pills Capsules Powder Hash Tablet Patch Syrup)
  sequence :presentation do
    PRESENTATIONS.shuffle.first
  end

  ADMINISTRATION = %w(Oral Sublingual Sublabial Rectal Nasal Intravenous Intravitreal)
  sequence :administration do
    ADMINISTRATION.shuffle.first
  end

  factory :cocktail do
    substance
    dosage '1mg'
    presentation
    administration
  end

  factory :experience do
    pseudonym 'svankmajer'
    title
    body 'some text body'
    is_approved false
    association :cocktails, factory: :cocktail
  end
end
