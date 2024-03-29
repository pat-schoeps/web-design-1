require "guard/internals/plugins"
require "guard/internals/groups"

require "guard/options"

module Guard
  # @private api
  module Internals
    # TODO: split into a commandline class and session (plugins, groups)
    # TODO: swap session and metadata
    # This class contains variables set during
    # evaluation of the guardfile (and are reset
    # before reevaluation)
    class Session
      attr_reader :options
      attr_reader :plugins
      attr_reader :groups

      DEFAULT_OPTIONS = {
        clear: false,
        debug: false,
        no_bundler_warning: false,

        # User defined scopes
        group: [],
        plugin: [],

        # Notifier
        notify: true,

        # Interactor
        no_interactions: false,

        # Guardfile options:
        # guardfile_contents
        guardfile: nil,

        # Listener options
        # TODO: rename to watchdirs?
        watchdir: Dir.pwd,
        latency: nil,
        force_polling: false,
        wait_for_delay: nil,
        listen_on: nil
      }

      def cmdline_groups
        @cmdline_groups.dup.freeze
      end

      def cmdline_plugins
        @cmdline_plugins.dup.freeze
      end

      def initialize(new_options)
        @options = Options.new(new_options, DEFAULT_OPTIONS)

        @plugins = Internals::Plugins.new
        @groups = Internals::Groups.new

        @cmdline_groups = @options[:group]
        @cmdline_plugins = @options[:plugin]

        @clear = @options[:clear]
        @debug = @options[:debug]
        @watchdirs = Array(@options[:watchdir])
        @notify = @options[:notify]
        @interactor_name = @options[:no_interactions] ? :sleep : :pry_wrapper

        @guardfile_plugin_scope = []
        @guardfile_group_scope = []
      end

      def guardfile_scope(scope)
        opts = scope.dup
        @guardfile_plugin_scope = Array(opts.delete(:plugins))
        @guardfile_group_scope = Array(opts.delete(:groups))
        fail "Unknown options: #{opts.inspect}" unless opts.empty?
      end

      attr_reader :guardfile_group_scope
      attr_reader :guardfile_plugin_scope

      def clearing(on)
        @clear = on
      end

      def clearing?
        @clear
      end

      alias :clear? :clearing?

      def debug?
        @debug
      end

      def watchdirs
        @watchdirs_from_guardfile ||= nil
        @watchdirs_from_guardfile || @watchdirs
      end

      # set by Dsl with :directories() command
      def watchdirs=(dirs)
        dirs = [Dir.pwd] if dirs.empty?
        @watchdirs_from_guardfile = dirs.map { |dir| File.expand_path dir }
      end

      def listener_args
        if options[:listen_on]
          [:on, options[:listen_on]]
        else
          listener_options = {}
          [:latency, :force_polling, :wait_for_delay].each do |option|
            listener_options[option] = options[option] if options[option]
          end
          expanded_watchdirs = watchdirs.map { |dir| File.expand_path dir }
          [:to, *expanded_watchdirs, listener_options]
        end
      end

      def evaluator_options
        opts = { guardfile: options[:guardfile] }
        # TODO: deprecate :guardfile_contents
        if options[:guardfile_contents]
          opts[:contents] = options[:guardfile_contents]
        end
        opts
      end

      def notify_options
        { notify: @options[:notify] }
      end

      def interactor_name
        @interactor_name
      end
    end
  end
end
