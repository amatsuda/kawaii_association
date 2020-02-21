# frozen_string_literal: true

# config
ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

module KawaiiAssociationTestApp
  Application = Class.new(Rails::Application) do
    config.eager_load = false
    config.active_support.deprecation = :log
  end.initialize!
end

# models
class Post < ActiveRecord::Base; end
class Comment < ActiveRecord::Base; end
class Category < ActiveRecord::Base; end

# migrations
class CreateAllTables < ActiveRecord::VERSION::MAJOR >= 5 ? ActiveRecord::Migration[5.0] : ActiveRecord::Migration
  def self.up
    create_table(:posts) {|t| t.string :title }
    create_table(:comments) {|t| t.string :body }
    create_table(:category) {|t| t.string :name }
  end
end
