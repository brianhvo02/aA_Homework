class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

    def initialize
        @sequence_length = 1
        @game_over = false
        @seq = []
    end

    def play
        until game_over
            self.take_turn
        end

        self.game_over_message
        self.reset_game
        self.play
    end

    def take_turn
        self.show_sequence
        self.require_sequence
        unless game_over
            round_success_message
            self.sequence_length += 1
        end
    end

    def show_sequence
        self.add_random_color
        system("clear")
        seq.each do |color|
            puts color
            sleep(1)
            system("clear")
        end
    end

    def require_sequence
        print "Please type in the sequence of colors you just saw: "
        self.game_over = true unless gets.chomp.split(" ") == seq
    end

    def add_random_color
        seq << COLORS.sample
    end

    def round_success_message
        puts "Correct!"
        sleep(1)
    end

    def game_over_message
        puts "Aww, you guessed the wrong sequence. Play again!"
        sleep(3)
    end

    def reset_game
        self.sequence_length = 1
        self.game_over = false
        self.seq = []
    end
end