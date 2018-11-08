# strategy...

class Speech
  attr_reader :text
  attr_accessor :charactor

  def initialize(charactor)
    @text = "もう一回遊べる"
    @charactor = charactor
  end

  def output
    @charactor.output(self)
  end
end

class Korosuke
  GOBI = 'ナリ'

  def output(context)
    p context.text + GOBI
  end
end

class TaikodeDon
  GOBI = 'ドン'

  def output(context)
    p context.text + GOBI + "!!!!"
  end
end

speech = Speech.new(Korosuke.new)
speech.output

speech.charactor = TaikodeDon.new
speech.output