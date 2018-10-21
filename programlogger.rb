def log stringDescription, &block
    block.call
    puts stringDescription
end

log '..."outer block" finished, returning: false' do
    puts "Beginning 'outer block'..."
    log '..."some little block" finished, returning: 5' do
        puts 'Beginning "some little block"...'
    end 
    log '..."yet another block" finished, returning:I like Thai food' do  
        puts 'Beginning "yet another block"...'
    end     
end