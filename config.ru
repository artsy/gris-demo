require File.expand_path('../config/application.rb', __FILE__)

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run GrisDemo::Application.instance
