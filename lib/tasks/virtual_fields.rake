desc 'virtual attributes content rake task'
task :add_virtual_fields => :environment  do
  puts "Generating migration"
  model_name = ENV['model'].to_s.downcase
  if model_name.blank?
    puts "Please provide model name."
    puts "e.g rake add_virtual_attributes model=Model"
    return
  end
  if VirtualAttributes.valid_column?(model_name)
    puts "Content column alreay present in model #{model_name}"
  else
    `rails generate migration "add_content_to_#{ENV['model'].to_s.downcase}s" "content:text"`
    puts "Running migration"
    `rake db:migrate`
    puts "Migration created"
  end

end
