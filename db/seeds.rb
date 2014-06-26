# I fear my lack of imagination for this.

pseudonyms = %w(svankmajer ricatorta tinchox jp_kakaroto ak|ra codefolk frankie norman leech nonce)

titles = [
  'absolute peace',
  'reaching the threshold',
  'perhaps a light at the end of the tunnel',
  'please, don\'t do this to me',
  'uncanny perceptions',
  'the monkey\'s out of the bottle, man',
  'allow me to break the ice',
  'it\'s not a tumor',
  'finding a new way',
  'this is enlightmen? whatever'
]

body = %{
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae orci nec leo gravida adipiscing. Duis aliquam ac massa non dictum. Pellentesque aliquam eu enim vitae volutpat. In justo eros, tempus in purus a, rutrum sagittis turpis. Suspendisse potenti. Phasellus quis commodo eros. Aenean ut odio faucibus, pulvinar tellus fringilla, ornare sem.

Ut dolor ante, sagittis nec ornare eu, sollicitudin eu nisi. Sed in enim quis ante viverra rhoncus vitae non tellus. Pellentesque convallis massa et felis vestibulum, vestibulum hendrerit felis luctus. In vel gravida lacus. Sed turpis elit, tristique a vulputate vitae, scelerisque vitae nunc. Sed ac nibh sollicitudin, ornare tortor a, pellentesque risus. Curabitur porta ligula aliquam, vulputate tortor quis, porttitor nisi. Sed molestie ac tortor eu dapibus.

Morbi quis ipsum sed dui placerat tristique. Integer consequat dolor enim, nec pretium lorem faucibus vitae. Mauris lacinia sem aliquet urna convallis, eu varius velit aliquam. Vestibulum sit amet turpis a sem varius sollicitudin. Praesent eu eleifend metus. Sed interdum varius lorem non egestas. Aenean metus massa, placerat in mauris vel, viverra pellentesque nunc. Sed neque dui, molestie eget molestie in, condimentum non enim. In ac nunc pretium, feugiat metus ac, placerat turpis. Curabitur malesuada ligula vel urna feugiat, a semper tortor dignissim. Fusce ut est a erat porttitor facilisis.
}

titles.zip(pseudonyms).each do |title, pseudonym|
  experience = Experience.create(title: title, pseudonym: pseudonym, body: body)
  experience.approve
end
