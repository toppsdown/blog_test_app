RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    # required for some reason due to
    # https://github.com/rails/spring/issues/88
    FactoryGirl.reload
  end
end
