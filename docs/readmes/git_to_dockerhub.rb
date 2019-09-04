require 'yaml'

def list_readmes(filename)
    data = YAML.load(File.read(filename))
    data["readmes"]
end

readmes = list_readmes("available_tasks.yaml")

puts readmes

# Vreadmes.each do |name, prefix, repo, md_filename |
#    puts "#{name}, #{prefix}, #{repo}, #{md_filename}"
#    `docker run --rm \
#    -v /$HOME/repos/nebula-docs/docs/readmes/#{:md_filename}:/data/README.md \
#    -e DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME} \
#    -e DOCKERHUB_PASSWORD=${DOCKERHUB_PASSWORD} \
#    -e DOCKERHUB_REPO_PREFIX=#{:prefix} \
#    -e DOCKERHUB_REPO_NAME=#{:repo} \
#     readme-to-hub`
#end