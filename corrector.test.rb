require_relative './corrector'

describe Corrector do
  before :each do
    @corrector = Corrector.new
    @name = @corrector.correct_name('busiwa')
    @second_name = @corrector.correct_name('deboranjisona')
  end

  it 'shows capitalization' do
    expect(@name).to match 'Busiwa'
  end

  it 'shows capitalization to first 10 letters' do
    expect(@second_name).to match 'Deboranjis'
  end
end
