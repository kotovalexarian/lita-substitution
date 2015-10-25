describe Lita::Handlers::Substitution, lita_handler: true do
  it { is_expected.not_to route_command('').to :handle }
  it { is_expected.not_to route_command('foo').to :handle }
  it { is_expected.not_to route_command('foo $').to :handle }
  it { is_expected.not_to route_command('foo (bar)').to :handle }
  it { is_expected.not_to route_command('foo ($)').to :handle }

  it { is_expected.to route_command('$(').to :handle }
  it { is_expected.to route_command('$()').to :handle }
  it { is_expected.to route_command('$(bar)').to :handle }
  it { is_expected.to route_command('foo$()').to :handle }
  it { is_expected.to route_command('foo $()').to :handle }
  it { is_expected.to route_command('foo $(bar)').to :handle }
end
