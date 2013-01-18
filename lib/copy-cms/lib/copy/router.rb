module Copy
  class Router
    def initialize(path, views)
      @path  = determine_path(path)
      @views = views
    end
    
    def format
      @format ||= if @path.index('.')
        @path.split('.').last.to_sym
      else
        :html
      end
    end
    
    def template_file
      @template_file ||= if file = Dir.glob(File.join(@views, "#{path_with_format}*")).first
        file
      elsif index = Dir.glob(File.join(@views, path_without_format, "index.#{format}*")).first
        index
      end
    end
    
    def renderer
      @renderer ||= template_file.split('.').last.to_sym
    end
    
    def template
      @template ||= template_file.gsub(%r{^#{@views}\/*}, '').gsub(%r{.#{renderer}$}, '').to_sym
    end
    
    def layout
      @layout ||= if format == :html && local_layout?
        local_layout.to_sym
      elsif global_layout?
        :'layout.html'
      else
        false
      end
    end
    
    def success?
      template_file && renderer && template
    end

    private
      
      def local_layout?
        File.exists?(File.join(@views, "#{local_layout}#{renderer}"))
      end

      def local_layout
        path_without_format.split('/')[0...-1].push("layout.html").join('/')
      end

      def global_layout?
        File.exists?(File.join(@views, "layout.html.#{renderer}"))
      end
      
      def determine_path(path)
        if path == '/'
          '/index'
        else
          # Remove trailing slash, if present
          path.strip.gsub(/\/$/, '')
        end
      end
      
      def path_without_format
        @path.split('.').first
      end

      def path_with_format
        "#{path_without_format}.#{format}"
      end
  end
end
