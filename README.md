# wpdb_activerecord

If you'd like to do it in Ruby instead, then this library might help
with some of the boilerplate.

It's a wrapper for the WordPress database, using
[ActiveRecord](http://apidock.com/rails/ActiveRecord), that gives you access to the
WordPress database and all its content via a nice ORM.

## Installation

```
gem "wpdb_activerecord"
```

## Usage

####Post###
```
WPDB::Post.all # Get all posts
@post = WPDB::Post.find(75)
@post.tags
@post.categories
@post.attachments # No matter what type
@post.revisions # versions
@post.postmetas # post meta values
@post.author # get user (WPDB::User)
```

####Term####
```
WPDB::Term.tag # get all tags
WPDB::Term.category # get all categories
```

####User####
```
@user = WPDB::User.find(25)
@user.posts
```

## Advanced ##
Sometime we will custom the table name prefix (default is wp_) or inherit to use and redefine something.

You can define your yaml file to setup prefix and association class_name.

Put the config file named "wpdb_activerecord.yml" in config

Example:

```
# config/wpdb_activerecord.yml
WPDB_PREFIX: "cgjbugpbs_" # the table of WPDB::Post is cgjbugpbs_posts, not wp_posts
WPDB_USER_CLASS: "WUser"

# models/w_user.rb
class WUser < WPDB::User
  def hello
    puts "world"
  end
end

# usage
@author = WPDB::Post.find(25).author
@author.class_name # will get WUser, not WPDB::User
@author.hello # world
```
All setting attributes you can use: 

* WPDB\_PREFIX
* WPDB\_USER\_CLASS
* WPDB\_POST\_CLASS
* WPDB\_POSTMETA\_CLASS
* WPDB\_TERM\_CLASS
* WPDB\_TERM\_RELATIONSHIP\_CLASS
* WPDB\_TERM\_TAXONOMY\_CLASS
