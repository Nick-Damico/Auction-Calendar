# Auction Calendar

Auction Calendar is a Sinatra Application CMS.
 This app allows an Auctioneer or Auction business to manage their upcoming sales. A user is able to Create an Auction with a sale title, description, location, sale starting date/time and ending date/time. An auction can be managed after creation. This allows the user to assign one or many Auctioneers to the sale, as well as remove or replace them with other auction staff. The application displays the final results on an attractive auction calendar page.

## View on Heroku
`https://auction-calendar.herokuapp.com/`

## Usage

Download or Fork this repository
- `cd auction-calendar` into the projects directory
- `bundle install`
- `rake db:migrate`
- `rackup config.ru` or `shotgun` to launch local server

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Nick-Damico/auction-calendar This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
