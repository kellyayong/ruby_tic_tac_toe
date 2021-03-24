require "spec_helper"

module TicTacToe
    RSpec.describe Game do
        let (:kelly) { Player.new({color: "X", name: "kelly"})}
        let (:peter) { Player.new({color: "O", name "peter"})}

        context "#initialize" do
            it "randomly selects a current_player" do
                Array.any_instance.stub(:shuffle) { [kelly, peter] }
                game = Game.new([peter, kelly])
                expect(game.other_player).to eq kelly
            end
            it "randomly selects a other_player" do
                Array.any_instance.stub(:shuffle) { [kelly, peter] }
                game = Game.new([peter, kelly])
                expect(game.other_player).to eq peter
            end
        end

        context "#switch_players" do
            it "will set @current_player to @other_player" do
                game = Game.new([kelly, peter])
                other_player = game.other_player
                game.switch_players 
                expect(game.current_player).to eq other_player
            end
            it "will set @other_player to @current_player" do
                game = Game.new([kelly, peter])
                current_player = game.current_player
                game.switch_players
                expect(game.other_players).to eq current_player
            end
        end

        context "#solicit_move" do
            it "asks the players to make a move" do
                game = Game.new([kelly, peter])
                game.stub(:current_player) { kelly }
                expected = "kelly: Enter a number between 1 to 9 to make your move"
                expect(game.solicit_move).to eq expected
            end
        end

        context "#get_move" do
            it "converts human_move of '1' to [0,0]" do
                game = Game.new([kelly, peter])
                expect(game.get_move("1")).to eq [0,0]
            end
            it "converts human_move of '1' to [0,0]" do
                game = Game.new([kelly, peter])
                expect(game.get_move("7")).to eq [0,2]
            end
        end

        context "#game_over_message" do
            it "returns '{current player name} won!' if board shows a winner" do
                game = Game.new([kelly, peter])
                game.stub(:current_player) { kelly }
                game.board.stub(:game_over) { :winner }
                expect(game.game_over_message).to eq "kelly won!"
            end
            it "returns 'The game ended in a tie' if board shows a draw" do
                game = Game.new([kelly, peter])
                game.stub(:current_player) { kelly }
                game.board.stub(:game_over) { :draw }
                expect(game.game_over_message).to eq "The game ended in a tie"
            end
        end
        
    end
end