# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift(File.dirname(__FILE__))

# load Rails first
require 'rails'
require 'active_record'
require 'byebug'

# load the plugin
require "kawaii_association"

# needs to load the app next
require 'dummy_app'

require 'test/unit/rails/test_help'

CreateAllTables.up unless ActiveRecord::Base.connection.table_exists? 'posts'
