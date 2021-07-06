
require 'net/http'
require 'nice_hash'


def request(github_login, repos='')
    uri = URI('https://api.github.com/users/' + github_login + repos)
    res = Net::HTTP.get_response(uri)
    return res
end


def getMethodName(github_login)
    res = request(github_login)
    repos = res.body.json(:name)
    puts repos
end

def getMethodRepo(github_login)
    res = request(github_login,repos='/repos')
    repos = res.body.json(:full_name)
    repos.each do |name|
        puts "- " + name.split("/")[1]
    end
end

def inputParamsOfGit()
    puts("Enter login of Git: ")
    github_login = gets.chomp()
    getMethodName(github_login)
    getMethodRepo(github_login)
end
inputParamsOfGit()
