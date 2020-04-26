module MyApi
  class Engine < ::Rails::Engine
    isolate_namespace MyApi
  end
end
