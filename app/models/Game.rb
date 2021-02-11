class Game < ActiveRecord::Base


    require 'nokogiri'
    require 'pry'
    require 'open-uri'
    require 'csv'
    def self.scrape_games


        url = "https://www.covers.com/sports/nba/matchups"



        html = open(url)

        doc = Nokogiri::HTML(html)



        doc.css("div.cmg_game_container").each do | games |

            
            matchup = { :matchup => games.css(".cmg_matchup_header_team_names").text.strip}
            
            odds = { :odds => games.css("div.cmg_team_odds").css('span').text}

            
            Game.create!(matchup: matchup, odds: odds)

        end 
    end

end