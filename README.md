# Candid Health Ruby Library
[![Gem Version](https://img.shields.io/gem/v/candidhealth)](https://rubygems.org/gems/candidhealth)
[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-SDK%20generated%20by%20Fern-brightgreen)](https://buildwithfern.com/?utm_source=candidhealth/candid-ruby/readme)

The Candid Health Ruby library provides access to the Candid Health API from Ruby.

## Installation

Install the gem and add to the application's Gemfile by executing:

```sh
bundle add candidhealth
```

If bundler is not being used to manage dependencies, install the gem by executing:

```sh
gem install candidhealth
```

## Instantiation

```ruby
require "candidhealth"

candidhealth = CandidApiClient::Client.new(
  api_key: 'YOUR_API_KEY',
)
```

## Async Client
The SDK exports an async client that you can use for non-blocking requests. 

```ruby
require "candidhealth"

candidhealth = CandidApiClient::AsyncClient.new(api_key: 'YOUR_API_KEY')

Sync do
  guarantor = candidhealth.guarantor.v_1.get(guarantor_id: "guarantor-id")
  puts guarantor
end
```

## Timeouts

The SDK defaults to a 60 second timout. Use the `timeout_in_seconds` option to 
configure this behavior. 

```Ruby
candidhealth.guarantor.v_1.get(guarantor_id: "guarantor-id", request_options: RequestOptions.new(
  timeout_in_seconds: 30 // override timeout to 30s
))
```

## Retries

The SDK is instrumented with automatic retries with exponential backoff. A request will be
retried as long as the request is deemed retriable and the number of retry attempts has not grown larger
than the configured retry limit (default: 2).

A request is deemed retriable when any of the following HTTP status codes is returned:

- [408](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/408) (Timeout)
- [409](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/409) (Conflict)
- [429](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429) (Too Many Requests)
- [5XX](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) (Internal Server Errors)
  
Use the `max_retries` request option to configure this behavior. 

```Ruby
candidhealth.guarantor.v_1.get(guarantor_id: "guarantor-id", RequestOptions.new(
  max_retries: 0 // override maxRetries at the request level
))
```

## Beta status

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore,
we recommend pinning the package version to a specific version in your package.json file. This way, you can install
the same version each time without breaking changes unless you are intentionally looking for the latest version.

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically. Additions made directly
to this library would have to be moved over to our generation code, otherwise they would be overwritten upon the next
generated release. Feel free to open a PR as a proof of concept, but know that we will not be able to merge it as-is. 
We suggest opening an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
