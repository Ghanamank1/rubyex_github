# caesar_cipher_spec.rb

require './ceasar_cipher'

RSpec.describe Cipher do
    describe '#caesar cipher' do 
        it 'ciphers' do
            cipher = Cipher.new
            expect(cipher.caesar_cipher("what a string!", 5)).to eql("Bmfy f xywnsl!")
        end
    end
end