require 'rspec'
require './lib/wizard'

RSpec.describe Wizard do
  it 'has a name' do
    wizard = Wizard.new('Eric')
    expect(wizard.name).to eq('Eric')
  end

  it 'has a different name' do
    wizard = Wizard.new('Alex')
    expect(wizard.name).to eq('Alex')
  end

  it 'is bearded by default' do
    wizard = Wizard.new('Ben')
    expect(wizard.bearded?).to be true
  end

  it 'is not always bearded' do
    wizard = Wizard.new('Valerie', bearded: false)
    expect(wizard.bearded?).to be false
  end

  it 'has root powers' do
    wizard = Wizard.new('Stella', bearded: false)
    expect(wizard.incantation('chown ~/bin')).to eq('sudo chown ~/bin')
  end

  it 'has many root powers' do
    wizard = Wizard.new('Sal', bearded: true)
    expect(wizard.incantation('rm -rf /home/mirandax')).to eq('sudo rm -rf /home/mirandax')
  end

  it 'starts rested' do
    # create wizard
    wizard = Wizard.new('Gandolf', bearded: true)

    # .rested? returns true
    expect(wizard.rested?).to be true
  end

  it 'can cast spells' do
    # create wizard
    wizard = Wizard.new('Spiralina', bearded: false)

    # .cast returns "MAGIC MISSILE!"
    expect(wizard.cast).to eq("MAGIC MISSILE!")
  end

  it 'gets tired after casting three spells' do
    # create wizard
    wizard = Wizard.new('Yogurth', bearded: true)
    # casts spell twice
    wizard.cast
    wizard.cast
    # check if wizard is rested
    expect(wizard.rested?).to be true
    # casts spell
    wizard.cast
    # check wizard is not rested
    expect(wizard.rested?).to be false
  end
end
