# Stripe.api_key = Rails.application.secrets.STRIPE_SECRET_KEY

Rails.configuration.stripe = {
  :stripe_secret_key => Rails.application.secrets.STRIPE_SECRET_KEY,
  :stripe_publishable_key => Rails.application.secrets.STRIPE_PUBLISHABLE_KEY,
  :stripe_connect_client_id => Rails.application.secrets.STRIPE_CONNECT_CLIENT_ID
}
Stripe.api_key = Rails.configuration.stripe[:stripe_secret_key]
