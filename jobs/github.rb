require 'rest-client'
require 'json'
require 'date'

git_owner = "rzl"
git_project = "tuwat"

## Change this if you want to run more than one set of issue widgets
event_name = "git_issues_labeled_defects"

## the endpoint we'll be hitting
uri = "https://git.raumzeitlabor.org/api/v4/projects/#{git_owner}%2F#{git_project}

SCHEDULER.every '2m', :first_in => 0 do |job|
    puts "Getting #{uri}"
    response = RestClient.get uri
    issues = JSON.parse(response.body, symbolize_names: true)


    send_event(event_name, {current: issues[:open_issues_count]})

end # SCHEDULER
