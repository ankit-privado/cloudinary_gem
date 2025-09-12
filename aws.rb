require 'segment/analytics'

# Initialize the Analytics client
analytics = Segment::Analytics.new({
  write_key: 'YOUR_WRITE_KEY', # Replace with your actual write key
  on_error: Proc.new { |status, msg| puts "Error: #{msg}" }
})

# Example PII object
pii = {
  ad_id: 'user-1234'
}

# Example parameters (traits)
parameters = {
  email: 'user@example.com',
  name: 'John Doe'
}

# Send the identify call
analytics.identify(
  user_id: pii[:ad_id],
  traits: parameters
)

# Optionally flush events (in case it's a short-lived process)
analytics.flush
