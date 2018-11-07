#./spec/enumerables_spec.rb

require './enumerables'

RSpec.describe Enumerable do
    describe 'my_each Enumerable' do 
        it 'iterates through each element' do
            expect( [1,2,3,4].my_each {|n| n}).to eql([1,2,3,4])
        end

        it 'returns an error if anything else' do
            expect{ 1.my_each {|n| n}}.to raise_error(NoMethodError)
        end
    end

    describe 'my_each_with_index' do
        it 'iterates through each element with index' do
            expect([1,2,3,4].my_each_with_index {|n| n}).to eql([1,2,3,4]) 
        end

        it 'returns an error if anything else' do
            expect{ 1.my_each {|n| n}}.to raise_error(NoMethodError)
        end
    end

    describe 'my_select method' do
        it 'selects the elements in the array that meet the requirement' do
            expect([1,2,3,4].my_select {|n| n>2}).to eql([3,4])
        end

        it 'returns an error if anything else' do
            expect{1.my_select {|n| n}}.to raise_error(NoMethodError)
        end
    end

    describe 'my_all? method' do
        it 'checks if all the elements match the entry' do
            expect([1,2,3,4].all? {|n| n>=1}).to eql(true)
        end
    end
end