class ListingSearchController < ApplicationController
	def index
		set_geolocation_by_params(params[:lat], params[:lng])
		set_listings_by_geolocation(@latitude, @longitude)
		if @listings.present?
			set_date_as_session(params[:start_date], params[:end_date])
			set_stay_duration(session[:start_date], session[:end_date])
			delete_reserved_listings(@start_date, @end_date, @listings)
		end
	end

	private
		def set_geolocation(latitude, longitude)
			@latitude = latitude
			@longitude = longitude
		end

		def set_geolocation_by_params(latitude, longitude)
			if latitude.present? && longitude.present?
				set_geolocation(latitude, longitude)
			else
				geolocation = Geocoder.coordinates(params[:search])
				set_geolocation(geolocation[0], geolocation[1])
			end
		end

		def set_listings_by_geolocation(latitude, longitude)
			@listings = Listing.where(active: true)
				.near([latitude, longitude], 1, order: 'distance').includes(:photos)
		end

		def set_date_as_session(start_date, end_date)
			session[:start_date] = start_date
			session[:end_date] = end_date
		end

		def set_stay_duration(start_date, end_date)
			@start_date = Date.parse(start_date)
			@end_date = Date.parse(end_date)
		end

		def delete_reserved_listings(start_date, end_date, listings)
			@all_listings = listings.to_a
			listings.each do |listing|
				unavailable = listing.reservations.where(
					"(? <= start_date AND start_date <= ?)
					 OR (? <= end_date AND end_date <= ?)
					 OR (start_date < ? AND ? < end_date)",
					start_date, end_date,
					start_date, end_date,
					start_date, end_date
				).limit(1)
				@all_listings.delete(listing) if unavailable.length > 0
			end
		end

end
