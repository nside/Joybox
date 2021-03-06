module Joybox
  class Director < CCDirectorDisplayLink

    alias_method :push_scene, :pushScene
    alias_method :pop_scene, :popScene
    alias_method :pop_to_root_scene, :popToRootScene
    alias_method :replace_scene, :replaceScene
    alias_method :stop_animation, :stopAnimation
    alias_method :start_animation, :startAnimation
    alias_method :purge_cached_data, :purgeCachedData
    alias_method :set_next_delta_time_zero, :setNextDeltaTimeZero

    def self.default_configuration
      {
        wants_full_screen_layout: true,
        display_stats: false,
        animation_interval: 1.0/60,
        projection: KCCDirectorProjection2D,
        enable_retina_display: true,
        delegate: nil
      }
    end

    def self.configure(options = {})
      options = options.nil? ? default_configuration : default_configuration.merge!(options)

      director = Director.sharedDirector

      director.wantsFullScreenLayout = options[:wants_full_screen_layout]
      director.displayStats = options[:display_stats]
      director.animationInterval = options[:animation_interval]
      director.projection = options[:projection]
      director.enableRetinaDisplay(options[:enable_retina_display])
      director.delegate = options[:delegate]
    end


    def << (scene)
      self.push_scene(scene)
    end

  end
end