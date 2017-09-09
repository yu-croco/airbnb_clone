class StripeController < ApplicationController

	# Logics on this file are referred by following repository
	# https://github.com/rfunduk/rails-stripe-connect-example

	# Connect yourself to a Stripe account.
	# Only works on the currently logged in user.
	# See app/services/stripe_oauth.rb for #oauth_url details.
	def index
		connector = StripeOauth.new( current_user )
		url, error = connector.oauth_url(redirect_uri: stripe_confirm_url)

		if url.nil?
			flash[:error] = error
			redirect_to listing_bank_accounts_path(session[:listing_id])
		else
			redirect_to url
		end
	end

	# Confirm a connection to a Stripe account.
	# Only works on the currently logged in user.
	# See app/services/stripe_oauth.rb for #verify! details.
	def create
		connector = StripeOauth.new(current_user)
		if params[:code]
			# If we got a 'code' parameter. Then the
			# connection was completed by the user.
			connector.verify!( params[:code] )

		elsif params[:error]
			# If we have an 'error' parameter, it's because the
			# user denied the connection request. Other errors
			# are handled at #oauth_url generation time.
			flash[:error] = "Authorization request denied."
		end

		redirect_to listing_bank_accounts_path(session[:listing_id]),
			notice: "受取口座情報を登録しました。"
	end

	# deauthorize
	def destroy
		connector = StripeOauth.new(current_user)
		connector.deauthorize!
		redirect_to listing_bank_accounts_path(session[:listing_id]),
			notice: "受取口座情報を削除しました。"
	end

end