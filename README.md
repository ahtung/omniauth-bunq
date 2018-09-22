# OmniAuth Bunq

This is the official OmniAuth strategy for authenticating to Rabobank. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [Bunq Applications Page]().

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :bunq, ENV['BUNQ_KEY'], ENV['BUNQ_SECRET']
end
```
