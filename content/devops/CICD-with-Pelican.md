Title: CICD with PelicanBlog
Tags: devops
Date: 2018-5-23
Slug: cicd-pelicanblog
Authors: Song.Jin
Summary: how I build this blog

Back in time, I knew PelicanBlog was a Python module that can generate static
website for me, as well as GithubPages was a good place to host the static website
generated.

But the pain was I had to compile and update content manually, every and each time.

This time, I decide to automate this bit!

## how it is setup

Key components of this blog include:

- a Github repo containing [source code](https://github.com/SongGithub/songgithub.github.io-src)
- another Github repo containing [compiled static web files](https://github.com/SongGithub/songgithub.github.io)
- a CICD [pipeline](https://travis-ci.org/SongGithub/songgithub.github.io-src)
- a [static site generator](https://blog.getpelican.com/)
- a domain provider to get you custom URL, instead of generic site URL like foo.github.io

## challenges

- how the CI agent get permission to write code to one of my repos ?

I considered solutions such as SSH keys, Github personal token. SSH key didn't
get to my final thoughts because it is complicated to setup. You need to generate
a pair of keys, embed the Pub key in the repo, then ensure your CI agent has got
the private key and added to current ssh-agent. And repeat yourself this process
for other repos. Even though Github personal access token may have too much power
over my other repos that are not relevant to the project, I still think it is
overall better solution. Because it is simple, thus less error prone.

- given CI has got permission to write back to repos, how to carry out the task ?

It has been my trick that one can easily do stuff with permissions originated
from the Github personal access token, by simply ensure *origin's* url is using
HTTPS, and have the token embeded like so
`https://<your-token>@github.com/<repo-owner>/<repo-name>.git`
It can't be simpler than that!

- how to have a faster feedback loop

A valid fast feedback loop should be its environment as similar as possible to
the one that is running on the server. One great tool is Docker which helps to
isolate your dependencies, and make it more repeatable on the server, and less
surprise that *"but it works on my laptop, why?"*

Another point will be having source code separated from configuration as much as
possible. So when you see someone put those configurable variables into source code,
you would realise it has this kind of weakness, hence it is hard to debug.

Lastly, for this particular project, local dev server makes getting feedbacks quickly.
The **Pelican** can compile my source code in Markdown files and stylesheets the same
way as it would do on the server. So I can tweak the website as frequent as
several times a minute.

- how to have a robust build solution, not a flaky solution?

That was one of my lesson here. I read an article online that uses Github
submodule embeded in source code. I learned it the hardway that if you use something
in way that it is not suppose to do, be aware of hidden gotchas. The submodule
in this case, make it very compicated to run simple `git push/checkout`. Because it
is made to *read* code from a commit.