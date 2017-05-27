# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Ensuring ES indexes exist..."
puts "Destorying all then Seeding Data ..."

[Comment, ProjectTagm ProjectUpload, ProjectStatus, Review, Project, ReviewUpload, User].each do |model_class|
  model_class.destroy_all
  model_class.__elasticsearch__.create_index! force: true
end





# load seeds from respective seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }



puts "DONE!"