module WcnScraper
  class Vacancy
    attr_reader :url, :id, :title, :role_type, :salary, :prison, :location, :closing_date

    def initialize(url, html)
      @url = url
      attrs = parse_html(html)
      @id = attrs.fetch(:id)
      @title = attrs.fetch(:title)
      @role_type = attrs.fetch(:role_type)
      @salary = attrs.fetch(:salary)
      @prison = attrs.fetch(:prison)
      @location = attrs.fetch(:location)
      @closing_date = attrs.fetch(:closing_date)
    end

    def attrs
      {
        url: url,
        id: id,
        title: title,
        role_type: role_type,
        salary: salary,
        prison: prison,
        location: { lat: location.lat, lng: location.lng },
        closing_date: closing_date
      }
    end

    private

    def parse_html(html)
      title = get_string('Vacancy Title', html)
      prison = get_prison(title)

      {
        id: %r[Vacancy Id:(\d+)].match(html)[1],
        title: title,
        prison: prison,
        location: Location.new(prison),
        role_type: get_string('Role Type', html),
        salary: get_string('Salary', html),
        closing_date: get_closing_date(html)
      }
    end

    def get_string(label, html)
      regexp = %r[#{label}:([^\<]+)]
      regexp.match(html)[1].strip
    end

    def get_prison(title)
      title.sub(/.*HM/, 'HM')
    end

    def get_closing_date(html)
      get_string('Closing Date', html).sub(/ \d\d:\d\d \w\w\w/, '')
    end
  end
end
