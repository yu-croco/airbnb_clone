class AjaxSearchesController < ApplicationController
	def index
		set_geolocation_as_session(params[:geolocation])
		set_listings_by_geolocation(@geolocation)
		parse_session_to_date(session[:start_date], session[:end_date])
		delete_reserved_listings(@start_date, @end_date, @listings)
	end

	private
		def set_geolocation_as_session(geolocation_params)
			@geolocation = geolocation_params unless geolocation_params.blank?
		end

		def set_listings_by_geolocation(geolocation)
			@listings = Listing.active_listing_near_geolocation(geolocation)
		end

		def parse_session_to_date(session_start_date, session_end_date)
			@start_date = Date.parse(session_start_date)
			@end_date = Date.parse(session_end_date)
		end

		def delete_reserved_listings(start_date, end_date, listings)
			@all_listings = listings.to_a
			listings.each do |listing|
				if listing.reservations.reserved_listing?(start_date, end_date)
					@all_listings.delete(listing)
				end
			end
		end
end
