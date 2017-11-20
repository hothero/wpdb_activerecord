# wpdb_activerecord

If you'd like to do it in Ruby instead, then this library might help
with some of the boilerplate.

It's a wrapper for the WordPress database, using
[ActiveRecord](http://apidock.com/rails/ActiveRecord), that gives you access to the
WordPress database and all its content via a nice ORM.

## Installation

```
gem "wpdb_activerecord"
gem "mysql2", "~> 0.3.0"
```

## Usage

#### Post

```ruby
WPDB::Post.all # Get all posts
@post = WPDB::Post.find(75)
@post.tags
@post.categories
@post.comments
@post.attachments # No matter what type
@post.revisions # versions
@post.postmetas # post meta values
@post.author # get user (WPDB::User)
```

#### Term

```ruby
WPDB::Term.tag # get all tags
WPDB::Term.category # get all categories
@term = WPDB::Term.first
@term.posts # get all the term posts
```

#### User

```ruby
@user = WPDB::User.find(25)
@user.posts
@user.comments
```

## Advanced

Sometime we will custom the table name prefix (default is wp_) or inherit to use and redefine something.

You can define your yaml file to setup prefix and association class_name.

Put the config file named "wpdb_activerecord.yml" in config

Example:

```ruby
# config/wpdb_config.yml
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
* WPDB\_COMMENT\_CLASS
* WPDB\_USER\_CLASS
* WPDB\_POST\_CLASS
* WPDB\_POSTMETA\_CLASS
* WPDB\_TERM\_CLASS
* WPDB\_TERM\_RELATIONSHIP\_CLASS
* WPDB\_TERM\_TAXONOMY\_CLASS

## Table Fields

### wp_posts

WPDB::Post
* ID:integer
* post_author:integer
* post_date:datetime
* post_date_gmt:datetime
* post_content:text
* post_title:string
* post_excerpt:string
* post_status:varchar(20)
* post_password:varchar(20)
* post_name:varchar(200) (post slug)
* post_modified:datetime
* post_modified_gmt:datetime
* post_parent:integer
* guid:varchar(255)
* menu_order:integer
* post_type:varchar(20)
* post_mime_type:varchar(100)
* comment_count:integer

### wp_postmeta

WPDB::Postmeta
* meta_id:integer
* post_id:integer
* meta_key:varchar(255)
* meta_value:text

### wp_comments

WPDB::Comment
* comment_ID:integer
* comment_post_id:integer
* comment_author:varchar(255)
* comment_author_email:varchar(100)
* comment_author_url:varchar(200)
* comment_author_IP:varchar(100)
* comment_date:datetime
* comment_date_gmt:datetime
* comment_content:text
* comment_karma:integer
* comment_approved:varchar(20)
* comment_agent:varchar(255)
* comment_type:varchar(20)
* comment_parent:bigint(20)
* user_id:bigint(20)

### wp_commentmeta ###
* meta_id:bigint(20)
* comment_id:bigint(20)
* meta_key:varchar(255
* meta_value:longtext

### wp_users

WPDB::User
* ID:integer
* user_login:varchar(60)
* user_pass:varchar(64)
* user_nicename:varchar(50)
* user_email:varchar(100)
* user_url:varchar(100)
* user_registered:datetime
* user_status:integer
* display_name:varchar(250)

### wp_usermeta

WPDB::Usermeta
* umeta_id:integer
* user_id:integer
* meta_key:varchar(255)
* meta_value:text

### wp_terms

WPDB::Term
* term_id:integer
* name:varchar(200)
* slug:varchar(200)
* term_group:integer

### wp_term_taxonomy

WPDB::TermTaxonomy
* term_taxonomy_id:integer
* term_id:integer
* taxonomy:varchar(32)
* description:text
* parent:integer
* count:integer

### wp_term_relationships

WPDB::TermRelationship
* object_id:integer
* term_taxonomy_id:integer
* term_order:integer

### wp_options

WPDB::Option
* option_id:integer
* option_name:varchar(64)
* option_value:text
* autoload:varchar(20)
