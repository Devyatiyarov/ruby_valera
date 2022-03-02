class Valera
  attr_reader :health, :alcohol, :happy, :tired
  attr_accessor :money

  def initialize(params = {})
    params ||= {}
    @health = params['health'] || 100
    @alcohol = params['alcohol'] || 0
    @happy = params['happy'] || 0
    @tired = params['tired'] || 0
    @money = params['money'] || 300
  end

  def dead?
    @health.zero? || @happy == -10 || @money <= -100 || @tired == 100
  end

  def health=(health)
    @health = validate(health, 0, 100)
  end

  def alcohol=(alcohol)
    @health -= validate(@alcohol - alcohol, 0, @health) if @alcohol < alcohol.abs
    @alcohol = validate(alcohol, 0, 100)
  end

  def happy=(happy)
    @happy = validate(happy, -10, 10)
  end

  def tired=(tired)
    @tired = validate(tired, 0, 100)
  end

  private

  def validate(value, min, max)
    [[value, max].min, min].max
  end
end
