# frozen_string_literal: true

# See https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#linting-factories

namespace :factory_bot do
  desc 'Verify that all FactoryBot factories are valid'
  task lint: :environment do
    factories_to_lint = FactoryBot.factories.reject do |factory|
      factories_with_problems.include?(factory.name.to_s)
    end

    if Rails.env.test?
      conn = ActiveRecord::Base.connection
      conn.transaction do
        FactoryBot.lint(
          factories_to_lint,
          strategy: :create,
          traits: true,
          verbose: true
        )
        raise ActiveRecord::Rollback
      end
    else
      system("bundle exec rake factory_bot:lint RAILS_ENV='test'")
      raise if $CHILD_STATUS.exitstatus.nonzero?
    end
  end
end
