# GitHub Enterprise

GitHub Enterpriseid=ix\_appendix-enterprise-asciidoc0range=startofrange
id=ix\_appendix-enterprise-asciidoc0range=startofrange
range=startofrangeMost people understandably equate GitHub (the company)
with GitHub.com (the website), but it’s interesting to note that they’re
not one and the same.

The GitHub website, as important as it is to modern open and closed
source software development, is not the only product that GitHub (the
company) produces. The single largest other product from that team is
called GitHub Enterprise, and it’s a version of the GitHub software that
can be deployed inside a corporate firewall—like having your own private
GitHub.com.

The two products are very similar from a user’s point of view, but there
are some important differences. It can sometimes be hard to imagine the
kinds of difficulties that Enterprise is designed to solve, but keep in
mind that it’s for large teams.

# Installation

GitHub Enterpriseinstallation installationUsing GitHub Enterprise isn’t
as easy as signing up for an account. You’re responsible for all the
infrastructure and maintenance, including installation, updates, system
maintenance, keeping the machine running, and so on. However, if your
company is considering Enterprise, it’s likely you already have
specialists who are already doing this for other services.

The GitHub team has also made it pretty easy for them. The software
comes as a pre-packaged virtual machine in a variety of formats, so
you’ll likely find something that fits into your infrastructure. Once
the machine is running, most of the configuration can be done with a web
interface, but there are some tricky bits like network configuration and
port forwarding that aren’t easy for the layperson to get right.

# Administration

GitHub Enterpriseadministration administrationSince you’re in control of
the environment in which Enterprise runs, you now have a lot of concerns
that the typical GitHub.com user does not. GitHub Enterprise has an
administration interface for dealing with these issues, which doesn’t
exist on GitHub.com. It allows management of things like system
resources, reports, search, and many others.

Also, while GitHub.com has its own user system, GitHub Enterprise can
optionally plug in to your organization’s existing authentication
system. This allows a company’s IT organization to manage user
identities in one single place, rather than having to duplicate a lot of
effort when a new team member hires on. It also eases the initial
transition, when perhaps thousands of people will need new accounts.
Several systems are supported, including LDAP and SAML, as well as plain
old email and password.

# Endpoints

GitHub Enterpriseendpoints endpointsThe complete GitHub API is also
available on an Enterprise instance; you just need to send your requests
to <https://<hostname>/api/v3> instead of <https://api.github.com/>. You
can imagine that some users have accounts on both an Enterprise instance
as well as GitHub.com, and many applications have started supporting
this scenario.

# Full Hostnames Versus Mount Points

GitHub Enterprisefull hostnames vs. mount points full hostnames vs.
mount pointsOne of the main differences between GitHub.com and an
Enterprise setup is often in the way that hostnames are set up.
GitHub.com has several hostnames for various content served. An
incomplete list includes:

  - *github.io*  
    Hosting Jekyll blogs for users and project pages

  - *gist.github.com*  
    Hosting gists

  - *raw.githubusercontent.com*  
    Hosting raw pages (unprocessed files)

For a variety of reasons, Enterprise GitHub installations often don’t
retain the same mapping. An Enterprise installation might look like:

  - *github.bigdevcorp.example.com/pages/xrd/somerepo*  
    Hosting gh-pages sites *github.bigdevcorp.example.com/gists*:
    Hosting gists

As you can see, Enterprise installations often map the subdomains to a
subdirectory rather than a different hostname. This simplifies the setup
of the Enterprise installation. But it means that some tools require
reconfiguration.

For the command-line [Gist tool](https://github.com/defunkt/gist), you
need to export an environment variable that specifies the Gist URL:

``` bash
$ export GITHUB_URL=http://github.bigdevcorp.example.com/
```

For the command-line [Hub tool](https://github.com/github/hub), you need
to use a different variable—`GITHUB_HOST`:

``` bash
$ GITHUB_HOST=github.bigdevcorp.example.com hub clone myproject
```

# Command-Line Client Tools: cURL

cURLand GitHub Enterprise and GitHub EnterpriseGitHub Enterpriseand cURL
and cURLWe show in [???](#introduction) how to use cURL to make a
request against the API on the main GitHub.com site. If you wanted to do
this against an Enterprise site, your request would look a little
different:

``` bash
$ curl -i https://github.bigdevcorp.example.com/api/v3/search/repositories?q=@ben
```

# Example Request Using a Client Library

GitHub Enterpriseexample request using a client library example request
using a client libraryIf you use a client library, most provide a way to
configure the library to use a different endpoint, as is required when
you are using an Enterprise GitHub instance.

This book documents connecting to GitHub using five different languages:
Ruby, Java, JavaScript, Python, and C\#. Here are examples in each
language. With these snippets in hand, any example in the book can be
converted to work against a GitHub Enterprise server.

## Ruby Client Configuration

GitHub EnterpriseRuby client configuration Ruby client
configurationOctokitand GitHub Enterprise client configuration and
GitHub Enterprise client configurationRubyclient configuration with
GitHub Enterprise client configuration with GitHub EnterpriseFor the
Octokit Ruby library, use code like this:

``` ruby
github = Github.new
           basic_auth: 'login:password',
           endpoint: 'https://github.bigdevcorp.example.com/api/v3/'
puts github.repos.list
```

## Java

GitHub Enterpriseand Java and JavaJavaand GitHub Enterprise and GitHub
EnterpriseFor the EGit Java library, this code specifies an Enterprise
endpoint:

``` java
GitHubClient client = new GitHubClient("github.bigcorpdev.example.com");
UserService us = new UserService(client);
us.getUser("internaluser");
```

When you create a new GitHub-backed service object of any type, you
parameterize the service constructor with the customized client object.

Also, note that this library is specifically configured for version 3
(v3) of the API (you cannot specify another version). If you need to use
a newer version of the API, you will need to make sure you are using the
correct version of the EGit libraries. And, unfortunately, there is no
way to use an older version of the API with this Java client if you have
an outdated Enterprise server that for some reason cannot be upgraded.

## JavaScript

GitHub Enterpriseand JavaScript library and JavaScript
libraryJavaScriptGitHub Enterprise and GitHub Enterprise andThe
JavaScript library we write about in this book (GitHub.js) uses the
following syntax to specify a GitHub Enterprise backend:

``` javascript
var github = new Github({
  apiUrl: "https://github.bigdevcorp.example.com/api/v3"
  ...
});
```

## Python

GitHub Enterpriseand Python and PythonPythonand GitHub Enterprise and
GitHub EnterpriseThe agithub client we use in [???](#python_search_api)
does not permit parameterizing an Enterprise endpoint when creating the
GitHub client. To use an Enterprise endpoint you need to define a new
class that overrides the built-in `agithub.Github` and then use that new
client in place of the built-in one:

``` py
class GitHubEnterprise(agithub.API):
    def __init__(self, api_url, *args, **kwargs):
        props = ConnectionProperties(
                    api_url = api_url,
                    secure_http = True,
                    extra_headers = {
                        'accept' :    'application/vnd.github.v3+json'
                        }
                    )

        self.setClient(Client(*args, **kwargs))
        self.setConnectionProperties(props)

g = GitHubEnterprise('github.mycorp.com', 'myusername', 'mypassword')
```

## C\#

C\#GitHub Enterpriseand C\# and C\#The default behavior of the Octokit
library is to connect to GitHub.com, but it’s relatively straightforward
to give it another API host instead. Simply replace the instantiation of
the `GitHubClient` object with something like this:

``` csharp
var ghe = new Uri("https://github.myenterprise.com/");
var client = new GitHubClient(new ProductHeaderValue("my-cool-app"), ghe);
```

# Management API

GitHub Enterpriseand Management Console API and Management Console
APIManagement Console APIEnterprise servers have a special additional
API section that isn’t available on GitHub.com, called the Management
Console API. It allows you to do things like check settings, maintain
SSH keys, manage your license, and so on. Nearly anything you can do
from the web management console, you can do through the API (so you can
script management tasks when desirable).

# Documentation

GitHub Enterprisedocumentation documentationDocumentation for the
Enterprise API is available at
<https://developer.github.com/v3/enterprise>.range=endofrangestartref=ix\_appendix-enterprise-asciidoc0
startref=ix\_appendix-enterprise-asciidoc0
