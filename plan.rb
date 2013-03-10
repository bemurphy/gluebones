module Plan
  class App
    def name
      # CHANGE THIS
      "gluebones"
    end

    def styledir
      # CHANGE if desired
      "stylesheets"
    end

    def scriptdir
      # CHANGE if desired
      "javascripts"
    end

    def title
      name.capitalize
    end

    def author
      `git config --global user.name`.chomp
    end

    def description
      ""
    end

    def destination
      "#{name}/app.rb"
    end

    def in_app_root(subdir)
      File.join(name, subdir)
    end

    def as_view(view)
      File.join(name, "views", "#{view}.erb")
    end

    def as_stylesheet(style)
      File.join(name, "public", styledir, "#{style}.css")
    end
  end

  class Config < App
    def destination
      in_app_root "config.ru"
    end
  end

  class Layout < App
    def destination
      as_view "layout"
    end
  end

  class Index < App
    def destination
      as_view "index"
    end
  end

  class Gemfile < App
    def destination
      in_app_root "Gemfile"
    end
  end

  class Skeleton < App
    def destination
      as_stylesheet "skeleton"
    end
  end

  class Base < App
    def destination
      as_stylesheet "base"
    end
  end

  class SkeletonLayout < App
    def destination
      as_stylesheet "layout"
    end
  end

  class Script < App
    def destination
      in_app_root "public/#{scriptdir}/app.js"
    end
  end
end

raise "Directory already exists. Aborting!" if File.exist?(Plan::App.new.name)

instructions = <<-EOS
  You have just created a Sinatra application with Skeleton Boilerplate.

  Sinatra: http://www.sinatrarb.com/
  Skeleton: http://www.getskeleton.com/

  Now, go ahead and install the dependencies with the following commands:

    $ cd #{Plan::App.new.name}
    $ bundle install # Installs dependencies

  Once you are done with the setup, run the webserver:

    $ bundle exec rackup

  Now you can head to http://localhost:9292

  In development mode, it is good to have your application code
  reloaded between requests. For that, we recommend the use of the
  shotgun gem:

    $ bundle exec shotgun

  Now you can head to http://localhost:9393
EOS

puts
puts instructions
puts
