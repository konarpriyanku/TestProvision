require 'yaml'
current_dir    = File.dirname(File.expand_path(__FILE__))
settings = YAML.load_file("#{current_dir}/settings-dev.yaml")

puts "settings = #{settings}"
puts  "default box = #{settings[:default_box]}"
puts  "webservers = #{settings[:webservers]}"




settings[:webservers].each do |server|
    puts "name  = #{server[:name]} "
    puts "box = #{server[:box]}"
    puts "network = #{server[:network]}"
    puts "ip= #{server[:ip]}"
    server[:port_forward].each do |portconfig|
          puts "host = #{portconfig[:host]}"
          puts "guest = #{portconfig[:guest]}"
          end
puts  "args = #{server[:args]}"
puts  "#{settings[:provision_root]}#{server[:script]}"
end

settings[:appservers].each do |server|
    puts "name  = #{server[:name]} "
    puts "box = #{server[:box]}"
    puts "hostname = #{server[:hostname]}"
    puts "network = #{server[:network]}"
    puts "ip= #{server[:ip]}"
    puts  "args = #{server[:args]}"
    puts  "#{settings[:provision_root]}#{server[:script]}"
end
