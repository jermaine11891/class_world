class World
  def initialize
    @politicians = []
    @voters = []
  end

def main_menu
  still_pending = true
  while still_pending
    puts "What would you like to do? (c)reate, (l)ist, (u)pdate, or (d)elete"
    choice = gets.chomp.downcase
    case choice
    when "c"
       create
    when "l"
       list
    when "u"
       update
    when "d"
       deletes
    when "exit"
       still_pending = false
    end
  end
end

def create
  puts "What would you like to create?"
  puts "(p)olitican or (v)oter"
  choice = gets.chomp.downcase
  if choice.include? "v"
    puts "Name?"
    voter_name = gets.chomp
    puts "Party?"
    puts "(l)iberal, (c)onservative, (t)ea party, (s)ocialist, or (n)eutral"
    voter_party = gets.chomp.downcase
    case voter_party
      when "l"
        voter_party = "Liberal"
      when "c"
        voter_party = "Conservative"
      when "t"
        voter_party = "Tea Party"
      when "s"
        voter_party = "Socialist"
      when "n"
        voter_party = "Neutral"
      else
        puts "I guess you're a Liberal"
        voter_party = "Liberal"
      end
      v = Voter.new(voter_name, voter_party)
      @voters << v

  elsif choice.include? "p"
    puts "Name?"
    politician_name = gets.chomp
    puts "Party?"
    puts "(D)emocrat or (R)epublican"
    politician_party = gets.chomp.downcase
      if politician_party == "d"
        politician_party = "Democrat"
      elsif politician_party == "r"
        politician_party = "Republican"
      else puts "I guess you're a Democrat"
        politician_party = "Democrat"
      end
      p = Politician.new(politician_name, politician_party)
      @politicians << p
      # puts @politicians
  end
end #End of Create

def list
  puts "Who do you want to list?"
  puts "(p)olitican or (v)oters"
  user_option = gets.chomp.downcase
  case user_option
    when "p"
      @politicians.each do |pol|
        puts "#{pol.politician_name}, #{pol.politician_party}"
  end
    when "v"
      @voters.each do |vote|
        puts "#{vote.voter_name}, #{vote.voter_party}"
  end
    else
        puts @voters, @politicians
      end
  end

  def update
    puts "Who would you like to update?"
    user_option2 = gets.chomp

    @politicians.each do |p|
      if p.politician_name == user_option2
          puts "New name?"
          p.politician_name = gets.chomp
          puts "New party?"
          puts "(D)emocrat or (R)epublican"
          politician_party = gets.chomp.downcase
          if politician_party == "d"
            p.politician_party = "Democrat"
          elsif politician_party == "r"
            p.politician_party = "Republican"
          else puts "I guess you're a Democrat"
            p.politician_party = "Democrat"
          end
      end
    end
    @voters.each do |v|
      if v.voter_name == user_option2
          puts "New name?"
          v.voter_name == gets.chomp
          puts "New Party"
          puts "(l)iberal, (c)onservative, (t)ea party, (s)ocialist, or (n)eutral"
          voter_party = gets.chomp.downcase
          if voter_party == "l"
            v.voter_party = "Liberal"
          elsif voter_party == "c"
            v.voter_party = "Conservative"
          elsif voter_party == "t"
            v.voter_party = "Tea Party"
          elsif voter_party == "s"
            v.voter_party = "Socialist"
          elsif voter_party == "n"
            v.voter_party = "Neutral"
          else puts "I guess you're a Socialist"
            v.voter_party = "Socialist"
          end
      end
    end
  end

  def deletes
    list
    puts "Who would you like to delete?"
    user_option3 = gets.chomp
    puts "Are you sure you want to delete the voter?"
    puts "(y)es or (n)o"
    user_option4 = gets.chomp.downcase
    case user_option4
    when "y"
      @politicians.each do |x|
        if x.politician_name == user_option3
          @politicians.delete(x)
        else
          main_menu
        end
      end
      @voters.each do |x|
        if x.voter_name == user_option3
          @voters.delete(x)
        else
          main_menu
        end
  end
    else
      main_menu
    end
  end
end #End of World class

# ------------------
class Politician < World
  attr_accessor :politician_name, :politician_party
 def initialize(politician_name, politician_party)
   @politician_name = politician_name
   @politician_party = politician_party
 end
end

# ----------------------
class Voter < World
  attr_accessor :voter_name, :voter_party
  def initialize(voter_name, voter_party)
    @voter_name = voter_name
    @voter_party = voter_party
  end
end

start_game = World.new

start_game.main_menu
puts "We Ended"
