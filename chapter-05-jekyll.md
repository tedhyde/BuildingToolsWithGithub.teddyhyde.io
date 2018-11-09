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

## Learning and Building with Jekyll

In this chapter we will investigate the structure of a Jekyll blog,
illustrating the few major technology pieces involved. Once we have
familiarized ourselves with Jekyll, we will then create a Jekyll blog
from scratch using the command-line tools. Then we will write a Ruby
program that scrapes a blog-like website and converts the scraped
information into a new Jekyll blog.

## What Is Jekyll?

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

### Operating Jekyll Locally

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

## Jekyll Blog Quick Start

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

### YFM: YAML Front Matter

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

### Jekyll Markup

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

### Using the Jekyll Command

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

### Privacy Levels with Jekyll

Jekyllprivacy levels with privacy levels withprivacy, JekyllJekyll
repositories on GitHub can be either public or private repositories. If
your repository is public you can host public content generated from the
Jekyll source files without publishing the source files themselves.
Remember, as noted previously, that any file without `publishing: false`
inside the YFM will be made public the moment you push it into your
repository.

### Themes

Jekyllthemes themesthemes, JekyllJekyll does not support theming
internally, but it is trivial to add any CSS files or entire CSS
frameworks. You can also fork an existing Jekyll blog that has the
theming you like. We will show how and where to add your own customized
CSS later in the chapter.

### Publishing on GitHub

Jekyll blogspublishing on GitHub publishing on GitHubOnce you have your
blog created, you can easily publish it to GitHub. There are two ways
you can publish Jekyll blogs:

  - As a github.io site

  - On a domain you own

GitHub offers free personal blogs that are hosted on the github.io
domain. And you can host any site with your own domain name with a
little bit of configuration.

#### Using a GitHub.io Jekyll blog

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

### Hosting On Your Own Domain

Jekyll blogshosting your own domainid=ix\_chapter-05-jekyll-asciidoc5
id=ix\_chapter-05-jekyll-asciidoc5range=startofrange
range=startofrangeTo host a blog on your own domain name, you need to
use the `gh-pages` branch inside your repository. You need to create a
CNAME file in your repository, and then finally establish DNS settings
to point your domain to the GitHub servers.

#### The gh-pages branch

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

#### The CNAME file

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

#### DNS settings

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
startref=ix\_chapter-05-jekyll-asciidoc5.\[1\]

## Importing from Other Blogs

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

### From Wordpress

Wordpressimporting into Jekyll blogs from importing into Jekyll blogs
fromThe most popular importer is the Wordpress importer. You will need
the 'jekyll-import' gem. This gem is distributed separately from the
core Jekyll gem, but will be installed if you use the `github-pages` gem
inside your Gemfile and use the `bundle` command.

#### Importing with direct database access

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

#### Importing from the Wordpress XML

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

### Exporting from Wordpress Alternatives

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

## Scraping Sites into Jekyll

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

### Jekyll Scraping Tactics

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

### Setting Up

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

### Scraping Titles

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

### Refinining with Interactive Ruby

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

### Writing Tests and Caching

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

### Writing Jekyll Posts

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

### Using the Jekyll Command-Line Tool

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

### Master Index File with Liquid Markup

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

### Scraping Body and Author

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

### Adding Images to Jekyll

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

### Customizing Styling (CSS)

CSSfor Jekyll blogsid=ix\_chapter-05-jekyll-asciidoc19
id=ix\_chapter-05-jekyll-asciidoc19range=startofrange
range=startofrangeJekyll blogscustom CSS
forid=ix\_chapter-05-jekyll-asciidoc20
id=ix\_chapter-05-jekyll-asciidoc20range=startofrange
range=startofrangeWe used BootstrapBootstrap in [???](#JavaScript) and
will use it again here. We will also layer another CSS file on top of
Bootstrap to customize the colors.

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

### Inviting Contributions with GitHub "Fork"

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

### Publishing Our Blog to GitHub

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

## Summary

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

1.  This is all well documented on the [GitHub
    blog.](https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages)
