class TicketBooking
  require "./audit_seats"
  include  AudiSeats
  
  attr_accessor :show_no, :check_seats 
  
  def initialize()
    puts "Enter the show No :-"
	@show_no = gets.chomp.to_i	
	puts "You selected the Show No #{@show_no}"
  end
  
  def show_seats(audi = AudiSeats::AUDI_1 )
  audi.each do |o|
	o.each  do |i|
	  print i+" "
	end
	puts "\n"
  end
  end
  
  def audit_seats_display
    case @show_no
    when 1 then show_seats(AudiSeats::AUDI_1)	
    when 2 then show_seats(AudiSeats::AUDI_2)
    when 3 then show_seats(AudiSeats::AUDI_3)
    else
	  puts "We have only 3 Audi Screen present"
    end
  end
  
  def seats_selected
    puts "Enter the Seats to book: - "
	@check_seats = gets.chomp.to_s.split
  end
  
  def check_seats_avilabel?
	puts "Checking for seats #{@check_seats}"
	case @show_no
    when 1 then validate_seat(AudiSeats::AUDI_1)	
    when 2 then validate_seat(AudiSeats::AUDI_2)
    when 3 then validate_seat(AudiSeats::AUDI_3)
    else
	  puts "We have only 3 Audi Screen present"
    end
  end

  def validate_seat(audi)
	
	audi.each_index do |i|
		row = audi[i]
		row.each_index  do |j|
		  if  @check_seats.include?(audi[i][j])
		    puts audi.delete_if { |check_seats| audi[i][j] ==  }
		  else
		    puts "Not present" 
		  end
		end	  
	end
	print audi
  end
  
  tb = TicketBooking.new
  tb.audit_seats_display
  tb.seats_selected
  tb.check_seats_avilabel?
  
  
end
