require 'bundler'
require 'git'
require 'haml'
require 'gems'
require 'logger'
require 'active_support/core_ext/module/delegation'

module Legendary
  def self.repository
    @repository ||= Repository.new
  end

  def self.repository=(repository)
    @repository = repository
  end

  def self.logger
    @logger ||= ::Logger.new(STDOUT)
  end
end

require 'legendary/version'
require 'legendary/vulnerabilities'
require 'legendary/repository'
require 'legendary/gems'
require 'legendary/info'
require 'legendary/formatters'
require 'legendary/formatters/base'
require 'legendary/formatters/html'
require 'legendary/runner'
