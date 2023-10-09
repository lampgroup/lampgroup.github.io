# Configure your environment

This installation guide assumes you are using Mac OS. You need to complete the
following steps: install Homebrew, install a local version of Ruby, install
the jekyll gem, and setup bibble in a new conda envirionment.

1. Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Install ruby: `brew install ruby`
3. Install jekyll: `gem install jekyll`
4. Append the following to your `~/.zshrc` to point to the Homebrew ruby and the jekyll gems

```
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
  
# gems (for Jekyll)
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
```

5. Create a conda environment for the dependencies: `conda create -n lampgroup python=3.9`
6. `conda activate lampgroup`
7. Install bibble: `pip install bibble`

# Clone the repository

1. Clone the repository: `git clone git@github.com:lampgroup/lampgroup.github.io.git`
2. `cd lampgroup.github.io`
3. Build and view a local version of the website: `make serve`

# Most Likely Actions

* You want to add a new person to the website
    * Edit `_data/people.yml`
    * Add a low-resolution image to img/people/

* You want to add a news post
    * Add a new markdown file to `_posts/`

* You want to add a new publication
    * Edit the main file `bib/bib.bib`
    * Duplicate your change into a relevant project bib file in the `bib/`directory.
