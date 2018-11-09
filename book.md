Unresolved directive in book.asciidoc - include::book-docinfo.xml\[\]

# Preface

This book contains stories about building software tools.

If you write software on a daily basis, you realize the act of writing
software is the craft of creating tools. Software is nothing more than a
tool. A spreadsheet is fundamentally a tool to add and subtract numbers.
A video game is fundamentally a tool to alleviate boredom. Almost
immediately after people started writing software tools we then
discovered we needed more tools to permit us to write the tools we set
out to build in the first place. meta–toolsLet’s call these tools that
are strictly to support writing software (rather than software tools for
the general population) meta-tools.

One of the most important meta-tools in the software development world
is Git. Git is a meta-tool that helps software developers manage the
complexity that comes from writing software. Git allows software
developers to store snapshots of their programs (and then easily restore
those snapshots if necessary) and to easily collaborate with other
programmers (a surprisingly complicated problem). source code management
(SCM)Git is called a source code management (SCM) tool and though there
were many other SCMs before Git, Git has taken the software world by
storm like no other before it and now dominates the SCM landscape.

GitHub is a company that saw the immense potential of Git early on and
built a layer of web services on top of the existing features found in
Git. Not surprisingly, one of the factors behind its success was that
GitHub employees embraced the ethos of writing meta-tools from the
beginning. Building meta-tools requires the courage to take a little
extra time to build a meta-tool rather than taking the easy route to get
the public-facing software out the door. GitHub employees are proud of
this prioritization and have written extensively about the benefits,
which include easy on-boarding of new hires and a transparent workflow
visible to all employees.

This book looks at the tools GitHub uses internally. The GitHub.com
website is itself a meta-tool, and we discuss the many facets of the
GitHub service. Specifically these technologies are the GitHub API and
related GitHub technologies, Gollum wiki, Jekyll static page generator,
and the chat robot called Hubot (if you are not familiar with any of
these, we’ll explain them fully in their respective chapters).

To reiterate, this book is not a reference of those technologies. This
book is a story-book, a book that relates the process of building
software meta-tools, explaining not only the technology specifics, but
also the compromises, the realities of refactoring, and the challenges
inherent to writing meta-tools in long narrative story form.

Meta-tools require a different mindset than what comes from building
software available to the general population. Meta-tools are generally
open source, which requires a different level of responsibility and
usage. One could argue that software engineers are more demanding of
quality than general users because software developers know they can
take action to improve or fork software that does not work for them.
Meta-tools enforce a higher level of contributory involvement, which
makes automated tests almost a requirement. All of these concepts
constitute the background story behind meta-tools, and we show you how
they play out when building your own.

# Why APIs and Why the GitHub API?

APIs, reasons for usingGitHub APIreasons for using reasons for
usingUsing an API to back an application is a common practice today:
this is the future of application development. APIs provide a great
pattern for making data accessible to the multiscreen world. If your
application is backed by a remote service API, the first application
could be a mobile app running on Apple’s iOS operating system.
Critically, if that business model does not turn out to be correct, you
can respond quickly to changing requirements and iterate to build
another application for an Android wearable. Or, perhaps you’ll build an
integrated car application, or any other console (or even nonconsole)
application. As long as your applications can send and receive data
using calls to a remote API you are free to build whatever user
interface you want on whatever platform you want.

As an author, you could write and host your own API. Many frameworks for
popular languages like Ruby, Go, or Java support building APIs using
standard architectural styles like REST. Or, you could use a third-party
API. In this book we’ll focus on a third-party API: the GitHub API.

Why the GitHub API? The GitHub API is exceedingly relevant if you are
building software because you are probably using GitHub to manage your
software code. For those that aren’t, you might be using Git without
GitHub, and the GitHub API is useful to know there as well, as it layers
the functionality of Git into a networked programming interface.

The GitHub API is perhaps the best designed API I’ve ever used.
Hypermedia APIIt is a Hypermedia API, which is an arguably successful
attempt to make API clients resilient to API changes—a tricky problem.
The API is well versioned. It is comprehensive, mapping closely to most
features of Git. It is consistent across sections and well organized.
The GitHub API is a great API on which to build applications, serving as
a case study for a well-designed API.

# Structure of This Book

The GitHub API is extremely comprehensive, permitting access and
modification of almost all data and metadata stored or associated with a
Git repository. Here is a grouped summary of the sections of the API
ordered alphabetically as they are on the [GitHub API documentation
site](https://developer.github.com/v3/):

  - Activity: notifications of interesting events in your developer life

  - Gists: programmatically create and share code snippets

  - Git Data: raw access to Git data over a remote API

  - Issues: add and modify issues

  - Miscellaneous: whatever does not fit into the general API
    categorization

  - Organizations: access and retrieve organizational membership data

  - Pull Requests: a powerful API layer on the popular merge process

  - Repositories: modify everything and anything related to repositories

  - Search: code-driven search within the entire GitHub database

  - Users: access user data

  - Enterprise: specifics about using the API when using the private
    corporate GitHub

In addition, though not a part of the API, there are other important
technologies you should know about when using GitHub that are not
covered in the API documentation:

  - Jekyll and "gh-pages": hosting blogs and static documentation

  - Gollum: wikis tied to a repository

  - Hubot: a programmable chat robot used extensively at GitHub

Each of these sections of the GitHub technology stack are covered in
various chapters (with two exceptions, which we explain next). The
GitHub API documentation is a stellar reference you will use constantly
when writing any application that talks to the API, but the chapters in
this book serve a different purpose: these chapters are stories about
building applications on top of the technologies provided by GitHub.
Within these stories you will learn the trade-offs and considerations
you will face when you use the GitHub API. Chapters in this book often
cover multiple pieces of the API when appropriate for the story we are
telling. We’ve generally tried to focus on a major API section and limit
exposure to other pieces as much as possible, but most chapters do need
to bring in small pieces of more than one section.

Here is a short synopsis of each chapter:

  - [???](#introduction)  
    This chapter covers a first look at the API through the command-line
    HTTP client called cURL. We talk a bit about the response format and
    how to parse it within the command line, and also document
    authentication. This is the only chapter that does not build an
    application from the technologies presented.
    [section\_title](#chapter2): This chapter covers the Gist API, as
    well as command-line tools and the Ruby language "Octokit" API
    client. We then take this API and build a simple Ruby server that is
    stored as a gist and displays gists.

  - [section\_title](#chapter3)  
    This chapter explains usage of the Gollum command-line tool and
    associated Ruby library (gem), which is backed by Grit, the
    C-language bindings for accessing Git repositories. We also document
    some details of the Git storage format and how it applies to storing
    large files inside of a Git repository, and show how to use the Git
    command-line tools to play with this information. We use Gollum and
    the Grit libraries to build an image management tool that also
    functions as a regular Gollum wiki, which can be published to
    GitHub.

  - [???](#python_search_api)  
    In this chapter we explore the Search API and build a GUI tool to
    search repositories on GitHub using Python.

  - [???](#commit_status)  
    This chapter covers a relatively new part of the API that documents
    the interactions between third-party tools and your code. This
    chapter builds an application using C\# and the Nancy .NET GitHub
    API libraries.

  - [section\_title](#Jekyll)  
    If you push a specifically organized repository into GitHub, GitHub
    will host a fully featured blog, equivalent in most ways to a
    Wordpress site (well, except for the complexity part). This chapter
    documents how to format your repository, how to use Markdown within
    Jekyll, how to use programmatic looping constructs provided by
    Liquid Templates, and then shows how to import an entire website
    from the Internet Archive into the Jekyll format using Ruby. We show
    how to respectfully spider a site using caching, a valuable
    technique when using APIs or third-party public information.

  - [section\_title](#android_and_git_data_api)  
    In this chapter we create a mobile application targeting the Android
    OS. Our application reads and writes information into a Jekyll
    repository from the Git Data section of the API. We show how to
    create user interface tests for Android that verify GitHub API
    responses using the Calabash UI testing tool.

  - [section\_title](#Hubot)  
    Hubot is a JavaScript (NodeJS) chat robot enabling technologists to
    go beyond developer operations ("DevOps") to a new frontier called
    "ChatOps." This chapter illustrates using the Activity and Pull
    Requests section of the API. In addition, we show how you can
    simulate GitHub notifications and how to write testable Hubot
    extensions (which is often a challenge when writing JavaScript
    code). We string all these pieces together and build a robot that
    automates assigning pull request review requests.

  - [section\_title](#JavaScript)  
    Did you know you can host an entire "single-page application" on
    GitHub? We show how you can build a coffee shop information app
    backed by a flat file database hosted on GitHub written in the
    JavaScript language. Importantly, we show how you can write a
    testable JavaScript application that mocks out the GitHub API when
    needed.

Organizations APIWe don’t cover the Organizations API: this is a small
facet of the API with only the ability to list organizations and modify
metadata about your organization; once you have used other parts of the
API this nook of the API will be very intuitive.

Users APIWe also don’t cover the Users section of the API. While you
might expect it to be an important part of the API, the Users API is
really nothing more than an endpoint to list information about users,
add or remove SSH keys, adjust email addresses, and modify your list of
followers.

issuesThere is not a specific chapter on issues. GitHub originally
grouped issues and pull requests into the same API section, but with the
growing importance of pull requests GitHub has separated them in the API
documentation. In fact, they are still internally stored in the same
database and pull requests are, at least for now, just another type of
issue. [section\_title](#Hubot) documents using pull requests and is a
good reference for issues in that way.

GitHub EnterpriseAPI APIThe Enterprise API works almost exactly the same
as the GitHub.com site API. We don’t have a chapter telling a story
about an Enterprise version of the API, but we do provide an
[appendix](#appendix) that contains a few notes about how the examples
work when using an Enterprise server. We also provide the specific
syntax for each of the languages used in the chapters that will make any
of the examples provided work with an Enterprise server.

Through these stories about the technologies behind GitHub we hope to
give you an inside look at the inner workings of the brain of a
developer building on top of the GitHub API.

# Who You Are

This book should be an interesting source of information for people who
have used Git or GitHub and want to "level-up" their skills related to
these technologies. People without any experience using GitHub or Git
should start with an introductory book on these technologies.

You should have good familiarity with at least one imperative modern
programming language. You don’t need to be an expert programmer to read
this book, but having some programming experience and familiarity with
at least one language is essential.

You should understand the basics of the HTTP protocol. The GitHub team
uses a very standard RESTful approach for its API. You should understand
the difference between a GET request and POST request and what HTTP
status codes mean at the very least.

Familiarity with other web APIs will make traversing these chapters
easier, although this book simultaneously aspires to provide a guide
showing how a well-thought-out, well-designed, and well-tested web API
creates a foundation for building fun and powerful tools. If you have
not used web APIs extensively, but have experience using other types of
APIs, you will be in good company.

# What You Will Learn

Much of the book focuses on the technical capabilities exposed by GitHub
and the powerful GitHub API. Perhaps you feel constrained by using Git
only from within a certain toolset; for example, if you are an Android
developer using Git to manage your app source code and want to unlock
Git in other places in your life as a developer, this book provides a
wider vista to learn about the power of Git and GitHub. If you have
fallen into using Git for your own projects and are now interested in
using Git within a larger community, this book can teach you all about
the "social coding" style pioneered and dogfooded by the GitHub team.
This book provides a stepping stone for software developers who have
used other distributed version control systems and are looking for a
bridge to using their skills with Git and within a web service like
GitHub.

Like any seasoned developer, automation of your tools is important to
you. This book provides examples of mundane tasks converted into
automated and repeatable processes. We show how to do this using a
variety of languages talking to the GitHub API.

To make this book accessible to everyone, regardless of their editor or
operating system, many of the programming samples work within the
command line. If you are unfamiliar with the "command line" this book
will give you a firm understanding of how to use it, and we bet you will
find great power there. If you have hated the command line since your
father forced you to use it when you were five, this is the perfect book
to rekindle a loving relationship with the bash shell.

If you absorb not only the technical facets of using GitHub but also pay
attention to the cultural and ideological changes offered behind the
tools, you’ll very likely see a new way of working in the modern age. We
focus on these "meta" viewpoints as we discuss the tools themselves to
help you see these extra opportunities.

Almost every chapter has an associated repository hosted on GitHub where
you can review the code discussed. Fork away and take these samples into
your own projects and tools\!

Finally, we help you write testable API-backed code. Even the most
experienced developers often find that writing tests for their code is a
challenge, despite the massive body of literature connecting quality
code with tests. Testing can be especially challenging when you are
testing something backed by an API; it requires a different level of
thinking than is found in strict unit testing. To help you get past this
roadblock, whenever possible, this book shows you how to write code that
interacts with the GitHub API and is testable.

# GitHub "First Class" Languages

There are two languages that are so fundamentally linked to GitHub that
you do need to install and use them in order to get the most out of this
book.

  - RubyRuby  
    A simple, readable programming language the founders of GitHub used
    extensively early in the life of the company.

  - JavaScriptJavaScript  
    The only ubiquitous browser-side programming language; its
    importance has grown to new heights with the introduction of
    NodeJSNodeJS, rivaling even the popularity of Ruby on Rails as a
    server-side toolkit for web applications, especially for independent
    developers.

Undoubtedly, many of you picking up this book already have familiarity
with Ruby or JavaScript/NodeJS. So, the basics and installation of them
are in appendices in the back of the book. The appendices don’t cover
syntax of these languages; we expect you have experience with other
languages as a prerequisite and can read code from any imperative
language regardless of the syntax. Later chapters discuss facets of the
API and go into language details at times, but the code is readable
regardless of your familiarity with that particular language. These
explanatory appendices discuss the history of these tools within the
GitHub story as well as important usage notes like special files and
installation options.

Your time will not be wasted if you install and play with these two
tools. Between them you will have a solid toolset to begin exploration
of the GitHub API. Several chapters in this book use Ruby or JavaScript,
so putting in some time to learn at least a little bit will make the
journey through this book richer for you.

# Operating System Prerequisites

MacBooksoperating system prerequisitesWe, the authors, wrote this book
using MacBook Pros. BASHshellMacBooks have a ubiquitous shell ("BASH")
that works almost identically to the one found on any Linux machine. If
you use either of these two operating systems, you will be able to run
the code from any chapter.

If you use a Windows machine (or an OS that does not include the BASH
shell) then some of the commands and code examples may not work without
installing additional software.

An easy remedy is to use VagrantVirtualBoxVirtualBox and Vagrant.
VirtualBox is a freely available virtualization system for x86 hardware.
Vagrant is a tool for managing development environments: using
VirtualBox and Vagrant you can quickly install a Linux virtual machine.
To do this, visit the downloads page for
[VirtualBox](https://www.virtualbox.org/wiki/Downloads) and
[Vagrant](https://www.vagrantup.com/downloads.html). Once you have
installed these two tools, you can then install an Unbuntu Linux virtual
machineUbuntu Linux virtual machine with these two commands:

``` bash
$ vagrant init hashicorp/precise32
$ vagrant up
```

# Who This Book Is Not For

If you are looking for a discussion of the GitHub API that focuses on a
single language, you should know that we look at the API through many
different languages. We do this to describe the API from not only the
way the GitHub team designed it to work, but the aspirational way that
client library authors made it work within diverse programming languages
and communities. We think there is a lot to learn from this approach,
but if you are interested in only a specific language and how it works
with the GitHub API, this is not the book for you.

This book strives to prove that API-driven code is testable and that
there is a benefit to doing so. This book does not intend to provide a
manual on how to write perfectly tested code. We cover too many
languages to end the healthy debates happening within each community
about the right test frameworks. Instead, given our contention that most
software projects have zero test coverage, this book tries to help you
get past this significant roadblock. There is something transformational
about writing tests if you have never done so before. Having these
examples in hand, we hope, will allow you to transition to writing
testable code for APIs, especially if you have not done so before. Some
of the associated repositories have much greater test suites than are
documented in this book, but we don’t cover all the entire set of edge
cases in every situation.

# Conventions Used in This Book

The following typographical conventions are used in this book:

  - *Italic*  
    Indicates new terms, URLs, email addresses, filenames, and file
    extensions.

  - Constant width  
    Used for program listings, as well as within paragraphs to refer to
    program elements such as variable or function names, databases, data
    types, environment variables, statements, and keywords.

  - *Constant width italic*  
    Shows text that should be replaced with user-supplied values or by
    values determined by context.

> **Note**
> 
> This icon signifies a general note.

> **Warning**
> 
> This icon indicates a warning or caution.

# Using Code Examples

Supplemental material (code examples, exercises, etc.) is available for
download at <https://github.com/xrd/building-tools-with-github>.

This book is here to help you get your job done. In general, if example
code is offered with this book, you may use it in your programs and
documentation. You do not need to contact us for permission unless
you’re reproducing a significant portion of the code. For example,
writing a program that uses several chunks of code from this book does
not require permission. Selling or distributing a CD-ROM of examples
from O’Reilly books does require permission. Answering a question by
citing this book and quoting example code does not require permission.
Incorporating a significant amount of example code from this book into
your product’s documentation does require permission.

We appreciate, but do not require, attribution. An attribution usually
includes the title, author, publisher, and ISBN. For example: “*Building
Tools with GitHub* by Chris Dawson and Ben Straub (O’Reilly). Copyright
2016 Chris Dawson and Ben Straub, 978-1-491-93350-3.”

If you feel your use of code examples falls outside fair use or the
permission given above, feel free to contact us at
permissions@oreilly.com.

# O’Reilly Safari

> **Note**
> 
> Safari (formerly Safari Books Online) is a membership-based training
> and reference platform for enterprise, government, educators, and
> individuals.

Members have access to thousands of books, training videos, Learning
Paths, interactive tutorials, and curated playlists from over 250
publishers, including O’Reilly Media, Harvard Business Review, Prentice
Hall Professional, Addison-Wesley Professional, Microsoft Press, Sams,
Que, Peachpit Press, Adobe, Focal Press, Cisco Press, John Wiley & Sons,
Syngress, Morgan Kaufmann, IBM Redbooks, Packt, Adobe Press, FT Press,
Apress, Manning, New Riders, McGraw-Hill, Jones & Bartlett, and Course
Technology, among others.

For more information, please visit http://oreilly.com/safari.

# How to Contact Us

Please address comments and questions concerning this book to the
publisher:

O’Reilly Media, Inc.

1005 Gravenstein Highway North

Sebastopol, CA 95472

800-998-9938 (in the United States or Canada)

707-829-0515 (international or local)

707-829-0104 (fax)

We have a web page for this book, where we list errata, examples, and
any additional information. You can access this page at
<http://bit.ly/building-tools-with-github>.

To comment or ask technical questions about this book, send email to
bookquestions@oreilly.com.

For more information about our books, courses, conferences, and news,
see our website at <http://www.oreilly.com>.

Find us on Facebook: <http://facebook.com/oreilly>

Follow us on Twitter: <http://twitter.com/oreillymedia>

Watch us on YouTube: <http://www.youtube.com/oreillymedia>

# Acknowledgments

Chris wants to thank his lovely wife, Nicole. I hope that I have added
to this book even a tiny bit of the wit and wisdom you provide to me and
our family every day. My son Roosevelt’s energy continues to inspire me
and keep me going even when I am at my limits. To my daughter Charlotte,
you are my little smiling Buddha. To my mother, who showed me how to
write and, most importantly, why to write, which is something we need
more of in the technology world. To Tim O’Brien who invited me into this
project, thank you, and I hope we can collaborate again. To Bradley
Horowitz, who demonstrates how small acts of kindness can have
immeasurable impact. And, to David J. Groom, though we have never met
face to face, your suggestions and excitement about the book early on
came at a critical moment in the life of this book, and I thank you for
channeling the excitement I hoped to cultivate with people who would one
day pick up this book.JavaScriptcoffee shop database appsee=coffee shop
database app coffee shop database appsee=coffee shop database app
see=coffee shop database appRubylibrariessee=Nancy librariessee=Nancy
see=NancyRubylibrariessee=Octokit librariessee=Octokit
see=OctokitRubylibrariessee=Rugged librariessee=Rugged
see=RuggedRubylibrariessee=Sinatra librariessee=Sinatra see=Sinatra

Ben would like to thank his wife, Becky, for her ongoing support and
(when needed) push from behind. None of this would have happened without
you.chat robotsee=Hubot see=HubotEnterprisesee=GitHub Enterprise
see=GitHub Enterprisewikissee=under Gollum see=under Gollum

Unresolved directive in book.asciidoc -
include::chapter-00-introduction.asciidoc\[\]

Unresolved directive in book.asciidoc -
include::chapter-01-tools.asciidoc\[\]

# Gists and the Gist API

gistsid=ix\_chapter-02-gist-asciidoc0range=startofrange
id=ix\_chapter-02-gist-asciidoc0range=startofrange
range=startofrangeGitHub revolutionized software development by
responding to a deep desire to share information. But calling it just
"sharing" does a disservice to the tools GitHub provides: these tools
remove barriers to communication and streamline workflows. These tools
also arose at exactly the moment when the information technology
revolution forced companies to adopt more open technologies that
assisted an emerging remote workforce.

Gists service part of this need: they permit intimate code sharing and
reuse, refactoring, and experimentation in a way not served by the
heavyweight tools predating it. In this chapter we will explore using
gists to share code, and then build an application hosted as a gist that
uses the Gist API.

# Easy Code Sharing

gistscreating creatingGists are straightforward to create. You copy a
snippet of code into the large text box in the center, optionally enter
in a description or filename, and then choose between a public or
private gist. Once your gist has been created you are presented with a
URL to share. Gists autodetect the language in most cases and syntax
highlight according to the language when displayed as in
[figure\_title](#documenting_json_using_a_gist).

![Documenting JSON using a gist](images/btwg_02in01.png)

There are other services that do this: pastebin was the first, and there
are many others that offer variances on code sharing. But gists by
GitHub are not simply a pasting service. Gists are first-class
repositories, forkable, editable, and expansive. We’ll go over the
basics of what gists are, and how to create them, and then show how they
allow you to share code that is also a live application.

# Gists Are Repositories

gistsas repositories as repositoriesrepositoriesgists as gists asEvery
gist created is a tiny repository. You can update gists and see the
history usinggit log `git log`. You can download gists, hack on the
repository, andgit push `git push` them back into the repository on
*gist.github.com* (which will republish them onto the publicly facing
web page). And, you can "fork" gists, just like any other repository.

You are allowed to branch within gist repositories; however, branches
are not displayed inside of *gist.github.com/*. But if you need the
benefits of branching when using gists you can branch normally inside a
repository and the branch information is retained on the upstream
repository after you push it up.

You can have an unlimited number of public and secret gistssecret gists.
Secret gists can, in many cases, replace private repositories, and these
secret gists don’t count against the limited amount of private
repositories you have with paid GitHub accounts. Or, you can make
apublic gists gist public, and share that URL to mailing lists or
anywhere you need public feedback.

> **Note**
> 
> As there are two types of gists (public and secret), it is important
> to understand the differences between them. Public gists are
> searchable. Secret gists are not searchable, but they are accessible
> to anyone who knows the URL. Don’t post any code to a gist you need to
> keep secret as once you put it there, it is only as safe as the URL is
> secret.

Most people share gists through the URL, but you can embed gists inside
of other contexts (like blogs) and get a simple and pretty snippet of
code.

## Embedding Gists Inside HTML

gistsin HTML in HTMLHTMLgists in gists inTo embed inside of an HTML page
look for the "Embed this gist" box to the left of a gist. Copy the code
listed there (which will look something like `<script
src="https://gist.github.com/xrd/8923697.js"></script>`) and paste it
into your HTML.

If you wish to include only a particular file from the gist (if it
contains multiple files), then add `?file=hi.rb` to the end of the URL
specified in the src attribute.

## Embedding Inside Jekyll Blogs

gistsin Jekyll blogs in Jekyll blogsJekyll blogsgists in gists inJekyll
blogs (explained in [section\_title](#Jekyll)) can easily host gists
using a special syntax. The shortcut `{% gist 8138797 %}` will embed a
private gist, which would be found at
*<http://gist.github.com/8138797>*. If you want to use a specific file
within the gist, add a filename to the gist code like `{% gist 8138797
hi.rb %}`. Secret gists can also be embedded. If you use a secret gist,
prefix the username of the account holder in the gist like so: `{% gist
xrd/8138797 hi.rb %}`.

Now let’s look at creating gists from outside the GitHub.com site, using
the command-line.

# Gist from the Command Line

command linegists from gists fromgistsfrom command line from command
line`gem install gist` gem install gist commandwill install a command
line tool that helps create gists. You can use it simply by typing the
command, and then entering the data you want to post as a gist:

``` bash
$ gist
(type a gist. <ctrl-c> to cancel, <ctrl-d> when done)
{ "foo" : "bar" }
https://gist.github.com/9106765
```

The gist command will return the link to the gist just created. Gists
are created anonymously by default. You can log in using the `--login`
switch. Once you do this, your gists will be linked to your account:

``` bash
$ gist --login
Obtaining OAuth2 access_token from github.
GitHub username: xrd
GitHub password:
2-factor auth code: 787878

Success! https://github.com/settings/applications
```

You can pipe text to the gist command to use the contents of that file:

``` bash
$ echo '{ "foo" : "bar" }' | gist
https://gist.github.com/9106799
```

You can also `cat` a file to gist:

``` bash
$ cat MyJavaFile.java | gist
https://gist.github.com/9345609
```

Gists are often used to show interesting or troublesome code, and there
are times when you don’t want to display the entirety of a file. In this
case the command-linegrep tool `grep` tool can be useful; `grep`
searches for a specific piece of code and with the right switches can
include several lines of context around that code inside a gist. This
command looks for the function `myFunction` inside the *MyJavaFile.java*
file and then prints the next 20 lines of context and stores it as a
gist:

``` bash
$ grep -A 20 myFunction MyJavaFile.java | gist
https://gist.github.com/9453069
```

Adding –o switchthe `-o` switch automatically opens the gist inside your
default web browser. You can also copy the gist URL to the clipboard
using –c switchthe `-c` switch. Or, you can copy the contents of your
clipboard into a gist using–P switch the `-P` switch.

There are many other fun features of the gist command. To learn more run
the gist command with––help switch the `--help` switch.

As gists are themselves repositories, you can use them for dual
purposes: for hosting code samples, and for code samples that are
themselves fully working and packaged applications inside a gist
repository.

# Gists as Fully Functioning Apps

gistsas fully functioning apps as fully functioning appsLet’s build a
simple Sinatra application to showcase how code hosted as a gist can
also be a living application. SinatraSinatra is a Ruby library for
creating dead-simple web servers. A Sinatra program can be as simple as
this:

``` ruby
require 'sinatra'

get '/hi' do
  "Hello World!"
end
```

Create a gist for this by visiting gist.github.com. Enter in the text
exactly as shown and then choose public gist.

You now have a share-friendly gist of code anyone can use to review.
More importantly, this is a repository with executable code. To clone
it, look for the Clone URL to the right of the gist itself. You will
likely see a Git protocol URL and an HTTPS URL. If you are cloning the
URL and intend only to read the gist, you can use the HTTPS URL. You
technically can push changes once you have cloned a repository using the
HTTPS URL but not if you have two-factor authentication enabled. In most
cases it is easier and more flexible to use the Git protocol URL.

Let’s clone it now:

``` bash
$ git clone git@gist.github.com:8138797.git
```

Once you have cloned the repository, go inside it. You’ll see a list of
files, a list that right now includes only one file:

``` bash
$ cd 8138797
$ ls
hi.rb
```

This code is exectuable: to run it enter `ruby hi.rb`.

If you have not used Sinatra with Ruby before, this will cause an error.
This program requires a library called "sinatra" and you have not yet
installed it. We could write a read me file, or add documentation into
this file itself. Another way to guarantee the user has the proper files
installed is toGemfile use a *Gemfile*, which is a file that tells which
libraries are installed and from where. That sounds like the best way:

``` bash
$ printf "source 'https://rubygems.org'\ngem 'sinatra'" > Gemfile
```

The `bundle` command (from the bundler gem) will install Sinatra and the
associated dependencies:

``` bash
$ bundle
Using rack (1.5.2)
Using rack-protection (1.5.1)
Using tilt (1.4.1)
Using sinatra (1.4.4)
Using bundler (1.3.5)
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

Why did we do things this way? Because now we can add the Gemfile to our
repository locally, and then publish into our gist for sharing on the
Web. Our repository now not only has the code, but a well-known manifest
file that explains the necessary components when running the code.

# Gists that Render Gists

gistsfor rendering other gistsid=ix\_chapter-02-gist-asciidoc1
id=ix\_chapter-02-gist-asciidoc1range=startofrange
range=startofrangeLet’s add to our application and use
theOctokitOctokit Ruby Octokit Ruby gem to pull all public gists for any
user we specify. The Octokit library is the the official Ruby library
for accessing the GitHub API. Why would we want to make a gist that
displays other gists? Self-referential meta code is all the rage, the
modern-day response to René Magritte’s famous work: "Ceci n’est pas une
pipe."\[1\]

Add a view *index.erb* at the root of our directory:

``` ruby
<html>
<body>

User has <%= count %> public gists

</body>
</html>
```

Add the Octokit gem to our Gemfile:

``` ruby
gem "octokit"
```

Run `bundle` to install Octokit. Then, modify our *hi.rb* app to look
like this:

``` ruby
require 'sinatra'
require 'octokit'

set :views, "."

get '/:username' do |username|
  user = Octokit.user username
  count = user.public_gists
  erb :index, locals: { :count => count }
end
```

Our filesystem should look like this, with three files:

``` bash
$ ls -1
Gemfile
hi.rb
index.erb
```

Restart Sinatra by running Ctrl-C and then `ruby hi.rb`. If you visit
*<http://localhost:4567/xrd>* in your browser, you will see the count of
public gists for user `xrd`
([figure\_title](#displaying_the_gist_count)); modify the username in
the URL to specify any GitHub username and you will see their last five
gists displayed.

![Displaying the gist count](images/btwg_02in02.png)

## Going Deeper into the Gist API

gistsand hypermedia and hypermediaHypermedia APIgist and gist andThe
GitHub API uses hypermedia instead of basic resource-driven APIs. If you
use a client like Octokit, the hypermedia details are hidden behind an
elegant Ruby client. But there is a benefit to understanding how
hypermedia works when you need to retrieve deeper information from the
GitHub API.

gistsand RESTful APIs and RESTful APIsRESTful APIsMost RESTful APIs come
withsitemaps a "sitemap," generally an API reference document that tells
a user which endpoints to use. You view the resources available from
that API and then apply some HTTP verb to do something to them.
Hypermedia thinks of an API differently. Hypermedia APIs describe
themselves inside their responses affordancesusing "affordances." What
this means is that the API might respond like this:

``` json
{
    "_links": {
        "self": {
            "href": "http://shop.oreilly.com/product/0636920030300.do"
        }
    }
    "id": "xrd",
    "name": "Chris Dawson"
}
```

In this payload, you can see that there is an id ("xrd") and a name
("Chris Dawson"). This particular payload was forked from the HAL
explanation at the [HAL Primer document](http://bit.ly/1SGLDw3), and you
can find a more detailed explanation of these concepts there.

The important thing to note about hypermedia APIs is that payloads
contain metadata about data itself and metadata about the possible
options of operating on the data. RESTful APIs typically provide a
mapping outside of the payload. You have to join the API sitemap with
the data in an ad hoc way when using RESTful APIs; with hypermedia APIs
your client can react to the payload itself correctly and intelligently
without knowing anything about a sitemap stored in human-readable
documentation.

This loose coupling makes APIs and their clients flexible. In theory, a
hypermedia API works intuitively with a hypermedia-aware client. If you
change the API, the client, as it understands hypermedia, can react and
still work as expected. Using a RESTful API means that clients must be
updated (a newer version of the client must be installed) or the client
code must be upgraded. Hypermedia APIs can alter their backend, and then
the client, as long as it is hypermedia-aware, can automatically and
dynamically determine the right way to access information from the
response itself. In other words, with a hypermedia client the API
backend can change and your client code should not need to.

This is explained in great detail in the book Building Hypermedia APIs
with HTML5 and Node (O'Reilly).

## Using Hypermedia Data from Octokit

gistsusing hypermedia data from Octokit using hypermedia data from
Octokithypermedia data, OctokitOctokitusing hypermedia data from using
hypermedia data fromNow that you know a little about hypermedia, let’s
navigate it using Octokit:

  - Start at a resource, with code like `user = Octokit.user "xrd"`.
    This begins the initialization of the client.

  - `user` now is an object filled with the actual data of the resource.
    In this case, you could call a method like `user.followers` to see a
    meager follower count.

  - `user` also has hypermedia references. You can see these by calling
    `user.rels`. This retrieves the relationships described in the
    hypermedia links.

  - Relationships (found by calling `user.rels`) include avatar, self,
    followers, etc.

  - Use a relationship by calling the `get.data` method to retrieve and
    access the data from the GitHub API (`followers =
    user.rels[:followers].get.data`).

  - Calling `.get.data` populates an array of the followers (paged if it
    exceeds 100 items).

Let’s extend our Sinatra app to retrieve actual data about the user’s
gists by using hypermedia references:

``` ruby
require 'sinatra'
require 'octokit'

set :views, "."

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

get '/:username' do |username|
  gists = Octokit.gists username, :per_page => 5
  erb :index, locals: { :gists => gists, username: username }
end
```

The *index.erb* file contains code to iterate over each gist and pull
the content. You can see that our response object is an array of gists,
and each has an attribute called `fields`. This `fields` attribute
specifies the filenames available in each gist. If you reference that
filename against the files, the response includes a hypermedia `ref`
attribute. Retrieve the `raw` content using the Octokit method
`.get.data`:

``` html
<html>
<body>

<h2>User <%= username %>'s last five gists</h2>

<% gists.each do |g| %>
<% g[:files].fields.each do |f| %>
<b><%= f %></b>:

<%= h g[:files][f.to_sym].rels[:raw].get.data %>

<br/>
<br/>

<% end %>
<% end %>

</body>
</html>
```

Now we see the gists and the contents, as in
[figure\_title](#last_five_gists_with_details).range=endofrangestartref=ix\_chapter-02-gist-asciidoc1
startref=ix\_chapter-02-gist-asciidoc1

![Last five gists, with details](images/btwg_02in03.png)

# Summary

In this chapter we looked at gists and learned how they can be used to
share code snippets. We built a simple application and stored it as a
gist. This application retrieves data from the GitHub API using our
first higher-level language client library (the Octokit library for
Ruby). We also went deeper into how hypermedia works and how a client
library implements using hypermedia
metadata.range=endofrangestartref=ix\_chapter-02-gist-asciidoc0
startref=ix\_chapter-02-gist-asciidoc0

In the next chapter we will look at Gollum, the GitHub wiki. This
chapter provides an introduction to the Rugged Ruby library for
accessing Git repositories and the Ruby library for accessing GitHub.

# GitHub Wikis with Gollum

GitHub wikisid=ix\_chapter-03-gollum-asciidoc0range=startofrange
id=ix\_chapter-03-gollum-asciidoc0range=startofrange
range=startofrangeGollumGitHub wikis
withid=ix\_chapter-03-gollum-asciidoc1
id=ix\_chapter-03-gollum-asciidoc1range=startofrange
range=startofrangeWikis have revolutionized the way we create and digest
information. It turns out that they are a great complement to technical
projects (code repositories) because they allow nontechnical users to
contribute in ways other than adding code. Gollum is an open source wiki
created by GitHub. Just as Git has revolutionized collaborative editing
of code, Gollum wikis layer the benefits of Git onto the widely used
wiki publishing workflow. Gollum wikis are themselves repositories that
generally annotate other typically code-centric repositories. GitHub
makes it easy to associate a wiki with any repository.

In this chapter we’ll explore the basics of using Gollum, creating a
wiki on GitHub and then learning how to edit it on GitHub and as a
repository on our local machine. We will then create a Gollum wiki by
hand from the command line, and show the bare minimum set of files to
call something a Gollum repository. Finally, we will build a simple
image organization tool that allows us to edit a Gollum wiki in an
entirely different way, but still publishes information into GitHub as a
regular Gollum wiki, exploring a little bit of the internals of Git
along the way.

> **Note**
> 
> This chapter demonstrates code that modifies a Git repository
> programmatically. You will be able to follow along without possessing
> a deep understanding of the internals of Git. And, a good supplement
> to this chapter (and later chapters as well) is the Version Control
> with Git book from O’Reilly.

# "The Story of Smeagol…​"

Gollumbasicsid=ix\_chapter-03-gollum-asciidoc2
id=ix\_chapter-03-gollum-asciidoc2range=startofrange
range=startofrangeAt its most basic form, a Gollum wiki is a Git
repository with a single file, *Home.ext* (*ext* would be any of the
supported wiki markup formats, which we will talk about later).

## Repository Linked Wikis

Gollumand repository–linked wikis and repository–linked
wikisrepositoriesand associated Gollum wikis and associated Gollum
wikisAny repository on GitHub, public or private, can have an associated
Gollum wiki. To create a wiki linked to your repository, visit the
repository page and then look in the rightmost colum. You’ll see an icon
that looks like a book, next to which will be the word "Wiki," as in
[figure\_title](#integrated_gollum_wiki_in_the_sidebar).

![Accessing the associated wiki from the
sidebar](images/btwg_03in01.png)

Clicking this link will bring you to a page where you are asked to
create a wiki for the first time. GitHub will ask you to create the
"Home" page, which is the starting point in a Gollum wiki
([figure\_title](#starting_a_gollum_wiki)). GitHub will automatically
create a page template with the project name; you can customize this
information to suit your own needs. Clicking "Save Page" will save your
first page and create the wiki for you.

![Genesis of a new wiki, creating the home page](images/btwg_03in02.png)

Your wiki is now as public as your repository is public. Public
repositories have public wikis, accessible to anyone. Private
repositories have private wikis, accessible only to those users or
organizations that have rights to edit the repository data.

Let’s review the markup options for Gollum wikis now.

## Markup and Structure

Gollummarkup optionsid=ix\_chapter-03-gollum-asciidoc3
id=ix\_chapter-03-gollum-asciidoc3range=startofrange
range=startofrangeGollum files can be written in any of the supported
GitHub Markup formats"Github Markup" formats, which include ASCIIdoc,
Creole, Markdown, Org Mode, Pod, RDoc, ReStructuredText, Textile, and
MediaWiki. The variety of markup languages brings flexibility but it can
be difficult to know which one to use. MarkdownMarkdown (and its variant
cousins) is the most popular markup language on GitHub, and is well
liked on other popular sites like Stack Overflow. If you are unsure
about which language to use, Markdown is a safe bet because it is
ubiquitous across GitHub. [section\_title](#Jekyll) has a much deeper
overview of Markdown.

If you do choose Markdown, in addition to the standard vanilla Markdown
language tags, Gollum adds its own set of wiki-specific tags. There are
often subtle (or conflicting) differences from other wiki markup so it
is worth reviewing the [Gollum repository documentation
page](https://github.com/gollum/gollum/wiki). We’ll go over the most
important ones here.

### Links

Gollumlink tag link tagHTMLlinksGollum tag Gollum tagMarkdownlink tag
link tagLinks obviously convert into the `<a>` HTML tag. Each format has
its own linking format: in Markdown you use `[text](URL)`. Gollum adds
its own link tag: `  `.

In addition:

  - You can add a link title using the bar character:
    `[[http://foobar.com|A link to foobar]]`.

  - Links can be either external or internal links.

  - A link like `[[Review Images]]` will be converted to a relative link
    to the page *review-images.ext* (where *.ext* is the preferred
    extension you are using with your wiki, most likely Markdown).

Wikis are generally a collection of pages linked together in myriad
ways, and this assumption about the structure of links makes writing
pages easier.

> **Warning**
> 
> As we mentioned, there are differences between Gollum wiki tags and
> other wikis, despite their having similar syntax. One such example is
> MediaWiki, where links with titles use the opposite ordering `[[A link
> to
> foobar|http://foobar.com]]`, so caveat emptor.

### Code snippets

code snippetsGollumcode snippets in wikis code snippets in wikisGollum
(the wiki) was invented at GitHub, a company dedicated to improving the
lives of software developers, so it stands to reason Gollum wikis would
support insertion of code snippets. To include a snippet of code, use
three backticks, followed by an optional language name, and close the
block of code using three more backticks. If you use the language name,
Gollum will do proper syntax highlighting for most languages:

```` ruby
```ruby
def hello
  puts "hello"
end
```
````

Gollum [at one point](http://bit.ly/1JMzd4m) supported inclusion of
files from any GitHub repository (and any branch\!) using a syntax like
this:

```` ruby
```ruby:github:xrd/TeddyHyde/blob/master/Gemfile```
````

Unfortunately, this no longer works. According to current documentation
for Gollum, this tag allows inclusion of files from the parent
repository:

```` ruby
```ruby:/lib/gollum/app.rb```
````

But I found this to be broken as well. At the time of writing, it
tragically appears that there is no way to insert code from the parent
repository (or any other repository) into your wiki content.

### Structural components

footers, in Gollum wikisGollumadding structural components adding
structural componentsheadersin Gollum wikis in Gollum wikissidebars, in
Gollum wikisGollum includes capabilities to add sidebars, headers, and
footers. If you include a file called \_Sidebar.ext inside your
repository, you’ll see it as a sidebar for every file rendered. Sidebars
are automatically added to any file and any file from subdirectories
that do not have their own sidebar files. If you wanted to add sidebars
specific to a subdirectory, add another sidebar file in the subdirectory
and this file will override the top-level sidebar file.

### No styling or JavaScript

CSSGollum limitations with Gollum limitations withGollumstyling
limitations styling limitationsJavaScriptGollum limitations with Gollum
limitations withFor security reasons, Gollum strips out all CSS and
JavaScript from raw markup files. You can include your own JavaScript or
CSS file when running Gollum from the command line (discussed
momentarily) using the `--custom-css` or `--custom-js` switches, but
there is no way to include these files on a wiki when your Gollum wiki
is hosted on GitHub.

### Inserting images

Golluminserting images inserting imagesimagesGollum tag format for
Gollum tag format forImages are inserted into your document using the
same tag format &\#x5b;&\#x5b;ceo.png&\#x5d;&\#x5d;: this adds the
correct HTML tags to include an image named *ceo.png* inside your page.
This basic syntax is often extended for additional funtionality. For
example, to add a frame and an alt tag, you could use syntax like
`[[ceo.png|frame|alt=Our CEO
relaxing on the beach]]`. This creates the proper HTML tags for the same
image, and also adds a frame and alt text (helpful for better context
and the extra information is used by screenreaders for visually impaired
users as well). Review the documentation on the Gollum repository for
more details about the breadth of the image options.

You can also add images using the editor on GitHub. But you’ll notice
that either way you are adding a link to an image and that there is no
way to upload images into GitHub from the editor
([figure\_title](#no_image_upload_only_image_urls)).

![No image upload, only image URLs](images/btwg_03in03.png)

For nontechnical users, this makes Gollum wikis on GitHub almost
unusable if they need to add images. Let’s address this problem by
building our own customized image-centric Gollum editor that still
interoperates with regular Gollum wikis. We can put this editor in front
of nontechnical users, allowing them to add images, and then publish the
wiki into GitHub as
isrange=endofrangestartref=ix\_chapter-03-gollum-asciidoc3
startref=ix\_chapter-03-gollum-asciidoc3.range=endofrangestartref=ix\_chapter-03-gollum-asciidoc2
startref=ix\_chapter-03-gollum-asciidoc2

# Hacking Gollum

imagesGollum–based editor forid=ix\_chapter-03-gollum-asciidoc4
id=ix\_chapter-03-gollum-asciidoc4range=startofrange
range=startofrangeWould Gollumas hackable wiki as hackable wikian image
editor based on Gollum be of general use? On many software teams there
is tension between the design team and the software team stemming from
the fact that designers generally don’t like using source-code tools to
manage images. This causes issues when software developers rely on
designs that are rapidly changing: coders quickly get out of sync with
the latest designs. As a wiki, Gollum is the perfect tool to bridge this
gap between designers and coders: wikis are easy to read and modify by
nontechnical users. Since Gollum is a hackable wiki, we can build our
own workflow tool that allows designers to manage images and coders to
easily see those changes in a source-code repository.

This will be a dual-purpose repository. We can use the repository with
Gollum as a standard wiki, and we can use it with our application to
enter data in a more powerful way than Gollum permits from its default
interface. The data will still be compatible with Gollum and will be
hosted on GitHub.

Rubygem installation gem installationTo begin, install the Gollum Ruby
gem and then initialize our repository:

``` bash
$ gem install gollum
$ mkdir images
$ cd images
$ git init .
$ printf "### Our home" > Home.md
$ git add Home.md
$ git commit -m "Initial commit"
```

We’ve just created a wiki compatible with Gollum. Let’s see what it
looks like inside Gollum. Run the `gollum` command then open
*<http://localhost:4567/>* in your browser, as shown in
[figure\_title](#gollum_running_locally).

![Viewing the wiki home page running on our
laptop](images/btwg_03in04.png)

As you can see, this tiny set of commands was enough to create the
basics of the Gollum wiki structure.

> **Warning**
> 
> command lineediting Gollum from editing Gollum fromIf you edit a
> Gollum wiki from the command line, be aware that Gollum only looks
> inside the repository data for files. If you have added something to
> the working directory or have not yet commited files in your index,
> they will not be visible to Gollum.

Now let’s begin creating the web app that will help us store images
inside a Gollum wiki.

# The Starting Point of a Gollum Editor

Gollumimage editor construction image editor constructionNow we will
create our custom editor. Sinatrafor Gollum image editor construction
for Gollum image editor constructionWe’ll use Sinatra, a Ruby library
that provides a simple DSL (domain-specific language) for building web
applications. First, create a file called *image.rb* and put the
following contents inside it:

``` ruby
require 'sinatra'
require 'gollum-lib'
wiki = Gollum::Wiki.new(".")
get '/pages' do
  "All pages: \n" + wiki.pages.collect { |p| p.path }.join( "\n" )
end
```

Then, create the Gemfile, install the dependencies, and run the web
application:

``` bash
$ echo "source 'https://rubygems.org'
gem 'sinatra', '1.4.5'
gem 'gollum-lib', '4.1.0'" >> Gemfile
$ bundle install
Fetching gem metadata from https://rubygems.org/..........
Resolving dependencies...
Installing charlock_holmes (0.7.3)
Using diff-lcs (1.2.5)
Installing github-markup (1.3.3)
Using mime-types (1.25.1)
...
$ bundle exec ruby image.rb
$ open http://localhost:4567/pages
```

We specify at least the minimum 4.1.0 for `gollum-lib` as the interface
and list of supporting libraries has changed. We then run within the
bundler context (using gems installed from this Gemfile rather than
system gems) using the `bundle exec ruby image.rb` command.

You’ll see a report of the files that exist in our Gollum wiki right
now. We’ve only added one file, the *Home.md* file.

# Programmatically Handling Images

Gollumprogrammatically handling imagesid=ix\_chapter-03-gollum-asciidoc5
id=ix\_chapter-03-gollum-asciidoc5range=startofrange
range=startofrangeimageshandling
programmaticallyid=ix\_chapter-03-gollum-asciidoc6
id=ix\_chapter-03-gollum-asciidoc6range=startofrange
range=startofrangeLet’s add to our server. We want to supportuploading
ZIP files uploading ZIP files into our system that we will then unpack
and add to our repository, as well as add a list of these files to our
wiki. Modify our *image.rb* script to look like this:

``` ruby
require 'sinatra'
require 'gollum-lib'
require 'tempfile'
require 'zip'
require 'rugged'

def index( message=nil )
  response = File.read(File.join('.', 'index.html'))
  response.gsub!( "<!-- message -->\n",
  "<h2>Received and unpacked #{message}</h2>" ) if message
  response
end

wiki = Gollum::Wiki.new(".")
get '/' do
  index()
end

post '/unpack' do
  @repo = Rugged::Repository.new('.')
  @index = Rugged::Index.new

  zip = params[:zip][:tempfile]
  Zip::Zip.open( zip ) { |zipfile|
    zipfile.each do |f|
      contents = zipfile.read( f.name )
      filename = f.name.split( File::SEPARATOR ).pop
      if contents and filename and filename =~ /(png|jp?g|gif)$/i
        puts "Writing out: #{filename}"
      end
    end
  }
  index( params[:zip][:filename] )
end
```

We’ll need an *index.html* file as well, so add that:

``` ruby
<html>
<body>
<!-- message -->
<form method='POST' enctype='multipart/form-data' action='/unpack'>
Choose a zip file:
<input type='file' name='zip'/>
<input type='submit' name='submit'>
</form>
</body>
</html>
```

This server script receives a POST request at the `/unpack` mount point
and retrieves a ZIP file from the parameters passed into the script. It
then opens the ZIP file (stored as a temp file on the server side),
iterates over each file in the ZIP, strips the full path from the
filename, and then prints out that filename (if it looks like an image)
to our console. Regardless of whether we are accessing the root of our
server, or have just posted to the `/unpack` mount point, we always need
to render our index page. When we do render it after unzipping, we
replace a comment stored in the index file with a status message
indicating the script received the correct file we posted.

RubyZipRugged libraryWe need to add the new Ruby libraries (RubyZip and
Rugged) to our Gemfile: update the required gems using the following
commands, and then rerun our Sinatra server script:

``` bash
$ echo "gem 'rubyzip', '1.1.7'
gem 'rugged', '0.23.2'" >> Gemfile
$ bundle install
$ bundle exec ruby image.rb
```

> **Warning**
> 
> Rugged requires the libgit2 libraries (the pure C libraries for
> accessing Git repositories). Rugged gives you access to modification
> of Git repositories in the elegance of the Ruby language but with the
> speed of C. However, as this library is based on libgit2, and libgit2
> requires a C compiler, you will need to install this toolset first to
> install Rugged. On OS X this can look like `brew install cmake` or
> `apt-get install cmake` for Linux.

Then, we can open *<http://localhost:4567/>* and test uploading a ZIP
file full of images. You’ll see output similar to this in your console
after uploading a ZIP file:

``` bash
...
[2014-05-07 10:08:49] INFO  WEBrick 1.3.1
[2014-05-07 10:08:49] INFO  ruby 2.0.0 (2013-05-14)
[x86_64-darwin13.0.0]
== Sinatra/1.4.5 has taken the stage on 4567 for development with
backup from WEBrick
[2014-05-07 10:08:49] INFO  WEBrick::HTTPServer#start: pid=46370
port=4567
Writing out: IMG1234.png
Writing out: IMG5678.png
Writing out: IMG5678.png
...
```

We are not doing anything beyond printing out the names of the images in
the ZIP. We’ll actually insert them into our Git repository in the next
section.range=endofrangestartref=ix\_chapter-03-gollum-asciidoc6
startref=ix\_chapter-03-gollum-asciidoc6range=endofrangestartref=ix\_chapter-03-gollum-asciidoc5
startref=ix\_chapter-03-gollum-asciidoc5

# Using the Rugged Library

GollumRugged library for adding files to
wikiid=ix\_chapter-03-gollum-asciidoc7
id=ix\_chapter-03-gollum-asciidoc7range=startofrange
range=startofrangeRugged
libraryid=ix\_chapter-03-gollum-asciidoc8range=startofrange
id=ix\_chapter-03-gollum-asciidoc8range=startofrange
range=startofrangeOur end goal for this script is to add files to our
Gollum wiki, which means adding files to the repository that backs our
Gollum wiki. The Rugged library handles the grunt work of this type of
task easily. GritRugged as successor to Rugged as successor toRugged is
the successor to the original Ruby library for Git (called Grit).
Gollum, at the time of writing, uses the Grit libraries, which also
provide a binding to the libgit2 library, a "portable, pure C
implementation of the Git core methods." Grit has been abandoned (though
there are unofficial maintainers) and the Gollum team intends to use
Rugged as the long-term library backing Gollum. Rugged is written in
Ruby and (provided you like Ruby) is a more elegant way to interface
with a Git repository than raw Git commands. As you might expect, Rugged
is maintained by several employees of GitHub.

To change our script to modify our Git repository, let’s change our
script to no longer print the filename (using the `puts` method inside
the ZIP decode block) and instead call a new method called
`write_file_to_repo`. And, at the end of the ZIP block, add a method
build\_commit() methodcalled `build_commit`, which builds the commit
from our new files. Our new file (omitting the unchanged code at the
head of the file) looks like this:

``` ruby
post '/unpack' do
  @repo = Rugged::Repository.new('.')
  @index = Rugged::Index.new

  zip = params[:zip][:tempfile]
  Zip::Zip.open( zip ) { |zipfile|
    zipfile.each do |f|
      contents = zipfile.read( f.name )
      filename = f.name.split( File::SEPARATOR ).pop
      if contents and filename and filename =~ /(png|jp?g|gif)$/i
        write_file_to_repo contents, filename # Write the file
      end
    end
    build_commit() # Build a commit from the new files
  }
  index( params[:zip][:filename] )
end

def get_credentials
  contents = File.read File.join( ENV['HOME'], ".gitconfig" )
  @email = $1 if contents =~ /email = (.+)$/
  @name = $1 if contents =~ /name = (.+)$/
end

def build_commit
  get_credentials()
  options = {}
  options[:tree] = @index.write_tree(@repo)
  options[:author] = { :email => @email, :name => @name, :time => Time.now }
  options[:committer] = { :email => @email, :name => @name, :time => Time.now }
  options[:message] ||= "Adding new images"
  options[:parents] = @repo.empty? ? [] : [ @repo.head.target ].compact
  options[:update_ref] = 'HEAD'

  Rugged::Commit.create(@repo, options)

end

def write_file_to_repo( contents, filename )
  oid = @repo.write( contents, :blob )
  @index.add(:path => filename, :oid => oid, :mode => 0100644)
end
```

As you can see from the code, Rugged handles a lot of the grunt work
required when creating a commit inside a Git repository. Rugged has a
simple interface to creating a blob inside your Git repository
(`write`), and adding files to the index (the `add` method), and also
has a simple and clean interface to build the tree object (`write_tree`)
and then build the commit (`Rugged::Commit.create`).

To ease the burden of hardcoding our commit credentials, we implement a
method calledget\_credentials method `get_credentials` that loads up
your credentials from a file called *.gitconfig* located in your home
directory. You probably have this if you have used Git for anything at
all on your machine, but if this file is missing, this method will fail.
On my machine this file looks like the following code snippet. The
`get_credentials` method simply loads up this file and parses it for the
name and email address. If you wanted to load the credentials using
another method, or even hardcode them, you can just modify this method
to suit your needs. The instance variables `@email` and `@name` are then
used in the `build_commit()` method:

``` ini
[user]
        name = Chris Dawson
        email = xrdawson@gmail.com
[credential]
        helper = cache --timeout=3600
...
```

Let’s verify that things are working correctly after uploading a ZIP
file. Jumping into a terminal window after uploading a new file, imagine
running these commands:

``` bash
$ git status
```

To our surprise, we will see something like this:

``` bash
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  deleted:    images/3190a7759f7f668.../IMG_20120825_164703.jpg
  deleted:    images/3190a7759f7f668.../IMG_20130704_151522.jpg
  deleted:    images/3190a7759f7f668.../IMG_20130704_174217.jpg
```

We just added those files; why is Git reporting them as deleted?

To understand why this happens, remember that in Git there are three
places files can reside: the working directory, the staging area or
index, and the repository itself. Your working directory is the set of
local files you are working on. The `git status` command describes
itself as "show the working tree status." Rugged operates on the
repository itself, and the Rugged calls in the preceding code operated
on the index and then built a commit. This is important to note because
our files will not exist in our working directory if we only write them
using the Rugged calls, and if we do this, we cannot reference them
inside our wiki page when we are running Gollum locally. We’ll fix this
in the next section.

We’ve now added the files to our repository, but we have not exposed
these files inside our wiki. Let’s modify our server script to write out
each file to a wiki page for review. As we mentioned in the previous
section, we need to make sure we write the files to both the working
index and the repository (using the Rugged library `write` call). Then
we can generate a Review file that details all the images
uploaded.range=endofrangestartref=ix\_chapter-03-gollum-asciidoc8
startref=ix\_chapter-03-gollum-asciidoc8range=endofrangestartref=ix\_chapter-03-gollum-asciidoc7
startref=ix\_chapter-03-gollum-asciidoc7

# Adding Images to a Review File

Now that we have successfully unzipped and processed the images, we can
add them to a file for review. We will call this file `Review.md`. The
code to write the review file looks like this:

``` ruby
def write_review_file( files, dir )
   review_filename = "Review.md"
   contents = "## Review Images\n\n"
   files.each do |f|
      contents += "### #{f} \n[[#{dir}/#{f}]]\n\n"
   end

  File.write review_filename, contents
  oid = @repo.write( contents, :blob )
  @index.add(:path => review_filename, :oid => oid, :mode => 0100644)
end
```

The method is straightforward: we pass in the list of files and a
subdirectory where we wrote out the image files to disk. Then, we
generate a Markdown file with a header (using the two hash formatting
characters) stating "Review Images," and then iterate over the list of
images, entering the filename as a subheader. We then use the Gollum
image markup tag (two braces, then the image filename, then closing with
two more braces). We write out the file to disk. Finally, we add the
file to the repository and then to the index. The commit that we built
for the images will include this review file as well, since it is added
to the index before the images are processed—as long as we place the
call to `write_review_file` before the call to `build_commit` like so:

``` ruby
 ...
  write_review_file files, dir # write out a review file
  build_commit() # Build a commit from the new files
 ...
```

Now, let’s take a look at how images are stored inside our repository,
particularly if the same image is uploaded twice.

# Optimizing for Image Storage

Gollumoptimizing for image storageid=ix\_chapter-03-gollum-asciidoc9
id=ix\_chapter-03-gollum-asciidoc9range=startofrange
range=startofrangeimagesoptimizing repository for storage
ofid=ix\_chapter-03-gollum-asciidoc10
id=ix\_chapter-03-gollum-asciidoc10range=startofrange
range=startofrangeIf a designer uploads the same image twice, what
happens? Our code writes the uploaded image to a path on disk that is
based on the parent SHA hash of the repository (and this means we will
always write the file to a different path, even when the file is the
same as a previous uploaded file). It would look to an untrained eye
like we are adding the file multiple times. However, the nature of Git
permits us to add the same file multiple times without incurring any
additional storage cost beyond the first addition (and the minimal cost
of a tree structure). When a file is added to a Git repository, an SHA
hash is generated from the file contents. For example, generating the
SHA hash from an empty file will always return the same SHA hash:\[2\]

``` bash
$ echo -en "blob 0\0" | shasum
e69de29bb2d1d6434b8b29ae775ad8c2e48c5391
$ printf '' | git hash-object -w --stdin
e69de29bb2d1d6434b8b29ae775ad8c2e48c5391
```

Adding a ZIP file with a bunch of files where only one or two differs
from the prior ZIP file means that Git will properly reference the same
file multiple times. Unfortunately, GitHub does not provide an interface
for reviewing the statistics of wikis in the same way they do for
regular repositories. We can, however, review our repository size from
within the local repository by running the count-objects Git subcommand.
As an example, I uploaded a ZIP file with two images inside of it. I
then use the count-objects command and see this:

``` bash
$ git gc
...
$ git count-objects -v
count: 0
size: 0
in-pack: 11
packs: 1
size-pack: 2029
prune-packable: 0
garbage: 0
size-garbage: 0
```

Inspecting the first ZIP file, I see these statistics about it:

``` bash
$ unzip -l ~/Downloads/Photos\ \(4\).zip
Archive:  /Users/xrdawson/Downloads/Photos (4).zip
  Length     Date   Time    Name
 --------    ----   ----    ----
  1189130  01-01-12 00:00   IMG_20130704_151522.jpg
   889061  01-01-12 00:00   IMG_20130704_174217.jpg
 --------                   -------
  2078191                   2 files
```

Now let’s use another ZIP file with the same two files present but with
an additional image file added:

``` bash
unzip -l ~/Downloads/Photos\ \(5\).zip
Archive:  /Users/xrdawson/Downloads/Photos (5).zip
  Length     Date   Time    Name
 --------    ----   ----    ----
  1189130  01-01-12 00:00   IMG_20130704_151522.jpg
   566713  01-01-12 00:00   IMG_20120825_164703.jpg
   889061  01-01-12 00:00   IMG_20130704_174217.jpg
 --------                   -------
  2644904                   3 files
```

Then, I upload the second ZIP file. If I rerun the count-objects command
(after running `git gc`, a command that packs files efficiently and
makes our output more human readable), I see this:

``` bash
$ git gc
...
$ git count-objects -v
count: 0
size: 0
in-pack: 17
packs: 1
size-pack: 2578
prune-packable: 0
garbage: 0
size-garbage: 0
```

Notice that our packed size has only changed by about half a MB, which
is the compressed size of the additional third file, but more
importantly, there was no impact from the other two files on our
repository size, even though they were added at different paths.

If we upload the secondary file yet again, we will regenerate and commit
a new version of the *Review.md* file, but no new files will need to be
created inside our Git repository object store from the images directory
(even though their paths have changed), so our impact on the repository
will be minimal:

``` bash
$ git gc
...
$ git count-objects -v
count: 0
size: 0
in-pack: 21
packs: 1
size-pack: 2578
prune-packable: 0
garbage: 0
size-garbage: 0
```

As you can see, our packed size has barely changed, an indication that
the only changes were a new Git tree object and commit object. We still
have the files located in our repository at a variety of paths so our
review pages will work no matter what revision we are accessing:

``` bash
$ find images
images
images/7507409915d00ad33d03c78af0a4004797eec4b4
images/7507409915d00ad33d03c78af0a4004797eec4b4/IMG_20120825_164703.jpg
images/7507409915d00ad33d03c78af0a4004797eec4b4/IMG_20130704_151522.jpg
images/7507409915d00ad33d03c78af0a4004797eec4b4/IMG_20130704_174217.jpg
images/7f9505a4bafe8c8f654e22ea3fd4dab8b4075f75
images/7f9505a4bafe8c8f654e22ea3fd4dab8b4075f75/IMG_20120825_164703.jpg
images/7f9505a4bafe8c8f654e22ea3fd4dab8b4075f75/IMG_20130704_151522.jpg
images/7f9505a4bafe8c8f654e22ea3fd4dab8b4075f75/IMG_20130704_174217.jpg
images/b4be28e5b24bfa46c4942d756a3a07efd24bc234
images/b4be28e5b24bfa46c4942d756a3a07efd24bc234/IMG_20130704_151522.jpg
images/b4be28e5b24bfa46c4942d756a3a07efd24bc234/IMG_20130704_174217.jpg
```

Git and Gollum can efficiently store the same file at different paths
without overloading the
repository.range=endofrangestartref=ix\_chapter-03-gollum-asciidoc10
startref=ix\_chapter-03-gollum-asciidoc10range=endofrangestartref=ix\_chapter-03-gollum-asciidoc9
startref=ix\_chapter-03-gollum-asciidoc9

# Reviewing on GitHub

Gollumreviewing wiki on GitHubid=ix\_chapter-03-gollum-asciidoc11
id=ix\_chapter-03-gollum-asciidoc11range=startofrange
range=startofrangeThe raison d’etre for this wiki is to annotate a
development project. If you follow the instructions and create a new
wiki for a repository, you’ll then be able to push up the changes we’ve
made using our image.rb script. Once you have created a new wiki, look
for a box on the right that says "Clone this wiki locally," as seen in
[figure\_title](#gollum_git_clone_url).

![Getting the clone URL for our wiki](images/btwg_03in05.png)

Copy that link, and then enter a terminal window where we can then add a
remote URL to our local repository that allows us to synchronize our
repositories and publish our images into GitHub. Gollum wikis have a
simple URL structure based on the original clone URL: just add the word
`.wiki` to the end of the clone URL (but before the final `.git`
extension). So, if the original clone URL of the repository is
`git@github.com:xrd/webiphany.com.git` our clone URL for the associated
wiki will be `git@github.com:xrd/webiphany.com.wiki.git`. Once we have
the URL, we can add it as a remote to our local repository using the
following commands:

``` bash
$ git remote add origin git@github.com:xrd/webiphany.com.wiki.git
$ git pull # This will require us to merge the changes...
$ git push
```

When we pull, we will be asked to merge our changes since GitHub created
a *Home.md* file that did not exist in our local repository. We can just
accept the merge as is. The `git push` publishes our changes. If we then
visit the wiki, we’ll see an additional file listed under the pages
sidebar to the right. Clicking the Review page, as in
[figure\_title](#images_displayed_within_a_gollum_wiki), we can see the
images we’ve added most recently.

![An image review page](images/btwg_03in06.png)

Not sure why our designer is providing us with an image of a couch, but
I am sure he has his reasons.

Once we have published the file, we can click the Review link in the
sidebar to see the most current version of the Review page. We also can
review the revisions of this file by clicking the "3 Commits" (or
whatever number of commits have occurred with this file) link right
underneath the page title. Jumping onto that page shows us the full
history of this file, as shown in
[figure\_title](#a_view_on_the_revisions_from_within_github).

![Wiki history review via the Commit Log](images/btwg_03in07.png)

Clicking any of the SHA hashes will display the page at that revision in
our history and show us the state of the document at any given moment in
history. Unfortunately, jumping back and forth between revisions
requires two clicks, one from the Review page to the list of revisions,
and then another click to jump into the revision we want, but this
permits us to review changes between the comps provided from our
designer.

It would be nice if GitHub provided a simple way to jump from a revision
to the parent (older) revision, but it doesn’t expose this in its site
at this point. We can fix this, however, by generating our own special
link inside the Review page itself, which will magically know how to
navigate to a previous version of the
page.range=endofrangestartref=ix\_chapter-03-gollum-asciidoc11
startref=ix\_chapter-03-gollum-asciidoc11

# Improving Revision Navigation

Gollumimproving revision navigation improving revision
navigationrevisions, improving navigation ofIn our example, we only have
three revisions right now, and all share the same commit message
("Adding new images"). This is not very descriptive and makes it
challenging to understand the differences between revisions, which is
critical when we are trying to understand how things have changed
between comps. We can improve this easily.

First, let’s add a commit message field to our upload form:

``` html
<html>
<body>
<!-- message -->
<form method='POST' enctype='multipart/form-data' action='/unpack'>
Choose a zip file:
<input type='file' name='zip'/>
<input type='text' name='message' placeholder='Enter commit message'/>
<input type='submit' name='submit'>
</form>
</body>
</html>
```

Then, let’s adjust the commit message inside our *image.rb* script,
which is a one-line change to the options hash, setting the value of it
to the parameter we are now passing in for commit:

``` ruby
  ...
options[:committer] = { :email => @email, :name => @name, :time => Time.now }
options[:message] = params[:message]
options[:parents] = @repo.empty? ? [] : [ @repo.head.target ].compact
  ...
```

Now, if our designer posts a new version of the UI comps, they can
specify what changes were made, and we have a record of that in our
change log, which is exposed on the revisions section of our wiki hosted
on GitHub.

# Fixing Linking Between Comp Pages

comp pages, fixing linking betweenGollumfixing linking between comp
pages fixing linking between comp pagesAs noted, there is no quick way
to jump between comps once we are inside a review revision. However, if
you recall we used the parent SHA hash to build out our image links. We
can use this to build out a navigation links inside our comp page when
we are on a revision page while viewing the history.

Again, it is a simple change: one line within thewrite\_review\_file
method `write_review_file` method. After the block that creates each
link to the image files, add a line that builds a link to the parent
document via its SHA hash using the parent SHA found in our Rugged
object under `@repo.head.target`. This link will allow us to navigate to
prior revisions in our history:

``` ruby
  ...
files.each do |f|
  contents += "### #{f} \n[[#{dir}/#{f}]]\n\n"
end
contents += "[Prior revision (only when viewing history)]" +
"(#{@repo.head.target})\n\n"

File.write review_filename, contents
oid = @repo.write( contents, :blob )
@index.add(:path => review_filename, :oid => oid, :mode => 0100644)
  ...
```

Now, when we view the Review file history, we see a link to each prior
version. Is it possible to provide a link to the next version in our
history? Unfortunately, we have no way to predict the SHA hash of the
next commit made to the repository, so we cannot build this link inside
our *Review.md* file with our Ruby script. However, we do get something
just as good for free because we can simply use the back button to jump
back to the prior page in the history stack of our browser. We might try
to get clever and use a link with JavaScript to call
window.history.back() but Gollum will foil this attempt by stripping
JavaScript from rendered markup files. This is generally a good thing,
as we don’t want to permit rogue markup inside our wiki pages, but it
does limit our options in this situation.

Unfortunately, these links do not work when you are viewing the review
file itself (clicking them brings you to a page that asks you to create
this as a new page). Liquid tagsGollum, unlike Jekyll, does not support
Liquid tags, which would permit building a link using the username and
repository. Right now we don’t have access to these variables, so our
link needs to be relative, which works when we are in history review,
but not in the normal review. It does not affect viewing the files so
this would require educating your stakeholders on the limitations of
this link.range=endofrangestartref=ix\_chapter-03-gollum-asciidoc4
startref=ix\_chapter-03-gollum-asciidoc4

# Summary

In this chapter we learned how to create a Gollum wiki from scratch,
both on GitHub and as a fresh repository from the command line. We then
looked at the different ways to use the Gollum command-line tool and
learned why this is a nice option when we want to run our own Gollum
server. Finally, we built a customized Gollum image-centric editor using
the Rugged and Sinatra Ruby
libraries.range=endofrangestartref=ix\_chapter-03-gollum-asciidoc1
startref=ix\_chapter-03-gollum-asciidoc1range=endofrangestartref=ix\_chapter-03-gollum-asciidoc0
startref=ix\_chapter-03-gollum-asciidoc0

In the next chapter we’ll switch gears completely and build a GUI
application for searching GitHub issues. And we’ll do it in Python.

# JavaScript and the Git Data API

JavaScriptid=ix\_chapter-04-javascript-asciidoc0range=startofrange
id=ix\_chapter-04-javascript-asciidoc0range=startofrange
range=startofrangeApplications utilizing the GitHub API will typically
reside inside a server. You are not limited, however, to accessing the
API from within server-side programming languages exclusively. The
GitHub API works perfectly well from within a web browser context as
well, and the UI to your application comes for free if you know a little
HTML. In this chapter we discuss how to use the unofficial JavaScript
client library to access the GitHub API and build a single-page
application (SPA), which we host entirely on GitHub.

The main weakness of JavaScript has always been testability. Mainly due
to the asynchronous nature of JavaScript, writing tests has never been
easy; polling for changes when a callback returns was until recently the
best way to test nonlinear code. But recent toolkits like AngularJS and
promise-based libraries have made testing not only easy, but elegant as
well. Building applications on top of third-party services makes testing
even more important than it already was, and we’ll make sure to add
testing to our application to verify the functionality works as we
expect.

JavaScript should be generally accessible to most people who know other
imperative programming languages. callbackThere is one feature, however,
that can be challenging: the callback function. In JavaScript, functions
are first-class objects, meaning they can be passed as arguments to
other functions and stored as the value of a variable. You will find
callbacks everywhere in JavaScript programming. Callbacks make debugging
and understanding JavaScript code more challenging at times. As we
stated earlier, writing code that includes tests makes understanding the
entire picture easier, and we will do that in this chapter to further
explain sections where necessary function callbacks may initially look
confusing.

# Building a Coffee Shop Database on GitHub

coffee shop database
appid=ix\_chapter-04-javascript-asciidoc1range=startofrange
id=ix\_chapter-04-javascript-asciidoc1range=startofrange
range=startofrangeLike many software developers, I suffer from an almost
disturbing obsession with coffee. Perhaps it is really my family that
suffers: when we travel to a new city, I drag my wife and children
through questionable neighborhoods just to find the perfect brew and
complementary gluten-free desserts.

Google MapsGoogle Maps is a great help on these quests, in that it will
find me a coffee shop and reviews, but the granularity of information
about that coffee shop is often poor and limited in scope. Do they offer
rice milk as a dairy-free alternative? What special details should I
know when considering a place? Many guidance and mapping applications
exist, but if they don’t fit my own personalized informational niche, I
might miss a unique experience. With such a pressing and dire problem in
front of us, let’s use the GitHub API to solve it.

We’ll build a coffee shop single-page web app that allows anyone to add
information on coffee shops, information that is flexible and dynamic,
and search and filter through that information about a coffee shop. All
files, such as the HTML, images, and JavaScript will be hosted on
GitHub. And we’ll be using the GitHub API to allow contributors to add
data to our database, a database we will also host on GitHub. And as
GitHub developers write code with tests, we will write tests to validate
our JavaScript code as well as the expectations we have of the GitHub
API.

More specifically, we’ll use these technologies:

  - [An (unofficial) GitHub API JavaScript
    library](https://github.com/michael/github)

  - [AngularJS](http://angularjs.org), a "superpowered framework" for
    writing JS applications that are testable

  - [Bootstrap](http://getbootstrap.com), a CSS library that simplifies
    building beautiful webapps

You don’t need to know these technologies in advance of working on this
chapter.

# Set Up

coffee shop database appsetupid=ix\_chapter-04-javascript-asciidoc2
id=ix\_chapter-04-javascript-asciidoc2range=startofrange
range=startofrangeTo create our app, let’s first create our main web
page and push it into our repository:

``` bash
$ mkdir coffeete.ch
$ cd coffeete.ch
$ git init
$ git checkout -b gh-pages
$ printf "<html>\n<body>Hello from CoffeeTe.ch</body>\n</html>\n" > index.html
$ git commit -m "Add starting point index.html" -a
$ git config push.default gh-pages
```

Notice that we created a new repository, and then created and entered
the gh-pages branch. We’ll do all our work there. And by using the git
config command, we specified that we want the default push branch to be
gh-pages. This allows us to use `git push` to push our branch up instead
of the longer `git push origin gh-pages`.

## Mapping Hostnames

coffee shop database appmapping hostnames mapping hostnameshostnames,
mappingOnce we publish these files into GitHub inside a repository we
can connect the repository to a real hostname. There are two steps to
take to do this:

  - Add a CNAME file that tells GitHub under which server name this
    service should resolve.

  - Set up DNS records so that the hostname maps to the correct IP
    address at GitHub.

Imagine you have the hostname *myspecialhostname.com*. If you map this
repository to a subdomain called *coffeetech*, then you would do
something like this:

``` bash
$ echo 'coffeetech.myspecialhostname.com' > CNAME
$ git commit -m "Added CNAME mapping" -a
$ git push
```

Remember that you need to wait about 10 minutes before GitHub
regenerates its database to establish the connection between your
gh-pages site and the mapping on their frontend servers. This is only
the first time you connect a repository to a hostname; you will see
subsequent changes almost instantaneously.

> **Note**
> 
> Generally it takes several hours to even a few days to propagate DNS
> settings out into the wild, so make sure you choose and set up a
> hostname far in advance if your site has to be live by a certain
> point.

Now we can install the libraries needed for this application.

## Adding the Support Libraries

AngularJSBootstrapcoffee shop database appsupport libraries for support
libraries forGitHub.js libraryAs we mentioned, we will use the GitHub.js
library, AngularJS, and Bootstrap. Let’s add those to our project now.
Using whatever editor you prefer, edit the *index.html* file to look
like this:

``` html
<html>
<head>
<title>CoffeeTe.ch</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<link rel="stylesheet" type="text/css" href="bootstrap.min.css"></link>
</head>
<body ng-app> 
<div class="container">
{{'Welcome to Coffeete.ch'}} 
</div>
<script src="angular.js"></script>
<script src="github.js"></script>
</body>
</html>
```

I am assuming you have a firm grasp on most HTML concepts, but a few of
the advanced topics are included here:

  - The `meta` tag makes our page work well with mobile browsers and
    enables the responsive features of Bootstrap.

  - The `ng-app` attribute in the body tag tells AngularJS to initialize
    and compile our page from the body tag downward.

  - The `{{ }}` (double brackets) are an AngularJS two-way data binding
    directive. You’ll see two-way data binding in action very soon if it
    is not already familiar. Adding this code here sanity checks whether
    AngularJS is working for us; if we see "Welcome to Coffeete.ch"
    without the braces then we know AngularJS is loading and working
    properly. If we see the braces, then there is some error in our
    setup to resolve. Two-way data binding solves a significant pain
    point when building JS apps: marshalling data back and forth between
    network events, into HTML and out of HTML forms. AngularJS does all
    this heavy lifting for you. In a moment we’ll show how to use
    two-way data binding as it was intended by defining a variable on
    the AngularJS scope. We then access the variable using the same `{{
    }}` data binding directives.

Then, download the necessary files locally using these commands. We
include AngularJS, GitHub.js, and Bootstrap CSS:

``` bash
$ wget https://ajax.googleapis.com/ajax/libs/angularjs/1.2.10/angular.js
$ wget https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css
$ wget https://github.com/michael/github/raw/master/github.js
```

Now we are ready to use the GitHub library inside our
SPA.range=endofrangestartref=ix\_chapter-04-javascript-asciidoc2
startref=ix\_chapter-04-javascript-asciidoc2

# An AngularJS Application Using GitHub.js

AngularJSapplication using
GitHub.jsid=ix\_chapter-04-javascript-asciidoc3
id=ix\_chapter-04-javascript-asciidoc3range=startofrange
range=startofrangecoffee shop database appAngularJS application using
GitHub.jsid=ix\_chapter-04-javascript-asciidoc4
id=ix\_chapter-04-javascript-asciidoc4range=startofrange
range=startofrangeGitHub.js
libraryid=ix\_chapter-04-javascript-asciidoc5range=startofrange
id=ix\_chapter-04-javascript-asciidoc5range=startofrange
range=startofrangeNow let’s implement a *coffeetech.js* file, which is
where we will build our single-page application functionality. Create a
new file called *coffeetech.js* in the root of your repository:

``` javascript
var mod = angular.module( 'coffeetech', [] ) 
mod.controller( 'GithubCtrl', function( $scope ) { 
  var github = new Github({} ); 
  var repo = github.getRepo( "gollum", "gollum" ); 
  repo.show( function(err, repo) { 
    $scope.repo = repo;
    $scope.$apply(); 
  });
})
```

  - Define a module named "coffeetech." Save a reference to the module
    we will use next in defining a controller, a smaller bundle of
    functions. Modules are an AngularJS feature for grouping related
    functionality, and we will keep all our code for this application
    inside this module.

  - We define a controller called `GithubCtrl` that bundles up functions
    and data. When we use the controller syntax, we name the controller,
    and then define a function with at least a single parameter: the
    scope object. I think of scope as the "world" available to the
    controller. The controller knows only of data and functions defined
    on its scope, and AngularJS does its magic as long as your functions
    or variables are defined on the scope.

  - We create a new `Github()` object using the constructor. This
    constructor can take user credentials, but for now, we can just
    create it without those since we are accessing a public repository.

  - Once we have our `github` object, we call the method `getRepo()`
    with an owner and a name. This returns our repository object.

  - To actually load the data for this repository object, we call the
    `show` method and pass it a callback that uses the two parameters
    `err` and `repo` to handle errors or otherwise provide us with
    details of the repository specified. In this case we are using the
    Gollum wiki public repository to display some sample data.

  - Once we have loaded the repository data, we need to call `$apply` to
    tell AngularJS a change has occurred to data stored within the scope
    variable. As we mentioned before, AngularJS knows only about
    functions and data defined on its scope. The `show` function is
    defined on the GitHub object, and any changes are not tracked by
    AngularJS, so we need to use `$apply()`.

GitHub.js handles making the proper request to GitHub for us, and
AngularJS handles putting the results into our web page. To modify our
HTML to use this data, we change *index.html* to look like the
following:

``` html
<html>
<head>
<title>CoffeeTe.ch</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css"></link>
</head>
<body ng-app="coffeetech"> 
<div class="container" ng-controller="GithubCtrl">
{{ repo }} 
</div>
<script src="angular.js"></script>
<script src="github.js"></script>
<script src="coffeetech.js"></script> 
</body>
</html>
```

  - Change the `ng-app` reference to use the module we defined in our
    *coffeetech.js* file.

  - Remove our data binding to the `Welcome to CoffeeTech` string and
    replace it with a binding to the variable `repo` (by default
    AngularJS will filter complex objects and convert them to JSON).

  - Add a reference to our *coffeetech.js* file beneath our other JS
    references.

If you load this up in your browser, you will see something like
[figure\_title](#the_whole_messy_json).

![The whole messy JSON](images/btwg_09in01.png)

That is a lot of data. AngularJS’s JSON filter pretty-printed it for us,
but this is a bit too much. Let’s change the HTML to reduce some noise:

``` html
<html>
<head>
<title>CoffeeTe.ch</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css"></link>
</head>
<body ng-app="coffeetech">
<div class="container" ng-controller="GithubCtrl">
<div>Subscriber count: {{ repo.subscribers_count }}</div>
<div>Network count: {{ repo.network_count }}</div>
</div>
<script
src="angular.js"></script>
<script src="github.js"></script>
<script src="coffeetech.js"></script>
</body>
</html>
```

We can filter this information by modifying the HTML to show just a few
vital pieces of information from the repository JSON. Let’s display the
`subscriber_count` and the `network_count`. Now we see something more
palatable ([figure\_title](#pulling_out_what_we_want)).

![Pulling out what we want](images/btwg_09in02.png)

We’ve just extracted the subscriber and network count from the Gollum
repository hosted on GitHub using the GitHub API and placed it into our
single-page app.

## Visualize Application Data Structure

coffee shop database appapplication database structure visualization
application database structure visualizationWe are going to be building
a coffee shop database. We want to use Git as our datastore, but Git and
its associated tools (either command-line tools or GitHub) don’t offer
the same features as a standard relational database. So, we need to
think and plan how we will structure our data inside our repository to
make it easily searchable.

This application allows us to search coffee shops. These coffee shops
will be, for the most part, in larger cities. If we keep all the data
stored as JSON files named after the city, we can keep data located in a
file named after the city, and then either use geolocation on the client
side to retrieve a set of the data, or ask the user to choose their city
manually.

If we look at the [GitHub.js JavaScript documentation on
GitHub](https://github.com/michael/github) we can see that there are
some options for us to pull content from a repository. We’ll store a
data file in JSON named after the city inside our repository and
retrieve this from that repository. It looks like the calls we need to
use are `github.getRepo( username, reponame )`, and once we have
retrieved the repository, `repo.contents( branch, path, callback )`.

Now that we have a barebones application let’s pause and make sure we
are building something we can refactor and maintain long term. This
means adding tests to our project.

## Making Our App Testable

coffee shop database apptestability of app testability of
apptestingcoffee shop database app coffee shop database appTesting not
only builds better code by making us think clearly about how our code
will be used from the outside, but makes it easier for an outsider
(meaning other team members) to use our code. Testing facilitates
"social coding."

We’ll use a JavaScript testing tool calledKarma "Karma." Karma
simplifies writing JavaScript unit tests. We need to first install the
tool, then write a test or two. Karma can easily be installed using npm
(installation of which is documented in [???](#appendix)):

``` bash
$ npm install karma -g
$ wget https://ajax.googleapis.com/ajax/libs/angularjs/1.2.7/angular-mocks.js
```

The *angular-mocks.js* file makes it easy to mock out Angular
dependencies in our tests.

Then, create a file called *karma.config.js* and enter the following
contents:

``` javascript
module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine'],
    files: [ 
        'angular.js',
        'fixtures-*.js',
        'angular-mocks.js',
        'firebase-mock.js',
        'github.js',
        '*.js'
    ],
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['Chrome'], 
    captureTimeout: 60000,
    singleRun: false
  });
};
```

This is more or less a default Karma configuration file.

  - The `files` section specifying the load order of our JavaScript
    implementations and the test scripts. You can see a few of the files
    we’ve added specified directly and wildcards to cover the remaining
    files.

  - Note also that we’ve specified Chrome as our test browser (so you
    should have it installed), which is a safe bet because it works on
    just about any desktop platform you might be running. Know that you
    can always choose Safari or Firefox if you want Karma to test inside
    those as well. Karma will start a new instance of each browser
    specified and run your tests inside a test harness in those
    browsers.

To write the test, let’s clarify what we want our code to do:

  - When a user first visits the application, we should use the
    geolocation features of their browser to determine their location.

  - Pull a file from our repository that contains general latitude and
    longitude locations of different cities.

  - Iterate over the list of cities and see if we are within 25 miles of
    any of the cities. If so, set the current city to the first match.

  - If we found a city, load the JSON data file from GitHub.

Concretely, let’s assert that we load the list of cities and have two of
them, then we load a matching city named "Portland," a city that has
three shops available.

We’ll use an `ng-init` directive, which is the mechanism to tell
AngularJS we want to call the function specified when the controller has
finished loading. We’ll call this function `init` so let’s test it.

AngularJSJasmine test framework for Jasmine test framework
forJasminetest framework for coffee shop database app test framework for
coffee shop database appFirst, we will write the setup code for an
AngularJS test written using the Jasmine test framework. Jasmine is a
"behavior-driven JavaScript" library that provides functions to group
and create expectation-based tests. Within the Jasmine framework are
"matchers" that allow for the most common assertions (comparing a
variety of expected types to the resultant types from function calls)
and the ability to define your own custom matchers. Jasmine also gives
you the ability to "spy" on functions, which is another way of saying
Jasmine can intercept function calls to validate that those calls were
made in the way you anticipate. It is easiest to explain the power of
Jasmine by showing the elegance of the tests themselves, so let’s do
that now:

``` javascript
describe( "GithubCtrl", function() {
    var scope = undefined; 
    var ctrl = undefined;
    var gh  = undefined;
    var repo = undefined;
    var geo = undefined;

    beforeEach( module( "coffeetech" ) ); 

    beforeEach( inject( function ($controller, $rootScope ) { 
            generateMockGeolocationSupport(); 
            generateMockRepositorySupport();
            scope = $rootScope.$new(); 
            ctrl = $controller( "GithubCtrl",
         { $scope: scope, Github: gh, Geo: geo } ); 
        } )
    );
...
```

  - We declare our variables at the top of the function. If we did not
    do this, JavaScript would silently define them inside the functions
    the first time the variable is used. Then our variables would be
    different inside our setup code and the actual tests.

  - We load our `coffeetech` module into our tests using the `module`
    method inside a `beforeEach` call, code that is executed before our
    tests run.

  - `inject` is the AngularJS way to provide our before functions with
    the `$controller` and `$rootScope` objects, which we use to set up
    our tests.

  - We will be creating two functions that generate the mock objects
    required for our tests. We’ll discuss these two functions in a bit.

  - scope is the AngularJS convention for the object into which all
    functionality and state is stored. We create a new scope using the
    AngularJS utility function `$rootScope.$new()` and store a reference
    to this scope so we can test functionality we’ve implemented in our
    actual code.

  - We pass in the mocked objects (created by the mocked function calls)
    as well as the scope object and instantiate a controller object.
    This controller uses the scope to define functions and data, and
    since we have a reference to it, we can call those functions and
    inspect that data and assert our implementation is correct.

Now, let’s write an actual test:

``` javascript
    describe( "#init", function() { 
        it( "should initialize, grabbing current city", function() { 
            scope.init(); 
            expect( geo.getCurrentPosition ).toHaveBeenCalled(); 
            expect( gh.getRepo ).toHaveBeenCalled();
            expect( repo.read ).toHaveBeenCalled();
            expect( scope.cities.length ).toEqual( 2 ); 
            expect( scope.city.name ).toEqual( "portland" );
            expect( scope.shops.length ).toEqual( 3 );
        });
    });
});
```

  - Describe functions are used to group tests defined inside `it`
    functions. Since we are testing the `init` function, it seems
    logical to use an identifier called `#init`.

  - `describe` blocks group tests while `it` blocks actually specify
    code that is run as a test.

  - Our controller code begins with an `init` call, so we mimic that
    inside our test to set up the controller state.

  - We assert that our code uses the various interfaces we defined on
    our injected objects: `getCurrentPosition` on the geo object, and
    `read` on the repository object.

  - Then we assert that the data is properly loaded. Our test verifies
    that there are two cities, that a default city has been loaded and
    the name of the default city is equal to the string "portland". In
    addition, the test verifies there are three shops loaded for the
    default city. Behind the scenes in our implementation we will load
    these via JSON, but all we care about is that the interface and data
    matches our expectations.

This syntax initially can look confusing if you have never written
Jasmine tests for JavaScript, but it actually solves a lot of problems
in an elegant way. Most importantly, Jasmine provides aspyOn function
`spyOn` function that will intercept a call to it, and then allow you to
assert that it was called. Any place in our tests you see
`toHaveBeenCalled()` is an assertion that `spyOn` provides to us proving
that a call was made.

Now we can implement the two mocking functions vital for the test. Put
them in between the `beforeEach( module( "coffeetech" ) )` line and the
`beforeEach( inject( ... ) )` functions to provide proper visibility to
Karma:

``` javascript
...
beforeEach( module( "coffeetech" ) );

function generateMockGeolocationSupport( lat, lng ) { 
    response = ( lat && lng ) ?
        { coords: { lat: lat, lng: lng } } :
  { coords: CITIES[0] };
    geo = { getCurrentPosition: function( success, failure ) { 
        success( response );
    } };
    spyOn( geo, "getCurrentPosition" ).andCallThrough(); 
}

function generateMockRepositorySupport() { 
    repo = { read: function( branch, filename, cb ) { 
        cb( undefined,
      JSON.stringify( filename == "cities.json" ?
              CITIES : PORTLAND ) );
    } };
    spyOn( repo, "read" ).andCallThrough();

    gh = new Github({});
    spyOn( gh, "getRepo" ).andCallFake( function() { 
        return repo;
    } );
}

beforeEach( inject( function ($controller, $rootScope ) {
...
```

  - We first implement the `generateMockLocation` function.

  - Mock location involves creating a geo object that has a single
    function `getCurrentPosition`, which is a function that calls back
    into a success callback function provided. This exactly matches the
    native browser support for Geolocation, which has the same function
    defined.

  - We then `spyOn` the function so we can assert that it was called in
    our actual tests.

  - Next, we implement `generateMockRepositorySupport`.

  - Again, we implement a mock object: this one to provide a method
    called `read`. This function matches the function of the same name
    contained in the API provided by the JavaScript GitHub.js library.
    Just like in the previous mock, we `spyOn` the function so we can
    validate it was called. However, this is not the "top-level"
    repository object—this is the object returned from the call to
    `getRepo`. We will take this mock object and return it from the
    `getRepo` call.

  - We spy on the `getRepo` call, and then return our next mock object,
    the repository object. This object is used to retrieve the actual
    information using the `read` call.

Now that we have a set of tests, run the test suite from the command
line and watch them fail:

``` bash
$ karma start karma.conf.js
Chrome 32.0.1700 (Mac OS X 10.9.1) GithubCtrl #init should initialize,
          grabbing current city FAILED
  Error: [$injector:modulerr] Failed to instantiate module...:
  Error: [$injector:nomod] Module 'coffeetech' is not available!
    You either misspelled the module name or forgot to load it.
    If registering a module ensure that you specify the
    dependencies as the second argument.
...
```

We now need to provide some test fixtures.

## Test Data

coffee shop database apptest data for test data forWe need to build our
support fixtures, data files that have test data. Add the
*fixtures-cities.js* file into the same directory as your other code:

``` javascript
var CITIES = [{
    name: "portland",
    latitude: 45,
    longitude: 45
}, {
    name: "seattle",
    latitude: 47.662613,
    longitude: -122.323837
}]
```

And the *fixtures-portland.js* file:

``` javascript
var PORTLAND = [{
    "name": "Very Good Coffee Shop",
    "latitude": 45.52292,
    "longitude": -122.643074
}, {
    "name": "Very Bad Coffee Shop",
    "latitude": 45.522181,
    "longitude": -122.63709
}, {
    "name": "Mediocre Coffee Shop",
    "latitude": 45.520437,
    "longitude": -122.67846
}]
```

## CoffeeTech.js

coffee shop database appand coffeetech.js.
fileid=ix\_chapter-04-javascript-asciidoc6
id=ix\_chapter-04-javascript-asciidoc6range=startofrange
range=startofrangeThen, add the *coffeetech.js* file. We’ll focus just
on the setup code and the changes to the `init` function for now:

``` javascript
var mod = angular.module( 'coffeetech', [] );

mod.factory( 'Github', function() {  // 
    return new Github({});
});

mod.factory( 'Geo', [ '$window', function( $window ) {  // 
    return $window.navigator.geolocation;
} ] );

mod.factory( 'Prompt', [ '$window', function( $window ) {
    return $window.prompt;
} ] );

mod.controller( 'GithubCtrl', [ '$scope', 'Github', 'Geo', 'Prompt',  // 
        function( $scope, ghs, Geo, Prompt ) {
    $scope.messages = []

    $scope.init = function() { // 
        $scope.getCurrentLocation( function( position ) {
            $scope.latitude = position.coords.latitude;
            $scope.longitude = position.coords.longitude;
            $scope.repo = ghs.getRepo( "xrd", "spa.coffeete.ch" );  // 
            $scope.repo.read( "gh-pages", "cities.json",
          function(err, data) {  // 
                $scope.cities = JSON.parse( data );  // 
                // Determine our current city
                $scope.detectCurrentCity();  // 

                // If we have a city, get it
                if( $scope.city ) {
                    $scope.retrieveCity();
                }

                $scope.$apply(); // 
            });
        });
...
```

  - We extract the GitHub library into an AngularJS factory. This allows
    us to inject our mocked GitHub object inside our tests; if we had
    placed the GitHub instance-creation code inside our controller, we
    would not have been able to easily mock it out in our tests.

  - We extract the geolocation support into an AngularJS factory. As we
    did with the GitHub library mock, we can now inject a fake one into
    our tests.

  - Our new controller "injects" the various objects we need. We have
    extracted the GitHub API object and a Geo object into dependencies,
    and this syntax finds the proper objects and provides them to our
    controller. You’ll also notice a slightly different syntax for
    creating the controller: `controller( "CtrlName", [ 'dependency1',
    'dependency2', function( dependency1, dependency2 ) {} ] );`. This
    style works even if JavaScript minification were to occur; the
    previous incarnation we saw would not have survived this process
    because AngularJS would not have known the dependency name after it
    had been mangled by a minimizer.

  - We extract the functionality into a function called `init`, which we
    can explicitly call from within our tests.

  - Set the username and load the repository. If you are putting this
    into your own repository, modify this appropriately, but you can use
    these arguments until you do post this into your own repository.

  - We use the `read` method to pull file contents from the repository.
    Notice that we use the `gh-pages` branch since we are storing our
    single-page app and all the data there.

  - Once our data is returned to us, it is simply a string. We need to
    reconstitute this data to a JavaScript object using the `JSON.parse`
    method.

  - After we retrieve our data from the repository, we can use the data
    inside the cities array to determine our current city.

  - Since we are calling outside of AngularJS and returning inside a
    callback, we need to call `scope.$apply()` like we showed in prior
    examplesrange=endofrangestartref=ix\_chapter-04-javascript-asciidoc6
    startref=ix\_chapter-04-javascript-asciidoc6.range=endofrangestartref=ix\_chapter-04-javascript-asciidoc5
    startref=ix\_chapter-04-javascript-asciidoc5range=endofrangestartref=ix\_chapter-04-javascript-asciidoc4
    startref=ix\_chapter-04-javascript-asciidoc4range=endofrangestartref=ix\_chapter-04-javascript-asciidoc3
    startref=ix\_chapter-04-javascript-asciidoc3

We are now ready to write our geocoding implementation.

# Geocoding Support

coffee shop database appgeocoding
supportid=ix\_chapter-04-javascript-asciidoc7
id=ix\_chapter-04-javascript-asciidoc7range=startofrange
range=startofrangegeocodingid=ix\_chapter-04-javascript-asciidoc8range=startofrange
id=ix\_chapter-04-javascript-asciidoc8range=startofrange
range=startofrangeWe’ll build functions to retrieve the data for a city
from the GitHub API, find the location of the user using their browser’s
Geolocation feature, use the user’s current location to determine what
cities they are close to, implement a distance calculation function,
load the city once close proximity cities are determined, and finally,
add a function to query the user for their GitHub credentials and
annotation data.

First, we can implement the city-loading functions:

``` javascript
$scope.retrieveCity = function() { 
    $scope.repo.read( "gh-pages", $scope.city.name + ".json",
      function(err, data) {
        $scope.shops = JSON.parse( data );
        $scope.$apply();
    });
}

$scope.loadCity = function( city ) { 
    $scope.repo.read( "gh-pages", city + ".json", function(err, data) {
        $scope.shops = JSON.parse( data );
        $scope.$apply();
    });
...
```

  - `retrieveCity` retrieves a list of shops in the same way we
    retrieved the list of cities by reading from the repository object.
    After loading the data into the scope, we need to call `$apply()` to
    notify Angular.

  - `loadCity` uses the city name to load city data.

Next, we can implement the functionality to calculate distances between
the current user and available cities:

``` javascript
$scope.getCurrentLocation = function( cb ) { 
    if( undefined != Geo ) {
        Geo.getCurrentPosition( cb, $scope.geolocationError );
    } else {
        console.error('not supported');
    }
};

$scope.geolocationError = function( error ) { 
    console.log( "Inside failure" );
};

$scope.detectCurrentCity = function() {  
    // Calculate the distance from our current position and use
    // this to determine which city we are closest to and within
    // 25 miles
    for( var i = 0; i < $scope.cities.length; i++ ) {
        var dist = $scope.calculateDistance( $scope.latitude, 
                                             $scope.longitude,
                                             $scope.cities[i].latitude,
                                             $scope.cities[i].longitude );
        if( dist < 25 ) {
            $scope.city = $scope.cities[i];
            break;
        }
    }
}

toRad = function(Value) { 
    return Value * Math.PI / 180;
};

$scope.calculateDistance = function( latitude1,   
                                     longitude1,
                                     latitude2,
                                     longitude2 ) {
    R = 6371;
    dLatitude = toRad(latitude2 - latitude1);
    dLongitude = toRad(longitude2 - longitude1);
    latitude1 = toRad(latitude1);
    latitude2 = toRad(latitude2);
    a = Math.sin(dLatitude / 2) * Math.sin(dLatitude / 2) +
        Math.sin(dLongitude / 2) * Math.sin(dLongitude / 2) *
        Math.cos(latitude1) * Math.cos(latitude2);
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    d = R * c;
    return d;
...
```

  - We build a `getCurrentLocation` function we will call within our
    code. We use the injected `Geo` object that has our
    `getCurrentPosition` function (which inside our tests will be the
    mocked function, and inside our real code just layers an abstraction
    on top of the native browser interface).

  - We need to provide an error callback to the `getCurrentPosition`
    call, so we implement that, which logs it to the console.

  - Then we build `detectCurrentCity`; we will look over the list of
    cities and see if we are in one.

  - We iterate over the list of cities and calculate whether they are
    within 25 miles of our current location. Each city is stored with
    its own latitude and longitude data. When we find a city, we store
    that in the scope as the official current city and exit the loop.

  - To calculate distance, we need to build a radian conversion
    function.

  - Finally, we build our distance calculation function.

At first glance, the calculate distance function looks confusing, no?
This was code I developed after reading a post on geocoding using a
stored procedure within the PostgreSQL database, and I converted the
code to JavaScript. Unless you are a geocoding geek, how do we know this
works as advertised? Well, let’s write some tests to prove it. Add these
lines to the bottom of your *coffeetech.spec.js*, just within the last
`});` closing braces:

``` javascript
    describe( "#calculateDistance", function() {
        it( "should find distance between two points", function() {
            expect( parseInt(
          scope.calculateDistance( 14.599512,
           120.98422,
           10.315699,
           123.885437 ) * 0.61371 ) ).
      toEqual( 354 );
        });
    });
```

To build this test, I searched for "distance between Manila" and Google
autocompleted my search to "Cebu." It says they are 338 miles apart. I
then grabbed latitude and longitudes for those cities and built the
preceding test. I expected my test to fail as my coordinates were going
to be off by a few miles here or there. But the test showed that our
distance was 571. Hmm, perhaps we calculated in kilometers, not miles?
Indeed, I had forgotten this algorithm actually calculated the distance
in kilometers, not miles. So, we need to multiply the result by 0.621371
to get the value in miles, which ends up being close enough to what
Google reports the distance to
be.range=endofrangestartref=ix\_chapter-04-javascript-asciidoc8
startref=ix\_chapter-04-javascript-asciidoc8range=endofrangestartref=ix\_chapter-04-javascript-asciidoc7
startref=ix\_chapter-04-javascript-asciidoc7

## City Data

coffee shop database appcity data for city data forLet’s seed our
application with some starting data and write out the *cities.json*
file:

``` javascript
[
  {
    "longitude": -122.67620699999999,
    "latitude": 45.523452,
    "name": "portland"
  },
  {
    "longitude": -122.323837,
    "latitude": 47.662613,
    "name": "seattle"
  }
]
```

Now that we have our geocoding implementation complete and sample data
in place, we can move on to acquiring credentials from the user.

# Adding Login

coffee shop database applogin for login forloginfor coffee shop database
app for coffee shop database appIf we want people to fork a repository
on GitHub, we need to have them log in to GitHub. So, we need to ask for
credentials:

``` javascript
...

$scope.annotate = function() {
    user = Prompt( "Enter your github username" )
    password = Prompt( "Enter your github password" )
    data = Prompt( "Enter data to add" );
};

...
```

We can now expose the new data inside the *index.html* file like so
(omitting the obvious from the HTML):

``` html
<body ng-app="coffeetech">

<div class="container" ng-controller="GithubCtrl" ng-init="init()">

<h1>CoffeeTe.ch</h1>

<h3 ng-show="city">Current city: {{city.name}}</h3>

<div class="row">
<div class="col-md-6"><h4>Shop Name</h4> </div>
<div class="col-md-6"><h4>Lat/Lng</h4> </div>
</div>
<div class="row" ng-repeat="shop in shops"> 
<div class="col-md-6">   
{{ shop.name }}  
</div>
<div class="col-md-6"> {{ shop.latitude }} / {{ shop.longitude }} </div>
</div>
</div>
```

  - `ng-repeat` is an AngularJS directive that iterates over an array of
    items. Here we use it to iterate over the items in our
    *portland.json* file and insert a snippet of HTML with our data
    interpolated from each item in the iteration.

  - BootstrapBootstrap makes it easy to establish structure in our HTML.
    The `col-md-6` class tells Bootstrap to build a column sized at 50%
    of our 12-column layout (the default for Bootstrap layouts). We set
    up two adjacent columns this way. And if we are inside a mobile
    device, it properly stacks these columns.

  - Using AngularJS two-way data binding we insert the name of the shop.

## Errors Already?

coffee shop database apperror
handlingid=ix\_chapter-04-javascript-asciidoc9
id=ix\_chapter-04-javascript-asciidoc9range=startofrange
range=startofrangeerror
handlingid=ix\_chapter-04-javascript-asciidoc10range=startofrange
id=ix\_chapter-04-javascript-asciidoc10range=startofrange
range=startofrangeIf you run this in your browser, you will not see the
shops for our city displayed. Something is broken, so let’s investigate.
I recommend using the Chrome browser to debug this, but you can use any
browser and set of developer tools you like. For Chrome, right-clicking
the page anywhere and selecting "Inspect Element" at the bottom (or by
the keyboard shortcut "F12" or "Ctrl-Shift-I" on Windows or Linux or
"Cmd-Opt-I" on Mac) will bring up the developer console. Then select the
console window. Refresh the browser window, and you’ll see this in the
console:

``` text
Uncaught TypeError: Cannot call method 'select' of undefined
```

If you click the link to the right for GitHub.js, you’ll see something
like [figure\_title](#an_unexpected_error).

![An unexpected error](images/btwg_09in03.png)

You see at the point of error that we are calling `select` on the tree.
select appears to be a method defined on an underscore character. If you
use JavaScript frequently, you’ll recognize that the underscore variable
comes from the Underscore library, and `select` is a method that detects
the first matching instance inside an array. Under the hood, the
GitHub.js library is pulling the entire tree from the repository, then
iterating over each item in the tree, then selecting the item from the
tree that matches the name of the file we have requested. This is an
important performance implication to consider; the GitHub API does not
provide a way to directly request content by the path name. Instead, you
pull a list of files and then request the file by the SHA hash, a
two-step process that makes two (potentially lengthy) calls to the API.

How do we fix the error telling us `select` is undefined? Did we forget
to include underscore.js? Reviewing the documentation on GitHub.js, we
see that it states underscore.js and base64.js are required. We forgot
to include them. Oops\! To include these, run these commands from the
console:

``` bash
$ wget http://underscorejs.org/underscore-min.js
$ wget https://raw.github.com/dankogai/js-base64/master/base64.js
```

Then, add the libraries to your *index.html* so that the JavaScript
includes look like
this:range=endofrangestartref=ix\_chapter-04-javascript-asciidoc10
startref=ix\_chapter-04-javascript-asciidoc10range=endofrangestartref=ix\_chapter-04-javascript-asciidoc9
startref=ix\_chapter-04-javascript-asciidoc9

``` html
...

<script src="angular.js"></script>
<script src="underscore-min.js"></script>
<script src="base64.min.js"></script>
<script src="github.js"></script>
<script src="coffeetech.js"></script>
...
```

Now we can build out some faked data and start envisioning the structure
of our data that will eventually come from our users.

# Displaying (Soon-to-Be) User-Reported Data

coffee shop database appdisplaying
dataid=ix\_chapter-04-javascript-asciidoc11
id=ix\_chapter-04-javascript-asciidoc11range=startofrange
range=startofrangeSo far we have built a database of cities and coffee
shops in those cities. Google MapsGoogle Maps or Apple Maps already
provide this information. If we layer additional information on top of
this data (like quirky information about the coffee shop), however, then
we might have something that someone might find useful once they have
found the coffee shop on their favorite mapping application.

So, to start, let’s add some fake data to our coffee shop information.
Add a file called *portland.json* that looks like this:

``` json
[
   {
      "information" : [
         "offers gluten free desserts",
         "free wifi",
         "accepts dogs"
      ],
      "longitude" : -122.643074,
      "latitude" : 45.52292,
      "name" : "Very Good Coffee Shop"
   },
   {
      "latitude" : 45.522181,
      "name" : "Very Bad Coffee Shop",
      "longitude" : -122.63709
   },
   {
      "name" : "Mediocre Coffee Shop",
      "latitude" : 45.520437,
      "longitude" : -122.67846
   }
]
```

Notice that we added an array called `information` to our data set.
We’ll use this to allow simple search. Add the search feature to our
*index.html*:

``` html
...

<div class="container" ng-controller="GithubCtrl" ng-init="init()">

<h1>CoffeeTe.ch</h1>

<input style="width: 20em;" ng-model="search"
       placeholder="Enter search parameters..."/> 

<h3 ng-show="city">Current city: {{city.name}}</h3>

<div class="row=">
<div class="col-md-6"><h4>Shop Name</h4> </div>
<div class="col-md-6"><h4>Lat/Lng</h4> </div>
</div>
<div class="row" ng-repeat="shop in shops | filter:search"> 
<div class="col-md-6">
{{ shop.name }}

<div ng-show="search"> 
<span ng-repeat="info in city.information">
<span class="label label-default">city.data</span>
</span>
</div>

</div>
<div class="col-md-6">
<a target="_map" 
   href="http://maps.google.com/?q={{shop.latitude}},{{shop.longitude}}">
   Open in map ({{shop.latitude}},{{shop.longitude}})
</a>
</div>
...
```

  - We add a search box that binds to the `search` model in our scope.

  - We add a filter on the data to display that searches through all
    data inside each item in our `shops` array.

  - If we are searching (the model variable `search` is defined) then we
    show the extra information.

  - Google MapsWe alter our lat/lng information to point to a Google
    Maps page.

Now if we type the word “gluten” in our search box, we filter out
anything except shops that match that, and we see the information pieces
formatted as labels underneath the shop name
([figure\_title](#filtering_coffeeshops_using_the_term_gluten)).

![Filtering coffee shops using the term gluten](images/btwg_09in04.png)

## User-Contributed Data

coffee shop database appuser–contributed data
forid=ix\_chapter-04-javascript-asciidoc12
id=ix\_chapter-04-javascript-asciidoc12range=startofrange
range=startofrangeNow that we have a functioning application, let’s
allow people to add information themselves and help build our database.
Just beneath the link to the map link, add a button that will allow us
to annotate a coffee shop with extra information.

To make a contribution, users will fork the repository, make a change,
and then issue a pull request from the fork to the original repository.
Forking means we create a copy of the original repository in our GitHub
account. All these steps are possible from within our webapp using the
GitHub.js library. Of course, if someone is going to fork a repository
into their account, we must ask the user to log in, so we will prompt
them for their username and password. If you are grimacing at the
thought of a webapp asking for GitHub credentials, don’t fret—we’ll find
a safe way to achieve the same thing shortly.

The implementation we will use starts with adding an annotate button to
our HTML:

``` html
<button ng-click="annotate(shop)">Add factoid</button>
```

Let’s add some tests. Add another file called
*coffeetech.annotate.spec.js* with these contents:

``` javascript
describe( "GithubCtrl", function() {

    var scope = undefined, gh = undefined,
        repo = undefined, prompter = undefined;

    function generateMockPrompt() {
        prompter = { prompt: function() { return "ABC" } }; 
        spyOn( prompter, "prompt" ).andCallThrough();

    }

    var PR_ID = 12345;
    function generateMockRepositorySupport() { 
        repo = {
            fork: function( cb ) {
                cb( false );
            },
            write: function( branch, filename, data, commit_msg, cb ) {
                cb( false );
            },
            createPullRequest: function( pull, cb ) {
                cb( false, PR_ID );
            },
            read: function( branch, filename, cb ) {
                cb( undefined,
            JSON.stringify( filename == "cities.json" ?
                        CITIES : PORTLAND ) );
            }
        };
        spyOn( repo, "fork" ).andCallThrough();
        spyOn( repo, "write" ).andCallThrough();
        spyOn( repo, "createPullRequest" ).andCallThrough();
        spyOn( repo, "read" ).andCallThrough();

        gh = { getRepo: function() {} }; 
        spyOn( gh, "getRepo" ).andCallFake( function() {
            return repo;
        } );
        ghs = { create: function() { return gh; } };
    }

...
```

It looks similar to our previous tests where we mock out a bunch of
items from the GitHub.js library.

  - We added a mock prompt. We will be prompting the user for username,
    password, and the annotating data, and we will use the native
    browser prompt mechanism to do this.

  - We added three new methods to our mock GitHub object: `fork`,
    `write`, and `createPullRequest`. We verify that these are called.

  - When we call the `getRepo` function we want to spy on it so we can
    assure it is called, but we also want to return the fake repository
    we provide inside our test, and this syntax does that.

We have some setup code that is called in a before function to load the
mock objects and establish a controller and scope for testing:

``` javascript
...

var $timeout;  // 
beforeEach( inject( function ($controller, $rootScope, $injector ) {
    generateMockRepositorySupport();  // 
    generateMockPrompt();
    $timeout = $injector.get( '$timeout' );  // 
    scope = $rootScope.$new();
    ctrl = $controller( "GithubCtrl",
       { $scope: scope,
         Github: ghs,
         '$timeout': $timeout,
         '$window': prompter } );
} ) );
...
```

  - According to the documentation for `fork` in the GitHub.js library,
    this method can take a little time to return (as long as it takes
    for GitHub to complete our fork request, which is nondeterministic),
    so we need to set a timeout in our app and query for the new
    repository. If we are using AngularJS, we can ask it for a mocked
    and programmatic timeout interface, which we can control inside our
    tests.

  - We generate our mocked GitHub method calls and spies, and we follow
    that by mocking our prompt calls.

  - As mentioned earlier, we need to get `$timeout`, and we can use the
    injector to retrieve the mocked one AngularJS provides for testing
    using this call.

Now we can write our tests for the annotate function:

``` javascript
...
describe( "#annotate", function() {  
    it( "should annotate a shop", function() {
        scope.city = PORTLAND
        var shop = { name: "A coffeeshop" }
        scope.annotate( shop ); 
        expect( scope.shopToAnnotate ).toBeTruthy();
        expect( prompter.prompt.calls.length ).toEqual( 3 );
        expect( scope.username ).not.toBeFalsy();
        expect( scope.annotation ).not.toBeFalsy();

        expect( repo.fork ).toHaveBeenCalled(); 
        expect( scope.waiting.state ).toEqual( "forking" ); 
        $timeout.flush();

        expect( scope.forkedRepo ).toBeTruthy(); 
        expect( repo.read ).toHaveBeenCalled();
        expect( repo.write ).toHaveBeenCalled();
        expect( repo.createPullRequest ).toHaveBeenCalled();
        expect( scope.waiting.state ).toEqual( "annotated" );
        $timeout.flush();

        expect( scope.waiting ).toBeFalsy();
    });

});
...
```

  - We create a new describe block to organize our tests, calling it
    `#annotate`. We then implement one `it` function, which is the
    single test we are creating: "annotate a shop."

  - After setting up the preconditions that our scope object should have
    a city selected, and creating a shop to annotate, we then call our
    `annotate` method.

  - Once we have called `annotate`, our code should request our
    credentials for the GitHub API, and then ask us for the information
    to use in annotating the shop. If this were happening in the
    browser, we would get three prompts. Our test mocks out the `prompt`
    object here, and we should therefore see three calls made to our
    mocked prompt object. We also validate some state we should see on
    the scope object like holding a username and annotation for usage
    later.

  - We should then see the first of our GitHub API calls being made:
    GitHub.js should issue a request to `fork` the repository.

  - We should then enter in our waiting state; we will tell the user we
    are waiting and our UI will use the scope.waiting.state to notify
    them of that.

  - Once we have flushed the timeout that simulates completion of the
    fork, we will then see our code storing the result of the forked
    repo into the scope.

  - Next, we can observe the other GitHub API calls that perform the
    annotation.

  - We flush again to resolve the timeouts, and then finally, after
    everything is done, we should no longer be telling the user they are
    in a waiting state.

If you are still running Karma in the background, you’ll see the tests
fail with:

``` bash
Chrome 32.0.1700 (Mac OS X 10.9.1) GithubCtrl #annotate should
annotate a shop FAILED
         TypeError: Object #<Scope> has no method 'annotate'
             at null.<anonymous> (/.../coffeetech.spec.js:80:19)
```

Now, let’s implement this functionality in our *coffeetech.js* file. Add
these lines to the bottom of the file, but before the last closing
braces. The function `annotate` actually does two things: makes a fork
of the repository for the user, and then adds annotation information to
that repository using the GitHub API once the fork has completed:

``` javascript
...
$scope.annotate = function( shop ) { 
    $scope.shopToAnnotate = shop;
    $scope.username = $window.prompt( "Enter your github username (not email!)" )
    pass = $window.prompt( "Enter your github password" )
    $scope.annotation = $window.prompt( "Enter data to add" ); 
    gh = ghs.create( $scope.username, pass );  
    toFork = gh.getRepo( "xrd", "spa.coffeete.ch" ); 
    toFork.fork( function( err ) {
        if( !err ) { 
            $scope.notifyWaiting( "forking",
          "Forking in progress on GitHub, please wait" );
            $timeout( $scope.annotateAfterForkCompletes, 10000 );
            $scope.$apply();
        }
    } );

};
  ...
```

  - We start by creating our annotation function. As we specified in our
    tests, this function takes a shop object, an object into which
    annotations about the shop are added.

  - We prompt the user three times: username and password on GitHub, and
    the text they want to annotate. If this seems like a really bad way
    to do things, don’t worry, we’ll fix it in a moment.

  - We create a new GitHub object with the username and password
    provided. We leave it as an exercise for the reader to contend with
    mistyped or incorrect credentials.

  - The GitHub.js library allows you to create a repository object
    (meaning create a local reference to an existing repository) using
    the `getRepo` function. Once we have this, we can issue a `fork` to
    the repository.

  - If we did not get an error, we still need to contend with the fact
    that forking takes a nondeterministic amount of time. So, we
    schedule a timeout in 10 seconds, which will check to make sure our
    request completed. As this operation is happening inside the
    browser, we have no way of registering for a notification, and as
    such, must poll GitHub to determine whether our fork has completed.
    In the real world, we probably would need to redo this request if we
    see it fail as this could just mean it was still pending on GitHub.

  - We register a message using a key called "forking" which we can use
    inside our HTML template to display to the user that our fork has
    completed. We’ll build this function out soon; it basically stores
    the value and a string for display, and allows us to clear it when
    the message is no longer valid.

  - Finally, we call the method `annotateAfterForkCompletes`, which adds
    data to our new forked repository once the process is fully
    complete.

Let’s now build the code to annotate our repository after the fork has
completed:

``` javascript
...

$scope.annotateAfterForkCompletes = function() {
    $scope.forkedRepo = gh.getRepo( $scope.username, "spa.coffeete.ch" );
    $scope.forkedRepo.read( "gh-pages", "cities.json", function(err, data) {
        if( err ) {
            $timeout( $scope.annotateAfterForkCompletes, 10000 );
        }
        else {
            $scope.notifyWaiting( "annotating",
          "Annotating data on GitHub" ); 
            // Write the new data into our repository
            $scope.appendQuirkToShop();

            var newData = JSON.stringify( $scope.shops, stripHashKey, 2 ); 
            $scope.forkedRepo.write('gh-pages', $scope.city.name + '.json', 
                                    newData,
                                    'Added my quirky information',
                                    function(err) {
                if( !err ) {
                    // Annotate our data using a pull request
                    var pull = { 
                        title: "Adding quirky information to " +
              $scope.shopToAnnotate.name,
                        body: "Created by :" + $scope.username,
                        base: "gh-pages",
                        head: $scope.username + ":" + "gh-pages"
                    };
                    target = gh.getRepo( "xrd", "spa.coffeete.ch" ); 
                    target.createPullRequest( pull,
              function( err, pullRequest ) { 
                        if( !err ) {
                            $scope.notifyWaiting( "annotated",
                  "Successfully sent annotation request" );
                            $timeout(
                  function() {
                   $scope.notifyWaiting( undefined )
                  }, 5000 );
                            $scope.$apply(); 
                        }
                    } );
                }
                $scope.$apply();
            });
        }
        $scope.$apply();
    } );

...
```

  - Once we have verified the fork has completed, we need to get the new
    forked repository. We use the username provided to our code when the
    user logs in to build the repository object. We then read the
    *cities.json* file from the repository; if we retrieve this file
    successfully (we don’t see the `err` object evaluating to true) then
    we know we are ready to start editing data.

  - We notify the UI that we are annotating and tell the user they will
    need to wait while the annotation request is in progress.

  - JSON.stringify`JSON.stringify` converts our annotated shop object
    into a JSON object. If you have used JSON.stringify before, you
    might not know about the other two parameters (beyond just the
    object you want to serialize) you can provide to this function.
    These two extra parameters allow us to filter the object and specify
    certain elements to ignore when serializing and how and if to indent
    the resultant JSON. So, we provide the stripHashKey function to
    remove the `$$hashKey` Angular tracking data, and an indentation
    count. The indentation count makes it much easier to read a pull
    request, because the diff’ing algorithm can diff line by line rather
    than as a long JSON string, which is how `JSON.stringify` serializes
    by default.

  - We then write data back to the forked repository using the `write`
    function. If this succeeds, the error value will be undefined inside
    the callback function as the last parameter.

  - If our error was undefined, we are in a position where we can make a
    pull request back to the original repository. To make a pull
    request, we create a pull request object we need to provide to the
    pull request method inside of GitHub.js.

  - We then get a reference to the target of the pull request, the
    original repository.

  - We then issue the pull request against the target. This takes the
    pull request specification object we created earlier, and a callback
    function that has an error code if the request failed, and
    otherwise, a pull request object.

  - Once the request has succeeded, we can notify the UI that the
    annotation process has completed, and then issue a timeout to remove
    that from the UI after 5000 milliseconds, or 5 seconds.

  - Any time we are inside a callback in a third-party library (like
    GitHub.js) we, as mentioned before, need to use `$apply()` to notify
    Angular that our scope object has changed.

We have three convenience methods to implement:

``` javascript
...

$scope.appendQuirkToShop = function() { 
    if( undefined == $scope.shopToAnnotate.information ) {
        $scope.shopToAnnotate.information = [];
    }
    $scope.shopToAnnotate.information.push( $scope.annotation );
};

function stripHashKey( key, value ) { 
    if( key == "$$hashKey" ) {
        return undefined;
    }
    return value;
}

$scope.notifyWaiting = function( state, msg ) { 
    if( state ) {
        $scope.waiting = {};
        $scope.waiting.state = state;
        $scope.waiting.msg = msg;
    }
    else {
        $scope.waiting = undefined;
    }
}
...
```

  - The `appendQuirkToShop` function creates an empty array if it is not
    yet defined and then adds the annotation to the list of annotations.
    We don’t want our code to crash if we try to add an annotation to an
    object for which there is an undefined array reference.

  - We define a transformation function that we used with the
    `JSON.stringify` function. AngularJS adds a tracking attribute
    (`$$hashKey`) to our objects when we use the `ng-repeat` directive,
    and this function filters that out so that our pull request data is
    clean.

  - `notifyWaiting` (obviously) notifies users. We create a waiting
    object, and then update the state (which our app will use to hide or
    display messages) and then a message itself. If we provide an empty
    message, we will clear the object, effectively removing the message
    from the
    UI.range=endofrangestartref=ix\_chapter-04-javascript-asciidoc12
    startref=ix\_chapter-04-javascript-asciidoc12

Now we need to expose the status message in our UI by modifying the
HTML:range=endofrangestartref=ix\_chapter-04-javascript-asciidoc11
startref=ix\_chapter-04-javascript-asciidoc11

``` javascript
...
<input class="ctinput" ng-model="search"
       placeholder="Enter search parameters..."/>

<h3 ng-show="city">Current city: {{city.name}}</h3>

<div ng-show="waiting">
{{waiting.msg}}
</div>
...
```

# Accepting Pull Requests

coffee shop database appaccepting pull requests accepting pull
requestspull requestswith coffee shop database app with coffee shop
database appWhen someone makes an annotation to a shop, the owner of the
original repository gets a pull request notification on GitHub
([figure\_title](#adding_information_through_a_pull_request)).

![Adding information through a pull request](images/btwg_09in05.png)

Now we can review changes through GitHub’s integrated online diff tool
([figure\_title](#reviewing_annotation_pull_request_diffs_from_within_github)).

![Reviewing annotation pull request diffs from within
GitHub](images/btwg_09in06.png)

Here we see a clear "diff" of the changes our contributor made: they
added an annotation that tells us "no turtles allowed." We might want to
consider a different location the next time we have a date with Morla.
The diff is clear in that the green information is easy to read, which
is a benefit we get when we use the `JSON.stringify` function with the
third parameter set to something other than undefined. Unfortunately,
the first line differs only by the extra comma, but this is still a very
readable diff.

# Toward a Safe Login Implementation

coffee shop database appsafe login implementation
forid=ix\_chapter-04-javascript-asciidoc13
id=ix\_chapter-04-javascript-asciidoc13range=startofrange
range=startofrangeloginfor coffee shop database
appid=ix\_chapter-04-javascript-asciidoc14
id=ix\_chapter-04-javascript-asciidoc14range=startofrange
range=startofrangeIf I saw this app in the wild I would never use it to
submit data. The app asks for my GitHub username and password. Asking
for my username and password implicitly asks me to trust the authors of
this application. Trust in this case means that I trust them to not
maliciously use my credentials for nefarious purposes, and also asks me
to trust that they are not doing something stupid that would allow an
attacker to insert themselves into the middle of the authentication
process and steal my crendentials. GitHub is a large part of my online
identity and I would never provide these crendentials to a web
application.

OAuthfor coffee shop database app
loginid=ix\_chapter-04-javascript-asciidoc15
id=ix\_chapter-04-javascript-asciidoc15range=startofrange
range=startofrangeFortunately, we have an alternative to asking for
passwords: OAuth.

When we use OAuth, our users enter their credentials directly into
GitHub. If our users have turned on two-factor authentication, GitHub
can still authenticate them (while our naive implementation could not be
modified to accept this type of authentication process). Once we have
entered our credentials, GitHub decides whether we are who we say we
are, and then returns us to the application that requested access.

> **Note**
> 
> There are many OAuthbenefits of benefits ofbenefits to using OAuth.
> GitHub provides the application with what is called an OAuth token
> that encapsulates exactly what services on GitHub we have access to,
> and whether that access is read-only or whether we can add data in a
> read-write manner. This means our requesting service can ask to modify
> only parts of our data within GitHub; this provides a much higher
> level of trust to users as they know the application cannot touch the
> more private parts within GitHub. Specifically, this means we could
> ask for access only to gists and not request access to our
> repositories. One important point about OAuth tokens is that they can
> be revoked. So, once a specific action has been taken, we can destroy
> the token and revoke access. With simple username and password access,
> the only way to revoke access is to change the password, which means
> any place you have saved that password (password managers or other
> applications that log in via username and password) need to update
> their settings as well. With OAuth we can revoke a single token at any
> time (and GitHub makes it easy to do this) without affecting access to
> other services.

Let’s modify our application to use OAuth.

## Authentication Requires a Server

authenticationfor coffee shop database
appid=ix\_chapter-04-javascript-asciidoc16
id=ix\_chapter-04-javascript-asciidoc16range=startofrange
range=startofrangeUp until now we have been able to publish all our
files into GitHub, and they are hosted for us by GitHub. Sadly the
authentication component cannot be hosted on GitHub. Somehow we need to
safely authenticate our user into GitHub and retrieve an OAuth token.
There is currently no way to do this strictly client side (using only
static HTML and JavaScript running in the browser). Other authentication
providers like Facebook do provide pure JavaScript login functionality
in their SDKs, but GitHub, citing security concerns, has not released
anything that does authentication purely on the client side as of yet.

Somehow we have to involve a server into our authentication process. The
most obvious choice we have is to run a small authentication server,
delegate authentication to it, and once authentication is completed,
jump back in our application hosted on GitHub. We provide code (written
in NodeJS, JavaScript for the server side) to do this in the associated
repository for this chapter. But creating even a simple authentication
system has a baseline of complexity that seems like overkill. If we
could instead delegate this authentication to a third party, we could
reduce a massive amount of code and complexity from our system.

## Fixing Authentication with Firebase

Firebasefixing authentication
withid=ix\_chapter-04-javascript-asciidoc17
id=ix\_chapter-04-javascript-asciidoc17range=startofrange
range=startofrangeInstead of writing our own server to manage
authentication and talk to the GitHub API, we will delegate that
authentication to Firebase. Firebase is a real-time communication
toolset that integrates well with our choice of AngularJS. By far the
simplest and safest option, Firebase offers AngularJS bindings (called
"AngularFire") and an integrated GitHub authentication component (called
"Simple Login"). Together they resolve the authentication issue for us,
and keep all our code hosted on GitHub. Delegation of our authentication
component is easy with Firebase: we just modify our existing GitHub
application, provide the credentials and GitHub OAuth scope to Firebase,
and then our application offloads user management to Firebase.

First, we need to create a new GitHub application. In the top-right
corner on GitHub.com, click on the "Account settings" link, and then
navigate to the "Applications" link toward the bottom. Click the
"Developer Applications" tab in the right center column and then click
the "Register new application" button. Make sure "Authorization callback
URL" is set to *<https://auth.firebase.com/auth/github/callback>*. Then
save the application by clicking the "Register application" button as
shown in
[figure\_title](#a_new_github_application_for_oauth).range=endofrangestartref=ix\_chapter-04-javascript-asciidoc17
startref=ix\_chapter-04-javascript-asciidoc17

![A new GitHub application for OAuth](images/btwg_09in07.png)

Now, create an account on Firebase. Once you have done this, create a
new app called "CoffeeTech" inside Firebase. The APP URL needs be
unique, so use "coffeetech-\<USERNAME\>", replacing USERNAME with your
GitHub username. Once you have created the app, click the "View
Firebase" button. You’ll then see a settings screen, and click "Simple
Login" and then "GitHub" as shown in
[figure\_title](#creating_the_firebase_hosted_login).

![Creating the Firebase hosted login](images/btwg_09in08.png)

Then, copy your GitHub client ID and secret to the sections inside the
Firebase Simple Login settings for the GitHub provider. Make sure the
"enabled" checkbox is checked to enable the provider.

We’ve now established a login application on GitHub, configured it to
use the Firebase service, and have properly configured Firebase to use
that GitHub application. We want all functionality, especially external
services, to be covered by tests, so we’ll write that test coverage
next.range=endofrangestartref=ix\_chapter-04-javascript-asciidoc16
startref=ix\_chapter-04-javascript-asciidoc16

## Testing Firebase

Firebasetestingid=ix\_chapter-04-javascript-asciidoc18
id=ix\_chapter-04-javascript-asciidoc18range=startofrange
range=startofrangetestingFirebaseid=ix\_chapter-04-javascript-asciidoc19
id=ix\_chapter-04-javascript-asciidoc19range=startofrange
range=startofrangeSince we load Firebase from its CDN, we first need to
mock out the `Firebase` constructor using a simple shim. Put the
following into a file called *firebase-mock.js*:

``` javascript
var Firebase = function (url) {
}

angular.module( 'firebase', [] );
```

To test our code, we make the following changes to our
*coffeetech-annotate.spec.js*:

``` javascript
beforeEach( module( "coffeetech" ) );

var mockFirebase = mockSimpleLogin = undefined;
function generateMockFirebaseSupport() { 
    mockFirebase = function() {};
    mockSimpleLogin = function() {
        return {
            '$login': function() {
                return { then: function( cb ) {
                    cb( { name: "someUser",
                          accessToken: "abcdefghi" } );
                } };
            }
        }
    };
}

var $timeout;
beforeEach( inject( function ($controller, $rootScope, $injector ) {
    generateMockRepositorySupport();
    generateMockPrompt();
    generateMockFirebaseSupport(); 
    $timeout = $injector.get( '$timeout' );
    scope = $rootScope.$new();
    ctrl = $controller( "GithubCtrl",
       { $scope: scope,
         Github: ghs,
         '$timeout': $timeout,
         '$window': prompter,
         '$firebase': mockFirebase,
         '$firebaseSimpleLogin': mockSimpleLogin } ); 
} ) );


describe( "#annotate", function() {
    it( "should annotate a shop", function() {
        scope.auth = mockSimpleLogin( mockFirebase() ); 
        scope.city = PORTLAND
        var shop = { name: "A coffeeshop" }
        scope.annotate( shop );
        expect( prompter.prompt.calls.length ).toEqual( 1 ); 
        expect( scope.shopToAnnotate ).toBeTruthy();
        expect( scope.username ).not.toBeFalsy();
        expect( scope.annotation ).not.toBeFalsy();

        expect( repo.fork ).toHaveBeenCalled();
        expect( scope.waiting.state ).toEqual( "forking" );
        $timeout.flush();

        expect( scope.forkedRepo ).toBeTruthy();
        expect( repo.read ).toHaveBeenCalled();
        expect( repo.write ).toHaveBeenCalled();
        expect( repo.createPullRequest ).toHaveBeenCalled();
        expect( scope.waiting.state ).toEqual( "annotated" );
        $timeout.flush();

        expect( scope.waiting ).toBeFalsy();
```

  - We add a `generateMockFirebaseSupport()` function that creates the
    mock firebase and simple login objects.

  - We call this method to initialize the mocks.

  - In our test we use the `$controller` method instantiator to inject
    these mock objects instead of letting AngularJS inject the real
    ones. We should modify our other spec file as well now that we are
    changing the required injections for any controller.

  - We change our `#annotate` test and create the auth object (normally
    created inside the initialization).

  - We prompt only once for the data to annotate (we don’t need to
    prompt for username and password any
    longer).range=endofrangestartref=ix\_chapter-04-javascript-asciidoc19
    startref=ix\_chapter-04-javascript-asciidoc19range=endofrangestartref=ix\_chapter-04-javascript-asciidoc18
    startref=ix\_chapter-04-javascript-asciidoc18

## Implementing Firebase Login

Firebaseimplementing login withid=ix\_chapter-04-javascript-asciidoc20
id=ix\_chapter-04-javascript-asciidoc20range=startofrange
range=startofrangeloginwith
Firebaseid=ix\_chapter-04-javascript-asciidoc21
id=ix\_chapter-04-javascript-asciidoc21range=startofrange
range=startofrangeNow, add Firebase support to our AngularJS
application. Add the references to the Firebase support libraries right
after AngularJS is loaded:

``` html
<script src="angular.js"></script>
<script src='https://cdn.firebase.com/v0/firebase.js'></script>
<script
  src='https://cdn.firebase.com/libs/angularfire/0.6.0/angularfire.min.js'>
</script>
<script
  src='https://cdn.firebase.com/js/simple-login/1.2.5/firebase-simple-login.js'>
</script>
```

We need to adjust our *coffeetech.js* file in a few ways. First, import
the Firebase into our AngularJS module. Also, our original OAuthfor
coffee shop database app login for coffee shop database app loginGitHub
service expected username and password as parameters, but we are now
using a slightly different signature for OAuth tokens:

``` javascript
var mod = angular.module( 'coffeetech', [ 'firebase' ] );

mod.factory( 'Github', function() {
    return {
        create: function(token) {
            return new Github( { token: token, auth: 'oauth' } );
        }
    };
});
```

When we instantiate our controller, we need to inject `Firebase` and
`FirebaseSimpleLogin` and initialize them inside our `init`
method:

``` javascript
mod.controller( 'GithubCtrl', [ '$scope', 'Github', 'Geo', '$window', '$timeout',
    '$firebase', '$firebaseSimpleLogin',
    function( $scope, ghs, Geo, $window, $timeout,
        $firebase, $firebaseSimpleLogin ) {

    $scope.init = function() {

        var ref = new Firebase( 'https://coffeetech.firebaseio.com' );
        $scope.auth = $firebaseSimpleLogin( ref );

        $scope.getCurrentLocation( function( position ) {
            $scope.latitude = position.coords.latitude;
```

Then, when we annotate, we need to provide the auth token returned from
Firebase. But it is gratifying to see that little else needs to change
in our flow:

``` javascript
$scope.annotate = function( shop ) {
    $scope.shopToAnnotate = shop;

    $scope.auth.$login( 'github', { scope: 'repo' } ).then(
      function( user ) { 

        $scope.me = user;
        $scope.username = user.name;

        $scope.annotation = $window.prompt( "Enter data to add" ); 

        if( $scope.annotation ) {
            gh = ghs.create( $scope.me.accessToken ); 
            toFork = gh.getRepo( "xrd", "spa.coffeete.ch" );
            toFork.fork( function( err ) {
```

  - We call the `$login` method on our auth object created using the
    Firebase SimpleLogin service. It returns a "promise," which is an
    interface that has a `then()` method that will be called if the
    `$login()` succeeds. `then()` calls our callback function, giving us
    a user object.

  - We still need to prompt the user for one piece of information—the
    data to annotate. You can imagine other ways to get this
    information, using modal HTML5 dialogs, but this will work for us
    for right now. At least we are only prompting once instead of three
    times\!

  - Once we are ready to fork we need to create our user object using
    the token.

After we make these changes, we can click the "Add factoid" button and
we’ll get a dialog like
[figure\_title](#the_final_step_in_the_permission_flow) indicating we
are logging in to GitHub (via the Firebase SimpleLogin).

![The final step in the permission flow for GitHub access using
Firebase](images/btwg_09in09.png)

After you authorize the application, the execution flow is identical to
the prior authentication flow (using username and password). As an
optimization we could check for previous logins before calling
`$login()` again, but we don’t do that here, meaning the login dialog
momentarily pops up each time we click the button.

Once users have logged in, they will be redirected to the application,
and we’ll notify them that they have submitted a pull request with their
contribution. Since their contribution is associated with their GitHub
account, they will receive standard pull request notifications when
their contribution is
acceptedrange=endofrangestartref=ix\_chapter-04-javascript-asciidoc21
startref=ix\_chapter-04-javascript-asciidoc21range=endofrangestartref=ix\_chapter-04-javascript-asciidoc20
startref=ix\_chapter-04-javascript-asciidoc20, so we don’t need to
implement that
ourselvesrange=endofrangestartref=ix\_chapter-04-javascript-asciidoc15
startref=ix\_chapter-04-javascript-asciidoc15.range=endofrangestartref=ix\_chapter-04-javascript-asciidoc14
startref=ix\_chapter-04-javascript-asciidoc14range=endofrangestartref=ix\_chapter-04-javascript-asciidoc13
startref=ix\_chapter-04-javascript-asciidoc13

# Summary

We’ve built an application in JavaScript that requires no server and
provides users with a searchable coffee shop database that accepts
contributions in a very safe and secure way using the Pull Request API.
We were able to completely ignore all the administrative features of a
data entry system, delegating all these to GitHub. Our single-page app
permits us to focus on one thing: making a powerful and useful
applicationrange=endofrangestartref=ix\_chapter-04-javascript-asciidoc1
startref=ix\_chapter-04-javascript-asciidoc1.range=endofrangestartref=ix\_chapter-04-javascript-asciidoc0
startref=ix\_chapter-04-javascript-asciidoc0

# Ruby and Jekyll

Jekyllid=ix\_chapter-05-jekyll-asciidoc0range=startofrange
id=ix\_chapter-05-jekyll-asciidoc0range=startofrange
range=startofrangeThe Jekyll project calls itself a "blog-aware, static
site generator in Ruby." At its core, Jekyll is a very simple set of
technologies for building websites. Simplicity is what gives Jekyll its
power: using Jekyll you will never have to learn about database
backends, complicated server installations, or any of the myriad
processes involved with most monolithic website technologies. Many
prominent technical bloggers use Jekyll as their blogging platform.

Like many of the open source technologies in heavy usage at GitHub,
Jekyll was originally developed by Tom Preson Warner, one of the
cofounders of GitHub, and Nick Quaranto, of 37 Signals, though there are
now thousands of contributors to the Jekyll codebase. Unsurprisingly,
the strength of the Jekyll tool comes not from the brilliance of the
original developers or the brilliance of the idea, but the way those
original developers cultivated community and involvement among their
users.

# Learning and Building with Jekyll

In this chapter we will investigate the structure of a Jekyll blog,
illustrating the few major technology pieces involved. Once we have
familiarized ourselves with Jekyll, we will then create a Jekyll blog
from scratch using the command-line tools. Then we will write a Ruby
program that scrapes a blog-like website and converts the scraped
information into a new Jekyll blog.

# What Is Jekyll?

Jekyllbasicsid=ix\_chapter-05-jekyll-asciidoc1
id=ix\_chapter-05-jekyll-asciidoc1range=startofrange
range=startofrangeJekyll specifies a file structure format: conform to
this format and Jekyll will compile your files into HTML. Jekyll builds
on top of two proven tools: Markdownand Jekyll and JekyllMarkdown, a
markup language that is surprisingly readable and expressive, and Liquid
MarkupJekyll and Jekyll andLiquid Markup, a simple programming language
that gives you just enough components to build modern web pages
requiring conditionals and loops, but safe enough that you can run
untrusted pages on public servers. With these two technologies and
agreement on a layout structure, Jekyll can build very complicated
websites paradoxically without requiring a complicated structure of
files and technologies.

Jekyll works natively with GitHub because a Jekyll blog is stored as a
Git repository. When you push files into GitHub from a repository GitHub
recognizes as a Jekyll site, GitHub automatically rebuilds the site for
you. Jekyll is an open source generator and defines a format for your
source files, a format other tools can easily understand and operate
upon. This means you can build your own tools to interact with a Jekyll
blog. Combining an open source tool like Jekyll with a well-written API
like the GitHub API makes for some powerful publishing tools.

## Operating Jekyll Locally

Jekylloperating locally operating locallyjekyll gemTo really use Jekyll,
you’ll need the `jekyll` gem. As we explain in [???](#appendix), we
could install a ruby gem using this command:

``` bash
$ gem install jekyll
```

There are two issues with installing this way. The first is that any
commands we run inside the command line are lost to us and the world
(other than in our private shell history file). The second is that if we
are going to publish any of our sites to GitHub, we will want to make
sure we are matching the exact versions of Jekyll and its dependencies
so that a site that works on our local laptop also works when published
into GitHub. If you don’t take care of this, you’ll occasionally get an
email like this from GitHub:

``` text
 The page build failed with the following error:

 page build failed

 For information on troubleshooting Jekyll see
 https://help.github.com/articles/using-jekyll-with-pages#troubleshooting
 If you have any questions please contact GitHub Support.
```

The fix for these two issues is a simple one. You’ve probably seen other
chapters using a `Gemfile` to install Ruby libraries. Instead of using a
manual command like `bundle` to install from the command line, let’s put
this dependency into the Gemfile. Then, anyone else using this
repository can run the command `bundle install` and install the correct
dependencies. And instead of using the `jekyll` gem directly, use the
`github-pages` gem, which synchronizes your Jekyll gem versions with
those on GitHub. If you do get the preceding email, run the command
`bundle update` to make sure that everything is properly set up and
synchronized and generally this will reproduce the issues on your local
setup, which is a much faster place to fix them:

``` bash
$ printf "gem 'github-pages' >> Gemfile
$ bundle install
```

Creating and managing your dependencies inside a Gemfile is the smart
way to get your Jekyll tool synced with the version running on GitHub.

Now we are ready to create a Jekyll
blog.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc1
startref=ix\_chapter-05-jekyll-asciidoc1

# Jekyll Blog Quick Start

Jekyll blogsid=ix\_chapter-05-jekyll-asciidoc2range=startofrange
id=ix\_chapter-05-jekyll-asciidoc2range=startofrange
range=startofrangeWe have our required tools installed, so Jekyll
blogssimple blog creationid=ix\_chapter-05-jekyll-asciidoc3
id=ix\_chapter-05-jekyll-asciidoc3range=startofrange
range=startofrangelet’s create a simple blog. Run these commands:

``` bash
$ jekyll new myblog
$ cd myblog
```

Thejekyll new
commandid=ix\_chapter-05-jekyll-asciidoc4range=startofrange
id=ix\_chapter-05-jekyll-asciidoc4range=startofrange range=startofrange
`jekyll new` command creates the necessary structure for a minimal
Jekyll blog. Taking a look inside the directory, you’ll see a few files
that comprise the structure of a basic Jekyll blog.

The `jekyll new` command installs two CSS files: one for the blog
(*main.css*) and one for syntax highlighting (*syntax.css*). Remember,
you are in full control of this site; the *main.css* file is simply
boilerplate, which you can completely throw away if it does not suit
your needs. The syntax file helps when including code snippets and
contains syntax highlighting CSS that prettifies many programming
languages.

gitignore fileInstallation of a new blog comes with a *.gitignore* file
as well that contains one entry: \_site. When you use the Jekyll library
to build your site locally, all files are by default built into the
\_site directory. This *.gitignore* file prevents those files from being
included inside your repository as they are overwritten by the Jekyll
command on GitHub when your files are pushed up to GitHub.

> **Note**
> 
> The `jekyll new` command does not create or initialize a new Git
> repository for you with your files. If you want to do this, you will
> need to use the `git init` command. The Jekyll initialization command
> does create the proper structure for you to easily add all files to a
> Git repository; just use `git add .; git commit` and your *.gitignore*
> file will be added and configure your repository to ignore unnecessary
> files like the \_site
> range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc4
> startref=ix\_chapter-05-jekyll-asciidoc4directory.

All your blog posts are stored in the \_posts directory. Jekyll sites
are not required to have a \_posts directory (you can use Jekyll with
any kind of static site) but if you do include files in this directory
Jekyll handles them in a special way. If you look in the \_posts
directory now, you see that the Jekyll initialization command has
created your first post for you, something like
\_posts/2014-03-03-welcome-to-jekyll.Markdown. These posts have a
special naming format: the title of the post (with any whitespace
replaced with hyphens) trailed by the date and then an extension (either
*.Markdown* or *.md* for Markdown files, or *.textile* for Textile).

Your new Jekyll blog also comes with a few HTML files: an *index.html*
file, which is the starting point for your blog, and several layout
files, which are used as wrappers when generating your content. If you
look in the \_layouts directory, notice there is a file named
*default.html* and another named *post.html*. These files are the layout
files, files that are wrapped around all generated content, like those
from your Markdown-formatted blog posts. For example, the *post.html*
file is wrapped around the generated content of each file stored inside
the \_posts directory. First, the markup content is turned into HTML and
then the layout wrapper is applied. If you look inside each of the files
inside the \_layouts directory, you will see that each contains a
placeholder with `{{ content }}`. This placeholder is replaced with the
generated content from other files.

These placeholders are actually a markup language on their Liquid
Markuporigins originsown: *Liquid Markup*. Liquid Markup was developed
and open sourced by Shopify.com. Liquid Markup arose from a desire to
have a safe way to host programmatic constructs (like loops and
variables) inside a template, without exposing the rendering context to
a full-fledged programming environment. Shopify wanted to create a way
for untrusted users of its public-facing systems to upload dynamic
content but not worry that the markup language would permit malicious
activity; for example, given a full-fledged embedded programming
language, Shopify would open itself to attack if a user wrote code to
open network connections to sites on its internal networks. Templating
languages like PHP or ERB (embedded Ruby templates, popular with the
Ruby on Rails framework) allow fully embedded code snippets, and while
this is very powerful when you have full control over your source
documents, it can be dangerous to provide a mechanism where that
embedded code could look like `system("rm -rf /")`. Liquid Markup
provides many of the benefits of embedded programming templates, without
the dangers. We will show several examples of Liquid Markup and how they
work later in the chapter.

Lastly, your Jekyll directory has a special file called \_config.yml.
This is the Jekyll configuration file. Peering into it, you’ll see it is
very basic:

``` yaml
name: Your New Jekyll Site
markdown: redcarpet
highlighter: pygments
```

We only have three lines to contend with and they are simple to
understand: the name of our site, the Markdown parser used by our Jekyll
command, and whether to use `pygments` to do syntax highlighting.

To view this site locally run this command:

``` bash
$ jekyll serve
```

This command builds the entirety of your Jekyll directory, and then
starts a mini web server to serve the files up to you. If you then visit
*<http://localhost:4000>* in your web browser, you will see something on
the front page of your site and a single blog post listed in the index,
as shown in [figure\_title](#bare-jekyll-site).

![A bare Jekyll site](images/btwg_0601.png)

Clicking into the link inside the "Blog Posts" section, you will then
see your first post, as in [figure\_title](#a-sample-post).

![A sample post](images/btwg_0602.png)

Our Jekyll initialization command created this new post for us. This
page is backed by the Markdown file inside the \_posts directory we saw
earlier:

``` yaml
---
layout: post
title:  "Welcome to Jekyll!"
date:   2014-03-03 12:56:40
categories: jekyll update
---
```

You’ll find this post in your \_posts directory—edit this post and
rebuild (or run with the `-w` switch) to see your changes\! To add new
posts, simply add a file in the \_posts directory that follows the
convention: YYYY-MM-DD-name-of-post.ext.

Jekyll also offers powerful support for code snippets:

``` liquid
{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}
```

Check out the [Jekyll docs](http://jekyllrb.com) for more info on how to
get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s
GitHub repo](https://github.com/mojombo/jekyll).

Hopefully you agree that this is a fairly intuitive and readable
alternative to raw HTML. This simplicity and readability is one of the
major benefits of using Jekyll. Your source files maintain a readability
that allows you to focus on the content itself, not on the technology
that will eventually make them beautiful. Let’s go over this file and
investigate some of the important pieces.

## YFM: YAML Front Matter

Jekyll blogsYAML Front Matter YAML Front MatterYFM (YAML Front
Matter)The first thing we see in a Jekyll file is the YAML Front Matter
(YFM):

``` yaml
---
layout: post
title:  "Welcome to Jekyll!"
date:   2014-03-03 12:56:40
categories: jekyll update
---
```

YFM is a snippet of YAML ("YAML Aint Markup Language") delimited by
three hyphens on both the top and bottom. YAML is a simple structured
data serialization language used by many open source projects instead of
XML. Many people find it more readable and editable by humans than XML.
The YFM in this file shows a few configuration options: a layout, the
title, the date, and a list of categories.

The layout specified references one of the files in our \_layouts
directory. If you don’t specify a layout file in the YFM, then Jekyll
assumes you want to use a file called *default.html* to wrap your
content. You can easily imagine adding your own custom layout files to
this directory and then overriding them in the YFM. If you look at this
file, you see that it manually specifies the `post` layout.

The title is used to generate the `<title>` tag and can be used anywhere
else you need it inside your template using the double-braces syntax
from Liquid Markup: `{{ page.title }}`. Notice that any variable from
the \_config.yml file is prefixed with the `site.` namespace, while
variables from your YFM are prefixed with `page.` Though the title
matches the filename (after replacing spaces with hyphens), changing the
title in the YFM does not affect the name of the URL generated by
Jekyll. If you want to change the URL, you need to rename the file
itself. This is a nice benefit if you need to slightly modify the title
and don’t want to damage preexisting URLs.

The date and categories are two other variables included in the YFM.
They are completely optional and strangely unused by the structure and
templates created by default using the Jekyll initializer. They do
provide additional context to the post, but are only stored in the
Markdown file and not included inside the generated content itself. The
categories list is often used to generate an index file of categories
with a list of each post included in a category. If you come from a
Wordpress background, you’ll likely have used categories. These are
generated dynamically from the MySQL database each time you request a
list of them, but in Jekyll this file is statically generated. If you
wanted something more dynamic, you could imagine generating a JSON file
with these categories and files, and then building a JavaScript widget
that requests this file and then does something more interactive on the
client side. Jekyll can take any template file and convert it to JSON
(or any other format)—you are not limited to just generating HTML files.

YFM is completely optional. A post or page can be rendered into your
Jekyll site without any YFM inside it. Without YFM, your page is
rendered using the defaults for those variables, so make sure the
default template, at the very least, is what you expect will wrap around
all pages left with unspecified layouts.

published variableOne important default variable for YFM is the
published variable. This variable is set to true by default. This means
that if you create a file in your Jekyll repository and do not manually
specify the published setting, it will be published automatically. If
you set the variable to false, the post will not be published. With
private repositories you can keep the contents of draft posts entirely
private until writing has completed by making sure published is set to
false. Unfortunately, not all tools that help you create Jekyll Markdown
files remember to set the published variable explicitly inside of YFM,
so make sure you check before committing the file to your repository if
there is something you don’t yet want published.

## Jekyll Markup

Jekyll blogsmarkup markupMarkdownand Jekyll markup and Jekyll
markupGoing past the YFM, we can start to see the structure of Markdown
files. Markdown files can be, at their simplest, just textual
information without any formatting characters. In fact, if your layout
files are well done, you can definitely create great blog posts without
any fancy formatting, just pure textual content.

But with a few small Markdown additions, you can really make posts
shine. One of the first Markdown components we notice is the backtick
character, which is used to wrap small spans of code (or code-ish
information, like filenames in this case). HTMLMarkdown shortcuts for
Markdown shortcuts forAs you use more and more Markdown, you’ll find
Markdown to be insidiously clever in the way it provides formatting
characters without the onerous weight that HTML requires to offer the
same explicit formatting.

linksMarkdown tags for Markdown tags forLinks can be specified using
`[format][link]`, where `link` is the fully qualified URL (like
"*<http://example.com>*"), or a reference to a link at the bottom of the
page. In our page we have two references, keyed as `jekyll-gh` and
`jekyll`; we can then use these inside our page with syntax like
`[Jekyll’s GitHub repo][jekyll-gh]`. Using references has an additional
benefit in that you can use the link more than once by its short name.

headersMarkdown tags for Markdown tags forThough not offered in the
sample, Markdown provides an easy way to generate headers of varying
degrees. To add a header, use the `  ` character, and repeat the
`</emphasis>` character to build smaller headers. These delimiters
simply map to the H tag; two hash characters (`  `) turns into an `<h2>`
tag. Building text enclosed by `<h3>` tags looks like `</emphasis># Some
Text`. You can optionally match the same number of hash symbols at the
end of the line if you find it more expressive (`#
Some Text #`), but you don’t have to.

Markdown offers easy shortcuts for most HTML elements: numbered and
unordered lists, emphasis, and more. And, if you cannot find a Markdown
equivalent, you can embed normal HTML right next to Markdown formatting
characters. The best way to write Markdown is to keep a [Markdown cheat
sheet](https://github.com/adam-p/Markdown-here/wiki/Markdown-Cheatsheet)
near you when writing. [John Gruber from Daring
Fireball](http://daringfireball.net) invented Markdown, and his site has
a more in-depth description of the how and why of Markdown.

## Using the Jekyll Command

Jekyllusing the Jekyll command using the Jekyll commandjekyll ––help
commandRunning `jekyll --help` will show you the options for running
Jekyll. You already saw the `jekyll serve` command, which builds the
files into the \_site directory and then starts a web server with its
root at that directory. If you start to use this mechanism to build your
Jekyll sites then there are a few other switches you’ll want to learn
about.

Jekyllwatch switch watch switchwatch switchIf you are authoring and
adjusting a page often, and switching back into your browser to see what
it looks like, you’ll find utility in the `-w` switch ("watch"). This
can be used to automatically regenerate the entire site if you make
changes to any of the source files. If you edit a post file and save it,
that file will be regenerated automatically. Without the `-w` switch you
would need to kill the Jekyll server, and then restart it.

> **Caution**
> 
> The Jekyll watch switch does reload all HTML and markup files, but
> does not reload the \_config.yml file. If you make changes to it, you
> will need to stop and restart the server.

If you are running multiple Jekyll sites on the same laptop, you’ll
quickly find that the second instance of `jekyll serve` fails because it
cannot open port 4000. In this case, use `jekyll --port 4010` to open
port 4010 (or whatever port you wish to use instead).

## Privacy Levels with Jekyll

Jekyllprivacy levels with privacy levels withprivacy, JekyllJekyll
repositories on GitHub can be either public or private repositories. If
your repository is public you can host public content generated from the
Jekyll source files without publishing the source files themselves.
Remember, as noted previously, that any file without `publishing: false`
inside the YFM will be made public the moment you push it into your
repository.

## Themes

Jekyllthemes themesthemes, JekyllJekyll does not support theming
internally, but it is trivial to add any CSS files or entire CSS
frameworks. You can also fork an existing Jekyll blog that has the
theming you like. We will show how and where to add your own customized
CSS later in the chapter.

## Publishing on GitHub

Jekyll blogspublishing on GitHub publishing on GitHubOnce you have your
blog created, you can easily publish it to GitHub. There are two ways
you can publish Jekyll blogs:

  - As a github.io site

  - On a domain you own

GitHub offers free personal blogs that are hosted on the github.io
domain. And you can host any site with your own domain name with a
little bit of configuration.

### Using a GitHub.io Jekyll blog

GitHub.io personal blog siteJekyll blogsGitHub.io site creation
GitHub.io site creationTo create a github.io personal blog site, your
Jekyll blog should be on the master branch of your Git repository. The
repository should be named `username.github.io` on GitHub. If everything
is set up correctly you can then publish your Jekyll blog by adding a
remote for GitHub and pushing your files up. If you use the `hub` tool
(a command for interacting with Git and GitHub), you can go from start
to finish with a few simple commands. Make sure to change the first line
to reflect your username.

> **Note**
> 
> Thehub tool hub tool was originally written in Ruby and as such could
> be easily installed using only `gem install hub`, but hub was recently
> rewritten in Go. Go has a somewhat more complicated installation
> process, so we won’t document it here. If you have the `brew` command
> installed for OS X, you can install hub with the `brew install hub`
> command. Other platforms vary, so check <http://github.com/github/hub>
> to determine the best way for your system.

Use these commands to install your github.io hosted Jekyll blog:

``` bash
$ export USERNAME=xrd
$ jekyll new $USERNAME.github.io
$ cd $USERNAME.github.io
$ git init
$ git commit -m "Initial checkin" -a
$ hub create  # You'll need to login here...
$ sleep $((10*60)) && open $USERNAME.github.io
```

The second to the last line creates a repository on GitHub for you with
the same name as the directory. That last line sleeps for 10 minutes
while your github.io site is provisioned on GitHub, and then opens the
site in your browser for you. It can take ten minutes for GitHub to
configure your site the first time, but subsequent content pushes will
be reflected immediately.

## Hosting On Your Own Domain

Jekyll blogshosting your own domainid=ix\_chapter-05-jekyll-asciidoc5
id=ix\_chapter-05-jekyll-asciidoc5range=startofrange
range=startofrangeTo host a blog on your own domain name, you need to
use the `gh-pages` branch inside your repository. You need to create a
CNAME file in your repository, and then finally establish DNS settings
to point your domain to the GitHub servers.

### The gh-pages branch

gh–pages branchJekyll blogshosting via gh–pages branch hosting via
gh–pages branchTo work on the gh-pages branch, check it out and create
the branch inside your repository:

``` bash
$ git checkout -b gh-pages
$ rake post title="My next big blog post"
$ git add _posts
$ git commit -m "Added my next big blog post"
$ git push -u origin gh-pages
```

You will need to always remember to work on the gh-pages branch; if this
repository is only used as a blog, then this probably is not an issue.
Adding the `-u` switch will make sure that Git always pushes up the
gh-pages branch whenever you do a push.

### The CNAME file

CNAME fileJekyll blogsand CNAME file and CNAME fileThe CNAME file is a
simple text file with the domain name inside of it:

``` bash
$ echo 'mydomain.com' > CNAME
$ git add CNAME
$ git commit -m "Added CNAME"
$ git push
```

Once you have pushed the CNAME file to your repository, you can verify
that GitHub thinks the blog is established correctly by visiting the
admin page of your repository. An easy way to get there is using the
`github` gem, which is no longer actively maintained but is still a
useful command-line tool:

``` bash
$ gem install github
$ github admin # Opens up https://github.com/username/repo/settings
```

The github gem is a useful command-line tool, but unfortunately it is
tied to an older version of the GitHub API, which means the documented
functionality is often incorrect.

If your blog is correctly set up, you will see something like
[figure\_title](#settings-jekyll-blog) in the middle of your settings
page.

![Settings for a Jekyll blog](images/btwg_0603.png)

GitHub has properly recognized the CNAME file and will accept requests
made to that host on its servers. We are still not yet complete,
however, in that we need to make sure the DNS is established for our
site.

### DNS settings

DNS settingsJekyll blogsDNS settings DNS settingsGenerally, establishing
DNS settings for your site is straightforward. subdomain, DNS setup
withIt is easiest if you are setting up DNS with a *subdomain* as
opposed to an *apex domain*. To be more concrete, an apex domainsapex
domain is a site like *mypersonaldomain.com*, while a subdomain would be
*blog.mypersonaldomain.com*.

Setting up a blog on a subdomain is simple: create a CNAME record in DNS
that points to *username.github.io*.

For an apex domain, things are slightly more complicated. You must
create DNS A records to point to these IP addresses: `192.30.252.153`
and `192.30.252.154`. These are the IP addresses right now; there is
always the possibility that GitHub could change these at some point in
the future. For this reason, hosting on apex domains is risky. If GitHub
needed to change its IP addresses (say during a denial-of-service
attack), you would need to respond to this, and deal with the DNS
propagation issues. If you instead use a subdomain, the CNAME record
will automatically redirect to the correct IP even if it is changed by
GitHubrange=endofrangestartref=ix\_chapter-05-jekyll-asciidoc5
startref=ix\_chapter-05-jekyll-asciidoc5.\[3\]

# Importing from Other Blogs

Jekyll blogsimporting from other blogs
intoid=ix\_chapter-05-jekyll-asciidoc6
id=ix\_chapter-05-jekyll-asciidoc6range=startofrange
range=startofrangeThere are many tools that can be used to import an
existing blog into Jekyll. As Jekyll is really nothing more than a
file-layout convention, you just need to pull the relevant pieces (the
post itself, and associated metadata like the post title, publishing
date, etc.) and then write out a file with those contents. Jekyll blogs
prefer Markdown, but they work fine with HTML content, so you can often
convert a blog with minimal effort, and there are good tools that
automate things for
you.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc6
startref=ix\_chapter-05-jekyll-asciidoc6

## From Wordpress

Wordpressimporting into Jekyll blogs from importing into Jekyll blogs
fromThe most popular importer is the Wordpress importer. You will need
the 'jekyll-import' gem. This gem is distributed separately from the
core Jekyll gem, but will be installed if you use the `github-pages` gem
inside your Gemfile and use the `bundle` command.

### Importing with direct database access

Wordpressimporting with direct database access importing with direct
database accessOnce you have the `jekyll-import` gem, you can convert a
Wordpress blog using a command like this:

``` bash
$ ruby -rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::WordPress.run({
      "dbname"   => "wordpress",
      "user"     => "hastie",
      "password" => "lanyon",
      "host"     => "localhost",
      "status"         => ["publish"]
    })'
```

This command will import from an existing Wordpress installation,
provided that your Ruby code can access your database. This will work if
you can log in to the server itself and run the command on the server,
or if the database is accessible across the network (which is generally
bad practice when hosting Wordpress\!).

Note the status option: this specifies that imported pages and posts are
published automatically. More specifically, the YAML for each file will
specify `published: true`, which will publish the page or post into your
blog. If you want to review each item individually, you can specify a
status of `private`, which will export the pages into Jekyll but leave
them unpublished. Remember that if your repository is public, posts
marked as unpublished will not be displayed in the blog but can still be
seen if someone visits your the repository for your blog on GitHub.

There are many more options than listed here. For example, by default,
the Wordpress-Jekyll importer imports categories from your Wordpress
database, but you can turn this off by specifying `"categories" ⇒
false`.

### Importing from the Wordpress XML

Wordpressimporting database as XML file importing database as XML
fileAnother alternative is to export the entire database as an XML file.
Then, you can run the importer on that file:

``` bash
ruby -rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::WordpressDotCom.run({
      "source" => "wordpress.xml",
      "no_fetch_images" => false,
      "assets_folder" => "assets"
    })'
```

This can be used to export files from a server you don’t maintain, but
works with sites you do maintain and might be a more plausible option
than running against a database.

To export the XML file, visit the export page on your Wordpress site.
This is usually mapped to */wp-admin/export.php*, so it will be
something like *<https://blogname.com/wp-admin/export.php>* (replacing
“blogname.com” with your blog’s name).

Like many free tools, there are definitely limitations to using this
method of export. If your Wordpress site is anything beyond the simplest
of Wordpress sites, then using this tool to import from Wordpress means
you will lose much of the metadata stored inside your blog. This
metadata can include pages, tags, custom fields, and image attachments.

ExitwpIf you want to keep this metadata, then you might consider another
import option like Exitwp. Exitwp is a Python tool that provides a much
higher level of fidelity between the original Wordpress site and the
final Jekyll site, but has a longer learning curve and option set.

## Exporting from Wordpress Alternatives

If you use another blog format other than Wordpress, chances are there
is a Jekyll importer for it. Jekyll has dozens of importers, well
documented on the [Jekyll importer site](http://import.jekyllrb.com).

Jekyll blogsimporting from Tumblr importing from TumblrTumblrFor
example, this command-line example from the importer site exports from
Tumblr blogs:

``` ruby
$ ruby -rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::Tumblr.run({
      "url"            => "http://myblog.tumblr.com",
      "format"         => "html", 
      "grab_images"    => false,  
      "add_highlights" => false,  
      "rewrite_urls"   => false   
    })'
```

The Tumblr import plug-in has a few interesting options.

  - Write out HTML; if you prefer to use Markdown use `md`.

  - This importer will grab images if you provide a true value.

  - Wrap code blocks (indented four spaces) in a Liquid Markup
    "highlight" tag if this is set to true.

  - Write pages that redirect from the old Tumblr paths to the new
    Jekyll paths using this configuration option.

Exporting from Tumblr is considerably easier than Wordpress. The Tumblr
exporter scrapes all public posts from the blog, and then converts to a
Jekyll-compatible post
format.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc3
startref=ix\_chapter-05-jekyll-asciidoc3

We’ve seen how we can use the importers available on import.jekyllrb.com
to import. What if we have a nonstandard site we need to import?

# Scraping Sites into Jekyll

Jekyll blogsscraping sites intoid=ix\_chapter-05-jekyll-asciidoc7
id=ix\_chapter-05-jekyll-asciidoc7range=startofrange
range=startofrangescrapinginto Jekyllid=ix\_chapter-05-jekyll-asciidoc8
id=ix\_chapter-05-jekyll-asciidoc8range=startofrange
range=startofrangeJekyll provides various importers that make it easy to
convert an existing blog into a Jekyll blog. But if you have a
nonstandard blog, or a site that is not a blog, you still have options
for migrating it to Jekyll. The first option is to write your own
importer by perusing the [source of the Jekyll importers on
GitHub](http://github.com/jekyll/jekyll-import). This is probably the
right way to build an importer if you plan on letting others use it, as
it will extend several Jekyll importer classes already available to make
importing standard for other contributors.

Another option is to simply write out files in the simple format that is
a Jekyll blog. This is much lazier than reading through the Jekyll tools
and their libraries, of course. I started as a Perl programmer and
always loved this quote from Larry Wall, the creator of Perl: "We will
encourage you to develop the three great virtues of a programmer:
laziness, impatience, and hubris." Let’s accept our inherent laziness
and choose the second route. We’ll write some code to scrape a site and
make a new Jekyll site from scratch, learning about the structure of a
Jekyll blog through trial and error.

While living in Brazil in 2000 I built a site called ByTravelers.com, an
early travel blog. At some point, I sadly lost the database and thought
the site contents were completely gone. Almost by accident, I happened
upon ByTravelers on Archive.org, the Internet Archive. I found that
almost all of the articles were listed there and available. Though the
actual database is long gone, could we recover the data from the site
using Archive.org?

## Jekyll Scraping Tactics

Jekyll blogsscraping tactics scraping tacticsscrapingtactics tacticsWe
can start by looking at the structure of the archive presented on
Archive.org. Go to Archive.org, enter "bytravelers.com" into the search
box in the middle of the page, and then click "BROWSE HISTORY." You will
see a calendar view that shows all the pages scraped by the Internet
Archive for this site as shown in
[figure\_title](#calendar-view-archive).

![Calendar view of Archive.org](images/btwg_0604.png)

In the middle of 2003 I took down the server, intending to upgrade it to
another set of technologies, and never got around to completing this
migration, and then lost the data. If we click the calendar item on June
6th, 2003, we will see a view of the data that was more or less complete
at the height of the site’s functionality and data. There are a few
broken links to images, but otherwise the site is functionally archived
inside Archive.org ([figure\_title](#calendar-view-bytravelers)).

![Archive of ByTravelers.com on Archive.org](images/btwg_0605.png)

Taking the URL from our browser, we can use this as our starting point
for scraping. Clicking around throughout the site, it becomes evident
that each URL to a journal entry uses a standard format; in other words,
*<http://www.bytravelers.com/journal/entry/56>* indicates the 56th
journal item stored on the site. With this knowledge in hand, we can
iterate over the first hundred or so URLs easily.

## Setting Up

Jekyll blogsscraper setupid=ix\_chapter-05-jekyll-asciidoc9
id=ix\_chapter-05-jekyll-asciidoc9range=startofrange
range=startofrangescrapingsetting up a
scraperid=ix\_chapter-05-jekyll-asciidoc10
id=ix\_chapter-05-jekyll-asciidoc10range=startofrange
range=startofrangeA naive implementation of a scraper would be a single
Ruby file in which the execution and functionality were contained all in
one. However, if we expose the functionality as a class, and then
instantiate the class in a separate file, we can also write tests that
utilize and validate the same steps as the runner script. So, let’s take
this smarter approach and create three files: the scraper class, the
runner class (which instantiates and "runs" our scraper), and the test
file (which instantiates and validates the functionality of our
scraper).

First, the runner script:

``` ruby
#!/usr/bin/env ruby

require './scraper'

scraper = Scraper.new()
scraper.run()
```

Our barebones scraper class just looks like this:

``` ruby
class Scraper
  def run

  end
end
```

We also need to have a manifest file, the Gemfile, where we will
document our library dependencies:

``` ruby
source "https://rubygems.org"

gem "github-pages"
gem "rspec"
```

Then, install our gems using the command `bundle`. That installs the
rspec tool, the Jekyll tool, and associated libraries.

Finally, we can create our test harness:

``` ruby
require './scraper'

describe "#run" do
  it "should run" do
    scraper = Scraper.new
    scraper.run()
  end
end
```

Remember to run using the `bundle exec rspec scraper_spec.rb` command,
which makes everything run inside the bundler context (and load our
libraries from the Gemfile, instead of the default system gems):

``` bash
$ bundle exec rspec scraper_spec.rb
.

Finished in 0.00125 seconds (files took 0.12399 seconds to load)
1 example, 0 failures
```

There is nothing we are explicitly testing yet, but our test harness
displays that our code inside our tests will match closely the code we
write inside our runner
wrapper.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc10
startref=ix\_chapter-05-jekyll-asciidoc10range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc9
startref=ix\_chapter-05-jekyll-asciidoc9

## Scraping Titles

Rubyfor scraping titles for scraping titlesscrapingtitles titlestitles,
scrapingLet’s start with something simple: scraping the titles from the
site. Mechanizeid=ix\_chapter-05-jekyll-asciidoc11range=startofrange
id=ix\_chapter-05-jekyll-asciidoc11range=startofrange
range=startofrangeWe’ll use Ruby to scrape the site; Ruby has some
intuitive gems like mechanize that simplify building web clients. There
is an API for the Internet archive, but I found it flakey and
unreliable, so we’ll just scrape the site. Add these additional lines to
the Gemfile using this command and then install the libraries:

``` bash
$ echo "gem 'mechanize'" >> Gemfile
$ bundle
```

Now we can modify our scraper to use the mechanize gem and retrieve
content from Archive.org:

``` ruby
require 'mechanize' # 

class Scraper

  attr_accessor :root # 
  attr_accessor :agent

  def initialize # 
    @root = "http://web.archive.org/web/20030820233527/" +
    "http://bytravelers.com/journal/entry/" # 
    @agent = Mechanize.new
  end

  def run
    100.times do |i| # 
      url = "#{@root}#{i}" # 
      @agent.get( url ) do |page|
        puts "#{i} #{page.title}"
      end
    end
  end

end
```

  - Require the mechanize library.

  - We use a Ruby method called `attr_accessor`, which creates a public
    instance variable. We can use variables created using
    `attr_accessor` by prefixing the variable name with an `@`
    character. Instance variables are accessible outside the class as
    well.

  - When a method named `initialize` is defined for a class, this method
    is called right after object creation, so this is the appropriate
    place for us to initialize the member variables.

  - Initialize the variables to default values. We store the root of the
    URL to the cached copy of ByTravelers.com here.

  - Our run method runs the block inside 100 times.

  - Our block starts by generating a URL to the specific page, retrieves
    the page, and then prints out the index in our loop plus the title
    of the page object.

Let’s run our scraper and see what happens now:

``` bash
$ bundle exec ./run.rb
...
53 Read Journal Entries
54 Read Journal Entries
55 Read Journal Entries
56 Read Journal Entries
57 Internet Archive Wayback Machine
58 Internet Archive Wayback Machine
...
```

You can see that some of the entries have a generic "Internet Archive
Wayback Machine" while some have "Read Journal Entries." Archive.org
will respond with a placeholder title when it does not have content from
the site (as is the case with item \#58, for example). We should ignore
those pages that don’t have the string "Read Journal Entries" as the
title (which tells us Archive.org does have cached content from our
site).

Now that we have all the content, we can start finding the important
pieces inside and putting them into our Jekyll posts.

## Refinining with Interactive Ruby

interactive Ruby shell (IRB)Ruby IRBscrapingwith Ruby IRB with Ruby
IRBThere are two things that make Mechanize immensely powerful as the
foundation for a scraping tool: easy access to making HTTP calls, and a
powerful searching syntax once you have a remote document. You’ve seen
how Mechanize makes it simple to make a GET request. Let’s explore
sifting through a massive document to get the important pieces of
textual content. We can manually explore scraping using the Ruby IRB
(interactive Ruby shell):

``` ruby
$ irb -r./scraper
2.0.0-p481 :001 > scraper = Scraper.new
 => #<Scraper:0x00000001e37ca8...>
2.0.0-p481 :002 > page = scraper.agent.get "#{scraper.root}#{56}"
 => #<Mechanize::Page {url #<URI::HTTP:0x00000001a85218...>
```

The first line invokes IRB and uses the `-r` switch to load the scraper
library in the current directory. If you have not used IRB before, there
are a few things to know that will make life easier. The IRB has a
prompt, which indicates the version of Ruby you are using, and the index
of the command you are running. IRB has a lot of features beyond what we
will discuss here, but those indexes can be used to replay history and
for job control, like many other types of shells. At the IRB prompt you
can enter Ruby and IRB executes the command immediately. Once the
command executes, IRB prints the result; the characters `⇒` indicate the
return value. When you are playing with Ruby, return values will often
be complex objects: the return value when you use `scraper.agent.get` is
a Mechanize Ruby object. This is a very large object, so printing it out
takes a lot of real estate. We’ve abbreviated the majority of it here,
and will do that for many complex objects to save space when discussing
IRB.

The last command in IRB saves the HTTP GET request as a page object.
Once we have the page, how do we extract information from it? Mechanize
has a nice piece of syntactic sugar that makes it easy to search the DOM
structure: the "/" operator. Let’s try it:

``` bash
2.0.0-p481 :003 > page / "tr"
 => []
```

If our query path had found anything, we would have seen a return value
with an array of Mechanize objects, but in this case we got back an
empty array (which indicates nothing was found). Unfortunately, the
paths vary when the document is loaded into a browser (the browser can
customize the DOM or the server can send slightly different data to the
client). But if we experiment with similar paths inside IRB, we will
find what we need. It helps to jump back and forth between Chrome and
IRB, examining the structure of the HTML inside Chrome and then testing
a search path using IRB. Eventually, we come across this search path:

``` ruby
2.0.0-p481 :004 > items = page /  "table[valign=top] tr"
 => [#<Nokogiri::XML::Element:0xc05670 name="font"
      attributes=[#<Nokogiri::XML::Attr:0xc05328 name="size"
      value="-2">]...
2.0.0-p481 :005 > items.length
 => 5
2.0.0-p481 :006 > items[0].text()
 => "\n\n\n\n\n\n\n\n\n\nBeautiful Belize\n\n\n\n\n\n\n"
2.0.0-p481 :005 > items[0].text().strip
 => "Beautiful Belize"
```

Eureka, we found the pattern that gives us our title. We had to jump
around inside the results from the query, but we can correlate the text
on the page inside the browser with different structures found using the
query inside IRB. It is important to note that we have to strip
whitespace from the title to make it presentable. We can incorporate
this into our scraper code, but this is a good moment to think about how
we can write tests to verify this works properly. And when we start
writing tests, we open the door for another opportunity: caching to our
HTTP requests.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc11
startref=ix\_chapter-05-jekyll-asciidoc11

## Writing Tests and Caching

cachingand scrapingid=ix\_chapter-05-jekyll-asciidoc12
id=ix\_chapter-05-jekyll-asciidoc12range=startofrange
range=startofrangescrapingwriting tests and
cachingid=ix\_chapter-05-jekyll-asciidoc13
id=ix\_chapter-05-jekyll-asciidoc13range=startofrange
range=startofrangeWere we to run our `run.rb` script again, we would
notice that it prints the document title, then halts as it retrieves the
content from the server, and then prints again, stopping and starting
until complete. The content from Archive.org does not change at all
since the original site was scraped years ago, so there is no reason we
need to get the latest content; content even several months stale will
be the same as content retrieved a few moments ago. It seems like a good
opportunity to put a caching layer between us and the code, reducing
impact on Archive.org and making our script run faster. In addition, if
we structure our code to make retrieval and processing happen
independently, we can write tests to verify the processing:

``` ruby
require 'mechanize'
require 'vcr' # 
VCR.configure do |c| # 
  c.cassette_library_dir = 'cached'
  c.hook_into :webmock
end

class Scraper

  attr_accessor :root
  attr_accessor :agent
  attr_accessor :pages # 

  def initialize
    @root = "http://web.archive.org/web/20030820233527/" +
    "http://bytravelers.com/journal/entry/"
    @agent = Mechanize.new
    @pages = [] # 
  end

  def scrape
    100.times do |i|
      begin
        VCR.use_cassette("bt_#{i}") do # 
          url = "#{@root}#{i}"
          @agent.get( url ) do |page|
            if page.title.eql? "Read Journal Entries" # 
              pages << page
            end
          end
        end
      rescue Exception => e
        STDERR.puts "Unable to scrape this file (#{i})"
      end
    end
  end

  def process_title( row )
    row.strip # 
  end

  def run
    scrape()
    @pages.each do |page| # 
      rows = ( page / "table[valign=top] tr" )
      puts process_title( rows[0].text() )
    end
  end

end
```

  - We require the VCR gem: this gem intercepts HTTP requests, sending
    them out normally the first time, and caching all successive calls,
    completely transparent to the user.

  - VCR must be configured when you use it: in this case we specify a
    directory where results will be cached, and tell it what mocking
    library we should use to store the cached results.

  - We establish a new variable called pages. We will scrape all the
    pages into this array (and get them for free once the information is
    cached).

  - Initialize the pages array here.

  - To use the VCR recording feature, we wrap any code that makes HTTP
    requests inside a VCR block with a name specifying the cassette to
    save it under. In this case, we use a cassette named bt (for
    ByTravelers) with the index of the page. The first time we use the
    scraper to request the page, it is retrieved and stored inside the
    cache. Successive calls to the scraper `get` method are retrieved
    from the cached responses.

  - We then look for any titles that look like pages archived into
    Archive.org (using the title to differentiate) and if we find one,
    store that page into our pages array for later processing.

  - We move the title processing into its own method called
    `process_title`. Here we use the information and remove any
    whitespace.

  - Inside of `run` we now call `scrape` to load the pages, and then
    iterate over each page, searching inside them and processing the
    titles.

We need to install the VCR and webmock libraries, so add them to the
Gemfile:

``` bash
$ echo "gem 'vcr'" >> Gemfile
$ echo "gem 'webmock'" >> Gemfile
$ bundle
```

If we run our script using `bundle exec ruby ./run.rb`, we will see it
print out the titles:

``` bash
$ bundle exec ruby ./run.rb
Unable to scrape this file (14)
Unable to scrape this file (43)
Unable to scrape this file (47)
Unable to scrape this file (71)
Unable to scrape this file (94)
Unable to scrape this file (96)
Third day in Salvador
The Hill-Tribes of Northern Thailand
Passion Play of Oberammergau
"Angrezis in Bharat"
Cuba - the good and bad
Nemaste
Mexico/Belize/Guatemala
South Africa
...
```

We print out the errors (when Archive.org does not have a page for a
particular URL). Note that as a side effect of caching, things work much
faster. If we analyze the time we save using the `time` command, we see
these results:

``` bash
$ time bundle exec ruby ./run.rb # before VCR
real    0m29.907s
user    0m2.220s
sys     0m0.170s
$ time bundle exec ruby ./run.rb # after VCR
real    0m3.750s
user    0m3.474s
sys     0m0.194s
```

So, it takes an order of magnitude more time without caching. And, we
get these cached responses for free, and inside our IRB sessions as
well.

The titles look good, but the fourth one is a little worrisome. Looks
like one of the users decided to enclose their title in double quotes.
To control the formatting, it would be nice to clean that up. Let’s do
that, and write tests to verify things work:

``` ruby
require './scraper'

describe "#run" do
  before :each  do
    @scraper = Scraper.new
  end

  describe "#process_titles" do
    it "should correct titles with double quotes" do
      str = ' something " with a double quote'
      expect( @scraper.process_title( str ) ).to_not match( /"/ )
    end

    it "should strip whitespace from titles" do
      str = '\n\n something between newlines \n\n'
      expect( @scraper.process_title( str ) ).to_not match( /^\n\n/ )
    end
  end

end
```

If we run this, we see one test pass and one test fail:

``` bash
$ bundle exec rspec scraper_spec.rb
F.

Failures:

  1) #run #process_titles should correct titles with double quotes
     Failure/Error: expect( @scraper.process_title( ' something " with
     a double quote' ) ).to_not match( /"/ )
       expected "something \" with a double quote" not to match /"/
       Diff:
       @@ -1,2 +1,2 @@
       -/"/
       +"something \" with a double quote"
     # ./scraper_spec.rb:10:in `block (3 levels) in <top (required)>'

Finished in 0.01359 seconds (files took 0.83765 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./scraper_spec.rb:9 # #run #process_titles should correct titles
with double quotes
```

To fix this test, let’s strip out the double quotes by changing one line
in the *scraper.rb* file:

``` ruby
...

def process_title( row )
  row.strip.gsub( /"/, '' )
end

...
```

Now both tests pass. That line of code might be worrisome if you believe
in defensive coding. If this function were called with a nil value, for
example, it would crash. Even if we could guarantee that this situation
would never occur from our calling context, it is better to make our
method safe. Let’s make sure it works and write a test to prove it.

Add a test that asserts there is not an error when the argument to
`process_title` is nil:

``` ruby
...
it "should not crash if the title is nil" do
  expect{ @scraper.process_title( nil ) }.to_not raise_error()
end
...
```

Running `rspec scraper_spec.rb` results in the following error, which we
expect since we have not yet fixed the code:

``` bash
..F..

Failures:

  1) #run #process_titles should not crash if the title is nil
     Failure/Error: expect{ @scraper.process_title( nil ) }.to_not raise_error()
       expected no Exception, got #<NoMethodError: undefined method
     `strip' for nil:NilClass> with backtrace:
         # ./scraper.rb:38:in `process_title'
         # ./scraper_spec.rb:20:in `block (4 levels) in <top (required)>'
         # ./scraper_spec.rb:20:in `block (3 levels) in <top (required)>'
     # ./scraper_spec.rb:20:in `block (3 levels) in <top (required)>'

Finished in 0.00701 seconds
5 examples, 1 failure

Failed examples:

rspec ./scraper_spec.rb:19 # #run #process_titles should not crash if the title
# is nil
```

We can fix it with this one simple change:

``` ruby
...

def process_title( row )
  row.strip.gsub( /"/, '' ) if row
end
...
```

Now we are in a position to write out the files for our actual
posts.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc13
startref=ix\_chapter-05-jekyll-asciidoc13range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc12
startref=ix\_chapter-05-jekyll-asciidoc12

## Writing Jekyll Posts

Jekyll blogswriting postsid=ix\_chapter-05-jekyll-asciidoc14
id=ix\_chapter-05-jekyll-asciidoc14range=startofrange
range=startofrangeposts,
blogid=ix\_chapter-05-jekyll-asciidoc15range=startofrange
id=ix\_chapter-05-jekyll-asciidoc15range=startofrange
range=startofrangeWith our titles in hand, we can generate an actual
Jekyll post. To keep things simple each post will contain nothing beyond
the titles for now, but we will quickly add other content. Getting the
skeleton of a post established allows us to use the Jekyll command-line
tools to troubleshoot our setup.

First, create a Git repository for our files. When the Jekyll tool runs,
it generates all the files into a directory called \_site so we should
add a *.gitignore* file, which ignores this directory:

``` bash
$ git init
$ mkdir _posts
$ echo "_site" >> .gitignore
$ git add .gitignore
$ git commit -m "Initial checkin"
```

Jekyll Markdown files are very simple: just a bit of YAML at the
beginning, with text content following, formatted as Markdown. To
generate Markdown posts, add a method called `write` to our scraper that
writes out the processed information after we have retrieved and parsed
the pages from Archive.org.

Jekyll posts are stored inside the \_posts directory. As a convention,
filenames are generated with the date and title, lowercased, converted
to a string without any characters beyond a-z and the hyphen, and
terminated by the extension (usually *.md* for Markdown). In order to
properly generate the filename, we will need to scrape the date, so we
will do that as well.

As a more concrete example, we want to take something like `Cuba - the
good and bad` that happened on January 12th, 2001, and make a filename
like `2001-01-12-cuba-the-good-and-bad.md`. Or,
`Mexico/Belize/Guatemala` from the same date, and make it into the
filename `2001-01-12-mexico-belize-guatemala.md`. These conversions look
like good places to write tests, so we can start there:

``` ruby
describe "#get_filename" do
  it "should take 'Cuba - the good and bad' on January 12th, 2001" +
      " and get a proper filename" do
    input = 'Cuba - the good and bad'
    date = "January 12th, 2001"
    output = "2001-01-12-cuba-the-good-and-bad.md"
    expect( @scraper.get_filename( input, date ) ).to eq( output )
  end

  it "should `Mexico/Belize/Guatemala` and get a proper filename" do
    input = "Mexico/Belize/Guatemala"
    date = "2001-01-12"
    output = "2001-01-12-mexico-belize-guatemala.md"
    expect( @scraper.get_filename( input, date ) ).to eq( output )
  end
end
```

Let’s build theget\_filename method `get_filename` method. This method
uses the handy Ruby `DateTime.parse` method to convert a string
representation of a date into a date object, and then uses the
`strfmtime` method to format that date into the format we want in our
filename:

``` ruby
...
def get_filename( title, date )
  processed_date = DateTime.parse( date )
  processed_title = title.downcase.gsub( /[^a-z]+/, '-' )
  "#{processed_date.strftime('%Y-%m-%d')}-#{processed_title}.md"
end
...
```

If we run our tests now, we will see them both pass.

Now we can add to our scraper so that it can write out the posts:

``` ruby
def render( processed ) # 
  processed['layout'] = 'post'
  rendered = "#{processed.to_yaml}---\n\n" # 
  rendered
end

def write( rendered, processed ) # 
  Dir.mkdir( "_posts" ) unless File.exists?( "_posts" )
  filename = get_filename( processed['title'], processed['creation_date'] )
  File.open( "_posts/#{filename}", "w+" ) do |f|
    f.write rendered
  end
end

def process_creation_date( date )
  tuple = date.split( /last updated on:/ ) # 
  rv = tuple[1].strip if tuple and tuple.length > 1
  rv
end

def run
  scrape()
  @pages.each do |page| # 
    rows = ( page / "table[valign=top] tr" )
    processed = {}
    processed['title'] = process_title( rows[0].text() )
    processed['creation_date'] = process_creation_date( rows[3].text() ) # 
    rendered = render( processed )
    write( rendered, processed )
  end
```

  - We define a render method. This takes the processed information
    (which arrives as a hash) and renders the information into the
    proper format: the YAML Front Matter (YFM) and then the body (which
    we don’t have yet). We then return the rendered string.

  - We use the `to_yaml` method on our hash. This method appears when we
    include the yaml library using `require 'yaml'` (not displayed here,
    but easy to add to the *scraper.rb* file and present in the samples
    on GitHub).

  - The write method writes the rendered content to disk. It makes sure
    the \_posts directory is available, and if not, creates it. It then
    writes out the file using our `get_filename` method to get the path,
    prefixed with the \_posts directory.

  - `process_creation_date` takes a piece from the scraped page and
    breaks it apart by the string “`last updated` on:” and uses the
    second item in the resultant array.

  - Inside our run method we now build out the processed hash, finding
    the date and title using rows from the query path we used before.

  - Once we have our processed array, we can "render" it and then write
    out the rendered string to our filesystem.

If we generate the posts by calling `bundle exec ruby ./run.rb` we will
see our posts generated into the \_posts directory. Choosing a random
one, they look like this:

``` ruby
---
title: Beautiful Belize
creation_date: '2003-03-23'
layout: post
---
```

As you can see, for now, posts are nothing more than the YFM, but this
is still a perfectly valid Jekyll post.

Now let’s use the jekyll command-line tool to start looking at our posts
and to troubleshoot any issues with our Jekyll
repository.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc15
startref=ix\_chapter-05-jekyll-asciidoc15range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc14
startref=ix\_chapter-05-jekyll-asciidoc14

## Using the Jekyll Command-Line Tool

command lineJekyll command line toolid=ix\_chapter-05-jekyll-asciidoc16
id=ix\_chapter-05-jekyll-asciidoc16range=startofrange
range=startofrangeJekyllcommand line
toolid=ix\_chapter-05-jekyll-asciidoc17
id=ix\_chapter-05-jekyll-asciidoc17range=startofrange
range=startofrangeJekyll blogscommand line
toolid=ix\_chapter-05-jekyll-asciidoc18
id=ix\_chapter-05-jekyll-asciidoc18range=startofrange
range=startofrangeTaking a moment to add our files to the Git
repository, we can then take a look at our site using the `jekyll`
command-line tool. Using the command-line tool locally will spot check
our new content as we will see errors immediately (rather than getting
notification emails from GitHub after publishing there). Errors can
occur if our scraper does not correctly process the HTML retrieved from
Archive.org and subsequently generates incorrect Markdown content, for
example.

``` bash
$ git add .
$ git commit -m "Make this into a Jekyll site"
...
$ jekyll serve --watch
Configuration file: none
            Source: /home/xrdawson/bytravelers
       Destination: /home/xrdawson/bytravelers/_site
      Generating...
     Build Warning: Layout 'post' requested in _posts/2000-05-23-third-day-in...
     Build Warning: Layout 'post' requested in _posts/2000-08-28-the-hill-tri...
     ...
                    done.
 Auto-regeneration: enabled for '/home/xrdawson/bytravelers'
Configuration file: none
    Server address: http://0.0.0.0:4000/
  Server running... press ctrl-c to stop.
```

So, we see a few problems already. First, we don’t have a layout for
"post." And, there is no configuration file. Let’s fix these problems.

Add a file called \_config.yml to the root directory:

``` yaml
name: ByTravelers.com: Online travel information
markdown: redcarpet
highlighter: pygments
```

Remember, the jekyll tool does not reload the configuration file
automatically, so we should restart the tool by hitting Ctrl-C and
restarting.

Then, create a directory called \_layouts, and place a file called
*post.html* inside it with these contents:

``` html
---
layout: default
---

<h1>{{ page.title }}</h1>

{{ content }}
```

The *post.html* layout file is very simple: we use Liquid Markup tags to
write out the title of the site (contained in an object called `page`,
which our template has access to) and then the content itself, which is
the rendered output from the post page.

We also need to create a "default" layout, so create this inside the
\_layouts directory with the filename *default.html*:

``` html
<html>
<head>
<title>ByTravelers.com</title>
</head>

<body>

{{ content }}

</body>
</html>
```

This file is almost pure HTML, with only the `{{ content }}` tag. When
we specify `default` as the layout inside YAML for a Markdown file, the
Markdown text is converted to HTML, and then this layout file is wrapped
around it. You can see that the initial post files specify the `post`
layout, which is wrapped around the content, then the *post.html* layout
file specifies the *default.html* layout, which is wrapped around the
entire contents.

When we add these files, the Jekyll tool will notice the filesystem has
changed and regenerate files. We now have generated posts, but we don’t
have a master index file, so let’s add this
now.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc18
startref=ix\_chapter-05-jekyll-asciidoc18range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc17
startref=ix\_chapter-05-jekyll-asciidoc17range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc16
startref=ix\_chapter-05-jekyll-asciidoc16

## Master Index File with Liquid Markup

Jekyll blogsmaster index file creation with Liquid Markup master index
file creation with Liquid MarkupLiquid Markupmaster index file creation
with master index file creation withWe now have the posts generated
properly, but we don’t have an entry page into the blog. index.md fileWe
can create an *index.md* file, which just displays an index of all the
blog posts:

``` html
---
layout: default
---

<h1>ByTravelers.com</h1>

Crowd sourced travel information.

<br/>

<div>
{% for post in site.posts %}
<a href="{{ post.url }}"><h2> {{ post.title }} </h2></a>
{{ post.content | strip_html | truncatewords: 40 }}
<br/>
<em>Posted on {{ post.date | date_to_string }}</em>
<br/>
{% endfor %}
</div>
```

Notice that the file combines Markdown (the single `#` character
converts into an H1 tag) with regular HTML. You are free to mix regular
HTML inside of Markdown files when there is not a Markdown equivalent.

Output output tagstags use double braces surrounding the content (`{{
site.title }}`) whilelogic tags logic tags use a brace and percent
symbol (`{% if site.title %}`). As you might expect, output tags place
some type of visible output into the page, and logic tags perform some
logic operation, like conditionals or loops.

The preceding template has both output and logic tags. We see a logic
tag in the form of `{% for …​ %}`, which loops over each post. Jekyll
will process the entire posts directory and provide it to pages inside
the `site.posts` variable, and the `for` logic tag allows us to iterate
over them. If we use a `{% for …​ %}` tag we need to "close" the tag
with a matching `{% endfor %}` tag. Inside of our for loop we have
several output tags: `{{ post.url }}` outputs the post URL associated
with a post, for example. We also have *filters*, which are methods
defined to process data. One such filter is the `strip_html` filter,
which you might guess strips out HTML text, converting it to escaped
text. This is necessary when your text could include HTML tags. You’ll
also notice that filters can be "chained"; we process the body with the
`strip_html` filter and then truncate the text by 40 characters using
the `truncatewords:40` filter.

If we open *<http://localhost:4000>* in our browser, we will see a
simple index page with the titles of our posts, like
[figure\_title](#austere_but_a_step_in_the_right_direction).

![The Index Page, for a naked Jekyll blog](images/btwg_06in01.png)

This index page lists every post: let’s make it display only the last 10
posts. Copy the *index.md* file to a file named *archive.md*. Then,
change the `{% for post in site.posts %}` tag to `{% for post in
site.posts | limit:10 %}`.

Each post has an associated page that is generated by Jekyll. Clicking
any of the links displays the post, which is right now just the title.
We can now add the rest of the pages from our scraper.

## Scraping Body and Author

interactive Ruby shell (IRB)scrapingauthor and body content author and
body contentUse IRB to find the author and body content. Start by
searching for the author information:

``` bash
2.0.0-p481 :037 > rows[2].to_s
=> "<tr>\n<td align=\"center\">\n\n\n\n<font size=\"+1\">author:..."
2.0.0-p481 :038 > ( rows[2] / "td font" )[0].text()
=> "author: \n\nMD \n\n\nread more from this author | \nsee maps from this..."
2.0.0-p481 :039 > author = ( rows[2] / "td font" )[0].text()
=> "author: \n\nMD \n\n\nread more from this author | \nsee maps from this..."
2.0.0-p481 :040 > author =~ /author:\s+\n\n([^\s]+)\n\n/
=> 0
2.0.0-p481 :041 > $1
=> "MD"
```

We start by looking at the second row and converting it to raw HTML. We
see there is a string author:, which is a likely place to reference the
author. This string is wrapped by a font tag and a td tag, so we can use
these search queries to eliminate extra information. Then, we convert
the HTML to text using the `text()` method and use a regular expression
to pull out the text after the author: string. If a regular expression
matches and has a captured expression, it will be held in the global
variable `$1`. There is more than one way to get this information, of
course.

Next, we retrieve our body from the scraped page. Add a method called
`process_body` and insert this into our processed hash:

``` ruby
def render( processed )
  processed['layout'] = 'post'
  filtered = processed.reject{ |k,v| k.eql?('body') } # 
  rendered = "#{filtered.to_yaml}---\n\n" + # 
    "### Written by: #{processed['author']}\n\n" +
    processed['body']
  rendered
end
 # 
def process_body( paragraphs )
  paragraphs.map { |p| p.text() }.join "\n\n"
end

def run
  scrape()
  @pages.each do |page|
    rows = ( page / "table[valign=top] tr" )
    processed = {}
    processed['title'] = process_title( rows[0].text() ) # 
    processed['creation_date'] = process_creation_date( rows[3].text() )
    processed['body'] = process_body( rows[4] / "p"  ) # 
    author_text = ( rows[2] / "td font" )[0].text()
    processed['author'] = $1.strip if author_text =~ /author:\s+\n\n+(.+)\n\n+/
    rendered = render( processed )
    write( rendered, processed )
  end
```

  - We need to rewrite `render` slightly. There is no need for the
    entire body content of a post to be included in the YFM. We can
    filter this out using the `reject` method.

  - Then, we append the author and body content to generate the new
    rendered output.

  - Our process body is straightforward: we convert each node passed
    into text (using the `text()` method) and then rejoin them with
    double newlines. Markdown will properly format paragraphs if they
    are separated by two newlines.

  - We then just need to invoke the `process_body` method and insert the
    results into our processed hash.

  - Next, we use the query path we found in our IRB session to retrieve
    the author information, and insert it into our processed hash. The
    author name will then be inserted into our YFM automatically within
    the `render` method, and we will insert it into the post.

We can then run `bundle exec ./run.rb` to rewrite our post files.

## Adding Images to Jekyll

imagesadding to Jekyll adding to JekyllJekyll blogsadding images to
adding images toJekyll can host any binary files as well, and Markdown
files can host the proper markup to include these assets. Let’s add the
images from the original site:

``` ruby
def process_image( title )
  img = ( title / "img" )
  src = img.attr('src').text()
  filename = src.split( "/" ).pop

  output = "assets/images/"
  FileUtils.mkdir_p output unless File.exists? output
  full = File.join( output, filename )

  if not File.exists? full or not File.size? full
    root = "https://web.archive.org"
    remote = root + src
    # puts "Downloading #{full} from #{remote}"
    `curl -L #{remote} -o #{full}`
  end

  filename
end
```

We use the venerable cURL to download our images. Our code makes it so
that the file is only downloaded the first time. We use the `-L` switch
to tell cURL to follow redirects, because these images URLs are
transparently redirected inside the browser.

We need to customize our run method to invoke the `process_image` call:
add `processed['image'] = process_image( rows[0] )` after any of the
other process methods.

> **Warning**
> 
> I paid an artist for the images used on the original ByTravelers.com.
> If you are using this technique to scrape images or text content from
> another site, make sure you are abiding by all local and international
> copyright laws.

Then, modify our post layout to include the image:

``` html
---
layout: default
---

<h1>{{ page.title }}</h1>

<img src="/assets/images/{{ page.image }}">

{{ content }}
```

Regenerating this page shows us a white background with an awkwardly
juxtaposed colored image. Adding background colors to the entire site
will help, so let’s now modify the CSS for our site.

## Customizing Styling (CSS)

CSSfor Jekyll blogsid=ix\_chapter-05-jekyll-asciidoc19
id=ix\_chapter-05-jekyll-asciidoc19range=startofrange
range=startofrangeJekyll blogscustom CSS
forid=ix\_chapter-05-jekyll-asciidoc20
id=ix\_chapter-05-jekyll-asciidoc20range=startofrange
range=startofrangeWe used BootstrapBootstrap in
[section\_title](#JavaScript) and will use it again here. We will also
layer another CSS file on top of Bootstrap to customize the colors.

First, add a reference to Bootstrap and our custom CSS inside of the
master layout file, *default.html*:

``` html
<html>
<head>
<title>ByTravelers.com</title>

<link href="/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/css/site.css" rel="stylesheet">

</head>

<body>

{{ content }}

</body>
</html>
```

Then, download the Bootstrap CSS file into the proper folder:

``` bash
$ mkdir assets/css
$ curl \
https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css \
-o assets/css/bootstrap.min.css
```

Adding a CSS framework like Bootstrap helps things considerably, but we
should match the original colors as well. Add a file called *site.css*
into the *assets/css* directory:

``` css
body {
color: #000000;
background-color: #CCCC99;
}

a {
color: #603;
}

.jumbotron {
background-color: #FFFFCC;
}
```

With the Bootstrap library installed, we can slightly modify our
*default.html* layout to make the site really stand out. Many Jekyll
blogs are quite minimalistic and stark, but you are limited only by your
imagination:

``` html
<html>
  <head>
    <title>ByTravelers.com</title>
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/site.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">
      <div class="jumbotron">
        <h1>ByTravelers.com</h1>
        Alternative travel information
      </div>
      <div class='row>
        <div class='span12'>
          <div class="container">
            {{ content }}
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
```

If we reload, we will see a much prettier version of the site
([figure\_title](#jekyll-now-livelier)).

![Restoring the original colors and images](images/btwg_0606.png)

We’ve now entirely scraped an old site and built a new Jekyll blog, so
there is just one thing left to do: encourage and permit collaboration,
which GitHub makes particularly
easy.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc20
startref=ix\_chapter-05-jekyll-asciidoc20range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc19
startref=ix\_chapter-05-jekyll-asciidoc19

## Inviting Contributions with GitHub "Fork"

forkingWhen you publish a Jekyll blog, the fact that it is a repository
on GitHub makes it simple to manage and track changes. In addition,
because forking is a button click away, you can ask people to contribute
or make changes with very little friction. You might have seen the
banner saying "Fork me on GitHub" on many a software project page hosted
on GitHub. We can motivate others to participate in our blog using pull
requests. Let’s add that as a final touch and invite people to make
contributions the GitHub way. The [GitHub blog first posted these
banners](https://github.com/blog/273-github-ribbons), and we’ll use its
code almost as is inside our *default.html* page, just changing the
reference to our repository in the link tag:

``` html
...
<body>

  <a href="https://github.com/xrd/bytravelers.com">
    <img style="position: absolute; top: 0; right: 0; border: 0;"
       src="https://..."
       alt="Fork me on GitHub"
       data-canonical-src="https://.../forkme_right_gray_6d6d6d.png"></a>

  <div class="container">
    <div class="jumbotron">
      <h1>ByTravelers.com</h1>
      Alternative travel information
...
```

Now anyone can fork our repository, add their own post to the \_posts
directory, and then issue a pull request asking us to incorporate the
new post into our Jekyll blog.

## Publishing Our Blog to GitHub

Jekyll blogspublishing on GitHub publishing on GitHubpublishing Jekyll
blogsLike any other GitHub repository, we can then publish our blog
using the same commands we saw with earlier repositories. Obviously you
should change the username and blog name to suit your own needs:

``` bash
$ export BLOG_NAME=xrd/bytravelers.com
$ gem install hub
$ hub create $BLOG_NAME # You might need to login here
$ sleep $((10*60)) && open http://bytravelers.com
```

And, don’t forget to set up DNS records and give yourself appropriate
time to let those records propagate
out.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc8
startref=ix\_chapter-05-jekyll-asciidoc8range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc7
startref=ix\_chapter-05-jekyll-asciidoc7

# Summary

We’ve explored the details of Jekyll, looking at the structure of a
Jekyll blog. Liquid Markup is a powerful way to use programmatic
constructs inside a Markdown file, and we documented the most important
concepts around using this templating language. By investigating the
internals of a Jekyll post, we explained the intricacies of YAML Front
Matter (YFM) and how seamlessly you can mix and match HTML with Markdown
syntax. Jekyll blogs can utilize their own custom CSS, and we’ve shown
how easy it is to use a powerful complete library like Bootstrap layered
underneath a site-specific small CSS file. And, we built a scraper
application that retrieves a remote site in its entirety and converts it
into the correct structure of a Jekyll blog. Even though this scraper
application was built specifically for a particular site, by adding
testing and properly structuring the components it should be evident how
to reuse much of the scraper for anything else you want to quickly
convert into a Jekyll
blogrange=endofrangestartref=ix\_chapter-05-jekyll-asciidoc2
startref=ix\_chapter-05-jekyll-asciidoc2.range=endofrangestartref=ix\_chapter-05-jekyll-asciidoc0
startref=ix\_chapter-05-jekyll-asciidoc0

In the next chapter we will continue looking at Jekyll by building an
Android application that uses the Java GitHub API bindings and allows
you to create Jekyll blog posts with the Git Data API.

# CoffeeScript, Hubot, and the Activity API

Though the phrase has now been removed from its marketing materials,
GitHub used to call itself a tool for "social coding." This idea is
still central to the services GitHub provides—intimate access to the
social layer inside of GitHub through the Activity API.

Hubotid=ix\_chapter-06-hubot-activities-asciidoc0range=startofrange
id=ix\_chapter-06-hubot-activities-asciidoc0range=startofrange
range=startofrangeIn this chapter we’ll investigate the Activity API by
extending a chat robot. You might find it odd that a robot, generally
considered an antisocial invention despite all best attempts, would play
nicely with a social API, but this is a social robot. GitHubbers use an
extensible chat robot called Hubot to record and automate their tasks,
and to have fun on the Internet. If there were any robot suited for
interacting with the GitHub Activity API, it’s Hubot, described on the
site <https://hubot.github.com/> as "a customizable, kegerator-powered
life embetterment robot."

# The Activity API

Activity APIcontents of contents ofThe Activity API includes:

  - Notifications (comments issued to users through various events)

  - Stargazing tools (Facebook has "likes" while GitHub has "stars" to
    indicate approval or interest)

  - Watching (a way to track GitHub data)

  - Events (a higher-level activity stream useful for following actions
    of users)

> **Note**
> 
> The Activity API section also includesfeeds *feeds*. While feeds are
> grouped within the Activity API, they are not programmatic in the same
> way an API is, and we won’t cover them in depth here. Feeds are
> actually Atom feeds and not interactive beyond that. Atom feeds are
> similar to RSS feeds: a static feed you can subscribe to with an Atom
> client.

# Planning for PR Satisfaction Guaranteed

Hubotcapabilities of capabilities ofWe are going to build an extension
to Hubot. When we are done, Hubot will be transformed into a robot
that…​

  - listens for pull request events from GitHub by subscribing to
    notifications using the GitHub Activity API;

  - invites people in the chat room to comment on those pull requests;

  - guarantees that communication between it and GitHub is securely
    delivered (with an unfortunate bug as caveat);

  - retrieves vital information from an external service (the Slack
    API);

  - has functionality fully described by automated tests;

  - allows easy simulation of inputs and outputs that map to the inputs
    and outputs it gets from APIs and services; and

  - runs with ease on a major PaaS (Heroku).

Hubot provides the skeleton for our chat robot. We’ll add the preceding
functionality to Hubot and see how easy it is to combine these features
into a coherent whole that solves a real problem.

## Considerations and Limitations

Hubotconsiderations and limitations considerations and limitationsIf you
want stability with your Hubot, you need to host it on a server. Hubot
is written in NodeJS and requires a hosting service that supports
NodeJS. Our Hubot needs to sit on a public IP address (not inside the
firewall) because we receive notifications from GitHub. It is not
strictly required that you host Hubot on a public server; if your Hubot
does not need to receive requests from the outside world, you can host
on a private internal server as well.

HerokuHubot and Hubot andThe simplest and cheapest hosting service for
Hubot is Heroku. Once we generate our Hubot, we can simply do a git-push
into Heroku to publish our chat robot for free. We’ll show these steps
later in the chapter.

Hubot works with many chat endpoints. Your Hubot can connect to almost
any popular chat service or protocol: IRC, XMPP, and many commercial
services like Gchat, Basecamp, and even Twitter. Slack is a relatively
new entrant into the world of chat services, but despite its youth, the
Slack API is solid and connecting third-party clients to the Slack
service is simple and straightforward. We’ll use Slack as our chat
endpoint.

Now let’s create our Hubot and configure it to use Slack.

## Creating a Vanilla Hubot

Hubotbasic basicNodeJSand Hubot and HubotTo build a Hubot you will need
a working NodeJS installation, as specified in [???](#appendix). The
following commands create a directory with a barebones Hubot:

    $ npm install -g generator-hubot 
    $ mkdir slacker-hubot 
    $ cd slacker-hubot/
    $ yo hubot 
    $ npm install hubot-slack --save 

You may not be familiar with these commands, so let’s go over the
important ones.

  - npm is the tool that installs packages for NodeJS (documented in
    [???](#appendix)). The `npm install -g
    generator-hubot` command installs a command-line tool called yeoman
    and a plug-in for yeoman that scaffolds Hubot.

  - You should create a new directory and enter it so that when you
    create your Hubot you can store it entirely in its own space.

  - You run the generator using the `yo hubot` command. This builds out
    the set of files for a minimal Hubot.

  - We then install the slack adapter and save the package to the
    *package.json* file.

Now that we have a simple Hubot created we need to create the Slack site
where our Hubot will live.

## Creating a Slack Account

HubotSlack account forid=ix\_chapter-06-hubot-activities-asciidoc1
id=ix\_chapter-06-hubot-activities-asciidoc1range=startofrange
range=startofrangeSlackid=ix\_chapter-06-hubot-activities-asciidoc2range=startofrange
id=ix\_chapter-06-hubot-activities-asciidoc2range=startofrange
range=startofrangeGoing to <https://slack.com/> starts the process of
creating your own Slack site. You’ll need to step through creating an
account. Slack sites are segmented by organization, and you’ll want to
establish a URL prefix for your Slack site. Typically this is the name
of your organization.

### Naming the channel

Hubotchannel creationid=ix\_chapter-06-hubot-activities-asciidoc3
id=ix\_chapter-06-hubot-activities-asciidoc3range=startofrange
range=startofrangeOnce you have your slack site created, you need to
create a channel as in
[figure\_title](#creating_a_channel_from_the_slack_sidebar).

![Creating a channel from the Slack sidebar](images/btwg_08in01.png)

You can name the channel anything you want, but it is often a good
mnemonic to use a name that suggests this is a channel where more
serious work gets done. You could use a name like "PR Discussion" to
indicate this is the channel where PRs are discussed. To keep things
simple, we will use the name "\#general." Once you click the link to
create a channel, you’ll see a popup asking for the name and an optional
description. After you have created the channel, you will see a link to
"Add a service integration" as shown in
[figure\_title](#adding_service_integrations_to_slack).

![Adding service integrations to Slack](images/btwg_08in02.png)

Slack supports many different service integrations, and one of them is
Hubot as shown in
[figure\_title](#service_integration_options_for_slack).

![Service integration options for Slack](images/btwg_08in03.png)

Choosing Hubot takes you to a settings screen for your Hubot
integration.

Slack automatically generates an authentication token for you. This
token is used to verify the connection from your Hubot. This token can
be revoked, and in fact the token from
[figure\_title](#choose_hubots_name) has been revoked and can no longer
be used to authenticate into Slack. If you ever accidentally publicize
this token, you can easily revoke and reassign a token to your Hubot on
this screen.

You will also need to specify a name. Use "probot" and if you’d like,
change the avatar associated with the Hubot (these options are shown in
[figure\_title](#choose_hubots_name)).

![Hubot configuration page for Slack](images/btwg_08in04.png)

Make sure you save your integration before
continuingrange=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc3
startref=ix\_chapter-06-hubot-activities-asciidoc3.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc2
startref=ix\_chapter-06-hubot-activities-asciidoc2range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc1
startref=ix\_chapter-06-hubot-activities-asciidoc1

## Running Hubot Locally

Hubotrunning locally running locallyEventually you will want to run your
Hubot on a server, but Hubot can run from a laptop behind a firewall as
well. At the beginning of development, while testing and developing your
bot and the changes are fast and furious, you probably want to run Hubot
locally. In fact, Hubot behind a firewall is almost identical in its
feature set with one major exception: anything behind the firewall is
inaccessible, obviously, to external services. We are eventually going
to be configuring GitHub to send events to us when a pull request is
created, and Hubot behind the firewall cannot receive those events. But,
for almost all other functionality, running Hubot locally speeds up
development cadence.

To run your bot locally, make sure you specify the variables on the
command line:

    $ HUBOT_SLACK_TOKEN=xoxb-3295776784-nZxl1H3nyLsVcgdD29r1PZCq \
    ./bin/hubot -a slack

This command runs the Hubot script with the Slack adapter. The Slack
adapter knows how to interact with the Slack.com service. It requires an
authentication token, and this is provided via the environment variable
at the beginning of the line.

### A first conversation

Hubotfirst conversation first conversationYour bot should be set up and
waiting in the \#general room inside your Slack site. Go to the
\#general room. Then, you can test that Hubot is properly connectd by
typing in the name of your Hubot and then a command like `the rules`.
For example, if our Hubot is named probot, then we would type `probot
the rules`, which then displays the following conversation as shown in
[figure\_title](#hubots_built_in_repartee).

![Hubot’s built-in repartee](images/btwg_08in05.png)

We see that our Hubot printed out the rules it abides by (published
originally by Isaac Asimov in his "Runaround" short story in 1942).

### Exploring the Hubot vocabulary

Hubotexploring vocabulary of exploring vocabulary ofHubot out-of-the-box
supports many commands. To get a list, type help to see a list like that
shown in [figure\_title](#listing_the_hubot_vocabulary).

![Listing the Hubot vocabulary](images/btwg_08in06.png)

The `pug me` command is a favorite. Many people new to Hubot quickly get
sucked into spending hours looking at cute pictures of pugs. Beware\!

# Installation on Heroku

HerokuHubot installation onid=ix\_chapter-06-hubot-activities-asciidoc4
id=ix\_chapter-06-hubot-activities-asciidoc4range=startofrange
range=startofrangeHubotinstallation on
Herokuid=ix\_chapter-06-hubot-activities-asciidoc5
id=ix\_chapter-06-hubot-activities-asciidoc5range=startofrange
range=startofrangeNow that we’ve successfully started our Hubot locally,
we can move it to Heroku and keep it running even when our laptop is
turned off.

## Setting Up Heroku

Herokusetup setupHeroku requires registration before using it. Heroku
offers free plans and everything we’ll do here can be done using one of
them. Once you have created an account, install the Heroku toolbelt
found here: <https://toolbelt.heroku.com/>. The toolbelt provides a set
of tools useful for managing Heroku applications. You will need to have
Ruby set up as explained in [???](#introduction).

If your chatbot is working per the instructions given in the previous
section, then it is almost ready to deploy to Heroku. You’ll need to add
the same environment variable using the Heroku tools. In addition to the
authentication token for Slack, you will need to configure a URL for
your site. Heroku will generate a URL for you from the name of your
project (in this case `inqry-chatbot`); so as long as the name has not
been claimed already by someone else, you can name it as you will:

    $ heroku create inqry-chatbot
    $ heroku config:add HEROKU_URL=https://inqry-chatbot.herokuapp.com/
    $ heroku config:add HUBOT_SLACK_TOKEN=xxbo-3957767284-ZnxlH1n3ysLVgcD2dr1PZ9Cq
    $ git push heroku master
    Fetching repository, done.
    Counting objects: 5, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 317 bytes | 0 bytes/s, done.
    Total 3 (delta 2), reused 0 (delta 0)
    
    -----> Node.js app detected
    -----> Requested node range:  0.10.x
    ...
    -----> Compressing... done, 6.8MB
    -----> Launching... done, v9
           https://inqry-chatbot.herokuapp.com/ deployed to Heroku
    
    To git@heroku.com:inqry-chatbot.git
       d32e2db..3627218  master -> master

If you need to troubleshoot issues with your Hubot, you can always run
the heroku log command to view logs for your application, `heroku logs
-t`:

    $ heroku logs -t
    2014-11-18T07:07:18.716943+00:00 app[web.1]: Successfully 'connected'
    as hubot
    2014-11-18T07:07:18.576287+00:00 app[web.1]: Tue, 18 Nov 2014 07:07:18
    GMT connect deprecated limit: Restrict request size at location of
    read at
    node_modules/hubot/.../express/.../connect/.../middleware/multipart.js:86:15
    ...

When you send commands into your chat room you will notice events inside
of Heroku. This is a good way to verify that your bot is wired into
Slack properly.

You might also want to publish this repository into GitHub. Heroku, as a
part of hosting your live application, also hosts the full Git
repository of your Hubot (Hubot, as friendly as it tries to be, is just
another NodeJS application in the end). Heroku can host the entirety of
the source code for your Hubot for you, but does not have the additional
tools, like user management, that GitHub does. For this reason, use your
GitHub account as your code repository, the place where team members
develop new features of your chatbot. Build and test locally, and then
push into Heroku using the ease of the Git workflow as a deployment
layer.

Now that we have created and installed Hubot, let’s look at the Activity
API and determine how we want to code our
extension.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc5
startref=ix\_chapter-06-hubot-activities-asciidoc5range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc4
startref=ix\_chapter-06-hubot-activities-asciidoc4

# Activity API Overview

Activity APIoverview overviewThe Activity API centers around
notificationsnotifications: notifications are similar to the
notifications you see on social networking sites, events that occur that
document important points of interest inside a timeline of activity.
GitHub activity events are often tied to important milestones inside of
a developer’s day, activities like pushing commits into the main remote
repository, asking questions on discussion threads associated with a
repository, or assigning issues to a developer for review.

These notifications are accessible to team members without
programmatically accessing the GitHub API. Team members are notified of
events inside of their workflow using email based on several rules.
GitHub will automatically send out notification emails when a user has
watched a repository and issues or comments are added, a pull request is
made, or there are comments made on a commit. In addition, even if a
user has not watched a repository, they will be notified if that user is
*@mentioned* (prefixing the @ character to a team member’s name inside a
comment), when an issue is assigned to them, or when that user
participates in a discussion associated with any repository.

The GitHub policy for notification is definitely to err on the side of
being overly verbose. Many people live in their email, and making sure
that all important activities are distributed to the right people
involved makes sense. GitHub has a good set of rules for making sure the
correct notifications get to the right parties.

Email does falter as a to-do list, however, and at times the ease in
which email can be delivered breeds a secondary problem: overwhelm. It
can be very easy to lose focus (vital to building software) when you are
constantly context switching by checking email, and notifications can
often fly by. In addition, email is privately directed and prevents easy
collaboration; generally people don’t share email inboxes. Let’s extend
our Hubot to help us resolve these problems by taking our GitHub
notifications into a shared and "opt-in when you are logged-in"
communication channel.

## Writing a Hubot Extension

extensionsHubot HubotHubotextensions extensionsHubot extensions are
written in either JavaScript or CoffeeScriptcharacteristics
characteristicsCoffeeScript. CoffeeScript is a intermediate language
that compiles directly to JavaScript. Many people prefer writing in
CoffeeScript because it has a cleaner syntax and writes "safer"
JavaScript (the syntax helps you avoid common tricky pitfalls in the
JavaScript language, like what "this" refers to). CoffeeScript is an
indentation-based language (much like Python), and after the initial
learning curve, can feel easier to read than JavaScript, especially when
you have many nested function callbacks (common in JavaScript
programming); it is easier to see where a function begins and ends given
the indentation levels. Hubot is itself written in CoffeeScript, and
we’ll write our extension in CoffeeScript as well.

> **Note**
> 
> CoffeeScriptindentation in indentation inindentation,
> CoffeeScriptCoffeeScript is a language where indentation is important.
> For readability purposes, when we display a snippet of code from a
> longer file, there are times where we have changed the indentation of
> that snippet and removed the initial indentation. If you were to copy
> the code without realignment, the snippet would not work until you
> reindented it to fit the context into which it sits.

The Hubot extension module format is exceedingly simple. You write
JavaScript modules (using the `export` syntax) and Hubot passes you in a
robot object you program using several API methods.

Hubotprogramming concepts programming conceptsThere are a few concepts
useful to programming Hubot. You can find an example of each of these
methods inside the *example.coffee* file inside the *scripts* directory:

  - Hubot has a "brain." This is an internal state object, which means
    these values persist across chat messages. This state is not
    persisted into a database by default, so this state is not restored
    if you restart Hubot. However, a persistence mechanism is exposed
    via Redis, though this is optional and requires configuration. The
    brain is the way you set and get values that are saved across
    discrete messages.

  - Hubot has different response mechanisms. They can choose to respond
    only when they hear exact phrases or when keywords are found in any
    message, and you don’t need to do the grunt work inside your code to
    determine the differences between these communication types.

  - Hubot includes an HTTP server. You might need your Hubot to accept
    requests from additional services beyond the chat service, and Hubot
    makes it easy to accept these kinds of requests.

  - Hubot has a built-in HTTP client. You can easily access HTTP
    resources within Hubot; many popular extensions to Hubot access a
    web service when Hubot receives a request.

  - Hubot commands can include parameters. You can tell a Hubot to do
    something multiple times and write a generic function that accepts
    options.

  - Hubot can handle events. Each chat service has a generalized set of
    events that are normalized to a common API. Hubot can be programmed
    to interact with these events. For example, Hubot can perform
    actions when a room topic changes or when users leave rooms.

  - Hubot can handle generic errors at the top level. Hubot can be
    programmed with a catch-all error handler so that no matter where
    your code failed, you can catch it without crashing your bot.

Hubot will use the first five of these features:

  - We will use the Hubot brain to store a PR review request. If Hubot
    asks a user to review a PR, it needs to keep track of this so that
    when the user responds it has some context of the request.

  - We will use the respond method to program our Hubot to handle a
    request when a user accepts or declines the review request.

  - We will use the HTTP server to accept PR notifications from GitHub
    webhooks.

  - We will use the HTTP client to get a list of users from Slack.

  - We will use the parameterization of requests to Hubot to retrieve
    the specific pull request ID from a chat user message.

There are examples of the other two features (events and generic errors)
inside the examples script that ship with the Hubot source code but we
won’t use those APIs in our Hubot.

## Code Reviews via Pull Requests

code
reviewsid=ix\_chapter-06-hubot-activities-asciidoc6range=startofrange
id=ix\_chapter-06-hubot-activities-asciidoc6range=startofrange
range=startofrangeHubotcode reviews via pull
requestsid=ix\_chapter-06-hubot-activities-asciidoc7
id=ix\_chapter-06-hubot-activities-asciidoc7range=startofrange
range=startofrangepull requestscode reviews
viaid=ix\_chapter-06-hubot-activities-asciidoc8
id=ix\_chapter-06-hubot-activities-asciidoc8range=startofrange
range=startofrangeAs we’ve seen in other chapters, pull requests are the
mechanism used on GitHub to easily integrate code changes into a
project. Contributors either fork the master repository and then issue a
pull request against that repository, or, if they have write permission
to the main repository, make a "feature" branch and then issue a pull
request against the "master" branch.

Pull requests often come with a chat message indicating several people
who should review the request. This tribal knowledge about who should be
involved is only in the head of the developer who created the code. It
could be that they invited the correct people. Or, it could be that they
invited the people they prefer to review their code for various (and
completely rational reasons). This can be an effective way to engage the
right people around a new piece of code.

And inviting reviewers this way can have downsides as well: if the
person is otherwise engaged, pull requests can linger when a
notification email goes unread. And, there is good research to indicate
that the best performing teams are those who share all tasks and
responsibilities equally. It often does not scale to ask everyone to
participate in all code reviews associated with a pull request. But it
might be the case that randomly selecting developers involved in a
project is a better (and more efficient) way to review code than asking
the developer who created the code to determine these people.

Hubot will assign active chat room users to do code reviews when a new
pull request is created. Activity APIand pull requests and pull
requestsWe will use the GitHub Activity API to subscribe to pull request
events. When Hubot becomes aware that a pull request needs review, it
will randomly assign a user in the chat room to do the review and then
ask that user if they want to accept the challenge. If they accept, we
will note that in the pull request comments.

### Extension boilerplate

CoffeeScriptextension boilerplate extension
boilerplateextensionsboilerplate boilerplateWe will start writing our
extension by defining the high-level communication format we expect from
our users. Our script has a simple vocabulary: look for responses
indicating acceptance or refusal of our review requests. Our extension
script should be in the *scripts* directory and named
*pr-delegator.coffee*. This is just the back and forth we will be having
with users; we are not yet writing any code to handle the pull request
notifications:

``` coffeescript
module.exports = (robot) -> 
       robot.respond /accept/i, (res) -> 
               accept( res )
       robot.respond /decline/i, (res) -> 
               decline( res )
       accept = ( res ) -> 
               res.reply "Thanks, you got it!"
               console.log "Accepted!" 
       decline = ( res ) -> 
               res.reply "OK, I'll find someone else"
               console.log "Declined!"
```

This is a dense piece of code and can be confusing if you are new to
CoffeeScript. At the same time, hopefully you will agree that this is
amazingly powerful code for such a small snippet after reading these
notes.

  - All NodeJS modules start by defining entrypoints using the `exports`
    syntax. This code defines a function that expects a single
    parameter; when the function is executed, the parameter will be
    called a robot. The Hubot framework will pass in a robot object for
    us that we will program further down.

  - The Hubot API defines a method on the robot object called `respond`,
    which we use here. It takes two parameters: a regular expression to
    match against and a function that receives an instance of the chat
    response object (called `res` here). The second line uses the API
    for this response object to call a method `accept` with the response
    object. We define accept in a moment.

  - We setup a response matcher for a decline response.

  - Now we define the `accept` method. The accept method receives the
    response object generated by the Hubot framework and calls the
    `reply` method, which, you guessed it, sends a message back into the
    chat channel with the text "Thanks, you got it\!"

  - The accept method then also calls `console.log` with information
    that is displayed on the console from which we started Hubot. This
    is a simple way for us to assure everything worked correctly; if we
    don’t see this message, our code before this was broken. The
    `console.log` is not visible to any users in the channel. It is good
    practice to remove this code when you finalize your production code,
    but if you forget, it won’t affect anything happening in the
    channel.

  - We then define the `decline` method using the same APIs as for the
    `accept` method.

If Hubot is running, you will need to restart it to reload any scripts.
Kill Hubot (using Ctrl-C), and then restart it, and then play with
commands inside your Slack site. Enter the commands `probot accept` and
`probot decline` and you’ll see Hubot responding inside the channel.
You’ll also see the message `Accepted!` or `Declined!` printed to the
console on which Hubot is running.

### Writing tests for Hubot extensions

extensionswriting tests forid=ix\_chapter-06-hubot-activities-asciidoc9
id=ix\_chapter-06-hubot-activities-asciidoc9range=startofrange
range=startofrangeHubotwriting tests for
extensionsid=ix\_chapter-06-hubot-activities-asciidoc10
id=ix\_chapter-06-hubot-activities-asciidoc10range=startofrange
range=startofrangeNow that we have the basics of our Hubot working,
let’s make sure we certify our code with some tests. Jasminetesting
framework testing frameworkWe’ll use the Jasmine testing framework for
NodeJS. It offers an elegant behavior-driven testing syntax where you
specify a behavior as the first parameter to an `it` function, and as a
second parameter, a function that is run as the test itself. Jasmine
manages running each `it` call and displays a nice output of passing and
failed tests at the end of your run. Jasmine tests are typically written
in JavaScript, but the latest versions of CoffeeScriptJasmine support
tests Jasmine support testsJasmine support tests are also written in
CoffeeScript. Hubot is written in CoffeeScript, so let’s write our tests
in CoffeeScript as well. We need to put our tests inside a directory
called *spec* and make sure our filename ends with *.spec.coffee*. Let’s
use *spec/pr-delegator.spec.coffee* as the complete filename. Jasmine
expects spec files to have *.spec.* at the end of their filename (before
the extension, either *.js* or *.coffee*); if your filename does not
match this pattern Jasmine won’t recognize it as a test.

``` coffeescript
Probot = require "../scripts/pr-delegator"
Handler = require "../lib/handler"

pr = undefined
robot = undefined

describe "#probot", ->
        beforeEach () ->
                robot = {
                        respond: jasmine.createSpy( 'respond' )
                        router: {
                                post: jasmine.createSpy( 'post' )
                                }
                        }

        it "should verify our calls to respond", (done) ->
                pr = Probot robot
                expect( robot.respond.calls.count() ).toEqual( 2 )
                done()
```

The first line in our test requires, or loads, the Hubot extension
module into our test script, giving us a function we save as a Probot
variable. We then create adescribe functions `describe` function, which
is an organizing function to group tests. `describe` functions take an
indentifier (in this case `#probot`) and a function that contains
multiple `it` calls. In addition, a `describe` function can also contain
a `beforeEach` function that configures common elements inside our `it`
calls; in this case we create a faked robot object we will pass into our
`Probot` function call. When we are running Hubot itself, Hubot creates
the robot and passes it into the `Probot` function, but when we run our
tests, we generate a fake one and query it to make sure it is receiving
the proper configuration. If we make a change inside our actual Hubot
code and forget to update our tests to verify those changes, our tests
will fail and we’ll know we need to either augment our tests, or
something broke inside our robot, a good automated sanity check for us
when we are feverishly coding away, animating our helpful Hubot.

You should see some similarities between the calls made to our robot
(`robot.respond` and `robot.router.post`) and the tests. We set up
"spies" using Jasmine that generate fake function calls capable of
recording any interaction from outside sources (either our production
code or the test code harness). Inside our `it` call, we then verify
that those calls were made. We use the `expect` function to verify that
we made two calls to the `respond` function defined on the robot, and
that `robot.router.post` has been called as well.

Jasmineinstallation installationWe need to install Jasmine, and we do
this by adding to our *package.json* file. Append `"jasmine-node":
"^1.14.5"` to the file, and make sure to add a comma to the tuple above
it. Adding this code specifies that the minimum version of Jasmine node
we will use is "1.14.5".

``` json
...
  "hubot-shipit": "^0.1.1",
  "hubot-slack": "^3.2.1",
  "hubot-youtube": "^0.1.2",
  "jasmine-node": "^2.0.0"
},
"engines": {
...
```

Runing the following commands will then install Jasmine (the library and
a test runner command-line tool) and run our tests. We abbreviate some
of the installation output to save space:

``` bash
$ npm install
...
hubot-slack@3.2.1 node_modules/hubot-slack
└── slack-client@1.2.2 (log@1.4.0, coffee-script@1.6.3, ws@0.4.31)
...
$ ./node_modules/.bin/jasmine-node --coffee spec/

.

Finished in 0.009 seconds
1 test, 1 assertions, 0 failures, 0 skipped
```

Our tests pass and we now have a way to document and verify that our
code does what we think it
does.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc10
startref=ix\_chapter-06-hubot-activities-asciidoc10range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc9
startref=ix\_chapter-06-hubot-activities-asciidoc9

### Setting up our webhook

Hubotwebhook setup webhook setupwebhookfor Hubot for HubotWe are now in
a position to start adding the actual functionality to our Hubot. Our
first requirement is to register for pull request events. We could do
this from within the GitHub website, but another way is to use the cURL
tool to create the webhook from the command line. authorization tokenfor
Hubot for HubotIn order to do this, we need to first create an
authorization token, and then we can use that token to create a webhook.

To create the token, run this command, setting the proper variables for
your username instead of mine ("xrd"):

``` bash
$ export USERNAME=xrd
$ curl https://api.github.com/authorizations --user $USERNAME --data
'{"scopes":["repo"], "note": "Probot access to PRs" }' -X POST
```

This call can return in one of three ways. If your username or password
is incorrect, you will get an error response message like this:

``` json
{
  "message": "Bad credentials",
  "documentation_url": "https://developer.github.com/v3"
}
```

If your username and password are correct and you don’t have two-factor
authentication turned on, the request will succeed and you will get back
a token inside the JSON response:

``` json
{
  "id": 238749874,
  "url": "https://api.github.com/authorizations/9876533",
  "app": {
    "name": "Probot access to PRs",
    "url": "https://developer.github.com/v3/oauth_authorizations/",
    "client_id": "00000000000000000000"
  },
  "token": "fakedtoken1234",
  "hashed_token": "fakedhashedtoken7654",
  ...
```

If you are using two-factor authentication then you will see a response
message like this:

``` json
{
  "message": "Must specify two-factor authentication OTP code.",
  "documentation_url":
  "https://developer.github.com/v3/auth#working-with-two-factor-authentication"
}
```

If you get this message in response to the prior cURL command, then you
will be receiving a one-time password via your choice of a two-factor
authentication alternative endpoint (either SMS or a two-factor
authentication app like Google Authenticator or recovery codes that you
printed out). If you use text messaging, check your text messages and
then resend the request appending a header using cURL:

``` bash
$ curl https://api.github.com/authorizations --user $USERNAME --data
'{"scopes":["repo"], "note": "Probot access to PRs" }' -X POST
--header "X-GitHub-OTP: 423584"
Enter host password for user 'xrd':
```

If all these steps complete successfully (regardless of whether you are
using two-factor authentication or not) you will then receive an OAuth
token:range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc8
startref=ix\_chapter-06-hubot-activities-asciidoc8range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc7
startref=ix\_chapter-06-hubot-activities-asciidoc7range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc6
startref=ix\_chapter-06-hubot-activities-asciidoc6

``` json
{
  "id": 1234567,
  "url": "https://api.github.com/authorizations/1234567",
  "app": {
    "name": "Probot access to PRs (API)",
    "url": "https://developer.github.com/v3/oauth_authorizations/",
    "client_id": "00000000000000000000"
  },
  "token": "ad5a36c3b7322c4ae8bb9069d4f20fdf2e454266",
  "note": "Probot access to PRs",
  "note_url": null,
  "created_at": "2015-01-13T06:23:53Z",
  "updated_at": "2015-01-13T06:23:53Z",
  "scopes": [
    "notifications"
  ]
}
```

## Using the OAuth Token to Register for Events

authorization tokenregistering for events
withid=ix\_chapter-06-hubot-activities-asciidoc11
id=ix\_chapter-06-hubot-activities-asciidoc11range=startofrange
range=startofrangeHubotusing OAuth token to register for
eventsid=ix\_chapter-06-hubot-activities-asciidoc12
id=ix\_chapter-06-hubot-activities-asciidoc12range=startofrange
range=startofrangeOAuthtokensid=ix\_chapter-06-hubot-activities-asciidoc13
id=ix\_chapter-06-hubot-activities-asciidoc13range=startofrange
range=startofrangetokens,
OAuthid=ix\_chapter-06-hubot-activities-asciidoc14range=startofrange
id=ix\_chapter-06-hubot-activities-asciidoc14range=startofrange
range=startofrangeOnce this is completed we now have our token we can
use to create a webhook. Make sure to use the correct repository name
and access token before running the cURL command. We will also need the
endpoint we created when we published into Heroku (in our case
`https://inqry-chatbot.herokuapp.com`):

``` bash
$ REPOSITORY=testing_repostory
$ TOKEN=ad5a36c3b7322c4ae8bb9069d4f20fdf2e454266
$ WEBHOOK_URL=https://inqry-chatbot.herokuapp.com/pr
$ CONFIG=$(echo '{
  "name": "web",
  "active": true,
  "events": [
    "push",
    "pull_request"
  ],
  "config": {
    "url": "'$WEBHOOK_URL'",
    "content_type": "form",
    "secret" : "XYZABC"
  }
}')
$ curl -H "Authorization: token $TOKEN" \
-H "Content-Type: application/json" -X POST \
-d "$CONFIG" https://api.github.com/repos/$USERNAME/$REPOSITORY/hooks
{
  "url": "https://api.github.com/repos/xrd/testing_repostory/hooks/3846063",
  "test_url":
  "https://api.github.com/repos/xrd/testing_repostory/hooks/3846063/test",
  "ping_url":
  "https://api.github.com/repos/xrd/testing_repostory/hooks/3846063/pings",
  "id": 3846063,
  "name": "web",
  "active": true,
  "events": [
    "push",
    "pull_request"
  ],
  "config": {
    "url": "https://inqry-chatbot.herokuapp.com/pr",
    "content_type": "json"
  },
  "last_response": {
    "code": null,
    "status": "unused",
    "message": null
  },
  "updated_at": "2015-01-14T06:23:59Z",
  "created_at": "2015-01-14T06:23:59Z"
}
```

There is a bit of bash cleverness here, but nothing to be overly
disturbed by. We create a few variables we use in the final command.
Since the $CONFIG variable is particularly long, we use `echo` to print
out a bunch of information with the webhook URL in the middle. If you
want to see the result of that variable, type `echo
$CONFIG` and you’ll notice the snippet `…​ "url":
"https://inqry-chatbot.herokuapp.com/pr" …​` properly interpolated.

HerokuAPI as webhood endpoint API as webhood endpointHere we use the
Heroku API URL as our webhook endpoint. This means we need to have
things hosted on Heroku for the webhook to talk to our HTTP server
properly. We can do some things (like connecting the Hubot to the Slack
service) from behind a firewall and have it talk with other chat room
participants, but any webhook request will fail unless the chat client
is running on a publicly available server.

Be careful to make sure you use the `content_type` set to "form" (which
is the default, so you could leave it blank). Setting this to `json`
will make it difficult to retrieve the raw body inside your Hubot when
the post request is received and validate the request using a secure
digest. We want to make sure all requests are real requests from GitHub
and not a cracker attempting to maliciously inject themselves into our
conversations. To protect from this possible situation, we verify each
request back into GitHub by using the secret generated when we created
the webhook. We’ll discuss this in detail later in this chapter, but for
now, establish a secret when you create the hook. A cracker might be
able to guess about where our endpoint exists, but unless Heroku or
GitHub is compromised, they won’t know our webhook secret.

We should update our tests to make sure we anticipate this new
functionality. We will be using the Hubot HTTP server, which piggybacks
on the built-in express server running inside of Hubot. Our new test
should reflect that we use the `router.post` method exposed to our
Hubot, and that it is called once. We add this next test to the end of
our spec file:

``` coffeescript
it "should verify our calls to router.post", (done) ->
        pr = Probot robot
        expect( robot.router.post ).toHaveBeenCalled()
        done()
```

This additional test will fail should we run it. Now we can add to our
Hubot and have it handle webhook callbacks from GitHub. Add this to the
end of the file:

``` coffeescript
  robot.router.post '/pr', ( req, res ) ->
        console.log "We received a pull request"
```

Now if we run our tests, they all pass. If they do, publish our new
version of the app into Heroku. We’ll omit this step in the future, but
if you want to receive pull requests on the router you have set up,
remember that you need to publish your files into Heroku so the endpoint
is public.

``` bash
$ ./node_modules/.bin/jasmine-node --coffee spec/
..
$ git commit -m "Working tests and associated code" -a
...
$ heroku push

Finished in 0.009 seconds
2 tests, 2 assertions, 0 failures, 0 skipped
$ git push heroku master
Fetching repository, done.
Counting objects: 5, done.
Delta compression using up to 8 threads.
...
```

We now have an end-to-end Hubot setup, ready to receive webhook
notifications.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc14
startref=ix\_chapter-06-hubot-activities-asciidoc14range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc13
startref=ix\_chapter-06-hubot-activities-asciidoc13range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc12
startref=ix\_chapter-06-hubot-activities-asciidoc12range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc11
startref=ix\_chapter-06-hubot-activities-asciidoc11

## Triggering Real Pull Requests

Hubottriggering real pull
requestsid=ix\_chapter-06-hubot-activities-asciidoc15
id=ix\_chapter-06-hubot-activities-asciidoc15range=startofrange
range=startofrangepull requeststesting Hubot
withid=ix\_chapter-06-hubot-activities-asciidoc16
id=ix\_chapter-06-hubot-activities-asciidoc16range=startofrange
range=startofrangeWe can now start testing our Hubot with real GitHub
notifications. First, let’s set up a repository we can use for testing.
hub toolCreating the new repository on GitHub is a quick task if we use
the `hub` tool described in [section\_title](#Jekyll):

``` bash
$ mkdir testing_repository
$ cd testing_repository
$ git init
$ touch test.txt
$ git add .
$ git commit -m "Initial checkin"
$ hub create
...
```

Now we can create a real pull requests for our repository from the
command line and test our Hubot. A typical pull request flow looks like
the following:

1.  Create a new branch

2.  Add new content

3.  Commit the content

4.  Push the new branch into GitHub

5.  Issue a pull request

All of this can be automated using a combination of Git commands and
cURL. We’ve seen some of these commands before and can reuse the
previous command-line invocations and variables we used when generating
our webhook using the API via cURL. Our config variable is similar, but
the required fields in this case are: the title and body for the pull
request, the "head" key that matches the name of the branch, and where
to merge it to using the "base" key.

Creating a new branch, adding some content, and then issuing a pull
request against the branch might be something we need to do several (or
more) times as we experiment and learn about the Hubot extension API.
The examples here work right out of the box, but don’t be fooled into
thinking that it all went exactly as we expected the first time. Given
that, these are commands you might want to perform multiple times as you
are experimenting, so let’s put the commands described in the previous
paragraph into a bash script that is generic and can be run multiple
times. We can call it issue-pull-request.sh and place the script inside
the test directory:

``` bash
# Modify these three variables
AUTH_TOKEN=b2ac1f43aeb8d73b69754d2fe337de7035ec9df7
USERNAME=xrd
REPOSITORY=test_repository

DATE=$(date "+%s")
NEW_BRANCH=$DATE
git checkout -b $NEW_BRANCH
echo "Adding some content" >> test-$DATE.txt
git commit -m "Adding test file to test branch at $DATE" -a
git push origin $NEW_BRANCH
CONFIG=$(echo '
{ "title": "PR on '$DATE'",
  "body" : "Pull this PR'$DATE'",
  "head": "'$NEW_BRANCH'",
  "base": "master"
}' )
URL=https://api.github.com/repos/$USERNAME/$REPOSITORY/pulls
curl -H "Authorization: token $AUTH_TOKEN" \
-H "Content-Type: application/json" -X POST -d "$CONFIG" "$URL"
```

This script generates a unique string based on the current time. It then
creates and checks out a new branch based on that name, adds some
content to a unique file, commits it, pushes it into GitHub, and
generates a pull request using the API. All you will need to do is make
a one-time update to the three variables at the top of the script to
match your information. This script is resilient in that even if your
auth token were incorrect (or had expired) this command would do nothing
other than add testing data to your test repository, so you can
experiment safely. Just be sure to pay attention to whether you see a
successful JSON request as shown in the following code or an error
message. And, as we are going to run this script as a command, make it
executable using the `chmod` command.

Now, let’s run it and see what happens:

``` bash
$ chmod +x ./issue-pull-request.sh
$ ./issue-pull-request.sh
{
  "url": "https://api.github.com/repos/xrd/testing_repostory/pulls/1",
  "id": 27330198,
  "html_url": "https://github.com/xrd/testing_repostory/pull/1",
  "diff_url": "https://github.com/xrd/testing_repostory/pull/1.diff",
  "patch_url": "https://github.com/xrd/testing_repostory/pull/1.patch",
  "issue_url": "https://api.github.com/repos/xrd/testing_repostory/issues/1",
  "number": 1,
  "state": "open",
  "locked": false,
  "title": "A PR test",
      "open_issues_count": 1,
...
```

This returns a huge JSON response (abbreviated here), but you can see
the first item is a link to the pull request. For a human-readable link,
we should use the link called `html_url`. Were we to visit this link, we
could merge the pull request from within the GitHub web UI.

To see more context on what is happening with this pull request, once we
are looking at this pull request inside of GitHub, we can then navigate
to the settings for our repository, follow the link to "Webhooks and
Services" on the left navigation bar, and we will then find at the very
bottom of the page a list of recent deliveries to our webhook, as in
[figure\_title](#recent_failed_deliveries_from_our_webhook).

![Recent failed deliveries from our webhook](images/btwg_08in07.png)

These requests all failed; our Hubot is not correctly configured to
handle real HTTP requests from GitHub. This does show that GitHub is
trying to do something when a pull request is received. We’ll work on
getting our handler code written and pushed into Heroku, and then issue
another
PR.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc16
startref=ix\_chapter-06-hubot-activities-asciidoc16range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc15
startref=ix\_chapter-06-hubot-activities-asciidoc15

## Handling PR Notifications as Post Requests over HTTP

HTTP handler, handling PR notifications as post requests
overid=ix\_chapter-06-hubot-activities-asciidoc17range=startofrange
id=ix\_chapter-06-hubot-activities-asciidoc17range=startofrange
range=startofrangeHubothandling PR notifications as post requests over
HTTPid=ix\_chapter-06-hubot-activities-asciidoc18
id=ix\_chapter-06-hubot-activities-asciidoc18range=startofrange
range=startofrangepost requests, handling PR notifications
asid=ix\_chapter-06-hubot-activities-asciidoc19range=startofrange
id=ix\_chapter-06-hubot-activities-asciidoc19range=startofrange
range=startofrangepull requestshandling notifications as post requests
over HTTPid=ix\_chapter-06-hubot-activities-asciidoc20
id=ix\_chapter-06-hubot-activities-asciidoc20range=startofrange
range=startofrangeLet’s build our HTTP handler when PR notifications
arrive from GitHub. At first glance, we might take the easy route,
adding it directly into the top-level script. But given the fact that
JavaScript handles events inside of callbacks and the fact that Hubot
extensions only export a single constructor (using the `module.exports`
syntax), it is easier to create, and more importantly test, a separate
module, which we require in our main extension script.

We start by writing our tests. We’ve already created a test that
verifies the call to `robot.router.post`. Our new functionality will
actually handle the PR notification, so let’s add a new grouping using
the describe syntax and call it "\#pr". The new functionality is simple:
if the Hubot receives the proper parameters (most importantly that the
internal secret matches the secret sent on the request) then we accept
the PR as valid and message our room with further instructions, namely
inviting some user to review this pull request. Our handler then needs
to expose two methods: `prHandler`, which is where we delegate any
information coming from an HTTP request to the `/pr` route, and a method
where we can configure the secret, which we call `setSecret`. Once we
have established this internal signature for our handler library, we can
add two simple tests and then our library.

We have two tests: one that handles the correct flow and one that
handles the incorrect flow. In a before block (this happens before each
test) we set up a fake robot, and set the secret on our handler module.
Our faked robot implements the same methods a real Hubot robot does (the
messageRoom and send methods), but we create Jasmine spies to verify
these functions are called inside our implementation code:

``` coffeescript
describe "#pr", ->
        secret = "ABCDEF"
        robot = undefined
        res = undefined

        beforeEach ->
                robot = {
                        messageRoom: jasmine.createSpy()
                        }
                res = { send: jasmine.createSpy() }
                Handler.setSecret secret

        it "should disallow calls without the secret", (done) ->
                req = {}
                Handler.prHandler( robot, req, res )
                expect( robot.messageRoom ).not.toHaveBeenCalled()
                expect( res.send ).toHaveBeenCalled()
                done()

        it "should allow calls with the secret", (done) ->
                req = { body: { secret: secret } }
                Handler.prHandler( robot, req, res )
                expect( robot.messageRoom ).toHaveBeenCalled()
                expect( res.send ).toHaveBeenCalled()
                done()
```

Now, add a file called *./lib/handler.coffee*:

``` coffeescript
_SECRET = undefined

exports.prHandler = ( robot, req, res ) ->
        secret = req.body?.secret
        if secret == _SECRET
                console.log "Secret verified, let's notify our channel"
                room = "general"
                robot.messageRoom room, "OMG, GitHub is on my caller-id!?!"
        res.send "OK\n"

exports.setSecret = (secret) ->
        _SECRET = secret
```

As you can see, the Hubot API does a lot of work for us: it processes
the JSON POST request to the `/pr` endpoint and provides us with the
parsed parameters inside the body object. We use that to retrieve the
secret from the request. Even if you have used CoffeeScript before, you
may not be familiar with the `?.` syntax: this just tests to see if
`body` is defined and if so, has a key named `secret`. This prevents us
from crashing if the secret is not sent in with the request. If the
secret from the request matches the configured secret, then we message
the room; otherwise we ignore the request. In either case, we need to
respond to the calling server by using the `send` method (`send` is
provided by the built-in *express* server Hubot uses to provide an HTTP
server). For debugging purposes we output that the secret was validated,
if it was in fact validated, but otherwise the behavior of our response
to the calling client is the same regardless of whether they provided a
correct secret or not. We don’t want to provide an attacker with
anything extra if they pass in an incorrect secret.

If we run our tests we will see them all pass:

``` bash
$ node_modules/jasmine-node/bin/jasmine-node \
--coffee spec/pr-delegator.spec.coffee
....

Finished in 0.01 seconds
4 tests, 6 assertions, 0 failures, 0 skipped
```

Hubot will spawn the HTTP server wherever it runs so we can talk to it
on our local machine (though this will likely be inside a firewall and
inaccessible to GitHub), so we can test it using cURL locally. Remember
that our robot router accepts commands as HTTP POST requests, so we need
to specify a post request (using the `--data` switch with cURL):

``` bash
$ ( HUBOT_SLACK_TOKEN=xoxb-3295776784-nZxl1H3nyLsVcgdD29r1PZCq \
./bin/hubot -a slack 2> /dev/null | grep -i secret & )
$ curl --data '' http://localhost:8080/pr
Invalid secret
OK
$ curl --data 'secret=XYZABC' http://localhost:8080/pr
Secret verified
OK
$ kill `ps a | grep node | grep -v grep | awk -F ' ' '{ print $1 }'`
```

These commands verify that things are working properly. First, we start
the server, piping the output to `grep` to constrain output related to
our secret processing (we also background the entire chain using an
ampersand and parentheses, a bash trick). Then, we hit the server
running locally without the secret: the server (as it is running in the
same shell) prints out the message "Invalid secret" using `console.log`,
and then cURL prints out "OK," which is what was returned from our
server. If we run the command again, this time including the secret as
post parameters, we see that Hubot verified the secret internally
against its own secret, and then cURL again prints "OK," which was what
the express server inside of Hubot returned to the calling client. The
final line quits Hubot: this command finds the PID for the Hubot client
(which runs as a node process) and then sends it a SIGHUP signal,
signaling to Hubot that it should quit.

Provided you connected correctly to your Slack site, you’ll also see a
message inside your \#general channel, which says "OMG, GitHub is on my
caller-id\!?\!" We now have a simple way to trigger a pull request
notification without going through the formality of actually generating
a pull request. Between our script, which issues real pull requests
through the GitHub API, and this one that fakes a webhook notification,
we have the ability to test our code externally as we develop it. Of
course, our tests are valuable, but sometimes it is impossible to
understand what is happening inside of our Hubot without running against
the real Hubot and not a test harness.

### Assigning an active chat room user

pull requestsassigning an active chat room user
toid=ix\_chapter-06-hubot-activities-asciidoc21
id=ix\_chapter-06-hubot-activities-asciidoc21range=startofrange
range=startofrangeNow that we have an incoming pull request (albeit one
we are faking), we need to write the code to find a random user and
assign them to the pull request.

> **Warning**
> 
> This next section is redundant; our Hubot will function exactly as we
> need it to if you were to disregard any code from this section. Slack
> APIid=ix\_chapter-06-hubot-activities-asciidoc22range=startofrange
> id=ix\_chapter-06-hubot-activities-asciidoc22range=startofrange
> range=startofrangeAs I was writing this book, I mistakenly missed the
> fact that the Hubot `brain` contains a list of users and found another
> avenue to get that data, the Slack API. I wrote the chapter using the
> Slack API, and then discovered my mistake.
> 
> Initially I planned to remove this entire section. However, it does
> demonstrate the ease of using an external service through the built-in
> HTTP client, which is a powerful feature of Hubot. And it also
> demonstrates how powerful tests aid you when developing a Hubot
> extension; I was able to refactor to use a radically different
> internal code path for getting the list of users and maintain faith
> that the end-to-end process of my code works by refactoring and then
> fixing broken tests. And, though not important for this section per
> se, the Slack API provides much richer data on the users logged in to
> a room, which could be valuable in other situations. If you want to
> skip to the next section, you will have all the code to build our
> Hubot as we described earlier. But I think it is a worthwhile read for
> general Hubot understanding.

To find a user in the room, one option is to go outside the Hubot API
and use the Slack API to query for a list of users. The Slack API
provides an endpoint, giving you all users currently in a room. To
access the Slack API, we will use the built-in Hubot HTTP client. Once
we have the list of members in the room we can look over this list and
randomly choose a member and deliver the PR request to them:

``` coffeescript
_SECRET = undefined

anyoneButProbot = (members) ->  
        user = undefined
        while not user
                user = members[ parseInt( Math.random() * \
             members.length ) ].name
                user = undefined if "probot" == user
        user

sendPrRequest = ( robot, body, room, url ) -> 
        parsed = JSON.parse( body )
        user = anyoneButProbot( parsed.members )
        robot.messageRoom room, "#{user}: Hey, want a PR? #{url}"

exports.prHandler = ( robot, req, res ) ->
        slack_users_url =   
                "https://slack.com/api/users.list?token=" +
                process.env.HUBOT_SLACK_TOKEN
        secret = req.body?.secret 
        url = req.body?.url

        if secret == _SECRET and url
                room = "general"
                robot.http( slack_users_url ) 
                        .get() (err, response, body) ->
                                sendPrRequest( robot, body, \
                           room, url ) unless err
        else
                console.log "Invalid secret or no URL specified"
        res.send "OK\n"

exports.setSecret = (secret) ->
        _SECRET = secret
```

  - We define a method called `anyoneButProbot` that takes a list of
    users and finds a random one, as long as it is not the Hubot.

  - The `sendPrRequest` method parses the JSON returned from the Slack
    API and then sends the members inside of the object into the
    `anyoneButProbot` call. It then uses the Hubot API to send a message
    to the room asking if that user will accept the pull request review
    invitation.

  - We build the URL to the Slack service by tacking on the Slack API
    token to the base Slack API URL.

  - As we did before, we pull out the secret and the PR URL, and then
    make sure they both exist.

  - We use the built-in HTTP client to make a GET request to the Slack
    API. Unless we receive an error in the response callback, we use the
    data provided by the Slack API to initiate the PR review request.

To test this using our cURL command, we need to modify the invocation
slightly:

``` bash
$ curl --data 'secret=XYZABC&url=http://pr/1' \
http://localhost:8080/pr
```

Our randomly selected user will see the text `username: Hey, want a
PR? http://pr/1` (and the Slack client will format that link as a
clickable URL).

Unfortunately, our tests are now broken: we now have the failure
`TypeError:
Object #<Object> has no method 'http'`. Our mocked robot object that we
pass into our tests does not have the HTTP interface that comes with
Hubot, so we should add it to our custom Robot. The method signature for
the HTTP client (which comes from the `node-scoped-http-client` NodeJS
package) is hairy: you chain calls together to build up an HTTP client
request and end up with a function returned into which you pass a
callback where you handle the response body. This module makes you write
code that is not particularly testable (said another way, it was
challenging for me to understand what the faked test implementation
should look like), but the setup code does work and the test itself
documents an interface to our robot, which is easily understandable. We
simulate the same chain, defining an `http` attribute on the mocked
robot object, an attribute that resolves to a function call itself.
Calling that function returns an object that has a `get` method, and
calling that function returns a function callback that when called
executes that function with three parameters. In real life that function
callback would contain the error code, the response object, and the
JSON. In our case, as long as the error code is empty, our
implementation will parse the JSON for members, and then issue the PR
request:

``` coffeescript
json = '{ "members" : [ { "name" : "bar" } , { "name" : "foo" } ] }'

httpSpy = jasmine.createSpy( 'http' ).and.returnValue(
        { get: () -> ( func ) ->
                func( undefined, undefined, json ) } )

beforeEach ->
        robot = {
                messageRoom: jasmine.createSpy( 'messageRoom' )
                http: httpSpy
                }

        res = { send: jasmine.createSpy( 'send' ) }
        Handler.setSecret secret

it "should disallow calls without the secret", (done) ->
        req = {}
        Handler.prHandler( robot, req, res )
        expect( robot.messageRoom ).not.toHaveBeenCalled()
        expect( httpSpy ).not.toHaveBeenCalled()
        expect( res.send ).toHaveBeenCalled()
        done()

it "should disallow calls without the url", (done) ->
        req = { body: { secret: secret } }
        Handler.prHandler( robot, req, res )
        expect( robot.messageRoom ).not.toHaveBeenCalled()
        expect( httpSpy ).not.toHaveBeenCalled()
        expect( res.send ).toHaveBeenCalled()
        done()

it "should allow calls with the secret", (done) ->
        req = { body: { secret: secret, url: "http://pr/1" } }
        Handler.prHandler( robot, req, res )
        expect( robot.messageRoom ).toHaveBeenCalled()
        expect( httpSpy ).toHaveBeenCalled()
        expect( res.send ).toHaveBeenCalled()
        done()
```

The code we write here was definitely not a piece of code where testing
came easy; I refactored this multiple times to find a balance between an
easy-to-read test and easy-to-read code. Writing test code takes effort,
but when both your tests and code are readable and minimal, you
generally can be sure you have a good implementation.

We now have a functional and complete implementation of the code to
retrieve a list of users and assign an incoming pull request out to a
randomly selected user from that
listrange=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc22
startref=ix\_chapter-06-hubot-activities-asciidoc22.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc21
startref=ix\_chapter-06-hubot-activities-asciidoc21

### The user list from the Hubot brain

Hubot brainuser list from user list frompull requestsand user list from
Hubot brain and user list from Hubot brainInstead of using the Slack
API, we can replace the code with a much simpler call to
`robot.brain.users`. Calling into the Slack users API takes a callback,
but the `brain.users` call does not, which simplifies our code. We do
verify inside our tests that we make a call to the HTTP Jasmine spy on
the `get` function, so we will want to remove that inside our tests. We
will need to provide a new function called `users` to the Hubot inside
the faked brain we created.

Unfortunately, things don’t just work when we change our code to this:

``` coffeescript
...
users = robot.brain.users()
sendPrRequest( robot, users, room, url, number )
...
```

It is likely that what we got back from the Slack API and what Hubot
stores inside its brain for users are functionally the same information,
but structurally stored very differently. How can we investigate whether
this assumption is correct? NodeJS has a standard library module called
`util`, which includes useful utility functions, as you might expect
from the name. One of them is `inspect`, which will dig into an object
and create a pretty printed view. If we use this module and
`console.log` we can see the full contents of a live response object
passed into our `accept` function. A line like `console.log( require(
'util' ).inspect( users ) )` displays the following:

``` json
{ U04FVFE97:
   { id: 'U04FVFE97',
     name: 'ben',
     real_name: 'Ben Straub',
     email_address: 'xxx' },
  U038PNUP2:
   { id: 'U038PNUP2',
     name: 'probot',
     real_name: '',
     email_address: undefined },
  U04624M1A:
   { id: 'U04624M1A',
     name: 'teddyhyde',
     real_name: 'Teddy Hyde',
     email_address: 'xxx' },
  U030YMBJY:
   { id: 'U030YMBJY',
     name: 'xrd',
     real_name: 'Chris Dawson',
     email_address: 'xxx' },
  USLACKBOT:
   { id: 'USLACKBOT',
     name: 'slackbot',
     real_name: 'Slack Bot',
     email_address: null } }
```

Ah, we were right: the Slack API returns an array while this is an
associative array (called a hash in other languages). So, we need to
refactor our inputs to the test to take an associative array instead of
an array, and then we need a function to flatten it out (after that our
code will work the same as before). We will return that when the user
calls `robot.brain.users` so add a new spy as the `users` key inside our
fake robot:

``` coffeescript
...
users = { CDAWSON: { name: "Chris Dawson" }, BSTRAUB: { name: "Ben Straub" } }
brainSpy = {
        users: jasmine.createSpy( 'getUsers' ).and.returnValue( users ),
        set: jasmine.createSpy( 'setBrain' ),
...
```

Inside our implementation code, flatten out the user associative array
and find the user inside the new flattened array:

``` coffeescript
...
flattenUsers = (users) ->
        rv = []
        for x in Object.keys( users )
               rv.push users[x]
        rv

anyoneButProbot = ( users ) ->
        user = undefined
        flattened = flattenUsers( users )
        while not user
                user = flattened[ parseInt( Math.random() * \
             flattened.length ) ].name
                user = undefined if "probot" == user
        user

...
```

### Sending PR data via webhook

Hubotsending PR data via
webhookid=ix\_chapter-06-hubot-activities-asciidoc23
id=ix\_chapter-06-hubot-activities-asciidoc23range=startofrange
range=startofrangepull requestssending data via
webhookid=ix\_chapter-06-hubot-activities-asciidoc24
id=ix\_chapter-06-hubot-activities-asciidoc24range=startofrange
range=startofrangewebhooksending PR data
viaid=ix\_chapter-06-hubot-activities-asciidoc25
id=ix\_chapter-06-hubot-activities-asciidoc25range=startofrange
range=startofrangeOur wiring is almost complete, so let’s actually send
real pull request information. If we run our script
`issue-pull-request.sh` we will see it sending data out to our Hubot.
Once we have deployed to Heroku, our Hubot is listening on a public
hostname. GitHub will accept the pull request and then send a JSON
inside the body of a POST request made to our Hubot. This JSON looks
very different from the URL-encoded parameters we provide in our cURL
script, so we need to modify our code to fit.

If we retrieve the JSON from a POST, it will look something like this
(reformatted for clarity and brevity):

``` json
{
    "action":"opened",
    "number":13,
    "pull_request": {
      "locked" : false,
      "comments_url" :
      "https://api.github.com/repos/xrd/test_repository/issues/13/comments",
      "url" : "https://api.github.com/repos/xrd/test_repository/pulls/13",
      "html_url" : "https://github.com/xrd/test_repository/pulls/13",
      }
      ...
}
```

Most importantly, you see a URL (the `html_url` more specifically) we
will use inside our Hubot message to the user. Retrieving the JSON and
parsing it is trivial inside our Hubot:

``` coffeescript
...
exports.prHandler = ( robot, req, res ) ->
        body = req.body
        pr = JSON.parse body if body
        url = pr.pull_request.html_url if pr
        secret = pr.secret if pr

        if secret == _SECRET and url
                room = "general"
...
```

Here you see we pull out the body contents, process them as JSON,
extract the secret and the URL from the parsed JSON, and then go through
our normal routine.

Our tests are simple, and require that we send in JSON:

``` coffeescript
...
it "should disallow calls without the secret and url", (done) ->
        req = {}
        Handler.prHandler( robot, req, res )
        expect( robot.messageRoom ).not.toHaveBeenCalled()
        expect( httpSpy ).not.toHaveBeenCalled()
        expect( res.send ).toHaveBeenCalled()
       done()

it "should allow calls with the secret and url", (done) ->
        req = { body: '{ "pull_request" : { "html_url" : "http://pr/1" },
        "secret": "ABCDEF" }' }
        Handler.prHandler( robot, req, res )
        expect( robot.messageRoom ).toHaveBeenCalled()
        expect( httpSpy ).toHaveBeenCalled()
        expect( res.send ).toHaveBeenCalled()
        done()
...
```

We are putting the secret inside the JSON as a convenience. The secret
will not come in with the JSON when GitHub sends us JSON via the
webhook, but this is an easy way to provide it to our handler for the
moment. If we run our tests, they should pass
now.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc25
startref=ix\_chapter-06-hubot-activities-asciidoc25range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc24
startref=ix\_chapter-06-hubot-activities-asciidoc24range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc23
startref=ix\_chapter-06-hubot-activities-asciidoc23

### Securing the webhook

Hubotsecuring webhookid=ix\_chapter-06-hubot-activities-asciidoc26
id=ix\_chapter-06-hubot-activities-asciidoc26range=startofrange
range=startofrangepull requestssecuring
webhookid=ix\_chapter-06-hubot-activities-asciidoc27
id=ix\_chapter-06-hubot-activities-asciidoc27range=startofrange
range=startofrangewebhooksecuringid=ix\_chapter-06-hubot-activities-asciidoc28
id=ix\_chapter-06-hubot-activities-asciidoc28range=startofrange
range=startofrangeOur Hubot is now in a position where it will operate
correctly if the secret passes validation and the webhook data is passed
properly. Now we need to secure the webhook. GitHub signs your data
inside the webhook payload, which provides you with a way to verify the
data really came from an authorized host. We need to decode it inside
our handler. To do this, we will need to retrieve the secure hash GitHub
provides inside the request headers. Then, we will need to calculate the
hash ourselves using the secret we maintain internally. If these hashes
match, then we know the incoming request and JSON is truly from GitHub
and not an attacker:

``` coffeescript
...
getSecureHash = (body, secret) ->
        hash = crypto.
                createHmac( 'sha1', secret ).
                update( "sha1=" + body ).
                digest('hex')
        console.log "Hash: #{hash}"
        hash

exports.prHandler = ( robot, req, res ) ->
        slack_users_url =
                "https://slack.com/api/users.list?token=" +
                process.env.HUBOT_SLACK_TOKEN
        body = req.body
        pr = JSON.parse body if body
        url = pr.pull_request.html_url if pr
        secureHash = getSecureHash( body, _SECRET ) if body
        webhookProvidedHash = req.headers['HTTP_X_HUB_SIGNATURE' ] \
                if req?.headers
        secureCompare = require 'secure-compare'

        if secureCompare( secureHash, webhookProvidedHash ) and url
                room = "general"
                robot.http( slack_users_url ) ->
                        .get() (err, response, body) ->
                                sendPrRequest( robot, body, \
                           room, url ) unless err
        else
...
```

The signature ishash message authentication code (HMAC) a *hash message
authentication code* (HMAC). HMAC cryptography is vulnerable to timing
attacks. When you use this encryption technique, the time it takes to
complete a comparison of the computed hash and the sent hash can be the
starting point for an attacker to gain forced access to a server. More
specifically to JavaScript, naive comparison operators like `==` will
leak this timing information. secure–compare moduleTo eliminate the risk
that this information could be used to compromise the host system, we
use a module called `secure-compare` that obscures this timing
information when making a comparison. To load this module, we need to
add it to our *package.json* manifest file with the command `npm install
secure-compare --save`.

Now we can adjust our tests to fit the new reality of our handler:

``` coffeescript
...
it "should disallow calls without the secret and url", (done) ->
        req = {}
        Handler.prHandler( robot, req, res )
        expect( robot.messageRoom ).not.toHaveBeenCalled()
        expect( httpSpy ).not.toHaveBeenCalled()
        expect( res.send ).toHaveBeenCalled()
        done()

it "should allow calls with the secret and url", (done) ->
        req = { body: '{ "pull_request" : { "html_url" : "http://pr/1" }}',
      headers: { "HTTP_X_HUB_SIGNATURE" :
               "cd970490d83c01b678fa9af55f3c7854b5d22918" } }
        Handler.prHandler( robot, req, res )
        expect( robot.messageRoom ).toHaveBeenCalled()
        expect( httpSpy ).toHaveBeenCalled()
        expect( res.send ).toHaveBeenCalled()
        done()
...
```

You’ll notice we moved the secret out of the JSON and into the headers.
This is the same structure our Hubot will see when the GitHub webhook
encodes the content of the JSON and provides us with a secure hash in
the HTTP\_X\_HUB\_SIGNATURE key. Inside our test we will need to provide
the same signature inside our mocked request object. We could duplicate
our secure hash generation code from the handler implementation, or we
could be lazy and just run our tests once (knowing they will fail this
time), watch for the console.log output that says "Hash: cd970490d83c…​"
and copy this hash into our mocked request object. Once we do this, our
tests will pass.

Now, after reloading our Hubot, if we issue a pull request using our
issue-pull-request.sh script, we should see the matching hashes. But we
won’t (at least if you used the same *package.json* file as we specified
earlier) because of a critical bug inside of Hubot at the time of this
writing.

Express.jsNodeJSand Express.js and Express.jsAs we mentioned earlier,
Hubot bundles Express.js, a high-performance web framework for NodeJS.
Express.js has a modular architecture, where middleware is inserted into
a request and response chain. This approach to building functionality
and the wide array of middleware allows web developers to string
together various standardized middleware components to use only those
features needed for the problem at hand. Common middleware includes
static file handlers (for serving static files), cookie handlers,
session handlers, and body parsers. You can imagine circumstances where
you would not need all of these (or you might need others) and this
flexibility makes Express.js a popular choice for building NodeJS web
applications.

The body body parser middlewareparser middleware is of particular
interest to us here: the body parser middleware is used to convert the
"body" of a request into a JavaScript object attached to the request
object. Previously you saw us access it inside a variable we called
`req` inside our callback; obviously this stands for request. The body
parser takes on converting whatever data content comes from inside the
body of the HTTP request into a structured JavaScript associative array
inside the `body` object within our request object. If the body is URL
encoded (as the PR information is encoded if we create the webhook with
the `content_type` set to `form`), then the body parser URL decodes the
content, parses it as JSON, and then sets the inflated object to the
body attribute on our request object. Normally, this is a very handy
process that removes a lot of grunt work for web application authors.

Unfortunately, because the `express` object is bundled and configured
for us long before our extension is loaded, we cannot interrupt the load
order of the body parser middleware inside our extension, which means we
cannot get access to the raw body content. The body parser middleware
processes the stream of data by registering for events inside the HTTP
request flow. NodeJS made a mark on web application development by
providing a network application toolkit centered around one of the most
controversial features of JavaScript: the asynchronous callback. In
NodeJS, processes register for events and then return control to the
host program. In other languages, like Ruby, for example, when building
services that receive data from clients, by default, you listen for
incoming data, and the moment you tell your program to listen, you have
blocked other processing. Asynchronous programming is by no means a new
concept (threading in many languages, for example), but NodeJS offers a
simple way to interact with asynchronous functions through event
registration. In the case of express middleware, however, this event
registration process bites us, because middleware loaded first gets
first access to incoming data, and once the body parser has processed
our body content, we can no longer access the original content. We need
access to the raw body content, and there is no way to install our own
middleware that would provide it inside our Hubot extension when a PR
request is received on the router.

What options do we have then? Well, fortunately, every bit of our stack
here is open source, and we can modify the code inside Hubot that sets
up our express server to fit our needs. This code is installed by the
`npm` tool in the node\_modules directory, and we can easily find where
express is configured inside of Hubot. There are issues with doing it
this way: if we rerun `npm install` we will blow away our node\_modules
directory, and this is something Heroku will do if it is not told
otherwise. A better way might be to fork Hubot and store our own copy of
Hubot inside of GitHub and then specify our forked copy inside of the
*package.json*? file. This has issues too; if Hubot gets updated with a
critical security flaw, we need to merge those changes into our fork, a
maintenance issue we would avoid if we use tagged releases from the main
repository. There is, unfortunately, no perfect way to resolve this
problem that does not itself create other problems.

If you do choose to modify the built-in Hubot code, modify the file
*robot.coffee* inside the node\_modules/hubot/src/ directory. The
node\_modules directory, in case memory fails, is where the NodeJS
package manager (npm) builds out the local dependency tree for
libraries, and this is the file Hubot uses internally to build the robot
object and set up the express HTTP server. If we add the following code
at line 288 (this line number might vary if you are not using the same
version of Hubot we specify in our *package.json*), we can install a
custom middleware callback that will provide us with the raw body we can
use when verifying the HMAC signature:

``` coffeescript
...
app.use (req, res, next) =>
  res.setHeader "X-Powered-By", "hubot/#{@name}"
  next()

app.use (req, res, next) =>
  req.rawBody = ''
  req.on 'data', (chunk) ->
    req.rawBody += chunk
  next()

app.use express.basicAuth user, pass if user and pass
app.use express.query()

...
```

Express express middlewaremiddleware have a very simple interface: they
are nothing more than a JavaScript function callback that receives a
request, response, and continuation function passed as parameters. We
register a listener when data content (the body) is propagated, and then
add the body content to a variable on the request object. When the
request object is passed in to our handler for pull requests within our
Hubot, we have the raw data prefilled. The `next()` function is used to
indicate to the middleware host that the next middleware can proceed.

We now need to adjust our tests to fit this new requirement. We prime
the pump with a request object that has this `rawBody` inside it, and we
should properly encode the content using `encodeURIComponent` to match
the format in which it will be appearing from GitHub:

``` coffeescript
...
it "should allow calls with the secret and url", (done) ->
        payload =  '{ "pull_request" : { "html_url" : "http://pr/1" } }'
        bodyPayload = "payload=#{encodeURIComponent(payload)}"
        req = { rawBody: bodyPayload,
        headers: { "x-hub-signature" : \
         "sha1=dc827de09c5b57da3ee54dcfc8c5d09a3d3e6109" } }

        Handler.prHandler( robot, req, res )
        expect( robot.messageRoom ).toHaveBeenCalled()
        expect( httpSpy ).toHaveBeenCalled()
        expect( res.send ).toHaveBeenCalled()
        done()
...
```

Our implementation breaks our tests, so we will need to modify the cost
to use the `rawBody` attribute on the request object, break it apart
from the payload key/value pair, URI decode it, and then if all that
works, parse the JSON and start the verification process. Our tests
describe all this for us. The new `prHandler` method looks like this:

``` coffeescript
...
exports.prHandler = ( robot, req, res ) ->

        rawBody = req.rawBody
        body = rawBody.split( '=' ) if rawBody
        payloadData = body[1] if body and body.length == 2
        if payloadData
                decodedJson = decodeURIComponent payloadData
                pr = JSON.parse decodedJson

                if pr and pr.pull_request
                        url = pr.pull_request.html_url
                        secureHash = getSecureHash( rawBody )
                        signatureKey = "x-hub-signature"
                        if req?.headers
                                webhookProvidedHash =
                                        req.headers[ signatureKey ]
                        secureCompare = require 'secure-compare'
                        if url and secureCompare( "sha1=#{secureHash}",
                                        webhookProvidedHash )
                                room = "general"
                                users = robot.brain.users()
                                sendPrRequest( robot, users, room, url )
                        else
                                console.log "Invalid secret or no URL specified"
                else
                        console.log "No pull request in here"

        res.send "OK\n"

_GITHUB = undefined

...
```

When all is said and done, is verifying the signature even worth it? If
we are not hosting our Hubot on a service that handles our router
requests over HTTPS, this HMAC verification could be compromised. And,
given the issues with maintaining our own copy of the Hubot code in
order to permit the validation inside our Hubot extension, it might be
best to ignore the validation header. The worst case, as our extension
is written now, would be that an attacker could fake a pull request
notification, and falsely engage chat room users around it. If the PR
the attacker used was fake, it might confuse our Hubot, but no real harm
would be done. If they used an existing real PR, an attacker could trick
our Hubot into adding data to the PR, adding confusion in the comments
about who accepted the review request. We won’t solve that potential
problem with this code, but you can imagine adding code to our Hubot
that handles a case like this (for example, by checking first to see if
someone was already tagged on the PR, and ignoring successive incoming
webhooks associated with that
PR).range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc28
startref=ix\_chapter-06-hubot-activities-asciidoc28range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc27
startref=ix\_chapter-06-hubot-activities-asciidoc27range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc26
startref=ix\_chapter-06-hubot-activities-asciidoc26

### Responding to the PR request

Hubotresponding to pull
requestsid=ix\_chapter-06-hubot-activities-asciidoc29
id=ix\_chapter-06-hubot-activities-asciidoc29range=startofrange
range=startofrangepull requestsresponding
toid=ix\_chapter-06-hubot-activities-asciidoc30
id=ix\_chapter-06-hubot-activities-asciidoc30range=startofrange
range=startofrangeOur Hubot is now programmed to generate a pull request
review message and send it to a random user. What happens when they
respond? They can respond in two ways obviously: accepting the request
or declining the request. We put placeholders in our Hubot extension to
notify us with a debugging message when the user responds and send a
message back to whoever sent us a message, but now we can actually wire
up handling the response and adding to the pull request on GitHub based
on the user we are interacting with (provided they accepted).

There are multiple ways in which a Hubot can interact with chat room
messages. hear methodrespond methodWe chose the `respond` method, but
there is another method called `hear` we could have used. `respond` is
used when the message is preceded by the Hubot name, so only messages
that look like `probot: accept` or `@probot decline` or `/ accept` (if
the Hubot name alias is enabled) will be processed by our Hubot. We
could have used `hear` but in our case we are processing a simple
response, and without a clear direction for the message, it would be
difficult to always make sure we were interpreting the message in the
correct context. `respond` makes more sense here.

If they decline the request, let’s just graciously note that the offer
was declined:

``` coffeescript
...
exports.decline = ( res ) ->
        res.reply "No problem, we'll go through this PR in a bug scrub"

...
```

We are asking someone to accept a pull request, and there is a possible
situation where two could come in within a very short period of time.
For this reason, it probably makes sense for us to indicate the pull
request identifier in the communication with the target user. And, users
should be told to reply with a string like `accept
112`. The Hubot can then interpret this to mean they are accepting PR
\#112 and not the other pull request the Hubot invited John to respond
to 10 seconds later.

If we do this, our Hubot does need to save the state of pull request
invitations. Hubot brainand pull request state and pull request
stateFortunately, there is an extremely easy way to do this using the
"brain" of our Hubot. The brain is a persistent store, typically backed
by Redis, into which you can keep any type of information. You simply
reference the `robot.brain` and use methods like `get` or `set` to
retrieve and store information. The `set` method takes any key and any
value but note that the Hubot brain does not do much with your value if
that value happens to be a complex object; if you want to properly
serialize something beyond a flat value, you should probably call
`JSON.stringify` on the object to maintain full control over the
roundtrip storing and retrieval.

Let’s modify our Hubot handler to deal with accepting or declining
responses (and change our extension file to deal with this new
interface). Of course, we will need to add to our tests. Finally, we
will need to set up a way to provide the GitHub API key to our Hubot
handler, so we’ll add a method to do that that looks almost exactly like
the one for setting our secret key.

node–github moduleWe’ll use a GitHub API NodeJs module called
`node-github`, found on GitHub at
<https://github.com/mikedeboer/node-github>. If we look at the API
documentation, we see that it supports authentication using an OAuth
token (using the `github.authenticate( { 'type' : 'oauth': 'token' :
'...' }` syntax), and has methods we can use to add a comment to an
issue or pull request associated with a repository (using the
`github.issues.createComment` method).

Knowing that this module handles most of the work for us between these
two methods, we can start by writing our tests. We’ll create a new
describe block called `#response` that groups our tests together. As we
noted earlier, our Hubot can take affirmative and negative responses, so
our tests should reflect these two code paths. Our setup block (the
`beforeEach` section) in both cases should do the same thing for each
response—make the pull request invitation to a random user: this all
happens inside our `prHandler` code. We don’t need to verify the
expectations of this method since that got that covered by prior tests.
After we get our handler to the right state, we need to test that the
handler works correctly with an `accept` and `decline` method (they
don’t yet exist in our handler code so we’ll add them next).

Our accept request handler triggers our Hubot to contact GitHub and add
a comment to the pull request noting our targeted chat user accepted the
request. The network connection to the GitHub API uses the GitHub API
bindings from within the `node-github` module. We want to make this
testable, so we should pass in the GitHub binding object inside our
interface, and during the test, pass in a mocked object. If we review
the documentation for the `createComment` in the GitHub API binding, we
see it requires information about the repository such as the user or
organization that owns the repository, the repository name, the issue
number (pull requests are also referenced by issue numbers), and the
comment itself. To get this information we simply need to decode it from
the Hubot handler that receives the pull request information, and we
will add code that does this (and is exposed in our handler for
testing). We saw that a pull request comes in through a large JSON
response, and we can use the URL we used earlier as the way we decode
this information. So, we’ll need to have two more tests inside our
`#response` block, one for the decoding of the URL into a message
object, and another to retrieve the username we insert into the comment
stored in the pull request on the repository. We know what our test URL
looks like since we saw it in our PR webhook message, but we don’t yet
have the structure of the chat message from which we can pull out our
username, so our test will need to be adjusted when we know what it
really looks like.

Declining the request means nothing happens. If we mock out our GitHub
API binding, acceptance should log in (using the `authenticate` method)
and then call `createComment`. These are directly pulled from the GitHub
API NodeJS documentation. Finally, we should record the result of this
operation inside the chat room, which happens using the reply method on
our response object:

``` coffeescript
...
describe "#response", ->
        createComment = jasmine.createSpy( 'createComment' ).and.
                callFake( ( msg, cb ) -> cb( false, "some data" ) )
        issues = { createComment: createComment }
        authenticate = jasmine.createSpy( 'ghAuthenticate' )
        responder = { reply: jasmine.createSpy( 'reply' ),
        send: jasmine.createSpy( 'send' ) }
        beforeEach ->
                githubBinding = { authenticate: authenticate, \
                              issues: issues }
                github = Handler.setApiToken( githubBinding, \
                                      "ABCDEF" )
                req = { body: '{ "pull_request" : \
                         { url : "http://pr/1" } }', \
                         headers: { "HTTP_X_HUB_SIGNATURE" : \
                         "cd970490d83c01b678fa9af55f3c7854b5d22918" } }
                Handler.prHandler( robot, req, responder )

        it "should tag the PR on GitHub if the user accepts", (done) ->
                Handler.accept( responder )
                expect( authenticate ).toHaveBeenCalled()
                expect( createComment ).toHaveBeenCalled()
                expect( responder.reply ).toHaveBeenCalled()
                done()

        it "should not tag the PR on GitHub if the user declines", \
           (done) ->
                Handler.decline( responder )
                expect( authenticate ).toHaveBeenCalled()
                expect( createComment ).not.toHaveBeenCalledWith()
                expect( responder.reply ).toHaveBeenCalled()
                done()

        it "should decode the URL into a proper message object " + \
           "for the createMessage call", (done) ->
                url = "https://github.com/xrd/testing_repository/pull/1"
                msg = Handler.decodePullRequest( url )
                expect( msg.user ).toEqual( "xrd" )
                expect( msg.repository ).toEqual( "testing_repository" )
                expect( msg.number ).toEqual( "1" )
                done()

        it "should get the username from the response object", (done) ->
                res = { username: { name: "Chris Dawson" } }
                expect( Handler.getUsernameFromResponse( res ) ).toEqual \
                             "Chris Dawson"
                done()
```

Note that this code was indented to save space, but yours will be nested
in several deeper levels of indentation. Refer to the sample repository
for the exact code if there is confusion.

Our tests will fail if we run them now. So, let’s write the code at the
end of our delegator extension. We need code that parses the URL into
the appropriate structured message object, code to put the reminder into
the pull request comment on GitHub, and code that pulls the user out of
the response object passed to us. The first two of these are within
reach; basic JavaScript and reading the GitHub API binding documentation
will get us to these two. The third one requires a little more
investigation, so we will leave this as a placeholder for now.

To convert the URL into the object necessary for the `createMessage`
call, we just need to split the message into pieces by the slash
character, and then retrieve the correct items by index. We probably
could add some additional tests that cover passing in empty strings, or
other edge cases, but we’ll leave it as an exercise to the reader. Our
code does not crash in these cases, but it would be nice to have
coverage of our expectations represented in our tests:

``` coffeescript
...
_GITHUB = undefined
_PR_URL = undefined

exports.decodePullRequest = (url) ->
        rv = {}
        if url
                chunks = url.split "/"
                if chunks.length == 7
                        rv.user = chunks[3]
                        rv.repository = chunks[4]
                        rv.number = chunks[6]
        rv

exports.getUsernameFromResponse = ( res ) ->
        "username"

exports.accept = ( res ) ->

        msg = exports.decodePullRequest( _PR_URL )
        username = exports.getUsernameFromResponse( res )
        msg.body = "@#{username} will review this (via Probot)."

        _GITHUB.issues.createComment msg, ( err, data ) ->
                unless err
                        res.reply "Thanks, I've noted that in a PR comment!"
                else
                        res.reply "Something went wrong, " + \
                  "I could not tag you on the PR comment."

exports.decline = ( res ) ->
        res.reply "OK, I'll find someone else."
        console.log "Declined!"

exports.setApiToken = (github, token) ->
        _API_TOKEN = token
        _GITHUB = github
        _GITHUB.authenticate type: "oauth", token: token

exports.setSecret = (secret) ->
        _SECRET = secret
```

To summarize, we added an internal variable called `_GITHUB` where we
will store a reference to our instantiation of the GitHub API binding.
Our interface to the `setApiToken` call passes in the instantiation;
this method takes our OAuth token and the binding because using an
interface like this means we can pass in a mocked binding inside our
tests. When we are not running inside a test, this method call
authenticates against the GitHub API, readying the API binding to make
connections to the GitHub API itself.

Our top-level extension script looks like this now:

``` coffeescript
handler = require '../lib/handler'

handler.setSecret "XYZABC"
github = require 'node-github'
handler.setApiToken github, "12345ABCDEF"

module.exports = (robot) ->
        robot.respond /accept/i, ( res ) ->
                handler.accept( res )

        robot.respond /decline/i, ( res ) ->
                handler.decline( res )

        robot.router.post '/pr', ( req, res ) ->
                handler.prHandler( robot, req, res )
```

If you were to look only at this code, the interface is clean, and the
bulk of the work is handled by our very testable
handler.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc30
startref=ix\_chapter-06-hubot-activities-asciidoc30range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc29
startref=ix\_chapter-06-hubot-activities-asciidoc29

### Peering into the response object

callbackHubotand pull request response object and pull request response
objectpull requestsand response object and response objectrespond
callbackWe need to get the username, and it stands to reason that the
object passed to us when we get a respond callback might have it in
there. The `respond` method provided by the Hubot API is documented
mostly by way of the example scripts that come with Hubot. There is very
little information on what the parameter passed to your callback looks
like. Let’s use the `util` library to inspect the data and print it to
the console. We abbreviate the full output here, and show you that it
contains information on the user who sent the message to our Hubot. We
can access this information by using `response.message.user.name` if,
for example, we wanted to retrieve the name of the user:

``` json
{ robot:
   { name: 'probot',
     brain:
      { data: [Object],
  ...
  message:
   { user:
      { id: '...',
        name: 'xrd',
        real_name: 'Chris Dawson',
        email: 'chrisdawson@example.com'
     ...
     text: 'probot accept',
     rawText: 'accept',
     rawMessage:
      { _client: [Object],
  ...
  match: [ 'probot accept', index: 0, input: 'probot accept' ],
  ...
}
```

Inside it all we can find information we need, specifically the username
and email. So, let’s update our test and our handler code. The last test
in our spec file can be modified to look like this:

``` coffeescript
...
it "should get the username from the response object", (done) ->
        res = { message: { user: { name: "Chris Dawson" } } }
        expect( Handler.getUsernameFromResponse( res ) ).toEqual "Chris Dawson"
        done()

...
```

And, our handler code defining `getUsernameFromResponse` simply turns
into this:

``` coffeescript
...
exports.getUsernameFromResponse = ( res ) ->
        res.message.user.name

...
```

With this information in hand, we can properly comment on the pull
request. Well, almost.

### Unifying usernames via the Collaborators API

Collaborators API, unifying usernames viaHubotunifying usernames via
Collaborators API unifying usernames via Collaborators APIpull
requestsunifying usernames via Collaborators API unifying usernames via
Collaborators APIusernames, unifying via Collaborators APIIf the Slack
username for the person who accepted the pull request is an exact match
with their GitHub username, then we can assume they are the same person
in real life and create a comment inside the pull request reminding them
(and anyone else) that they will be reviewing the PR. We can use the
collaborator subsection of the Repository API to look up their name on
GitHub.

If we don’t find them inside the list of users and there is not an exact
match with their Slack name then we have at least one problem, maybe
two. First, we could just have a mismatch in their identities (their
usernames are different on each site). If this is the case, we could ask
them to clarify this inside the Slack room. We do have another case: the
user is not a collaborator on the repository hosted on GitHub. If this
is the case, clarifying their username is not going to help. The
Repository API does support adding a user to the list of collaborators
so we could do that here, but this arguably is a moment where a larger
discussion should happen (write access to a repository is a big
resposibility in a way that being inside a chat room is not). Adding a
user as a repository collaborator should not be automated inside a chat
room. Because of the complexity here, we will write code to unify a
username inside the chat room, but we won’t handle the case where there
is no clarification to be made because they are not in the repository
collaborator list.

Using the GitHub API binding we passed into our `setApiToken` call we
will verify the user exists as a collaborator on the repository. The API
binding provides a method called `getCollaborator` inside the `repos`
namespace we can use to verify that a username is on the list of
collaborators. It takes as the first parameter a message that is used to
specify the repository and owner, and then an attribute called
`collabuser`, which is the name you want to ensure is a collaborator.
The second parameter to the function is a callback that is executed once
the request has completed. If the callback returns without an error
code, then our Hubot should tag the pull request with a comment
confirming and message the room.

Our new test reflects usage of the `repos.getCollaborator` call. In our
test setup block we mock out the call to `getCollaborator` and use
Jasmine to "spy on" it so we can assure it was called later in our
actual test. Our setup is more beefy than before, but we are following
the same patterns of generating spies to watch methods, and implementing
our fake callbacks when necessary. We can also move our message inside
the response object into the one created in our setup block so that we
can use it inside all of our subtests, rather than creating a new object
for each test inside the test body:

``` coffeescript
...
send: jasmine.createSpy( 'send' ),
message: { user: { name: "Chris Dawson" } } }
getCollaborator = jasmine.createSpy( 'getCollaborator' ).and.
        callFake( ( msg, cb ) -> cb( false, true ) )
repos = { getCollaborator: getCollaborator }

...

it "should tag the PR on GitHub if the user accepts", (done) ->
        Handler.accept( robot, responder )
        expect( authenticate ).toHaveBeenCalled()
        expect( createComment ).toHaveBeenCalled()
        expect( responder.reply ).toHaveBeenCalled()
        expect( repos.getCollaborator ).toHaveBeenCalled()
        done()
```

Our handler can then implement the accept and decline methods in full:

``` coffeescript
...
exports.accept = ( robot, res ) ->

        prNumber = res.match[1]
        url = robot.brain.get( prNumber )

        msg = exports.decodePullRequest( url )
        username = exports.getUsernameFromResponse( res )
        msg.collabuser = username

        _GITHUB.repos.getCollaborator msg, ( err, collaborator ) ->
                msg.body = "@#{username} will review this (via Probot)."

                _GITHUB.issues.createComment msg, ( err, data ) ->
                        unless err
                                res.reply "Thanks, I've noted that " + \
                      "in a PR comment. " + \
                          "Review the PR here: #{url}"
                        else
                                res.reply "Something went wrong."  + \
                          "I could not tag you " + \
                      "on the PR comment: " +
            "#{require('util').inspect( err )}"

exports.decline = ( res ) ->
        res.reply "No problem, we'll go through this PR in a bug scrub"
...
```

We now have a full implementation of both the `accept` and `decline`
methods inside our Hubot.

### Sanitizing our source code

Hubotsanitizing source code sanitizing source codeIt is typically bad
form to save passwords (or other access credentials, like OAuth tokens
or secrets) inside of source code. Right now we have hardcoded them into
our application inside of the *pr-delegator.coffee* file. We could
instead retrieve them from the environment of the running process:

``` coffeescript
...
handler.setSecret process.env.PROBOT_SECRET
github = require 'github'
ginst = new github version: '3.0.0'
handler.setApiToken ginst, process.env.PROBOT_API_TOKEN
...
```

command linelaunching Hubot from launching Hubot fromWhen we launch our
Hubot from the command line, we will need to use a command like this as
we are testing locally from our laptop:

``` bash
$ PROBOT_SECRET=XYZABC \
PROBOT_API_TOKEN=926a701550d4dfae93250dbdc068cce887531 \
HUBOT_SLACK_TOKEN=xoxb-3295776784-nZxl1H3nyLsVcgdD29r1PZCq \
./bin/hubot -a slack
```

Herokupublishing into publishing intoWhen we publish into Heroku, we
will want to set these as environment variables using the appropriate
Heroku
commands:

``` bash
$ heroku config:set PROBOT_API_TOKEN=926a701550d4dfae93250dbdc068cce887531
Adding config vars and restarting myapp... done, v12
PROBOT_API_TOKEN=926a701550d4dfae93250dbdc068cce887531

$ heroku config:set PROBOT_SECRET=XYZABC
Adding config vars and restarting myapp... done, v12
PROBOT_SECRET=XYZABC
```

Don’t forget that when we run our tests, we will need to specify the
environment variables on the command line as
well:range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc20
startref=ix\_chapter-06-hubot-activities-asciidoc20range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc19
startref=ix\_chapter-06-hubot-activities-asciidoc19range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc18
startref=ix\_chapter-06-hubot-activities-asciidoc18range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc17
startref=ix\_chapter-06-hubot-activities-asciidoc17

``` bash
$ PROBOT_SECRET=XYZABC \
PROBOT_API_TOKEN=926a701550d4dfae93250dbdc068cce887531 \
node_modules/jasmine-node/bin/jasmine-node --coffee \
spec/pr-delegator.spec.coffee
```

# Summary

Our Hubot is alive\! We went through building a robot that can interact
with us inside a chat room, then refactored the robot so that its
functionality is contained into a highly testable module. Along the way,
we got intimate with the Hubot API, and even discussed how to modify
(and the drawbacks surrounding) modifying the source code to Hubot
itself. Finally, we demonstrated how to use the Activity API receiving
(and faking data) coming from a GitHub
webhook.range=endofrangestartref=ix\_chapter-06-hubot-activities-asciidoc0
startref=ix\_chapter-06-hubot-activities-asciidoc0

In the next chapter we will look at building a single-page application
that edits information inside a GitHub repository using JavaScript and
the GitHub.js library talking to the Pull Request API.

# Android and the Git Data API

Androidid=ix\_chapter-07-android-asciidoc0range=startofrange
id=ix\_chapter-07-android-asciidoc0range=startofrange
range=startofrangeAndroidand Git Data
APIid=ix\_chapter-07-android-asciidoc1
id=ix\_chapter-07-android-asciidoc1range=startofrange
range=startofrangeYou might not use your phone right now as a developer
tool, but the odds are that you will soon. At the moment, phones and
tablets can be great for reading code, but the editors we developers use
on our laptops have not yet been reimagined for mobile devices. We are
getting close though: the GitHub API is accessible through the
well-written EGit client library for Java, and this library supports
both reading data stored on GitHub and writing data back into it. These
are a perfect set of building blocks to develop applications for the
Android platform, currently the world’s most popular mobile OS.

In this chapter, we’ll use the Java EGit libraries to develop a small
Android application that posts to our blog hosted on GitHub. Our
blogging application will allow us to log in to GitHub, and then ask us
for a quick note describing how we are feeling. The application will
then compose a Jekyll blog post for us and push the post into our blog
on GitHub.

# Setting Up

Android application examplesetup forid=ix\_chapter-07-android-asciidoc2
id=ix\_chapter-07-android-asciidoc2range=startofrange
range=startofrangeTo build this application, we need to create a Jekyll
blog and then install the necessary Android build tools.

## Creating a Jekyll Blog

Jekyll blogsfor Android app for Android appWe are writing an application
that adds Jekyll blog entries, and we are writing tests to verify our
application works as advertisted, so we need a sandbox blog against
which we can run commands. There are various ways to create a new Jekyll
blog. The simplest is to run a series of Ruby commands documented here;
if you want to know more about Jekyll, it is covered in more depth in
[section\_title](#Jekyll). There are a few items of note when
establishing a Jekyll blog that have some complexity, things like
mapping a hostname properly and using the correct branch inside Git. For
our purposes here, however, we won’t need to make sure all that is
established. All we need is to make sure we have a sandbox repository
that has the structure of a Jekyll blog:

``` bash
$ echo "source 'https://rubygems.org'" >> Gemfile
$ echo "gem 'github-pages'" >> Gemfile
$ echo "gem 'hub'" >> Gemfile
$ export BLOG_NAME=mytestblog
$ bundle
$ jekyll new $BLOG_NAME
$ cd $BLOG_NAME
$ hub create
$ git push -u origin master
```

These commands install the correct libraries for using Jekyll (and one
for our tests as well), generate a new blog using the Jekyll
command-line tool, and then create a blog on GitHub with those files. On
the second line we specify the name of the blog; you are welcome to
change this to any name you’d like, just make sure the tests match the
name.

> **Warning**
> 
> When you have finished running these commands, you should close the
> terminal window. There are other commands later in this chapter that
> should occur in a fresh directory and as such it is best not to run
> those commands from within the same directory where you created your
> Jekyll blog. You’ve pushed all those files into GitHub, so you could
> safely delete the local repository in this directory.

## Android Development Tools

Androiddevelopment tools for development tools forIf you don’t have a
physical Android device, don’t fret. You can follow along with this
chapter without having an actual Android device by doing development and
testing on a virtual device.

### Installing the Java SDK

AndroidJava SDK installation Java SDK installationJavaSDK installation
SDK installationUnfortunately there is no simple shell command to
install Java in the same way as there is for Ruby and NodeJS using RVM
or NVM. Oracle controls the Java language and distribution of official
SDKs, and it restricts access to downloads other than from
java.oracle.com. Java is freely available, but you need to visit
java.oracle.com and find the correct download for your needs. Android
works with the 1.7 versions of Java or better.

### Installing Android Studio

AndroidAndroid Studio installation Android Studio installationWe will
use Android Studio, the Google IDE for developing Android applications.
To install it, go to <https://developer.android.com/sdk/index.html> and
you will see a download button for your platform (OS X, Linux, and
Windows supported). Android Studio bundles all the important tools for
building Android
applications.range=endofrangestartref=ix\_chapter-07-android-asciidoc2
startref=ix\_chapter-07-android-asciidoc2

# Creating a New Project

Android application examplecreating new
projectid=ix\_chapter-07-android-asciidoc3
id=ix\_chapter-07-android-asciidoc3range=startofrange
range=startofrangeLet’s now create our Android project. Android
StudioWhen you first open Android Studio, you will see an option in the
right pane inviting you to create a new project. Click the "Start a new
Android Studio project" option. In the next step, you will see a screen
for configuring your new project. Enter GhRU ("GitHub R U?") into the
Application Name and use *example.com* as the Company Domain (or use
your own domain, but be aware that this will make the directory
structure presented in this chapter different than yours). Android
Studio should automatically generate the "package name" for you as
`com.example.ghru`.

You will then need to choose aSDK (software development kit)target SDK
target SDK. The higher the target, the better access to newer Android
APIs, but the fewer number of devices that can run the application. The
code in this chapter will work with older SDKs, so let’s make a balanced
choice and use Android 4.4 (KitKat), which runs on phones and tablets.
At the moment this means, according to Android Studio, that our
application will run on 49.5% of Android devices in the world as shown
in [figure\_title](#choose-android-sdk).

![Choose an Android SDK](images/btwg_07in01.png)

You will then be presented with a choice of activities. Choose "Blank
Activity." You will be taken to a screen that allows you to customize
the activity. Accept the defaults of "MainActivity" as the Activity Name
and the associated files for the layout, title, and menu resource name.
Then click the "Finish" button to generate the project.

After completing these steps, Android Studio will create Gradle
configuration files and generate the structure of your application. Once
this has completed, you can review the file tree of your project by
clicking the lefthand vertical tab labeled "Project" as shown in
[figure\_title](#reviewing-android-project-structure).

![Reviewing the Android project structure for the first
time](images/btwg_07in02.png)

If you have never seen an Android project before, this screen deserves
some explanation. The *app* directory contains your application code and
resources (layout files, images, and strings). Inside the *app*
directory you will see several other directories: The *java* directory
contains, quite obviously, any Java code for the project, which includes
the application files, and also programs that do not reside in the app
when it is published to the app store but perform testing on the app.
The *res* directory contains the resources we mentioned. Android Studio
lists all build files under the Gradle Scripts section, and groups them
regardless of their directory placement. You can see two *build.gradle*
files, the first of which you can generally ignore, though the second we
will need to adjust.

Now we are ready to start editing our project.

## Editing the Gradle Build File

Android application exampleGradle build file
editingid=ix\_chapter-07-android-asciidoc4
id=ix\_chapter-07-android-asciidoc4range=startofrange
range=startofrangeGradleid=ix\_chapter-07-android-asciidoc5range=startofrange
id=ix\_chapter-07-android-asciidoc5range=startofrange
range=startofrangeFirst, we need to add to our Gradle build file and
specify the dependent libraries. Gradle is a build system for Java and
has become the offical build system for the Android platform. Open the
*build.gradle* within the `app` module (the second of the two
*build.gradle* files):

``` groovy
apply plugin: 'com.android.application' //  

android {
    compileSdkVersion 23 //  
    buildToolsVersion "23.0.1"

    defaultConfig {
        applicationId "com.example.ghru"
        minSdkVersion 21
        targetSdkVersion 23
        versionCode 1
        versionName "1.0"
        testInstrumentationRunner
            "android.support.test.runner.AndroidJUnitRunner" //  
    }
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'),
            'proguard-rules.pro'
        }
    }
}

dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar']) //  
    compile 'com.android.support:appcompat-v7:23.0.1'
    compile 'org.eclipse.mylyn.github:org.eclipse.egit.github.core:2.1.5'
    compile( 'commons-codec:commons-codec:1.9' )
    testCompile 'junit:junit:4.12' //  
    testCompile 'com.squareup.okhttp:okhttp:2.5.0'
    androidTestCompile 'com.android.support.test:runner:0.4' //  
    androidTestCompile 'com.android.support.test:rules:0.4'
    androidTestCompile 'com.android.support.test.espresso:espresso-core:2.2.1'
}
```

  - First, we load the Android gradle plug-in. This extends our project
    to allow an `android` block, which we specify next.

  - Next, we configure our android block, with things like the target
    version (which we choose when setting up our project) and the actual
    SDK, which we are using to compile the application.

  - In order to run UI tests, we need to specify a test runner called
    the `AndroidJUnitRunner`.

  - Android Studio automatically adds a configuration to our build file
    that loads any JARS (Java libraries) from the *lib* directory. We
    also install the support compatibility library for older Android
    devices, and most importantly, the EGit library that manages
    connections to GitHub for us. The commons CODEC library from the
    Apache Foundation provides tools that help to encode content into
    Base64, one of the options for storing data inside a GitHub
    repository using the API.

  - Next, we install libraries that are only used when we run unit
    tests. `testCompile` libraries are compiled only when the code is
    run on the local development machine, and for this situation we need
    the JUnit libraryOkHttp libraryJUnit library, and the OkHttp library
    from Square, which helps us validate that our request for a new
    commit has made it all the way into the GitHub API.

  - Lastly, we install the Espresso libraries, the Google UI testing
    framework. The first line (of the three libraries) installs the test
    runner we configured earlier. We use `androidTestCompile`, which
    compiles against these libraries when the code runs on Android in
    test mode.range=endofrangestartref=ix\_chapter-07-android-asciidoc5
    startref=ix\_chapter-07-android-asciidoc5range=endofrangestartref=ix\_chapter-07-android-asciidoc4
    startref=ix\_chapter-07-android-asciidoc4

### Creating AVDs for development

Android Virtual Devices (AVDs)Android Studio makes creating AVD (Android
Virtual Devices) simple. To start, under the “Tools” menu, click
“Android” and then select “AVD Manager.” To create a new AVD, click
the “Create Virtual Device” button and follow the prompts. You are
generally free to choose whatever settings you like. Google produces a
real device called the Nexus 5. This is the Android reference device,
and is a good option for a generic device with good support across all
features. You can choose this one if you are confused about which to use
as shown in [figure\_title](#creating-new-avd).

![Creating a new AVD](images/btwg_07in03.png)

Once you have created an AVD, start it up. It will take a few minutes to
boot; AVDs emulate the chipset in software and booting up can take a few
minutes, unfortunately. There are alternative tools that speed up AVD
boot time (Genymotion is one of those), but there are complexities if
you stray away from the stock Android tools, so we will stick with AVD.

## Default Android Main

Android application exampledefault main
forid=ix\_chapter-07-android-asciidoc6
id=ix\_chapter-07-android-asciidoc6range=startofrange
range=startofrangeWhen we use the preceding commands to create a new
Android application, it creates a sample entry point that is the
starting point of our Android application. AndroidManifest.xml fileAll
Android applications have a file called *AndroidManifest.xml*, which
specifies this activity and also supplies a list of permissions to the
apps. Open the *AndroidManifest.xml* file from within the *app/src/main*
directory. We need to make one change: to add a line that specifies that
this app will use the Internet permission (required if our app will be
talking to the GitHub API). Note that when viewing this file inside
Android Studio the IDE can interpolate strings from resources, so you
might see the `android:label` attribute displayed as GhRU with a grey
tinge, when in fact the XML file itself has the value displayed here
(`@string/app_name`):

``` java
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
  package="com.example.ghru">

    <uses-permission android:name="android.permission.INTERNET" />

    <application android:allowBackup="true" android:label="@string/app_name"
        android:icon="@mipmap/ic_launcher" android:supportsRtl="true"
        android:theme="@style/AppTheme">

        <activity android:name="MainActivity"
            android:label="@string/app_name">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

    </application>

</manifest>
```

When the application is launched, the Android OS will launch this
activity and then call the `onCreate` function for us. Inside this
function, our application calls our parent’s implementation of
`onCreate`, and then inflates the layout for our application. Layouts
are XML files in which the UI of an Android application is declaratively
described.

Android Studio created a default layout for us (called
*activity\_main.xml*), but let’s ignore that and create our own layout.
To do so, right-click (Ctrl-click on OS X) on the *layouts* directory,
and then choose "New" and then "Layout resource file" at the very top of
the list (Android Studio nicely chooses the most likely candidate given
the context of the click). Enter "main.xml" as the filename, and accept
the other defaults.

This application requires that we log in, so we know we at least need a
field and a descriptive label for the username, a password field (and
associated descriptive label) for the password, a button to click that
tells our app to attempt to log in, and a status field that indicates
success or failure of the login. So, let’s modify the generated
*main.xml* to specify this user interface. To edit this file as text,
click the tab labeled Text next to the tab labeled Design at the very
bottom of the *main.xml* pane to switch to text view. Then, edit the
file to look like the following:

\<?xml version="1.0" encoding="utf-8"?\> \<--

\--\> \<LinearLayout
xmlns:android="http://schemas.android.com/apk/res/android"
android:orientation="vertical" android:layout\_width="match\_parent"
android:layout\_height="match\_parent" \> \<--

\--\> \<TextView android:layout\_width="match\_parent"
android:layout\_height="wrap\_content" android:text="GitHub Username:"
/\> \<EditText android:layout\_width="match\_parent"
android:layout\_height="wrap\_content" android:id="@+id/username" /\>
\<TextView android:layout\_width="match\_parent"
android:layout\_height="wrap\_content" android:text="GitHub Password:"
/\> \<EditText android:layout\_width="match\_parent"
android:layout\_height="wrap\_content" android:id="@+id/password"
android:inputType="textWebPassword" /\> \<--

\--\> \<Button android:layout\_width="match\_parent"
android:layout\_height="wrap\_content" android:text="Login"
android:id="@+id/login" /\> \<--

\--\> \<TextView android:layout\_width="match\_parent"
android:layout\_height="wrap\_content" android:id="@+id/login\_status"
/\> \</LinearLayout\>

You may have complicated feelings about XML files (I know I do), but the
Android layout XML files are a straightforward way to design layouts
declaratively, and there is a great ecosystem of GUI tools that provide
sophisticated ways to manage them. Scanning this XML file, it should be
relatively easy to understand what is happening here.

The entire layout is wrapped in a

LinearLayout

, which simply positions each element stacked vertically inside it. We
set the height and width layout attributes to

match\_parent

, which means this layout occupies the entire space of the screen.

We then add the elements we described previously: pairs of

TextView

and

EditView

for the label and entry options necessary for the username and password.

The password field customizes the type to be a password field, which
means the entry is hidden when we enter it.

Some elements in the XML have an ID attribute, which allows us to access
the items within our Java code, such as when we need to assign a handler
to a button or retrieve text entered by the user from an entry field. We
will demonstrate this in a moment.

You can review the visual structure of this XML file by clicking the
"Design" tab to switch back to design mode.

We also need a layout once we have logged in. Create a file called
*logged\_in.xml* using the same set of steps. Once logged in, the user
is presented with a layout asking him to choose which repository to save
into, to enter his blog post into a large text field, and then to click
a button to submit that blog post. We also leave an empty status box
beneath the button to provide context while saving the post:

``` java
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    >
  <TextView
      android:layout_width="match_parent"
      android:layout_height="wrap_content"
      android:text="Logged into GitHub"
      android:layout_weight="0"
      android:id="@+id/status" />

  <EditText
      android:layout_width="match_parent"
      android:layout_height="wrap_content"
      android:hint="Enter the blog repository"
      android:id="@+id/repository"
      android:layout_weight="0"
      />

    <EditText
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="Enter the blog title"
        android:id="@+id/title"
        android:layout_weight="0" />

    <EditText
      android:gravity="top"
      android:layout_width="match_parent"
      android:layout_height="match_parent"
      android:hint="Enter your blog post"
      android:id="@+id/post"
      android:layout_weight="1"
      />

  <Button
      android:layout_width="match_parent"
      android:layout_height="wrap_content"
      android:layout_weight="0"
      android:id="@+id/submit"
      android:text="Send blog post"/>

</LinearLayout>
```

Most of this should be familiar once you have reviewed the *main.xml*
file (and be sure to copy this from the associated sample repository on
GitHub if you don’t want to copy it in
yourself).range=endofrangestartref=ix\_chapter-07-android-asciidoc6
startref=ix\_chapter-07-android-asciidoc6

Now that we have our XML established, we can ready our application for
testing.range=endofrangestartref=ix\_chapter-07-android-asciidoc3
startref=ix\_chapter-07-android-asciidoc3

# Android Automated Testing

Android application exampleautomated testing
forid=ix\_chapter-07-android-asciidoc7
id=ix\_chapter-07-android-asciidoc7range=startofrange
range=startofrangetestingAndroid appid=ix\_chapter-07-android-asciidoc8
id=ix\_chapter-07-android-asciidoc8range=startofrange
range=startofrangeAndroid supports three types of tests: unit tests,
integration tests, and user interface (UI) tests. Unit tests validate
very tightly defined and isolated pieces of code, while integration
testsintegration tests and UI tests test larger pieces of the whole. On
Android, integration tests generally mean instantiation of data managers
or code that interacts with multiple components inside the app, while UI
testing permits testing of user-facing elements like buttons or text
fields. In this chapter we will create a unit test and a UI test.

One important note: Unit tests run on your development machine, not the
Android device itself. UI tests run on the Android device (or emulator).
There can be subtle differences between the Java interpreter running on
your development machine and the Dalvik interpreter running on your
Android device, so it is worthwhile to use a mixture of the three types
of tests. Stated another way, write at least one test that runs on the
device or emulator itself\!

## Unit Tests for Our GitHub Client

Android application exampleunit tests
forid=ix\_chapter-07-android-asciidoc9
id=ix\_chapter-07-android-asciidoc9range=startofrange
range=startofrangeunit
testsid=ix\_chapter-07-android-asciidoc10range=startofrange
id=ix\_chapter-07-android-asciidoc10range=startofrange
range=startofrangeLet’s start by defining a unit test. Since the unit
test runs on our development machine, our test and implementation code
should be written such that they do not need to load any Android
classes. This forces us to constrain functionality to only the GitHub
API. We will define a helper class that will handle all the interaction
with the GitHub API but does not know about Android whatsoever. Then, we
can write a test harness that takes that class, instantiates it, and
validates our calls to GitHub produce the right results.

> **Note**
> 
> You might legitimately ask: is a unit test the right place to verify
> an API call? Will this type of test be fast, given that slow-running
> unit tests are quickly ignored by software developers? Would it be
> better to mock out the response data inside our unit tests? These are
> all good questions\!

To set up unit tests, we need to switch the build variant to unit tests.
Look for a vertical tab on the lefthand side of Android Studio. Click
this, and then where it says "Test Artifact" switch to "Unit Tests."
From the project view (click the "Project" vertical tab if project view
is not already selected) you can expand the "java" directory, and you
should then see a directory with "(test)" in parentheses indicating this
is where tests go. If this directory is not there, create a directory
using the command line (this command would work: `mkdir -p
app/src/test/java/com/example/ghru`).

Then, create a test file called *GitHubHelperTest.java* that looks like
the following:

``` java
package com.example.ghru;

import com.squareup.okhttp.OkHttpClient; //  
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

import org.junit.Test; //  

import java.util.Date;

import static org.junit.Assert.assertTrue;

/**
 * To work on unit tests, switch the Test Artifact in the Build Variants view.
 */
public class GitHubHelperTest { //  
    @Test
    public void testClient() throws Exception {

        String login = System.getenv("GITHUB_HELPER_USERNAME"); //  
        String password = System.getenv("GITHUB_HELPER_PASSWORD");
        String repoName = login + ".github.io";

        int randomNumber = (int)(Math.random() * 10000000);
        String randomString = String.valueOf( randomNumber );
        String randomAndDate = randomString + " " +
      (new Date()).toString() ; //  

        GitHubHelper ghh = new GitHubHelper( login, password ); //  
        ghh.SaveFile(repoName,
             "Some random title",
             "Some random body text",
             randomAndDate );

        Thread.sleep(3000); //  

        String url = "https://api.github.com/repos/" +  //  
        login + "/" + repoName + "/events";
        OkHttpClient ok = new OkHttpClient();
        Request request = new Request.Builder()
                .url( url )
                .build();
        Response response = ok.newCall( request ).execute();
        String body = response.body().string();

        assertTrue( "Body does not have: " + randomAndDate,   //  
            body.contains( randomAndDate ) );
    }

}
```

  - First, we import the OkHttp library, a library for making HTTP
    calls. We will verify that our GitHub API calls made it all the way
    into GitHub by looking at the event log for our repository, a log
    accessible via HTTP.

  - Next, we import JUnit, which provides us with an annotation `@Test`
    we can use to indicate to a test runner that certain methods are
    test functions (and should be executed as tests when in test mode).

  - We create a class called `GitHubHelperTest`. In it, we define a sole
    test case `testClient`. We use the `@Test` annotation to indicate to
    JUnit that this is a test case.

  - Now we specify our login information and the repository we want to
    test against. In order to keep the password out of our source code,
    we use an environment variable we can specify when we run the tests.

  - Next, we build a random string. This unique string will be our
    commit message, a beacon that allows us to verify that our commit
    made it all the way through and was stored on GitHub, and to
    differentiate it from other commits made recently by other tests.

  - Now, to the meat of the test: we instantiate our GitHub helper class
    with login credentials, then use the `SaveFile` function to save the
    file. The last parameter is our commit message, which we will verify
    later.

  - There can be times when the GitHub API has registered the commit but
    the event is not yet displayed in results coming back from the API;
    sleeping for a few seconds fixes this.

  - Next, we go through the steps to make an HTTP call with the OkHttp
    library. We load a URL that provides us with the events for a
    specified repository, events that will have the commit message when
    it is a push type event. This repository happens to be public so we
    don’t require authentication against the GitHub API to see this
    data.

  - Once we have the body of the HTTP call, we can scan it to verify the
    commit message is there.

The final steps deserve a bit more investigation. If we load the event
URL from cURL, we see data like
this:

``` bash
$ curl https://api.github.com/repos/burningonup/burningonup.github.io/events
[
  {
    "id": "3244787408",
    "type": "PushEvent",
    ...
    "repo": {
      "id": 44361330,
      "name": "BurningOnUp/BurningOnUp.github.io",
      "url":
      "https://api.github.com/repos/BurningOnUp/BurningOnUp.github.io"
    },
    "payload": {
      ...
      "commits": [
        {
          "sha": "28f247973e73e3128737cab33e1000a7c281ff4b",
          "author": {
            "email": "unknown@example.com",
            "name": "Unknown"
          },
          "message": "207925 Thu Oct 15 23:06:09 PDT 2015",
          "distinct": true,
          "url":
      "https://api.github.com/repos/BurningOnUp/BurningOnUp.github.io/..."
        }
      ]
    }
...
]
```

This is obviously JSON. We see the type is PushEvent for this event, and
it has a commit message that matches our random string format. We could
reconstitute this into a complex object structure, but scanning the JSON
as a string works for our
test.range=endofrangestartref=ix\_chapter-07-android-asciidoc10
startref=ix\_chapter-07-android-asciidoc10range=endofrangestartref=ix\_chapter-07-android-asciidoc9
startref=ix\_chapter-07-android-asciidoc9

## Android UI Tests

Android application exampleUI tests
forid=ix\_chapter-07-android-asciidoc11
id=ix\_chapter-07-android-asciidoc11range=startofrange
range=startofrangeUI
testsid=ix\_chapter-07-android-asciidoc12range=startofrange
id=ix\_chapter-07-android-asciidoc12range=startofrange
range=startofrangeLet’s now write a UI test. Our test will start our
app, find the username and password fields, enter in the proper username
and password text, then click the login button, and finally verify that
we have logged in by checking for the text "Logged into GitHub" in our
UI.

EspressoAndroid uses the Espresso framework to support UI testing. We
already installed Espresso with our Gradle configuration, so we can now
write a test. Tests are written by deriving from a generic test base
class (`ActivityInstrumentationTestCase2`). Any public function defined
inside the test class is run as a test.

In Android Studio, from the "Build Variant" window, select "Android
Instrumentation Test," which will then display a test directory called
"androidTest." These are tests that will run on the emulator or actual
device. Inside the directory, make a new file called
*MainActivityTest.java*:

``` java
package com.example.ghru;

import android.support.test.InstrumentationRegistry; // 
import android.test.ActivityInstrumentationTestCase2;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.*;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.*;

public class MainActivityTest  // 
    extends ActivityInstrumentationTestCase2<MainActivity> {

    public MainActivityTest() {
        super( MainActivity.class ); // 
    }

    public void testLogin() { // 
        injectInstrumentation( InstrumentationRegistry.
        getInstrumentation() ); // 
        MainActivity mainActivity = getActivity();
        String username = mainActivity // 
                .getString( R.string.github_helper_username );
        onView( withId( R.id.username ) ) // 
            .perform( typeText( username ) ); // 
        String password = mainActivity
                .getString( R.string.github_helper_password );
        onView( withId( R.id.password ) )
            .perform( typeText( password ) );
        onView( withId( R.id.login ) )
            .perform( click() );
        onView( withId( R.id.status ) ) // 
            .check( matches( withText( "Logged into GitHub" ) ) );


    }
}
```

  - We import the instrumentation registry (for instrumenting the tests
    of our app), the base class, and matchers that will be used to make
    assertions in our tests.

  - We create a test class that derives from the
    `ActivityInstrumentationTestCase2` generic.

  - The constructor of an Espresso test implementation needs to call the
    parent constructor with the class of the activity for test, in this
    case `MainActivity`.

  - Our test verifies that we can log in to GitHub, so we name it
    accordingly.

  - We then load theinstrumentation registry instrumentation registry,
    and also call `getActivity`, which actually instantiates and starts
    the activity. In many Espresso tests these two steps will occur in a
    function annotated as a `@Before` function if they are used across
    multiple tests (in which case they will be run before each test).
    Here to simplify our function count we can call them inside the
    single test function.

  - It is never a good idea to store credentials inside of a code
    repository, so we retrieve the username and password from a resource
    XML file using the `getString` function available using the
    activity. We will show what the contents of this secret file could
    look like presently.

  - Once we have the username, we can enter it in the text field in our
    UI. With theonView function `onView` function we can interact with a
    view (for example: a button or text field). `withId` withId
    functionfinds the view using the resource identifier inside the XML
    layout files. Once we have the view, we can then perform an action
    (using the `perform` function) like typing in text. This chain of
    calls enters the GitHub username into the first text field.

  - We then complete our interaction with the UI, entering in the
    password and then clicking the login button.

  - If all is successful, we should see the text "Logged into GitHub."
    Under the hood, this test will verify that we are logged in to
    GitHub and display the successful result.

To provide a username and password to our test and to keep these
credentials out of our source code, create a file called *secrets.xml*
inside our *strings* directory inside the resource folder. This file
should look like this:

``` java
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="github_helper_login">MyUsername</string>
    <string name="github_helper_password">MyPwd123</string>
</resources>
```

Make sure this is not checked into your source code by adding an
exception to *.gitignore* (the command `echo
"secrets.xml" >> .gitgnore` is a quick way to add this to your
*.gitignore*
file).range=endofrangestartref=ix\_chapter-07-android-asciidoc12
startref=ix\_chapter-07-android-asciidoc12range=endofrangestartref=ix\_chapter-07-android-asciidoc11
startref=ix\_chapter-07-android-asciidoc11

Our tests will not even compile yet because we have not yet written the
other parts of the application. As such, we will skip the setup required
to run our tests within Android Studio for
now.range=endofrangestartref=ix\_chapter-07-android-asciidoc8
startref=ix\_chapter-07-android-asciidoc8range=endofrangestartref=ix\_chapter-07-android-asciidoc7
startref=ix\_chapter-07-android-asciidoc7

Let’s now build the application itself to pass these tests.

# Application Implementation

Android application
exampleimplementationid=ix\_chapter-07-android-asciidoc13
id=ix\_chapter-07-android-asciidoc13range=startofrange
range=startofrangeNow we can start writing some Java code for our
application. Let’s make it so our `MainActivity` class will inflate the
layouts we defined earlier:

``` java
package com.example.ghru;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.EditText;
import android.widget.TextView;
import android.view.View;

public class MainActivity extends Activity
{
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView( R.layout.main);

        Button login = (Button)findViewById( R.id.login );
        login.setOnClickListener(new View.OnClickListener() { // 
            public void onClick(View v) {
                login(); // 
            }
        });
    }

    private void login() {

        setContentView(R.layout.logged_in); // 

        Button submit = (Button)findViewById( R.id.submit );
        submit.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) { // 
                doPost(); (4)
            }
        });
    }

    private void doPost() {
        TextView tv = (TextView)findViewById( R.id.post_status ); // 
        tv.setText( "Successful jekyll post" );
    }

}
```

This code mocks out the functionality we will be building and shows us
exactly what the UI will look like once that code is completed.

  - We register a click handler for our login button.

  - When the login button is clicked, we call the `login()` function
    that triggers a login flow.

  - Once we have logged in, we inflate the logged-in layout, suitable
    for making a blog post.

  - We then set up another click handler for the submit button; when
    clicked, we call the `doPost()` function.

  - Our `doPost()` function updates the status message at the bottom of
    our application.

Even though our code is not functionally complete, this application will
compile. This is a good time to play with this application and verify
that the UI looks appropriate. Our login form looks like
[figure\_title](#simple-ui-blog-posts).

![A simple UI for making blog post entries](images/btwg_07in04.png)

## Code to Log In to GitHub

Android application examplecode for logging in to
GitHubid=ix\_chapter-07-android-asciidoc14
id=ix\_chapter-07-android-asciidoc14range=startofrange
range=startofrangeNow we can wire in the GitHub API. Let’s first work on
theloginfor Android app for Android app `login()` function. Poking into
the [EGit libary reference](http://bit.ly/1SQ93Qf), we can write GitHub
login code, which is as simple as the following:

``` java
GitHubClient client = new GitHubClient();
client.setCredentials("us3r", "passw0rd");
```

The context in which the code runs makes as much of a difference as the
code. The Android OS disallows any code from making network connections
unless it runs inside a background thread. If you are not a Java
developer already, and the thought of using threads with Java sounds
daunting, dispell your worries. The Android SDK provides a great class
for managing background tasks called `AsyncTask`. This class provides
several entry points into the lifecycle of a thread that is managed by
the Android OS. We implement a class and then override two functions
provided by `AsyncTask`: the first function isdoInBackground() function
`doInBackground()`, which handles operations off the main thread (our
background thread code), and the second function is `onPostExecute()`,
which runs on the UI thread and allows us to update the UI with the
results of the code that ran inside `doInBackground()`.

Before we implement the login, we need to update ouronCreate function
`onCreate` function of the `MainActivity`. Our login button handles
logging in, so let’s register a click handler on the login button that
will call the login task we will define inside our class based off
`AsyncTask`:

``` java
...
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        Button login = (Button)findViewById( R.id.login );
        login.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    EditText utv = (EditText)findViewById( R.id.username );
                    EditText ptv = (EditText)findViewById( R.id.password );
                    username = (String)utv.getText().toString();
                    password = (String)ptv.getText().toString(); // 
                    TextView status =
              (TextView)findViewById( R.id.login_status );
                    status.setText( "Logging in, please wait..." ); // 
                    new LoginTask().execute( username, password );  // 
                }
            });
    }
...
```

  - We retrieve the username and password from our UI elements.

  - Our UI should notify the user that a login is occurring in a
    background task, so we grab the status text element and update the
    text in it.

  - We then start the background thread process to do our login. This
    syntax creates a new thread for us with the username and password as
    parameters. Android will manage the lifecycle of this thread for us,
    including starting the new thread separate from the main UI thread.

Now we can implement `LoginTask`:

``` java
...
    class LoginTask extends AsyncTask<String, Void, Boolean> {   // 
        @Override
            protected Boolean doInBackground(String... credentials) { // 
            boolean rv = false;
            UserService us = new UserService();
            us.getClient().setCredentials( credentials[0], credentials[1] );
            try {
                User user = us.getUser( credentials[0] );  // 
                rv = null != user;
            }
            catch( IOException ioe ) {}
            return rv;
        }

        @Override
            protected void onPostExecute(Boolean result) {
            if( result ) {
                loggedIn();  // 
            }
            else { // 
                TextView status = (TextView)findViewById( R.id.login_status );
                status.setText( "Invalid login, please check credentials" );
            }
        }
    }
...
```

  - Here we define our class derived from AsyncTask. You see three types
    in the generics BooleansString typeVoid typesignature: `String`,
    `Void`, and `Boolean`. These are the parameters to our entry point,
    an intermediate callback and the final callback, which returns
    control to the calling thread. The first type allows us to
    parameterize our instantiated task; we need to provide a username
    and password to the background task, and the first type in the
    signature allows us to pass an array of Strings. You can see in the
    actual function definition that the ellipsis notation provides a way
    to parameterize a function with a variable number of arguments
    (called varargs). Inside our defined function we expect we will send
    two Strings in, and we make sure to do that in our call.

  - Once inside the `doInBackground()` function, we instantiate a
    `UserService` class, a wrapper around the GitHub API, which
    interacts with the user service API call. In order to access this
    information, we have to retrieve the client for this service call
    and provide the client with the username and password credentials.
    This is the syntax to do that.

  - We wrap the call to `getUser()` in a try block as the function
    signature can throw an error (if the network were down, for
    example). We don’t really need to retrieve information about the
    user using the User object, but this call verifies that our username
    and password are correct, and we store this result in our return
    value. GitHub will not use the credentials you set until you make an
    API call, so we need to use our credentials to access something in
    order to verify that those credentials work.

  - Let’s call our function `loggedIn()` instead of `login()` to more
    accurately reflect the fact that when we call this, we are already
    logged in to GitHub.

  - If our login was a failure, either because of network failure, or
    because our credentials were incorrect, we indicate this in the
    status message. A user can retry if they wish.

`loggedIn` updates the UI once logging in has completed and then
initiates the post on GitHub:

``` java
...
    private void loggedIn() {

        setContentView(R.layout.logged_in);  // 

        Button submit = (Button)findViewById( R.id.submit );
        submit.setOnClickListener(new View.OnClickListener() { // 
            public void onClick(View v) {

                TextView status = (TextView) findViewById(R.id.login_status);
                status.setText("Logging in, please wait...");

                EditText post = (EditText) findViewById(R.id.post); // 
                String postContents = post.getText().toString();

                EditText repo = (EditText) findViewById(R.id.repository);
                String repoName = repo.getText().toString();

                EditText title = (EditText) findViewById(R.id.title);
                String titleText = title.getText().toString();

                doPost(repoName, titleText, postContents); // 
            }
        });
    }
...
```

  - Inflate the logged-in layout to reflect the fact we are now logged
    in.

  - Then, install a click handler on the submit button so that when we
    submit our post information, we can start the process to create the
    post on GitHub.

  - We need to gather up three details the user provides: the post body,
    the post title, and the repository name.

  - Using these three pieces of data, we can then call into `doPost` and
    initiate the asynchronous task.

Building outdoPost() function `doPost()` should be more familiar now
that we have experience with AsyncTask. `doPost()` makes the commit
inside of GitHub, and it performs the network activity it needs to run
on a background thread:

``` java
...
    private void doPost( String repoName, String title, String post ) {
        new PostTask().execute( username, password, repoName, title, post );
    }

    class PostTask extends AsyncTask<String, Void, Boolean> {

        @Override
        protected Boolean doInBackground(String... information) { // 
            String login = information[0];
            String password = information[1];
            String repoName = information[2];
            String titleText = information[3];
            String postContents = information[4];

            Boolean rv = false; // 
            GitHubHelper ghh = new GitHubHelper(login, password); // 
            try {
                rv = ghh.SaveFile(repoName, titleText,
                postContents, "GhRu Update"); // 
            } catch (IOException ioe) { // 
                Log.d(ioe.getStackTrace().toString(), "GhRu");
            }
            return rv;
        }

        @Override
        protected void onPostExecute(Boolean result) {
            TextView status = (TextView) findViewById(R.id.status);
            if (result) { // 
                status.setText("Successful jekyll post");

                EditText post = (EditText) findViewById(R.id.post);
                post.setText("");

                EditText repo = (EditText) findViewById(R.id.repository);
                repo.setText("");

                EditText title = (EditText) findViewById(R.id.title);
                title.setText("");
            } else {
                status.setText("Post failed.");
            }
        }
    }
...
```

  - First, we retrieve the parameters we need to send off to the GitHub
    API. Notice that we don’t attempt to retrieve these from the UI.
    Background threads don’t have access to the Android UI functions.

  - This function returns a true or false value indicating success or
    failure (using the variable `rv` for "return value"). We assume that
    it fails unless everything we need to do inside our function works
    exactly as expected, so set the expectation to false to start. The
    value of our return statement is passed to the next stage in the
    lifecycle of the thread, a function called `onPostExecute` (an
    optional stage in the thread lifecycle we will use to report status
    of the operation back to the user).

  - Now, we instantiate the `GitHubHelper` class. This instantiation and
    usage should look very familiar as it is the same thing we did
    inside our unit test.

  - Our helper class returns success or failure. If we have reached this
    point, this is our final return value.

  - We will wrap the call to `SaveFile` inside a try/catch block to make
    sure we handle errors; these will most likely be network errors.

  - `onPostExecute()` is onPostExecute() functionthe function we
    (optionally) return to once our background task has completed. It
    receives the return value from our previous function. If we have a
    true value returned from `doInBackground()`, then our save file
    succeeded and we can update the UI of our application.

We need to import the support classes. The JARs and classes for EGit
have already been added to our project automatically using Gradle. Make
sure you add these `import` statements to the top of the file, under the
other imports:

``` java
...
import android.view.View;
import android.os.AsyncTask;
import org.eclipse.egit.github.core.service.UserService;
import org.eclipse.egit.github.core.User;
import java.io.IOException;
...
```

Nowrange=endofrangestartref=ix\_chapter-07-android-asciidoc14
startref=ix\_chapter-07-android-asciidoc14 we are ready to write the
code to write data into GitHub.

## Code to Talk to GitHub

Android application examplecode for putting content into
GitHubid=ix\_chapter-07-android-asciidoc15
id=ix\_chapter-07-android-asciidoc15range=startofrange
range=startofrangeOur last step is to write the code that handles
putting content into GitHub. This is not a simple function, because the
GitHub API requires you build out the structure used internally by Git.
A great reference for learning more about this structure is the free and
open-source book called [*Pro Git*](https://progit.org/) and
specifically the last chapter called [Git
Internals](http://git-scm.com/book/en/Git-Internals).

In a nutshell, the GitHub API expects you to create a Git "tree" and
then place a "blob" object into that tree. You then wrap the tree in a
"commit" object and then create that commit on GitHub using a data
service wrapper. In addition, writing a tree into GitHub requires
knowing the base SHA identifier, so you’ll see code that retrieves the
last SHA in the tree associated with our current branch. This code will
work regardless of whether we are pushing code into the master branch,
or into the gh-pages branch, so this utility class works with real
Jekyll blogs.

We’ll write a helper class called `GitHubHelper` and add a single
function that writes a file to our repository.

The GitHub API requires that files stored in repositories be either
Base64 encoded or UTF-8. The Apache Foundation provides a suite of tools
published toMaven Maven (the same software repository where we grabbed
the EGit libraries), which can do this encoding for us, and which were
already installed in our Gradle file previously (the "commons-codec"
declaration).

We will start by defining a series of high-level functions inside
`SaveFile` to get through building a commit inside of GitHub. Each
function itself contains some complexity so let’s look first at the
overview of what it takes to put data into GitHub using the Git Data
API:

``` java
package com.example;

import android.util.Log;

import org.eclipse.egit.github.core.*;
import org.eclipse.egit.github.core.client.GitHubClient;
import org.eclipse.egit.github.core.service.CommitService;
import org.eclipse.egit.github.core.service.DataService;
import org.eclipse.egit.github.core.service.RepositoryService;
import org.eclipse.egit.github.core.service.UserService;
import org.apache.commons.codec.binary.Base64;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.IOException;
import java.util.*;

class GitHubHelper {

    String login;
    String password;

    GitHubHelper( String _login, String _password ) {
        login = _login;
        password = _password;
    }

    public boolean SaveFile( String _repoName,
                             String _title,
                             String _post,
                             String _commitMessage ) throws IOException {
        post = _post;
        repoName = _repoName;
        title = _title;
        commitMessage = _commitMessage;

        boolean rv = false;

        generateContent();
        createServices();
        retrieveBaseSha();

        if( null != baseCommitSha && "" != baseCommitSha ) {
            createBlob();
            generateTree();
            createCommitUser();
            createCommit();
            createResource();
            updateMasterResource();
            rv = true;
        }

        return rv;
    }

...
```

TheSaveFile function `SaveFile` function goes through each step of
writing data into a repository using the GitHub API. We will walk
through each of these functions. As you can see, the `SaveFile` function
has the same signature as the function we call inside our unit
test.range=endofrangestartref=ix\_chapter-07-android-asciidoc15
startref=ix\_chapter-07-android-asciidoc15

Let’s implement each of the functions specified in the GitHubHelper
class.

## Writing the Blog Content

Android application examplewriting blog content writing blog
contentFirst, we implementgenerateContent() function
`generateContent()`. The following code snippet shows the functions
defined to generate the content we will place into our remote Git
repository stored on GitHub:

``` java
...
    String commitMessage; // 
    String postContentsWithYfm;
    String contentsBase64;
    String filename;
    String post;
    String title;
    String repoName;

    private void generateContent() { // 
        postContentsWithYfm =  // 
        "---\n" +
        "layout: post\n" +
        "published: true\n" +
        "title: '" + title + "'\n---\n\n" +
        post;
        contentsBase64 =  // 
        new String( Base64.encodeBase64( postContentsWithYfm.getBytes() ) );
        filename = getFilename();
    }

    private String getFilename() {
        String titleSub = title.substring( 0,  // 
                       post.length() > 30 ?
                       30 :
                       title.length() );
        String jekyllfied = titleSub.toLowerCase() // 
        .replaceAll( "\\W+", "-")
        .replaceAll( "\\W+$", "" );
        SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd-" ); // 
        String prefix = sdf.format( new Date() );
        return "_posts/" + prefix + jekyllfied + ".md"; // 
    }

    String blobSha;
    Blob blob;
...
```

You will notice many similarities between this Java code and the Ruby
code we used in [section\_title](#Jekyll) when generating filenames and
escaping whitespace.

  - First, we set up several instance variables we will use when storing
    the data into GitHub: the commit message, the full post including
    the YAML Front Matter (YFM), the post contents encoded as Base64,
    the filename, and then the three parameters we saved from the call
    to `SaveFile()`: the post itself, the title, and the repository
    name.

  - The `generateContent` function creates the necessary components for
    our new post: the full content Base64 encoded, and the filename we
    will use to store the content.

  - Here we create the YAML Front Matter (see [section\_title](#Jekyll)
    for more details on YFM). This YAML specifies the "post" layout and
    sets publishing to "true." We need to terminate the YAML with two
    newlines.

  - Base64 encodes the contents of the blog post itself using a utility
    class found inside the Apache Commons library. Contents inside a Git
    repository are stored either as UTF-8 content or Base64; we could
    have used UTF-8 since this is text content but Base64 works
    losslessly, and you can always safely use Base64 without concerning
    yourself about the content.

  - Next, inside `getFilename()`, create the title by using the first 30
    characters of the post.

  - Convert the title to lowercase, and replace the whitespace with
    hyphens to get the Jekyll post title format.

  - Jekyll expects the date to be formatted as `yyyy-MM-dd`, so use the
    java `SimpleDateFormat` class to help create a string of that
    format.

  - Finally, create the filename from all these pieces, prepending
    `_posts` to the filename, where Jekyll expects posts to reside.

Now we will set up the services necessary to store a commit inside
GitHub.

## GitHub Services

Android application exampleand GitHub services and GitHub servicesNext,
we createServices() functionimplement `createServices()`. There are
several services (wrappers around Git protocols) we need to instantiate.
We don’t use them all immediately, but we will need them at various
steps during the file save process. The `createServices` call manages
these for us:

``` java
...
    RepositoryService repositoryService;
    CommitService commitService;
    DataService dataService;

    private void createServices() throws IOException {
        GitHubClient ghc = new GitHubClient();
        ghc.setCredentials( login, password );
        repositoryService = new RepositoryService( ghc );
        commitService = new CommitService( ghc );
        dataService = new DataService( ghc );
    }

...
```

As a side note, writing things this way would allow us to specify an
enterprise endpoint instead of GitHub.com. Refer to the
[???](#appendix_b) for specific syntax on how to do this.

## The Base SHA from the Repository and Branch

Android application examplebase SHA implementation base SHA
implementationSHA (secure hash algorithm)Now we implementdirected acylic
graphs (DAG)retrieveBaseSha() function `retrieveBaseSha()`. A Git
repository is a directed acyclic graph (DAG) and as such, (almost) every
node in the graph points to another commit (or potentially two if it is
a merge commit). When we append content to our graph, we need to
determine the prior node in that graph and attach the new node.
`retrieveBaseSha` does this: it finds the SHA hash for our last commit,
a SHA hash that is functionally an address inside our tree. To determine
this address, our application needs to have a reference to the
repository, and we use the repository service we instantiated earlier to
get this reference. Once we have the repository, we need to look inside
the correct branch: `getBranch` does this for us:

``` java
...

    private void createServices() throws IOException {
        GitHubClient ghc = new GitHubClient();
        ghc.setCredentials( login, password );
        repositoryService = new RepositoryService( ghc );
        commitService = new CommitService( ghc );
        dataService = new DataService( ghc );
    }

    Repository repository;
    RepositoryBranch theBranch;
    String baseCommitSha;
    private void retrieveBaseSha() throws IOException {
        // get some sha's from current state in git
        repository =  repositoryService.getRepository(login, repoName);
        theBranch = getBranch();
        baseCommitSha =  theBranch.getCommit().getSha();
    }

    public RepositoryBranch getBranch() throws IOException {
        List<RepositoryBranch> branches =
      repositoryService.getBranches(repository);
        RepositoryBranch master = null;
        // Iterate over the branches and find gh-pages or master
        for( RepositoryBranch i : branches ) {
            String theName = i.getName().toString();
            if( theName.equalsIgnoreCase("gh-pages") ) {
                theBranch = i;
            }
            else if( theName.equalsIgnoreCase("master") ) {
                master = i;
            }
        }
        if( null == theBranch ) {
            theBranch = master;
        }
        return theBranch;
    }

...
```

This SHA commit is very important. Without it, we cannot create a new
commit that links into our existing commit graph. In our starting point
function `SaveFile()` we discontinue our commit steps if the SHA hash is
not retrieved properly.

## Creating the Blob

Android application exampleblob creation for blob creation forContents
inside a Git repository are stored ascreateBlob function blobs.
`createBlob` manages storing our content as a blob object, and then uses
the dataService to store this blob into a repository. Until we have
called `dataService.createBlob`, we have not actually placed the object
inside GitHub. Also, remember that blobs are not linked into our DAG by
themselves; they need to be associated with our DAG vis-a-vis a tree and
commit object, which we do next:

``` java
...
    String blobSha;
    Blob blob;
    private void createBlob() throws IOException {
        blob = new Blob();
        blob.setContent(contentsBase64);
        blob.setEncoding(Blob.ENCODING_BASE64);
        blobSha = dataService.createBlob(repository, blob);
    }

...
```

## Generating a Tree

Android application exampletree generation tree generationtree (for
Android app)Next, we generate a tree by implementinggenerateTree()
function `generateTree()`. A tree wraps a blob object and provides
basically a path to our object: if you were designing an operating
system, the tree would be the filename path and the blob is an inode.
Our data service manager uses a repository name and a base SHA address,
one that we retrieved earlier, to validate that this is a valid starting
point inside our repository. Once we have a tree, we fill out the
necessary tree attributes, like tree type (blob) and tree mode (blob),
and set the SHA from the previously created blob object along with the
size. Then we store the tree into our GitHub account using the data
service object:

``` java
...
    Tree baseTree;
    private void generateTree() throws IOException {
        baseTree = dataService.getTree(repository, baseCommitSha);
        TreeEntry treeEntry = new TreeEntry();
        treeEntry.setPath( filename );
        treeEntry.setMode( TreeEntry.MODE_BLOB );
        treeEntry.setType( TreeEntry.TYPE_BLOB );
        treeEntry.setSha(blobSha);
        treeEntry.setSize(blob.getContent().length());
        Collection<TreeEntry> entries = new ArrayList<TreeEntry>();
        entries.add(treeEntry);
        newTree = dataService.createTree( repository, entries,
      baseTree.getSha() );
    }

...
```

## Creating the Commit

Android application examplecreating commit for creating commit forcommit
(Android app example)We are getting close to actually finalizing the
creation of content: next, implementcreateCommit() function
`createCommit()`. We have created a blob that stores the actual content,
and created a tree that stores the path to the content (more or less),
but since Git is a version control system, we also need to store
information about who wrote this object and why. A commit object stores
this information. The process should look familiar coming from the
previous steps: we create the commit and then add relevant metadata, in
this case the commit message. We also need to provide the commit user
with the commit. We then use the data service to create the commit
inside our repository in GitHub at the correct SHA address:

``` java
...
    CommitUser commitUser;
    private void createCommitUser() throws IOException {
        UserService us = new UserService(); // 
        us.getClient().setCredentials( login, password );
        commitUser = new CommitUser(); // 
        User user = us.getUser(); // 
        commitUser.setDate(new Date());
        String name = user.getName();
        if( null == name || name.isEmpty() ) { // 
            name = "Unknown";
        }

        commitUser.setName( name ); // 
        String email = user.getEmail();
        if( null == email || email.isEmpty() ) {
            email = "unknown@example.com";
        }
        commitUser.setEmail( email );
    }

    Commit newCommit;
    private void createCommit() throws IOException {
        // create commit
        Commit commit = new Commit(); // 
        commit.setMessage( commitMessage );
        commit.setAuthor( commitUser); // 
        commit.setCommitter( commitUser );
        commit.setTree( newTree );
        List<Commit> listOfCommits = new ArrayList<Commit>(); // 
        Commit parentCommit = new Commit();
        parentCommit.setSha(baseCommitSha);
        listOfCommits.add(parentCommit);
        commit.setParents(listOfCommits);
        newCommit = dataService.createCommit(repository, commit); // 
    }
...
```

  - Create a user service object. We will use this to get back user data
    for the logged-in user from GitHub.

  - We then create a commit user. This will be used to annotate the
    commit object (twice in fact, as we will use it for both the author
    and committer).

  - Retrieve the user from the service, loading it from GitHub.

  - Now, attempt to get the name for the logged-in user. If the name
    does not exist (the user has not set a name in their GitHub profile)
    set the name to unknown. Then, store the name in the commit user
    object.

  - Do the same process to establish the email for the commit user.

  - Now, return to the `createCommit` function and create a commit
    object.

  - We need to use an author and committer, so pass in the commit user
    we created in the `createCommitUser` function.

  - Next, generate a list of commits. We will only use one, but you
    might recall commits can have multiple parents (a merge, for
    example) and we need to specify the parent or parents. We create the
    list, create a parent, and set the base SHA we determined earlier,
    and then indicate in our new commit that it is the parent.

  - Finally, we create the commit using our data service object.

## Updating the Master Resource

Android application examplemaster resource updating master resource
updatingOur final step is to take the new commit SHA and update our
branch reference to point to it:

``` java
...
    TypedResource commitResource;
    private void createResource() {
        commitResource = new TypedResource(); // 
        commitResource.setSha(newCommit.getSha());
        commitResource.setType(TypedResource.TYPE_COMMIT);
        commitResource.setUrl(newCommit.getUrl());
    }

    private void updateMasterResource() throws IOException {
        Reference reference =
                dataService.getReference(repository,
                        "heads/" + theBranch.getName() ); // 
        reference.setObject(commitResource);
        dataService.editReference(repository, reference, true) ; // 
    }
...
```

  - First, we create the new commit resource. We then associate the new
    commit SHA, indicate it is a resource of commit type, and then link
    it to our commit using its URL.

  - We use the data service object to get the current branch reference
    from GitHub. Branch references are retrieved by appending "heads" to
    the branch (we determined the branch in a previous step).

  - Finally, we update the branch reference to our new commit resource.

This is the complete code to add data to GitHub using the Git Data API.
Good work\!

## Passing All Our Tests

Android application exampletestingid=ix\_chapter-07-android-asciidoc16
id=ix\_chapter-07-android-asciidoc16range=startofrange
range=startofrangetestingAndroid appid=ix\_chapter-07-android-asciidoc17
id=ix\_chapter-07-android-asciidoc17range=startofrange
range=startofrangeOur code is complete. Let’s make sure our tests run
successfully.

We need to set up our test configuration to run within Android Studio.
Select the “Build Variants” vertical tab on the left, and in Test
Artifact select Unit Tests. Then, open the Run menu, and select “Edit
configurations”. Click the plus symbol, and choose JUnit. You will be
presented with space to create a unit test run configuration. First,
click “Use classpath of module” and select “app”. Make sure the Test
Kind is set to class, and then click the selector to the right of the
class field. It should display your test class “GitHubHelperTest.java”.
We will need to store the username and password as environment
variables, so click to add these. Your final configuration should look
like [figure\_title](#creating-unit-tests).

![Creating a unit test configuration](images/btwg_07in05.png)

Now, create the UI tests configuration: switch to "Android
Instrumentation Tests" in the "Test Artifact" of the "Build Variants"
tab. Then, click the "Run" menu, and again go to "Edit configurations".
Click the plus symbol, and this time choose "Android Tests." Choose
"app" as the module, and then select
"android.support.test.runner.AndroidJUnitRunner" as the specific
instrumentation runner. You can choose whichever target device you
prefer, an emulator, or a physical device if you have one. Give the
configuration a name like "Android Test."

To run your tests, switch to the appropriate test artifact and then from
the "Run" menu, select "Debug" and choose the proper test configuration.
You can set breakpoints and step through code in your test or
implementation from within Android Studio.

I personally find it annoying to switch between build variants when I
want to run my tests, so if you prefer, you can use the command line
instead (and ignore the need to change build variants):

``` bash
$ GITHUB_HELPER_USERNAME=MyUsername \
GITHUB_HELPER_PASSWORD=MyPwd123 \
./gradlew testDebugUnitTest
...
:app:mockableAndroidJar UP-TO-DATE
:app:assembleDebugUnitTest UP-TO-DATE
:app:testDebugUnitTest UP-TO-DATE

BUILD SUCCESSFUL
$ ./gradlew connectedAndroidTest
...
:app:compileDebugAndroidTestNdk UP-TO-DATE
:app:compileDebugAndroidTestSources
:app:preDexDebugAndroidTest
:app:dexDebugAndroidTest
:app:packageDebugAndroidTest
:app:assembleDebugAndroidTest
:app:connectedDebugAndroidTest

BUILD SUCCESSFUL
```

You will see similar results with the Android Studio test runner
windows. Our tests pass and our application is
complete.range=endofrangestartref=ix\_chapter-07-android-asciidoc17
startref=ix\_chapter-07-android-asciidoc17range=endofrangestartref=ix\_chapter-07-android-asciidoc16
startref=ix\_chapter-07-android-asciidoc16

> **Note**
> 
> If you want to see a more complicated version of the GitHub API on
> Android, take a look at [Teddy
> Hyde](https://github.com/xrd/TeddyHyde.git) (also available on the
> Google Play Store). Teddy Hyde uses OAuth to log in to GitHub, and has
> a much richer set of features for editing Jekyll
> blogs.range=endofrangestartref=ix\_chapter-07-android-asciidoc13
> startref=ix\_chapter-07-android-asciidoc13

# Summary

This application will allow you to write into a real Jekyll blog, adding
posts, upon which GitHub will regenerate your site. This little
application manages quite a few things: formatting the filename
correctly, encoding the data for submission to GitHub, and we have a
unit test and UI test that help to verify the
functionality.range=endofrangestartref=ix\_chapter-07-android-asciidoc1
startref=ix\_chapter-07-android-asciidoc1range=endofrangestartref=ix\_chapter-07-android-asciidoc0
startref=ix\_chapter-07-android-asciidoc0

In the next chapter we will use CoffeeScript to create our own chat
robot that requests pull request reviews from chat room members using
the Activity API.

1.  [Explained best by Ben Zimmer](http://bit.ly/1Ot2qOd)

2.  This is explained beautifully in the blog
    <http://alblue.bandlem.com/2011/08/git-tip-of-week-objects.html>.

3.  This is all well documented on the [GitHub
    blog.](https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages)
