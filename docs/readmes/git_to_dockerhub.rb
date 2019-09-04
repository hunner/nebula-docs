require 'yaml'

def list_readmes(filename)
    data = YAML.load(File.read(filename))
    data["readmes"]
end

readmes = list_readmes("available_tasks.yaml")

readmes.each do |name, prefix, repo |
    puts "#{name}, #{prefix}, #{repo}"
end