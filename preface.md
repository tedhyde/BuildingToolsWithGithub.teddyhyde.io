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
    application from the technologies presented. [???](#chapter2): This
    chapter covers the Gist API, as well as command-line tools and the
    Ruby language "Octokit" API client. We then take this API and build
    a simple Ruby server that is stored as a gist and displays gists.

  - [???](#chapter3)  
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

  - [???](#Jekyll)  
    If you push a specifically organized repository into GitHub, GitHub
    will host a fully featured blog, equivalent in most ways to a
    Wordpress site (well, except for the complexity part). This chapter
    documents how to format your repository, how to use Markdown within
    Jekyll, how to use programmatic looping constructs provided by
    Liquid Templates, and then shows how to import an entire website
    from the Internet Archive into the Jekyll format using Ruby. We show
    how to respectfully spider a site using caching, a valuable
    technique when using APIs or third-party public information.

  - [???](#android_and_git_data_api)  
    In this chapter we create a mobile application targeting the Android
    OS. Our application reads and writes information into a Jekyll
    repository from the Git Data section of the API. We show how to
    create user interface tests for Android that verify GitHub API
    responses using the Calabash UI testing tool.

  - [???](#Hubot)  
    Hubot is a JavaScript (NodeJS) chat robot enabling technologists to
    go beyond developer operations ("DevOps") to a new frontier called
    "ChatOps." This chapter illustrates using the Activity and Pull
    Requests section of the API. In addition, we show how you can
    simulate GitHub notifications and how to write testable Hubot
    extensions (which is often a challenge when writing JavaScript
    code). We string all these pieces together and build a robot that
    automates assigning pull request review requests.

  - [???](#JavaScript)  
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
issue. [???](#Hubot) documents using pull requests and is a good
reference for issues in that way.

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
