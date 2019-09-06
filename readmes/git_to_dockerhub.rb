require 'yaml'

def list_readmes(filename)
     data = YAML.load(File.read(filename))
     # data["readmes"]
end

filename = "available_tasks.yaml"

readmes = list_readmes(filename)
# puts readmes

readmes.each do |one, two|
    puts "#{one} #{two}"
#    puts "#{readmes[:name]}, #{readmes[:prefix]}, #{readmes[:repo]}, #{readmes[:md_filename]}"
#    `docker run --rm \
#    -v /$HOME/repos/nebula-docs/docs/readmes/#{:md_filename}:/data/README.md \
#    -e DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME} \
#    -e DOCKERHUB_PASSWORD=${DOCKERHUB_PASSWORD} \
#    -e DOCKERHUB_REPO_PREFIX=#{:prefix} \
#    -e DOCKERHUB_REPO_NAME=#{:repo} \
#     readme-to-hub`
end