### User
- `name`: string
- `email`: string
- `uid`: string
- `provider`: string
- `oauth_token`: string
- `api_key`: string

### ScrapingJobs
- `name`: string
- `href`: string
- `selector`: string
- `description`: string
- `cron_schedule`: string
- `user_id`: references user

To generate these models, you can use the following commands:

For the User model:
```
rails generate devise User name:string uid:string provider:string oauth_token:string api_key:string
```
For the ScrapingJobs model:
```
rails generate model ScrapingJob name:string href:string selector:string description:string cron_schedule:string user:references
```

And then migrate your database:
```
rails db:migrate
```

You need to use `omniauth` gem with `devise` to implement OAuth authentication. Here is a sample configuration for Google:

```ruby
# config/initializers/devise.rb
Devise.setup do |config|
  # ...
  config.omniauth :google_oauth2, "GOOGLE_CLIENT_ID", "GOOGLE_CLIENT_SECRET", {}
  # ...
end
```

And in your User model:

```ruby
# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.oauth_token = auth.credentials.token
    end
  end
end
```

To generate a unique API key for each user, you can add a callback in the User model to generate it when a new user record is created:

```ruby
before_create :generate_api_key

private

def generate_api_key
  self.api_key = SecureRandom.hex(20)
end
```

Please be sure to modify these code snippets as per your needs and ensure to handle potential security issues appropriately, especially regarding OAuth tokens and API keys.