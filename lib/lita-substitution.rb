# rubocop:disable Style/FileName

require 'lita'

Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require 'lita/handlers/substitution'
require 'lita/extensions/substitution'

Lita::Handlers::Substitution.template_root File.expand_path(
  File.join('..', '..', 'templates'),
  __FILE__
)
