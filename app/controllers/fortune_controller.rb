class FortuneController < ApplicationController
  def horoscopes
    @sign = params.fetch("the_sign")
    sign_sym = @sign.to_sym
    all_zodiacs = Zodiac.list
    this_zodiac = all_zodiacs.fetch(sign_sym)
    @horoscope = this_zodiac.fetch(:horoscope)

    @array_of_numbers = Array.new

    5.times do
      another_number = rand(1...100)

      @array_of_numbers.push(another_number)
    end

    @sign = @sign.capitalize

    render({ :template => "fortune_templates/fortunes.html.erb" })
  end
end
