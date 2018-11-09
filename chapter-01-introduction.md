# The Unclad GitHub API

GitHub APIreading and writing data
fromid=ix\_chapter-01-introduction-asciidoc0
id=ix\_chapter-01-introduction-asciidoc0range=startofrange
range=startofrangeThis chapter eases us into reading and writing data
from the GitHub API. Successive chapters show you how to access
information from the GitHub API using a variety of client libraries.
These client libraries, by design, hide the nuts and bolts of the API
from you, providing streamlined and idiomatic methods to view and modify
data inside a Git repository hosted on GitHub. This chapter, however,
gives you a naked viewpoint of the GitHub API and documents the details
of the raw HTTP requests and responses. It also discusses the different
ways to access public and private data inside of GitHub and where
limitations exist. And it gives you an overview of the options for
accessing GitHub data when running inside a web browser context where
network access is restrained.

## cURL

cURLGitHub APIcURL and cURL andThere will be times when you want to
quickly access information from the GitHub API without writing a formal
program. Or, when you want to quickly get access to the raw HTTP request
headers and content. Or, where you might even question the
implementation of a client library and need confirmation it is doing the
right thing from another vantage point. In these situations, cURL, a
simple command-line HTTP tool, is the perfect fit. cURL, like the best
Unix tools, is a small program with a very specific and purposefully
limited set of features for accessing HTTP servers.

cURL, like the HTTP protocol it speaks intimately, is stateless: we will
explore solutions to this limitation in a later chapter, but note that
cURL works best with one-off requests.

> **Note**
> 
> cURLinstalling installingcURL is usually installed on most OS X
> machines, and can easily be installed using Linux package managers
> (probably one of apt-get install curl or yum install curl). If you are
> using Windows or want to manually install it, go to
> <http://curl.haxx.se/download.html>.

Let’s make a request. We’ll start with the most basic GitHub API
endpoint found at *<https://api.github.com>*:

``` bash
$ curl https://api.github.com
{
  "current_user_url": "https://api.github.com/user",
  "current_user_authorizations_html_url":
  "https://github.com/settings/connections/applications{/client_id}",
  "authorizations_url": "https://api.github.com/authorizations",
  "code_search_url":
  "https://api.github.com/search/code?q={query}{&page,per_page,sort,order}",
  "emails_url": "https://api.github.com/user/emails",
  "emojis_url": "https://api.github.com/emojis",
  ...
}
```

We’ve abbreviated the response to make it more readable. A few salient
things to notice: there are a lot of URLs pointing to secondary
information, parameters are included in the URLs, and the response
format is JSON.

What can we learn from this API response?

## Breadcrumbs to Successive API Paths

GitHub APIas hypermedia API as hypermedia APIThe GitHub API is a
hypermedia APIhypermedia API. Though a discussion on what constitutes
hypermedia deserves an entire book of its own (check out O’Reilly’s
Building Hypermedia APIs with HTML5 and Node), you can absorb much of
what makes hypermedia interesting by just looking at a response. First,
you can see from the API response that each response contains a map with
directions for the next responses you might make. Not all clients use
this information, of course, but one goal behind hypermedia APIs is that
clients can dynamically adjust their endpoints without recoding the
client code. If the thought of GitHub changing an API because clients
*should* be written to handle new endpoints automatically sounds
worrisome, don’t fret too much: GitHub is very dilligent about
maintaining and supporting its API in a way that most companies would do
well to emulate. But you should know that you can rely on having an API
reference inside the API itself, rather than hosted externally in
documentation, which very easily could turn out to be out of date with
the API itself.

These API maps are rich with data. For example, they are not just URLs
to content, but also information about how to provide parameters to the
URLs. Looking at the previous example, the `code_search_url` key
references a URL that obviously allows you to search within code on
GitHub, but also tells you how to structure the parameters passed to
this URL. If you have an intelligent client who can follow this
programmatic format, you could dynamically generate the query without
involving a developer who can read API documentation. At least that is
the dream hypermedia points us to; if you are skeptical, at least know
that APIs such as GitHub encode documentation into themselves, and you
can bet GitHub has test coverage to prove that this documentation
matches the information delivered by the API endpoints. That’s a strong
guarantee that is sadly missing from many other APIs.

Now let’s briefly discuss the format of all GitHub API responses: JSON.

## The JavaScript Object Notation (JSON) Format

GitHub APIJSON andid=ix\_chapter-01-introduction-asciidoc1
id=ix\_chapter-01-introduction-asciidoc1range=startofrange
range=startofrangeJSON (JavaScript Object
Notation)id=ix\_chapter-01-introduction-asciidoc2range=startofrange
id=ix\_chapter-01-introduction-asciidoc2range=startofrange
range=startofrangeEvery response you get back from the GitHub API will
be in the JSON (JavaScript Object Notation) format. JSON is a
"lightweight data interchange format" (read more on the [JSON.org
website](http://www.json.org/)). There are other competing and effective
formats, such as XML (Extensible Markup Language) or YAML (YAML Ain’t
Markup Language), but JSON is quickly becoming the de facto standard for
web services.

A few of the reasons JSON is so popular:

  - JSON is readable. JSON has a nice balance of human readability when
    compared to serialization formats like XML.

  - JSON can be used within JavaScript with very little modification
    (and cognitive processing on the part of the programmer). A data
    format that works equally well on both the client and server side
    was bound to be victorious, as JSON has been.

You might expect that a site like GitHub, originally built on the Ruby
on Rails stack (and some of that code is still live), would support
specifying an alternative format like XML, but XML is no longer
supported. Long live JSON.

JSON is very straightforward if you have used any other text-based
interchange format. One note about JSON that is not always obvious or
expected to people new to JSON is that the format only supports using
double quotes, not single quotes.

We are using a command-line tool, cURL, to retrieve data from the API.
It would be handy to have a simple command-line tool that also processes
that JSON. Let’s talk about one such tool next.

### Parsing JSON from the Command Line

command lineparsing JSON from parsing JSON fromJSON is a text format, so
you could use any command-line text processing tool, such as the
venerable AWK, to process JSON responses. There is one fantastic
JSON-specific parsing tool that complements cURL that is worth
jqid=ix\_chapter-01-introduction-asciidoc3range=startofrange
id=ix\_chapter-01-introduction-asciidoc3range=startofrange
range=startofrangeknowing: *jq*. If you pipe JSON content (using the `|`
character for most shells) into jq, you can then easily extract pieces
of the JSON filtersusing *filters*.

> **Note**
> 
> jq can be installed from source, using package managers like `brew` or
> `apt-get`, and there are binaries on the [downloads
> page](http://stedolan.github.io/jq/download/) for OS X, Linux,
> Windows, and Solaris.

Going deeper into the prior example, let’s pull out something
interesting from the API map that we receive when we access
*api.github.com*:

``` bash
$ curl https://api.github.com | jq '.current_user_url'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  2004  100  2004    0     0   4496      0 --:--:-- --:--:-- --:--:--  4493
"https://api.github.com/user"
```

What just happened? The jq tool parsed the JSON, and using the
`.current_user_url` filter, it retrieved content from the JSON response.
If you look at the response again, you’ll notice it has key/value pairs
inside an associative array. It uses the `current_user_url` as a key
into that associative array and prints out the value there.

You also will notice that cURL printed out transfer time information.
cURL printed this information standard errorto *standard error*, which
is a shell convention used for messaging errors and an output stream
that jq will correctly ignore (in other words, the JSON format stream
will not be corrupted by error messages). If we want to restrict that
information and clean up the request we should use –s switchthe `-s`
switch, which runs cURL insilent mode "silent" mode.

It should be easy to understand how the jq filter is applied to the
response JSON. For a more complicated request (for example, we might
want to obtain a list of public repositories for a user), we can see the
pattern for the jq pattern parameter emerging. Let’s get a more
complicated set of information, a user’s list of repositories, and see
how we can extract information from the response using jq:

``` bash
$ curl -s https://api.github.com/users/xrd/repos
[
  {
    "id": 19551182,
    "name": "a-gollum-test",
    "full_name": "xrd/a-gollum-test",
    "owner": {
      "login": "xrd",
      "id": 17064,
      "avatar_url":
      "https://avatars.githubusercontent.com/u/17064?v=3",
     ...
  }
]
$ curl -s https://api.github.com/users/xrd/repos | jq '.[0].owner.id'
17064
```

This response is different structurally: instead of an associative
array, we now have an array (multiple items). To get the first one, we
specify a numeric index, and then key into the successive associative
arrays inside of it to reach the desired content: the owner id.

jq is a great tool for checking the validity of JSON. As mentioned
before, JSON key/values are stored only with double quotes, not single
quotes. You can verify that JSON is valid and satisfies this requirement
using jq:

``` bash
$ echo '{ "a" : "b" }' | jq '.'
{
  "a": "b"
}
$ echo "{ 'no' : 'bueno' }" | jq "."
parse error: Invalid numeric literal at line 1, column 7
```

The first JSON we pass into jq works, while the second, because it uses
invalid single-quote characters, fails with an error. jq filters are
strings passed as arguments, and the shell that provides the string to
jq does not care if you use single quotes or double quotes, as you can
see in the preceding code. The echo command, if you didn’t already know,
prints out whatever string you provide to it; when we combine this with
the pipe character we can easily provide that string to jq through
standard input.

jq is a powerful tool for quickly retrieving content from an arbitray
JSON request. jq has many other powerful features, documented at
*<https://stedolan.github.io/jq/>*.

We now know how to retrieve some interesting information from the GitHub
API and parse out bits of information from that response, all in a
single line. But there will be times when you incorrectly specify
parameters to cURL or the API, and the data is not what you expect. Now
we’ll learn about how to debug the cURL tool and the API service itself
to provide more context when things
gorange=endofrangestartref=ix\_chapter-01-introduction-asciidoc3
startref=ix\_chapter-01-introduction-asciidoc3 wrong.

### Debugging Switches for cURL

cURLdebugging switches forid=ix\_chapter-01-introduction-asciidoc4
id=ix\_chapter-01-introduction-asciidoc4range=startofrange
range=startofrangedebugging, cURL switches
forid=ix\_chapter-01-introduction-asciidoc5range=startofrange
id=ix\_chapter-01-introduction-asciidoc5range=startofrange
range=startofrangeswitches,
cURLid=ix\_chapter-01-introduction-asciidoc6range=startofrange
id=ix\_chapter-01-introduction-asciidoc6range=startofrange
range=startofrangeAs mentioned, cURL is a great tool when you are
verifying that a response is what you expect it to be. The response body
is important, but often you’ll want access to the headers as well. cURL
makes getting these easy with the `-i` and `-v` switches. The `-i`
switch–i switch prints out request headers, and–v switch the `-v` switch
prints out both request and response headers (the `>` character
indicates request data, and the `<` character indicates response data):

``` bash
$ curl -i https://api.github.com
HTTP/1.1 200 OK
Server: GitHub.com
Date: Wed, 03 Jun 2015 19:39:03 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 2004
Status: 200 OK
X-RateLimit-Limit: 60
...
{
  "current_user_url": "https://api.github.com/user",
  ...
}
$ curl -v https://api.github.com
* Rebuilt URL to: https://api.github.com/
* Hostname was NOT found in DNS cache
*   Trying 192.30.252.137...
* Connected to api.github.com (192.30.252.137) port 443 (#0)
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* SSLv3, TLS handshake, Client hello (1):
* SSLv3, TLS handshake, Server hello (2):
...
* CN=DigiCert SHA2 High Assurance Server CA
*        SSL certificate verify ok.
> GET / HTTP/1.1
> User-Agent: curl/7.35.0
> Host: api.github.com
> Accept: */*
>
< HTTP/1.1 200 OK
* Server GitHub.com is not blacklisted
...
```

With the `-v` switch you get everything: DNS lookups, information on the
SSL chain, and the full request and response information.

> **Note**
> 
> Be aware that if you print out headers, a tool like jq will get
> confused because you are no longer providing it with pure JSON.

This section shows us that there is interesting information not only in
the body (the JSON data) but also in the headers. It is important to
understand what headers are here and which ones are important. The HTTP
specification requires a lot of these headers, and we can often ignore
those, but there are a few that are vital when you start making more
than just a few isolated
requestsrange=endofrangestartref=ix\_chapter-01-introduction-asciidoc6
startref=ix\_chapter-01-introduction-asciidoc6range=endofrangestartref=ix\_chapter-01-introduction-asciidoc5
startref=ix\_chapter-01-introduction-asciidoc5range=endofrangestartref=ix\_chapter-01-introduction-asciidoc4
startref=ix\_chapter-01-introduction-asciidoc4.range=endofrangestartref=ix\_chapter-01-introduction-asciidoc2
startref=ix\_chapter-01-introduction-asciidoc2range=endofrangestartref=ix\_chapter-01-introduction-asciidoc1
startref=ix\_chapter-01-introduction-asciidoc1

## Important Headers

GitHub APIimportant headers important headersheadersin GitHub API
responses in GitHub API responsesThree headers are present in every
GitHub API response that tell you about the GitHub API rate
limitsheaders for headers forrate limits. They are
X–RateLimit–LimitX–RateLimit–RemainingX–RateLimit–ResetX-RateLimit-Limit,
X-RateLimit-Remaining, and X-RateLimit-Reset. These limits are explained
in detail in [section\_title](#developer-api-rates).

The X–GitHub–Media–Type headerX-GitHub-Media-Type header contains
information that will come in handy when you are starting to retrieve
text or blob content from the API. When you make a request to the GitHub
API you can specify the format you want to work with by sending an
Accept header with your request.

Now, let’s use a response to build another response.

## Following a Hypermedia API

GitHub APIfollowing a Hypermedia API following a Hypermedia
APIHypermedia APIfollowing followingWe’ll use the "map" of the API by
hitting the base endpoint, and then use the response to manually
generate another request:

``` bash
$ curl -i https://api.github.com/
HTTP/1.1 200 OK
Server: GitHub.com
Date: Sat, 25 Apr 2015 05:36:16 GMT
...
{
  "current_user_url": "https://api.github.com/user",
  ...
  "organization_url": "https://api.github.com/orgs/{org}",
  ...
}
```

We can use the organizational URL and substitute "github" in the
placeholder:

``` bash
$ curl https://api.github.com/orgs/github
{
  "login": "github",
  "id": 9919,
  "url": "https://api.github.com/orgs/github",
  ...
  "description": "GitHub, the company.",
  "name": "GitHub",
  "company": null,
  "blog": "https://github.com/about",
  "location": "San Francisco, CA",
  "email": "support@github.com",
  ...
  "created_at": "2008-05-11T04:37:31Z",
  "updated_at": "2015-04-25T05:17:01Z",
  "type": "Organization"
}
```

This information allows us to do some forensics on GitHub itself. We get
the company blog <https://github.com/about>. We see that GitHub is
located in San Francisco, and we see that the creation date of the
organization is May 11th, 2008. Reviewing the blog, we see a [blog post
from April](https://github.com/blog/40-we-launched) that indicates
GitHub launched as a company a month earlier. Perhaps organizations were
not added to the GitHub site features until a month after the company
launched?

So far all of our requests have retrieved publicly available
information. But the GitHub API has a much richer set of information
that is available only once we authenticate and access private
information and publicly inaccessible services. For example, if you are
using the API to write data into GitHub, you need to know about
authentication.

## Authentication

authenticationGitHub APIid=ix\_chapter-01-introduction-asciidoc7
id=ix\_chapter-01-introduction-asciidoc7range=startofrange
range=startofrangeGitHub
APIauthenticationid=ix\_chapter-01-introduction-asciidoc8
id=ix\_chapter-01-introduction-asciidoc8range=startofrange
range=startofrangeThere are two ways to authenticate when making a
request to the GitHub API: username and passwords (HTTP Basic) and OAuth
tokens.

### Username and Password Authentication

authenticationusername and password username and passwordpassword
authenticationusername authenticationYou can access protected content
inside GitHub using a username and password combination. Username aHTTP
Basic authenticationuthentication works by using the HTTP Basic
authentication supported by the `-u` flag in cURL. HTTP Basic
Authentication is synonymous with username and password authentication:

``` bash
$ curl -u xrd https://api.github.com/rate_limit
Enter host password for user 'xrd': xxxxxxxx
{
  "rate": {
    "limit": 5000,
    "remaining": 4995,
    "reset": 1376251941
  }
}
```

This cURL command authenticates into the GitHub API and then retrieves
information about our own specific rate limits for our user account,
protected information only available as a logged-in user.

#### Benefits of username authentication

username authenticationbenefits of benefits ofAlmost any client library
you use will support HTTP Basic authentication. All the GitHub API
clients we looked at support username and passwords. And, writing your
own specific client is easy as this is a core feature of the HTTP
standard, so if you use any standard HTTP library when building your own
client, you will be able to access content inside the GitHub API.

#### Downsides to username authentication

username authenticationdownsides to downsides toThere are many reasons
username and password authentication is the wrong way to manage your
GitHub API access:

  - HTTP Basic is an old protocol that never anticipated the granularity
    of web services. It is not possible to specify only certain features
    of a web service if you ask users to authenticate with
    username/passwords.

  - If you use a username and password to access GitHub API content from
    your cell phone, and then access API content from your laptop, you
    have no way to block access to one without blocking the other.

  - HTTP Basic authentication does not support extensions to the
    authentication flow. Many modern services now support two-factor
    authentication and there is no way to inject this into the process
    without changing the HTTP clients (web browsers, for example) or at
    least the flow they expect (making the browser repeat the request).

All of these problems are solved (or at least supported) with OAuth
flows. Given all these concerns, the only time you will want to use
username and password authentication is when convenience trumps all
other considerations.

### OAuth

authenticationOAuth forid=ix\_chapter-01-introduction-asciidoc9
id=ix\_chapter-01-introduction-asciidoc9range=startofrange
range=startofrangeOAuthid=ix\_chapter-01-introduction-asciidoc10range=startofrange
id=ix\_chapter-01-introduction-asciidoc10range=startofrange
range=startofrangeOAuthtokensid=ix\_chapter-01-introduction-asciidoc11
id=ix\_chapter-01-introduction-asciidoc11range=startofrange
range=startofrangetokens,
OAuthid=ix\_chapter-01-introduction-asciidoc12range=startofrange
id=ix\_chapter-01-introduction-asciidoc12range=startofrange
range=startofrangeOAuth is an authentication mechanism where tokens are
tied to functionality or clients. In other words, you can specify what
features of a service you want to permit an OAuth token to carry with
it, and you can issue multiple tokens and tie those to specific clients:
a cell phone app, a laptop, a smart watch, or even an Internet of Things
toaster. And, importantly, you can revoke tokens without impacting other
tokens.

The main downside to OAuth tokens is that they introduce a level of
complexity that you may not be familiar with if you have only used HTTP
Basic. HTTP Basic requests generally only require adding an extra header
to the HTTP request, or an extra flag to a client tool like cURL.

OAuthscopesid=ix\_chapter-01-introduction-asciidoc13
id=ix\_chapter-01-introduction-asciidoc13range=startofrange
range=startofrangescopesOAuth
andid=ix\_chapter-01-introduction-asciidoc14
id=ix\_chapter-01-introduction-asciidoc14range=startofrange
range=startofrangeOAuth solves the problems just described by linking
tokens to scopes (specified subsets of functionality inside a web
service) and issuing as many tokens as you need to multiple clients.

#### Scopes: specified actions tied to authentication tokens

OAuthtokens tokensscopesand OAuth tokens and OAuth tokenstokens,
OAuthWhen you generate an OAuth token, you specify the access rights you
require. Though our examples create the token using HTTP Basic, once you
have the token, you no longer need to use HTTP Basic in successive
requests. If this token is properly issued, the OAuth token will have
permissions to read and write to public repositories owned by that user.

The following cURL command uses HTTP Basic to initiate the token request
process:

``` bash
$ curl -u username -d '{"scopes":["public_repo"], "note": "A new authorization"}' \
https://api.github.com/authorizations
{
  "id": 1234567,
  "url": "https://api.github.com/authorizations/1234567",
  "app": {
    "name": "My app",
    "url": "https://developer.github.com/v3/oauth_authorizations/",
    "client_id": "00000000000000000000"
  },
  "token": "abcdef87654321
  ...
}
```

The JSON response, upon success, has a token you can extract and use for
applications that need access to the GitHub API.

If you are using two-factor authentication, this flow requires
additional steps, all of which are documented within [???](#Hubot).

To use this token, you specify the token inside an authorization header:

``` bash
$ curl -H "Authorization: token abcdef87654321" ...
```

Scopes clarify how a service or application will use data inside the
GitHub API. This makes it easy to audit how you are using the
information if this was a token issued for your own personal use. But,
most importantly, this provides valuable clarity and protection for
those times when a third-party application wants to access your
information: you can be assured the application is limited in what data
it can access, and you can revoke access easily.

#### Scope limitations

scopeslimitations of limitations ofThere is one major limitation of
scopes to be aware of: you cannot do fine-grained access to certain
repositories only. If you provide access to any of your private
repositories, you are providing access to all repositories.

It is likely that GitHub will change the way scopes work and address
some of these issues. The great thing about the way OAuth works is that
to support these changes you will simply need to request a new token
with the scope modified, but otherwise, the application authentication
flow will be unchaged.

> **Warning**
> 
> Be very careful about the scopes you request when building a service
> or application. Users are (rightly) paranoid about the data they are
> handing over to you, and will evaluate your application based on the
> scopes requested. If they don’t think you need that scope, be sure to
> remove it from the list you provide to GitHub when authorizing and
> consider escalation to a higher scope after you have developed some
> trust with your users.

#### Scope escalation

scopesescalation escalationYou can ask for scope at one point that is
very limited, and then later ask for a greater scope. For example, when
a user first accesses your application, you could only get the user
scope to create a user object inside your service, and only when your
application needs repository information for a user, then request to
escalate privileges. At this point the user will need to approve or
disapprove your request, but asking for everything upfront (before you
have a relationship with the user) often results in a user abandoning
the
login.range=endofrangestartref=ix\_chapter-01-introduction-asciidoc14
startref=ix\_chapter-01-introduction-asciidoc14range=endofrangestartref=ix\_chapter-01-introduction-asciidoc13
startref=ix\_chapter-01-introduction-asciidoc13

Now let’s get into the specifics of authentication using OAuth.

#### Simplified OAuth flow

OAuthsimplified flow simplified flowOAuth2OAuth has many variants, but
GitHub uses OAuth2. OAuth2 specifies a flow where:

1.  The application requests access

2.  The service provider (GitHub) requests authentication: username and
    password usually

3.  If two-factor authentication is enabled, ask for the OTP (one-time
    password) code

4.  GitHub responds with a token inside a JSON payload

5.  The application uses the OAuth token to make requests of the API

A real-world flow is described in full in
[???](#Hubot).range=endofrangestartref=ix\_chapter-01-introduction-asciidoc12
startref=ix\_chapter-01-introduction-asciidoc12range=endofrangestartref=ix\_chapter-01-introduction-asciidoc11
startref=ix\_chapter-01-introduction-asciidoc11range=endofrangestartref=ix\_chapter-01-introduction-asciidoc10
startref=ix\_chapter-01-introduction-asciidoc10range=endofrangestartref=ix\_chapter-01-introduction-asciidoc9
startref=ix\_chapter-01-introduction-asciidoc9

Now let’s look at the variety of HTTP status codes GitHub uses to
communicate feedback when using the
API.range=endofrangestartref=ix\_chapter-01-introduction-asciidoc8
startref=ix\_chapter-01-introduction-asciidoc8range=endofrangestartref=ix\_chapter-01-introduction-asciidoc7
startref=ix\_chapter-01-introduction-asciidoc7

## Status Codes

GitHub APIstatus codesid=ix\_chapter-01-introduction-asciidoc15
id=ix\_chapter-01-introduction-asciidoc15range=startofrange
range=startofrangeHTTP status
codesid=ix\_chapter-01-introduction-asciidoc16range=startofrange
id=ix\_chapter-01-introduction-asciidoc16range=startofrange
range=startofrangestatus
codesid=ix\_chapter-01-introduction-asciidoc17range=startofrange
id=ix\_chapter-01-introduction-asciidoc17range=startofrange
range=startofrangeThe GitHub API uses HTTP status codes to tell you
definitive information about how your request was processed. If you are
using a basic client like cURL, it will be important to validate the
status code before you look at any of the data retrieved. If you are
writing your own API client, pay close attention to the status code
before anything else. If you are new to the GitHub API, it is worth
reviewing the response codes thoroughly until you are familiar with the
various conditions that can cause errors when making a request.

### Success (200 or 201)

200 status code201 status codeIf you have worked with any HTTP clients
whatsoever, you know that the HTTP status code "200" means success.
GitHub will respond with a 200 status code when your request destination
URL and associated parameters are correct. If your request creates
content on the server, then you will get a 201 status code, indicating
successful creation on the server.

``` bash
$ curl -s -i https://api.github.com | grep Status
Status: 200 OK
```

### Naughty JSON (400)

400 status codestatus codesinvalid payload (400) invalid payload (400)If
your payload (the JSON you send to a request) is invalid, the GitHub API
will respond with a 400 error, as shown here:

``` bash
$ curl -i -u xrd -d 'yaml: true' -X POST https://api.github.com/gists
Enter host password for user 'xrd':
HTTP/1.1 400 Bad Request
Server: GitHub.com
Date: Thu, 04 Jun 2015 20:33:49 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 148
Status: 400 Bad Request
...

{
  "message": "Problems parsing JSON",
  "documentation_url":
  "https://developer.github.com/v3/oauth_authorizations/#create...authorization"
}
```

Here we attempt to generate a new gist by using the endpoint described
at the [Gist API
documentation](https://developer.github.com/v3/gists/#create-a-gist).
We’ll discuss gists in more detail in a later chapter. This issue
fails because we are not using JSON (this looks like it could be YAML,
which we will discuss in [???](#Jekyll)). The payload is sent using the
`-d` switch. GitHub responds with advice on where to find the
documentation for the correct format at the `documentation_url` key
inside the JSON response. Notice that we use the `-X POST` switch and
value to tell cURL to make a POST request to GitHub.

### Improper JSON (422)

422 status codefields, invalidstatus codesimproper JSON (422) improper
JSON (422)If any of the fields in your request are invalid, GitHub will
respond with a 422 error. Let’s attempt to fix the previous request. The
documentation indicates the JSON payload should look like this:

``` bash
{
  "description": "the description for this gist",
  "public": true,
  "files": {
    "file1.txt": {
      "content": "String file contents"
    }
  }
}
```

What happens if the JSON is valid, but the fields are incorrect?

``` bash
$ curl -i -u chris@burningon.com -d '{ "a" : "b" }' -X POST
https://api.github.com/gists
Enter host password for user 'chris@burningon.com':
HTTP/1.1 422 Unprocessable Entity
...

{
  "message": "Invalid request.\n\n\"files\" wasn't supplied.",
  "documentation_url": "https://developer.github.com/v3"
}
```

There are two important things to note: first, we get a 422 error, which
indicates the JSON was valid, but the fields were incorrect. We also get
a response that indicates why: we are missing the `files` key inside the
request payload.

### Successful Creation (201)

201 status codestatus codessuccessful creation (201) successful creation
(201)We’ve seen what happens when the JSON is invalid, but what happens
when the JSON is valid for our request?

``` bash
$ curl -i -u xrd \
-d '{"description":"A","public":true,"files":{"a.txt":{"content":"B"}}} \
https://api.github.com/gists
Enter host password for user 'xrd':
HTTP/1.1 201 Created
...

{
  "url": "https://api.github.com/gists/4a86ed1ca6f289d0f6a4",
  "forks_url":
  "https://api.github.com/gists/4a86ed1ca6f289d0f6a4/forks",
  "commits_url":
  "https://api.github.com/gists/4a86ed1ca6f289d0f6a4/commits",
  "id": "4a86ed1ca6f289d0f6a4",
  "git_pull_url": "https://gist.github.com/4a86ed1ca6f289d0f6a4.git",
  ...
}
```

Success\! We created a gist and got a 201 status code indicating things
worked properly. To make our command more readable we used the backslash
character to allow parameters to span across lines. Also, notice the
JSON does not require whitespace, which we have completely removed from
the string passed to the `-d` switch (in order to save space and make
this command a little bit more readable).

### Nothing Has Changed (304)

304 status codestatus codesno change (304) no change (304)304s are like
200s in that they say to the client: yes, your request succeeded. They
give a little bit of extra information, however, in that they tell the
client that the data has not changed since the last time the same
request was made. This is valuable information if you are concerned
about your usage limits (and in most cases you will be). We have not yet
explained how rate limits work, so let’s discuss that and then return to
demonstrate triggering a 304 response code by using conditional headers.

### GitHub API Rate Limits

GitHub APIrate limits rate limitsrate limitsand authenticated requests
and authenticated requestsGitHub tries to limit the rate at which users
can make requests to the API. Anonymous requests (requests that haven’t
authenticated with either a username/password or OAuth information) are
limited to 60 requests an hour. If you are developing a system to
integrate with the GitHub API on behalf of users, clearly 60 requests
per hour isn’t going to be sufficient.

This rate limit is increased to 5000 requests per hour if you are making
an authenticated request to the GitHub API, and while this rate is two
orders of magnitude larger than the anonymous rate limit, it still
presents problems if you intend to use your own GitHub credentials when
making requests on behalf of many users.

For this reason, if your website or service uses the GitHub API to
request information from the GitHub API, you should consider using OAuth
and make requests to the GitHub API using your user’s shared
authentication information. If you use a token connected to another
user’s GitHub account, the rate limits count against that user, and
not your user account.

> **Note**
> 
> There are actually two rate limits: core rate limitssearch rate
> limitsthe *core* rate limit and the *search* rate limit. The rate
> limits explained in the previous paragraphs were for the core rate
> limit. For search, requests are limited to 20 requests per minute for
> authenticated user requests and 5 requests per minute for anonymous
> requests. The assumption here is that search is a more
> infrastructure-intensive request to satisfy and that tighter limits
> are placed on its usage.

Note that GitHub tracks anonymous requests by IP address. This means
that if you are behind a firewall with other users making anonymous
requests, all those requests will be grouped together.

### Reading Your Rate Limits

rate limitsreading readingReading your rate limit is
straightforward—just make a GET request to /rate\_limit. This will
return a JSON document that tells you the limit you are subject to, the
number of requests you have remaining, and the timestamp (in seconds
since 1970). Note that this timestamp is in the Coordinated Universal
Time (UTC) time zone.

cURLand rate limit retrieval and rate limit retrievalThe following
command listing uses cURL to retrieve the rate limit for an anonymous
request. This response is abbreviated to save space in this book, but
you’ll notice that the quota information is supplied twice: once in the
HTTP response headers and again in the JSON response. The rate limit
headers are returned with every request to the GitHub API, so there is
little need to make a direct call to the /rate\_limit API:

``` bash
$ curl https://api.github.com/rate_limit
{
  "resources": {
    "core": {
      "limit": 60,
      "remaining": 48,
      "reset": 1433398160
    },
    "search": {
      "limit": 10,
      "remaining": 10,
      "reset": 1433395543
    }
  },
  "rate": {
    "limit": 60,
    "remaining": 48,
    "reset": 1433398160
  }
}
```

Sixty requests over the course of an hour isn’t very much, and if you
plan on doing anything interesting, you will likely exceed this limit
quickly. If you are hitting up against the 60 requests per minute limit,
you will likely want to investigate making authenticated requests to the
GitHub API. We’ll show that when we discuss authenticated requests.

Calls to the /rate\_limit API are not deducted from your rate limits.
And, remember, rate limits are reset after 24
hours.range=endofrangestartref=ix\_chapter-01-introduction-asciidoc17
startref=ix\_chapter-01-introduction-asciidoc17range=endofrangestartref=ix\_chapter-01-introduction-asciidoc16
startref=ix\_chapter-01-introduction-asciidoc16range=endofrangestartref=ix\_chapter-01-introduction-asciidoc15
startref=ix\_chapter-01-introduction-asciidoc15

## Conditional Requests to Avoid Rate Limitations

conditional requestsGitHub APIconditional requests to avoid rate
limitations conditional requests to avoid rate limitationsrate
limitsconditional requests to avoid conditional requests to avoidIf you
are querying the GitHub APIs to obtain activity data for a user or a
repository, there’s a good chance that many of your requests won’t
return much activity. If you check for new activity once every few
minutes, there will be time periods over which no activity has occurred.
These constant polls still use up requests in your rate limit even
though there’s no new activity to be delivered.

conditional HTTP headersIf–Modified–Since headerIf–None–Match headerIn
these cases, you can send the conditional HTTP headers
`If-Modified-Since` and `If-None-Match` to tell GitHub to return an HTTP
304 response code telling you that nothing has been modified. When you
send a request with a conditional header and the GitHub API responds
with an HTTP 304 response code, this request is not deducted from your
rate limit.

The following command listing is an example of passing in the
If-Modified-Since HTTP header to the GitHub API. Here we’ve specified
that we’re only interested in receiving content if the Twitter Bootstrap
repositories have been altered after 7:49 PM GMT on Sunday, August 11,
2013. The GitHub API responds with an HTTP 304 response code that also
tells us that the last time this repository changed was a minute earlier
than our cutoff date:

``` bash
$ curl -i https://api.github.com/repos/twbs/bootstrap \
          -H "If-Modified-Since: Sun, 11 Aug 2013 19:48:59 GMT"
HTTP/1.1 304 Not Modified
Server: GitHub.com
Date: Sun, 11 Aug 2013 20:11:26 GMT
Status: 304 Not Modified
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 46
X-RateLimit-Reset: 1376255215
Cache-Control: public, max-age=60, s-maxage=60
Last-Modified: Sun, 11 Aug 2013 19:48:39 GMT
```

cachingtags tagsHTTP caching tagsThe GitHub API also understands HTTP
caching tags. An Entity TagETagETag, or Entity Tag, is an HTTP header
that is used to control whether or not content you have previously
cached is the most recent version. Here’s how your systems would use an
ETag:

  - Your server requests information from an HTTP server.

  - Server returns an ETag header for a version of a content item.

  - Your server includes this ETag in all subsequent requests:
    
      - If the server has a newer version it returns new content + a new
        ETag.
    
      - If the server doesn’t have a newer version it returns an HTTP
        304.

The following command listing demonstrates two commands. The first cURL
call to the GitHub API generates an ETag value, and the second value
passes this ETag value as an If-None-Match header. You’ll note that the
second response is an HTTP 304, which tells the caller that there is no
new content available:

``` bash
$ curl -i https://api.github.com/repos/twbs/bootstrap
HTTP/1.1 200 OK
Cache-Control: public, max-age=60, s-maxage=60
Last-Modified: Sun, 11 Aug 2013 20:25:37 GMT
ETag: "462c74009317cf64560b8e395b9d0cdd"

{
  "id": 2126244,
  "name": "bootstrap",
  "full_name": "twbs/bootstrap",
  ....
}

$ curl -i https://api.github.com/repos/twbs/bootstrap \
          -H 'If-None-Match: "462c74009317cf64560b8e395b9d0cdd"'

HTTP/1.1 304 Not Modified
Status: 304 Not Modified
Cache-Control: public, max-age=60, s-maxage=60
Last-Modified: Sun, 11 Aug 2013 20:25:37 GMT
ETag: "462c74009317cf64560b8e395b9d0cdd"
```

Use of conditional request headers is encouraged to conserve resources
and make sure that the infrastructure that supports GitHub’s API isn’t
asked to generate content unnecessarily.

At this point we have been accessing the GitHub API from a cURL client,
and as long as our network permits it, we can do whatever we want. The
GitHub API is accessible in other situations as well, like from within a
browser context, and certain restrictions apply there, so let’s discuss
that next.

## Accessing Content from the Web

GitHub APIaccessing content from
Webid=ix\_chapter-01-introduction-asciidoc18
id=ix\_chapter-01-introduction-asciidoc18range=startofrange
range=startofrangeWeb
contentaccessingid=ix\_chapter-01-introduction-asciidoc19
id=ix\_chapter-01-introduction-asciidoc19range=startofrange
range=startofrangeIf you are using the GitHub API from a server-side
program or the command line then you are free to issue any network calls
as long as your network permits it. If you are attempting to access the
GitHub API from within a browser using JavaScript and theXHR
(XmlHttpRequest) XHR (XmlHttpRequest) object, then you should be aware
of limitations imposed by the browser’s same-origin policy. In a
nutshell, you are not able to access domains from JavaScript using
standard XHR requests outside of the domain from which you retrieved the
original page. There are two options for getting around this
restriction, one clever (JSON-P) and one fully supported but slightly
more onerous (CORS).

### JSON-P

GitHub APIand JSON–P and JSON–PJSON–PWeb contentaccessing with JSON–P
accessing with JSON–PJSON-P is a browser hack, more or less, that allows
retrieval of information from servers outside of the same-origin policy.
JSON-P works because `<script>` tags are not checked against the
same-origin policy; in other words, your page can include references to
content on servers other than the one from which the page originated.
With JSON-P, you load a JavaScript file that resolves to a specially
encoded data payload wrapped in a callback function you implement. The
GitHub API supports this syntax: you request a script with a parameter
on the URL indicating what callback you want the script to execute once
loaded.

We can simulate this request in cURL:

``` bash
$ curl https://api.github.com/?callback=myCallback
/**/myCallback({
  "meta": {
    "X-RateLimit-Limit": "60",
    "X-RateLimit-Remaining": "52",
    "X-RateLimit-Reset": "1433461950",
    "Cache-Control": "public, max-age=60, s-maxage=60",
    "Vary": "Accept",
    "ETag": "\"a5c656a9399ccd6b44e2f9a4291c8289\"",
    "X-GitHub-Media-Type": "github.v3",
    "status": 200
  },
  "data": {
    "current_user_url": "https://api.github.com/user",
    "current_user_authorizations_html_url":
    "https://github.com/settings/connections/applications{/client_id}",
    "authorizations_url": "https://api.github.com/authorizations",
    ...
  }
 })
```

If you used the same URL we used in the preceding code inside a script
tag on a web page (`<script
src="https://api.github.com/?callback=myCallback" type=
"text/javascript"></script>`), your browser would load the content
displayed in the preceding code, and then a JavaScript function you
defined called `myCallback` would be executed with the data shown. This
function could be implemented like this inside your web page:

``` javascript
<script>
function myCallback( payload ) {
  if( 200 == payload.status ) {
    document.getElementById("success").innerHTML =
      payload.data.current_user_url;
  } else {
    document.getElementById("error").innerHTML =
      "An error occurred";
  }
}
</script>
```

This example demonstrates taking the `current_user_url` from the data
inside the payload and putting it into a DIV, one that might look like
`<div id="success"> </div>`.

Because JSON-P works via \<script\> tags, only GET requests to the API
are supported. If you only need read-only access to the API, JSON-P can
fulfill that need in many cases, and it is easy to configure.

If JSON-P seems too limiting or hackish, CORS is a more complicated but
official way to access external services from within a web page.

### CORS Support

CORSGitHub APICORS support CORS supportWeb contentCORS requests CORS
requestsCORS is the W3C (a web standards body) approved way to access
content from a different domain than the original host. CORS requires
that the server be properly configured in advance; the server must
indicate when queried that it allows cross-domain requests. If the
server effectively says "yes, you can access my content from a different
domain," then CORS requests are permitted. The HTML5Rocks website has a
[great tutorial explaining many details of
CORS](http://www.html5rocks.com/en/tutorials/cors/).

Because XHR using CORS allows the same type of XHR requests you get from
the same domain origin, you can make requests beyond GET to the GitHub
API: POST, DELETE, and UPDATE. Between JSON-P and CORS you have two
options for accessing content from the GitHub API inside of web
browsers. The choice is between the simplicity of JSON-P and the power
and extra configuration of CORS.

We can prove using cURL that the GitHub API server is responding
correctly for CORS requests. In this case we only care about the
headers, so we use the `-I` switch, which tells cURL to make a HEAD
request, telling the server not to respond with body content:

``` bash
curl -I https://api.github.com
HTTP/1.1 200 OK
Server: GitHub.com
...
X-Frame-Options: deny
Content-Security-Policy: default-src 'none'
Access-Control-Allow-Credentials: true
Access-Control-Expose-Headers: ETag, Link, X-GitHub-OTP,
X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset,
X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval
Access-Control-Allow-Origin: *
X-GitHub-Request-Id: C0F1CF9E:07AD:3C493B:557107C7
Strict-Transport-Security: max-age=31536000; includeSubdomains;
preload
```

We can see the Access-Control-Allow-Credentials header is set to true.
It depends on the browser implementation, but some JavaScript host
browsers will automatically make a *preflight* request to verify this
header is set to true (and that other headers, like the
Access-Control-Allow-Origin, are set correctly and permit requests from
that origin to proceed). Other JavaScript host browsers will need you to
make that request. Once the browser has used the headers to confirm that
CORS is permitted, you can make XHR requests to the GitHub API domain as
you would any other XHR request going into the same domain.

We’ve covered much of the details of connecting and dissecting the
GitHub API, but there are a few other options to know about when using
it. One of them is that you can use the GitHub API service to provide
rendered content when you need it.

### Specifying Response Content Format

Web contentresponse format specification response format
specificationWhen you send a request to the GitHub API, you have some
ability to specify the format of the response you expect. For example,
if you are requesting content that contains text from a commit’s comment
thread, you can use the Accept header to ask for the raw Markdown or for
the HTML this Markdown generates. You also have the ability to specify
this version of the GitHub API you are using. At this point, you can
specify either version 3 or beta of the API.

#### Retrieving formatted content

Web contentretrieving formatted content retrieving formatted contentThe
Accept header you send with a request can affect the format of text
returned by the GitHub API. As an example, let’s assume you wanted to
read the body of a GitHub Issue. An issue’s body is stored in Markdown
and will be sent back in the request by default. If we wanted to render
the response as HTML instead of Markdown, we could do this by sending a
different Accept header, as the following cURL commands demonstrate:

``` bash
$ URL='https://api.github.com/repos/rails/rails/issues/11819'
$ curl -s $URL | jq '.body'
"Hi, \r\n\r\nI have a problem with strong...." 
$ curl -s $URL | jq '.body_html'
null 
$ curl -s $URL \
-H "Accept: application/vnd.github.html+json" | jq '.body_html'
"<p>Hi, </p>\n\n<p>I have a problem with..." 
```

  - Without specifying an extra header, we get the internal
    representation of the data, sent as Markdown.

  - Note that if we don’t request the HTML representation, we don’t see
    it in the JSON by default.

  - If we use a customized Accept header like in the third instance,
    then our JSON is populated with a rendered version of the body in
    HTML.

Besides "raw" and "html" there are two other format options that
influence how Markdown content is delivered via the GitHub API. If you
specifytext format "text" as a format, the issue body would have been
returned as plaintext. If you specifyfull format "full" then the content
will be rendered multiple times including the raw Markdown, rendered
HTML, and rendered plaintext.

In addition to controlling the format of text content, you can also
retrieve GitHub blobs either as raw binary or as a BASE64-encoded text.
When retrieving commits, you can also specify that the content be
returned either as a diff or as a patch. For more information about
these fine-grained controls for formatting, see the GitHub API
documentation.

> **Note**
> 
> The GitHub team has already provided very thorough documentation on
> their API with examples using cURL. Bookmark this URL:
> <https://developer.github.com/v3/>. You’ll use it often. Do note that
> this URL is tied, obviously, to the current API "version 3," so this
> URL will change when a new version is
> released.range=endofrangestartref=ix\_chapter-01-introduction-asciidoc19
> startref=ix\_chapter-01-introduction-asciidoc19range=endofrangestartref=ix\_chapter-01-introduction-asciidoc18
> startref=ix\_chapter-01-introduction-asciidoc18

## Summary

In this chapter we learned how to access the GitHub API from the
simplest client available: the command-line cURL HTTP tool. We also
explored the API by looking at the JSON and played with a command-line
tool (jq) that when paired with cURL gives us the ability to quickly
find information in the often large body of data the GitHub API
provides. We learned about the different authentication schemes
supported by GitHub, and also learned about the possibilities and
trade-offs when accessing the GitHub API from within a browser
context.range=endofrangestartref=ix\_chapter-01-introduction-asciidoc0
startref=ix\_chapter-01-introduction-asciidoc0

In the next chapter we will look at gists and the Gist API. We’ll use
Ruby to build a gist display program, and host all source files for the
application as a gist itself.
