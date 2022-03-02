class FileManagerMock
  def initialize
    @default_valera = Valera.new({
                                   'health' => 95,
                                   'alcohol' => 10,
                                   'happy' => 3,
                                   'tired' => -4,
                                   'money' => 123
                                 })
  end

  def save(_valera)
    nil
  end

  def load_game
    @default_valera
  end

  def load_config
    Hash.new({ actions: [
               {
                 name: 'Пойти на работу (Можно только если алкоголь < 50 а усталость < 10) (Счастье -5, Опьянение -30, Усталость +70, Деньги +100$)',
                 conditions: [
                   {
                     name: 'alcohol',
                     min: 0,
                     max: 70
                   },
                   {
                     name: 'tired',
                     min: 0,
                     max: 10
                   }
                 ],
                 result: [
                   {
                     name: 'alcohol',
                     value: -30
                   },
                   {
                     name: 'happy',
                     value: -5
                   },
                   {
                     name: 'tired',
                     value: 70
                   },
                   {
                     name: 'money',
                     value: 100
                   }
                 ]
               }
             ] })
  end
end
