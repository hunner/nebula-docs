require 'yaml'

def list_readmes(filename)
    data = YAML.load(File.read(filename))
end

filename = "available_tasks.yaml"

readmes = list_readmes(filename)

readmes.each do |value|
    `docker run --rm \
    -v /$HOME/repos/nebula-docs/readmes/#{value["md_filename"]}:/data/README.md \
    -e DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME} \
    -e DOCKERHUB_PASSWORD=${DOCKERHUB_PASSWORD} \
    -e DOCKERHUB_REPO_PREFIX=#{value["dockerhub_repo_prefix"]} \
    -e DOCKERHUB_REPO_NAME=#{value["dockerhub_repo_name"]} \
     readme-to-hub`
end