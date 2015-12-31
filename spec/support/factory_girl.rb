RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    # required for some reason due to
    # https://github.com/rails/spring/issues/88
    FactoryGirl.reload

    if Rails.env.test?
      begin DatabaseCleaner.start
        FactoryGirl.lint
      ensure
        DatabaseCleaner.clean
      end
    end
  end
end
