# Google Maps API Consumer, it will get distance between 2 cities, no key needed
class GoogleMapsConsumer
  def initialize(origin_city_name, destination_city_name, current_request_number)
    @origin_city_name = origin_city_name
    @destination_city_name = destination_city_name
    @current_request_number = current_request_number
  end

  def get_city_distances(origin_city = @origin_city_name,
                         destination_city = @destination_city_name,
                         current_req_number = @current_request_number)

    # TODO: Develop the API consumer, did just to keep developing
    # the seed for generator now
    # puts origin_city
    # puts destination_city
    # puts current_req_number

    if origin_city == 'Uberlandia' && destination_city == 'Sao Paulo'
      return 591239
    end

    0
  end

end
