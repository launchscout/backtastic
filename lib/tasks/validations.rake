namespace :backtastic do
  namespace :validations do
    desc "Build put validation metadata in app/assets/javascripts"
    task :build => :environment do
      output = ENV["VALIDATIONS_FILE"] || Rails.root.join("app", "assets", "javascripts", "rails_validations.coffee")
      Dir[Rails.root.join "app", "models", '**', '*.rb'].each do |file|
        begin
          require file
        rescue
        end
      end

      erb = ERB.new File.read(File.join(File.dirname(__FILE__), "..", "templates", "rails_validations.coffee.erb"))
      File.open(output, "w") { |f| f.puts(erb.result) }
    end
  end
end