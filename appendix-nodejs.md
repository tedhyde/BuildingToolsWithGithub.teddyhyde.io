# NodeJS

NodeJS has gained immense popularity in the last few years. JavaScript
is the language of client-side development on the web, and many people
are excited about developing in the same language on the server side.
One of the chapters in this book discusses Hubot, GitHub’s "devops"
chatbot. Hubot is written in NodeJS. Fortunately, installing NodeJS is
simple using NVM.

NVM stands for "Node Version Manager" and is a direct correlate to RVM.
To install it run these commands from a shell prompt:

``` bash
$ curl https://raw.github.com/creationix/nvm/master/install.sh | sh
```

## package.json

Much like Ruby has a Gemfile which indicates required libraries, so too
does NodeJS have an equivalent file. In NodeJS, this file is called
`package.json`. To install all required libraries for any project, use
the `npm` tool. Running without any arguments will install all libraries
specified by the application if there is a `package.json` file included
with the project.
